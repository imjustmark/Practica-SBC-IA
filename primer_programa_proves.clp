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
    (is-a Ciudad)
    (role concrete)
    (pattern-match reactive)
    (slot nombre
        (type STRING)
        (create-accessor read-write))
    (slot precio
        (type FLOAT)
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
    (is-a Ciudad)
    (role concrete)
    (pattern-match reactive)
    (slot satisface
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
    (reina_sofia of Hotel (nombre "Hotel Reina Sofia") (precio 200))
    (macba of Sitio_de_Interés (nombre "MACBA") (precio 50) (satisface [aventura]))
    (sagrada_familia of Sitio_de_Interés (nombre "Sagrada Familia") (precio 100) (satisface [religion]))
    (barceloneta of Sitio_de_Interés (nombre "barceloneta") (precio 0) (satisface [aventura]))
    (raval of Sitio_de_Interés (nombre "raval") (precio 23.8) (satisface [aventura]))
)

; Exportació del MAIN
(defmodule MAIN (export ?ALL)
 (focus Preguntes)
 (focus Seleccio)
)

; Definició de TEMPLATES que poguem necessitar
(deftemplate client 
    (slot tipus)
    (slot pressupost)
    (slot duracio-esperada)
    (slot dies-per-ciutat)
    (slot num-ciutats)
    (multislot interesos)
)

(deftemplate viatge
    (slot preu-total)
    (slot duracio)
    (multislot ciutats)
    (multislot allotjaments)
    (multislot dies-ciutats)
    (multislot llocs-interes)
    (multislot transports)
)

; Definició de MISSATGES entre classes

; Definició de FUNCIONS

(deffunction fer-pregunta (?p)
   (printout t ?p)
   (bind ?r (read))
   (if (lexemep ?r) 
       then (bind ?r (lowcase ?r)))
   ?r)

   (deffunction pregunta-si-o-no (?p)
   (bind ?r (fer-pregunta ?p))
   (if (or (eq ?r yes) (eq ?r si))
       then TRUE 
       else FALSE))

; Definició de REGLES

; Mòdul de PREGUNTES
(defmodule Preguntes (import ?ALL) (export ?ALL)

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
)
   
; Mòdul de SELECCIÓ
(defmodule Seleccio (import ?ALL) (export ?ALL)

(deftemplate dades
    slot preu-actual
    slot dies-actuals
    slot num-ciutats-actual
    multislot llocs-compatibles
)

(defrule inicialitza-viatge ""
    (not (viatge-inicialitzat ?))
    ?c <- (client (duracio-esperada ?de))
    =>
    (assert (viatge (duracio ?de)))
    (assert (viatge-inicialitzat usuari))
    (assert (dades))
)

(defrule troba-llocs-compatibles ""
    (viatge-inicialitzat ?)
    ?ll <- (object (is-a Sitio_de_Interés) (satisface ?i))
    ?c <- (client (interesos $?li))
    ?d <- (dades (llocs-compatibles $?ls)) 
    =>
    (if (member ?i ?li) then (insert$ ?ls ?i))
)

(defrule assigna-ciutats ""
    (llocs-compatibles ?)
    (not (ciutats-assignades) ?)
    ?c <- (object (is-a Ciudad))
    ?d <- (dades (llocs-compatibles $?l))
    =>

)

)

; Mòdul de CONSTRUCCIÓ

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
