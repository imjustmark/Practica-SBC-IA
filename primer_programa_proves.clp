;;; ---------------------------------------------------------
;;; ontologia-IA-2.clp
;;; Translated by owl2clips
;;; Translated to CLIPS from ontology ontologia-IA-2.owl
;;; :Date 15/05/2022 12:36:02

; Definició de les CLASSES

(defclass Ciudad
    (is-a USER)
    (role concrete)
    (pattern-match reactive)
    ;;; Expresa los días de duración.
    (slot duración
        (type INTEGER)
        (create-accessor read-write))
    (slot nombre
        (type STRING)
        (create-accessor read-write))
)

(defclass Alojamiento
    (is-a USER)
    (role concrete)
    (pattern-match reactive)
    (slot nombre
        (type STRING)
        (create-accessor read-write))
    (slot precio
        (type FLOAT)
        (create-accessor read-write))
    (slot esta-en
        (type INSTANCE)
        (create-accessor read-write))
)

(defclass Apartamento
    (is-a Alojamiento)
    (role concrete)
    (pattern-match reactive)
)

(defclass Camping
    (is-a Alojamiento)
    (role concrete)
    (pattern-match reactive)
)

(defclass Hotel
    (is-a Alojamiento)
    (role concrete)
    (pattern-match reactive)
)

(defclass Pensión
    (is-a Alojamiento)
    (role concrete)
    (pattern-match reactive)
)

(defclass Sitio_de_Interés
    (is-a USER)
    (role concrete)
    (pattern-match reactive)
    (multislot satisface
        (type INSTANCE)
        (create-accessor read-write))
    (slot esta-en
        (type INSTANCE)
        (create-accessor read-write))
    (slot nombre
        (type STRING)
        (create-accessor read-write))
    (slot precio
        (type FLOAT)
        (create-accessor read-write))
)

(defclass Trayecto
    (is-a USER)
    (role concrete)
    (pattern-match reactive)
    ;;; Expresa los días de duración.
    (slot duración
        (type INTEGER)
        (create-accessor read-write))
)

(defclass Medio_de_Transporte
    (is-a Trayecto)
    (role concrete)
    (pattern-match reactive)
    (multislot destino
        (type INSTANCE)
        (create-accessor read-write))
    (multislot origen
        (type INSTANCE)
        (create-accessor read-write))
    (slot precio
        (type FLOAT)
        (create-accessor read-write))
)

(defclass Avión
    (is-a Medio_de_Transporte)
    (role concrete)
    (pattern-match reactive)
)

(defclass Barco
    (is-a Medio_de_Transporte)
    (role concrete)
    (pattern-match reactive)
)

(defclass Bus
    (is-a Medio_de_Transporte)
    (role concrete)
    (pattern-match reactive)
)

(defclass Tren
    (is-a Medio_de_Transporte)
    (role concrete)
    (pattern-match reactive)
)

(defclass Interés
    (is-a USER)
    (role concrete)
    (pattern-match reactive)
    (slot nombre
        (type STRING)
        (create-accessor read-write))
)

; Definició de les INSTÀNCIES

(definstances instances
    (aventura of Interés (nombre "aventura"))
    (religion of Interés (nombre "religión"))
    (barcelona of Ciudad (nombre "barcelona"))
    (reina_sofia of Hotel (nombre "Hotel Reina Sofia") (precio 200) (esta-en [barcelona]))
    (macba of Sitio_de_Interés (nombre "MACBA") (precio 50) (satisface [religion] [aventura]) (esta-en [barcelona]))
    (sagrada_familia of Sitio_de_Interés (nombre "Sagrada Familia") (precio 100) (satisface [religion]) (esta-en [barcelona]))
    (barceloneta of Sitio_de_Interés (nombre "barceloneta") (precio 0) (satisface [aventura]) (esta-en [barcelona]))
    (raval of Sitio_de_Interés (nombre "raval") (precio 23.8) (satisface [aventura]) (esta-en [barcelona]))
)

; Exportació del MAIN
(defmodule MAIN (export ?ALL))

; Definició de TEMPLATES que poguem necessitar
(deftemplate client 
    (slot tipus)
    (slot pressupost)
    (slot duracio-esperada)
    (slot dies-per-ciutat)
    (slot num-ciutats)
    (multislot interesos)
)

; Definició de MISSATGES entre classes

; Definició de FUNCIONS

(deffunction fer-pregunta (?p)
   (printout t ?p crlf)
   (bind ?r (read))
   (if (lexemep ?r) 
       then (bind ?r (lowcase ?r)))
   ?r
)

(deffunction pregunta-si-o-no (?p)
    (bind ?r (fer-pregunta ?p))
    (if (or (eq ?r yes) (eq ?r si))
        then TRUE 
        else FALSE)
)

(deffunction pregunta-llista (?pregunta)
    (format t "¿%s?" ?pregunta)
    (bind ?resposta (readline))
    (bind ?resposta (lowcase ?resposta))
    (bind ?res (explode$ ?resposta))
    ?res
)


; Definició de REGLES

; Mòdul de PREGUNTES
;(defmodule Preguntes (import ?ALL) (export ?ALL)

(defrule inici
    (declare (salience 10))
    (not (iniciat ?))
    =>
    (printout t "Benvingut!" crlf)
    (assert(iniciat usuari))
)

(defrule determina-tipus-client ""
   (iniciat ?)
   =>
   (if (pregunta-si-o-no "Viatges sol? (si/no) ") 
       then (assert (client (tipus individual)))
       else 
       (if (pregunta-si-o-no "Viatges amb la teva parella? (si/no) ")
           then (assert (client (tipus parella)))
           else 
           (if (pregunta-si-o-no "Viatges amb la teva familia? (si/no) ")
                 then (assert (client (tipus familia)))
                 else (assert (client (tipus grup)))
            )
        )
    )
    (assert (tipus usuari))
)

(defrule determina-pressupost-client ""
   (iniciat ?)
   (not (pressupost ?))
   ?c <- (client)
   =>
   (bind ?r (fer-pregunta "Quin es el teu pressupost maxim? "))
   (while (< ?r 0) do (bind ?r (fer-pregunta "Quin es el teu pressupost maxim? ")))
   (modify ?c (pressupost ?r))
   (assert (pressupost usuari)) 
)

(defrule determina-dies-client ""
   (iniciat ?)
   (not (dies ?))
   ?c <- (client)
   =>
   (bind ?r (fer-pregunta "Quants dies vols que duri el viatge? "))
   (while (< ?r 0) do (bind ?r (fer-pregunta "Quants dies vols que duri el viatge? ")))
   (modify ?c (duracio-esperada ?r))
   (assert (dies usuari)) 
)

(defrule determina-interesos-client ""
    (iniciat ?)
    (dies ?)
    (dies-per-ciutat ?)
    (not (interesos ?))
    ?c <- (client)
    =>
    (bind ?interesos (find-all-instances ((?i Interés)) TRUE))
    (printout t ?interesos  crlf)
    (bind ?r (pregunta-llista "Quins son els teus interessos? (d'entre la llista anterior)"))
    (bind ?l (create$))
    (loop-for-count (?i 1 (length$ ?r)) do
        (bind ?aux (nth$ ?i ?r))
        (if (member$ ?aux ?interesos) then (bind ?l (insert$ ?l 1 ?aux)))
    )
    (modify ?c (interesos ?l))
    (assert (interesos usuari))
)

(defrule determina-dies-per-ciutat-client ""
   (iniciat ?)
   (not (dies-per-ciutat ?))
   ?c <- (client)
   =>
   (bind ?r (fer-pregunta "Quants dies vols estar a cada ciutat? "))
   (while (< ?r 0) do (bind ?r (fer-pregunta "Quants dies vols estar a cada ciutat? ")))
   (modify ?c (dies-per-ciutat ?r))
   (assert (dies-per-ciutat usuari)) 
)

(defrule determina-num-ciutats-client ""
    (dies ?)
    (dies-per-ciutat ?)
    (not (num-ciutats ?))
    ?c <- (client (duracio-esperada ?de) (dies-per-ciutat ?dpc))
    =>
    (modify ?c (num-ciutats (/ ?de ?dpc)))
    (assert (num-ciutats usuari))
)
;)
   
; Mòdul de SELECCIÓ
;(defmodule Seleccio (import ?ALL) (export ?ALL)

(deftemplate dades
    (multislot llocs-compatibles)
    (multislot ciutats-compatibles)
    (multislot qualitat-ciutats)
    (multislot allotjaments-compatibles)
    (multislot transports-compatibles)
)

(deffunction troba_index (?elem ?list)
    (bind ?i 1)
    (while (and (neq (nth$ ?i ?list) ?elem) (<= ?i (length$ ?list))) do 
        (bind ?i (+ ?i 1))
    )
    (if (<= ?i (length$ ?list)) 
        then ?i 
        else -1
    )
)

(defrule inicialitza-dades ""
    (interesos ?)
    (num-ciutats ?)
    (not (inicialitza-dades ?))
    =>
    (assert(dades (llocs-compatibles (create$)) (ciutats-compatibles (create$)) 
                 (allotjaments-compatibles (create$)) (transports-compatibles (create$))
                 (qualitat-ciutats (create$))))
    (assert (inicialitza-dades usuari))
)

(defrule troba-llocs-compatibles ""
    ?c <- (client (interesos $?li))
    ?d <- (dades)
    (inicialitza-dades ?) 
    (not (llocs-compatibles ?))
    =>
    (bind ?llocs (find-all-instances ((?s Sitio_de_Interés)) TRUE))
    (bind ?lista (create$))
    (loop-for-count (?i 1 (length$ ?llocs)) do
        (bind ?ll (nth$ ?i ?llocs))
        (bind ?ins (send ?ll get-satisface))
        (loop-for-count (?j 1 (length$ ?ins)) do
            (bind ?in (nth$ ?j ?ins))
            (if (member$ ?in ?li) then (bind ?lista (insert$ ?lista 1 ?ll)))
        )
    )
    (modify ?d (llocs-compatibles ?lista))
    (assert (llocs-compatibles usuari))
)

(defrule assigna-ciutats ""
    (llocs-compatibles ?)
    (not (ciutats-assignades ?))
    ?d <- (dades (llocs-compatibles $?ls))
    =>
    (bind ?cs (create$))
    (bind ?nums (create$))
    (loop-for-count (?i 1 (length$ ?ls)) do
        (bind ?l (nth$ ?i ?ls))
        (bind ?c (send ?l get-esta-en))
        (if (member$ ?c ?cs) then 
            (bind ?n (troba_index ?c ?cs))
            (bind ?nums (replace$ ?nums ?n ?n (+ (nth$ ?n ?nums) 1)))
        else
            (bind ?cs (insert$ ?cs 1 ?c))
            (bind ?nums (insert$ ?nums 1 1))
        )
    )
    (modify ?d (ciutats-compatibles ?cs) (qualitat-ciutats ?nums))
    (assert (ciutats-assignades usuari))
)

(defrule assigna-allotjaments ""
    (ciutats-assignades ?)
    (not (allotjaments-assignats ?))
    ?d <- (dades (ciutats-compatibles $?cs))
    =>
    (bind ?list (create$))
    (loop-for-count (?i 1 (length$ ?cs)) do
        (bind ?c (nth$ ?i ?cs))
        (bind ?allotjs (find-all-instances ((?a Alojamiento)) (eq ?a:esta-en ?c)))
        (bind ?list (insert$ ?list (+ (length$ ?list) 1) ?allotjs))
    )
    (modify ?d (allotjaments-compatibles ?list))
    (assert (allotjaments-assignats usuari))
)

;)

; Mòdul de CONSTRUCCIÓ

(deftemplate viatge
    (slot preu-total)
    (slot duracio)
    (multislot ciutats)
    (multislot allotjaments)
    (multislot dies-ciutats)
    (multislot llocs-interes)
    (multislot transports)
)

; Mòdul d'IMPRESIÓ dels RESULTATS

;(defrule cliente-e-interes
;    ?p1 <- (object (is-a Cliente))
;    =>
;    (printout t "A " (send ?p1 get-nombre) " le gusta " (send ?p1 get-nombre-interes) crlf)
;)

;(defrule interes-y-lugar
;    ?p1 <- (object (is-a Cliente) (nombre ?n1) (está_interesado_en ?i1))
;    ?l1 <- (object (is-a Sitio_de_Interés) (satisface ?i2))
;    (test (eq ?i1 ?i2))
;    =>
;    (printout t (send ?p1 get-nombre) " debería ir a " (send ?l1 get-nombre) ", le costará " (send ?l1 get-precio) crlf)
;)
