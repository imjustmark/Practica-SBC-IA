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

(defclass Medio_de_Transporte
    (is-a USER)
    (role concrete)
    (pattern-match reactive)
    (slot destino
        (type INSTANCE)
        (create-accessor read-write))
    (slot origen
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
    (cultura of Interés (nombre "cultura"))
    (relax of Interés (nombre "relax"))
    (fiesta of Interés (nombre "fiesta"))
    (romantico of Interés (nombre "romántico"))
    (nens of Interés (nombre "nens"))
    (amics of Interés (nombre "amics"))

    (origen of Ciudad (nombre "Origen"))

    (barcelona of Ciudad (nombre "Barcelona"))
    (reina_sofia of Hotel (nombre "Hotel Reina Sofia") (precio 200) (esta-en [barcelona]))
    (macba of Sitio_de_Interés (nombre "MACBA") (precio 50) (satisface [religion] [aventura]) (esta-en [barcelona]))
    (sagrada_familia of Sitio_de_Interés (nombre "Sagrada Familia") (precio 100) (satisface [religion]) (esta-en [barcelona]))
    (barceloneta of Sitio_de_Interés (nombre "barceloneta") (precio 0) (satisface [aventura]) (esta-en [barcelona]))
    (raval of Sitio_de_Interés (nombre "raval") (precio 23.8) (satisface [aventura]) (esta-en [barcelona]))

    (amsterdam of Ciudad (nombre "Amsterdam"))
    (the_bulldog_hotel of Hotel (nombre "The Bulldog Hotel") (precio 150) (esta-en [amsterdam]))
    (corendon_city_hotel of Hotel (nombre "Corendon City Hotel") (precio 86) (esta-en [amsterdam]))
    (hotel_notting_hill of Hotel (nombre "Hotel Notting Hill") (precio 131) (esta-en [amsterdam]))
    (camping_zeeburg of Camping (nombre "Camping Zeeburg") (precio 16) (esta-en [amsterdam]))
    (pension_homeland of Pensión (nombre "Pensión Homeland") (precio 46) (esta-en [amsterdam]))
    (rijksmuseum of Sitio_de_Interés (nombre "Rijksmuseum") (precio 20) (satisface [cultura]) (esta-en [amsterdam]))
    (vondelpark of Sitio_de_Interés (nombre "Vondelpark") (precio 0) (satisface [relax]) (esta-en [amsterdam]))

    (paris of Ciudad (nombre "Paris"))
    (hotel_minerve of Hotel (nombre "Hotel MINERVE") (precio 105) (esta-en [paris]))
    (hotel_le_walt of Hotel (nombre "Hotel Le Walt") (precio 307) (esta-en [paris]))
    (enjoy_hostel of Pensión (nombre "Enjoy Hostel") (precio 82) (esta-en [paris]))
    (torre_eiffel of Sitio_de_Interés (nombre "Torre Eiffel") (precio 40) (satisface [romántico]) (esta-en [paris]))
    (museo_louvre of Sitio_de_Interés (nombre "Museo Louvre") (precio 20) (satisface [cultura]) (esta-en [paris]))
    (catedral_de_notredame of Sitio_de_Interés (nombre "Catedral de Notre-Dame") (precio 0) (satisface [religion]) (esta-en [paris]))

    (viena of Ciudad (nombre "Viena"))
    (boutique_hotel of Hotel (nombre "Boutique Hotel") (precio 69) (esta-en [viena]))
    (aparthotel_adadgio of Hotel (nombre "Aparthotel Adagio") (precio 131) (esta-en [viena]))
    (camping_wien_west of Pensión (nombre "Camping Wien West") (precio 15) (esta-en [viena]))
    (schonbrunn_palace of Sitio_de_Interés (nombre "Schonbrunn Palace") (precio 20) (satisface [cultura]) (esta-en [viena]))
    (st_stephen_cathedral of Sitio_de_Interés (nombre "St Stephen Cathedral") (precio 0) (satisface [religion]) (esta-en [viena]))

    (roma of Ciudad (nombre "Roma"))
    (napoleon_hotel of Hotel (nombre "Napoleon Hotel") (precio 186) (esta-en [roma]))
    (hotel_trevi of Hotel (nombre "Hotel Trevi") (precio 192) (esta-en [roma]))
    (rome_experience_hostel of Pensión (nombre "Rome Experience Hostel") (precio 52) (esta-en [roma]))
    (coliseo of Sitio_de_Interés (nombre "Coliseo") (precio 40) (satisface [cultura]) (esta-en [roma]))
    (basílica_st_peter of Sitio_de_Interés (nombre "Basílica St Peter") (precio 10) (satisface [religion]) (esta-en [roma]))
    (bike_tour_orvieto of Sitio_de_Interés (nombre "Bike Tour Orvieto") (precio 400) (satisface [aventura]) (esta-en [roma]))

    (praga of Ciudad (nombre "Praga"))
    (grandium_hotel of Hotel (nombre "Grandium Hotel") (precio 96) (esta-en [praga]))
    (aria_hotel of Hotel (nombre "Aria Hotel") (precio 233) (esta-en [praga]))
    (prague_central_camp of Hotel (nombre "Prague Central Camp") (precio 18) (esta-en [praga]))
    (karlovy_lazne of Sitio_de_Interés (nombre "Karlovy Lazne") (precio 20) (satisface [fiesta]) (esta-en [praga]))
    (dancing_house of Sitio_de_Interés (nombre "Dancing House") (precio 0) (satisface [cultura]) (esta-en [praga]))

    (bus1 of Bus (origen [barcelona]) (destino [praga]) (precio 20.0))
    (bus2 of Bus (origen [praga]) (destino [barcelona]) (precio 20.0))
    (bus3 of Bus (origen [barcelona]) (destino [roma]) (precio 12.0))
    (bus4 of Bus (origen [roma]) (destino [barcelona]) (precio 12.0))
    (bus5 of Bus (origen [praga]) (destino [roma]) (precio 8.0))
    (bus6 of Bus (origen [roma]) (destino [praga]) (precio 8.0))
    (bus7 of Bus (origen [barcelona]) (destino [paris]) (precio 10.0))
    (bus8 of Bus (origen [paris]) (destino [barcelona]) (precio 10.0))
    (bus9 of Bus (origen [barcelona]) (destino [origen]) (precio 15.0))
    (bus10 of Bus (origen [origen]) (destino [barcelona]) (precio 15.0))


    (tren1 of Tren (origen [origen]) (destino [praga]) (precio 20.0))
    (tren2 of Tren (origen [praga]) (destino [origen]) (precio 20.0))
    (tren3 of Tren (origen [amsterdam]) (destino [paris]) (precio 15.0))
    (tren4 of Tren (origen [paris]) (destino [amsterdam]) (precio 15.0))
    (tren5 of Tren (origen [roma]) (destino [paris]) (precio 25.0))
    (tren6 of Tren (origen [paris]) (destino [roma]) (precio 25.0))
    (tren7 of Tren (origen [roma]) (destino [amsterdam]) (precio 75.0))
    (tren8 of Tren (origen [amsterdam]) (destino [roma]) (precio 75.0))
    (tren9 of Tren (origen [viena]) (destino [amsterdam]) (precio 50.0))
    (tren10 of Tren (origen [amsterdam]) (destino [viena]) (precio 50.0))
    (tren11 of Tren (origen [paris]) (destino [viena]) (precio 20.0))
    (tren12 of Tren (origen [viena]) (destino [paris]) (precio 20.0))
    (tren13 of Tren (origen [origen]) (destino [viena]) (precio 30.0))
    (tren14 of Tren (origen [viena]) (destino [origen]) (precio 30.0))

    (avion1 of Avión (origen [origen]) (destino [roma]) (precio 80.0))
    (avion2 of Avión (origen [roma]) (destino [origen]) (precio 80.0))
    (avion3 of Avión (origen [barcelona]) (destino [viena]) (precio 120.0))
    (avion4 of Avión (origen [viena]) (destino [barcelona]) (precio 120.0))
    (avion5 of Avión (origen [praga]) (destino [viena]) (precio 40.0))
    (avion6 of Avión (origen [viena]) (destino [praga]) (precio 40.0))
    (avion7 of Avión (origen [paris]) (destino [praga]) (precio 70.0))
    (avion8 of Avión (origen [praga]) (destino [paris]) (precio 70.0))
    (avion9 of Avión (origen [amsterdam]) (destino [praga]) (precio 90.0))
    (avion10 of Avión (origen [praga]) (destino [amsterdam]) (precio 90.0))
    (avion11 of Avión (origen [roma]) (destino [viena]) (precio 60.0))
    (avion12 of Avión (origen [viena]) (destino [roma]) (precio 60.0))
    (avion13 of Avión (origen [paris]) (destino [origen]) (precio 70.0))
    (avion14 of Avión (origen [origen]) (destino [paris]) (precio 70.0))

    (barco1 of Barco (origen [origen]) (destino [amsterdam]) (precio 45.0))
    (barco2 of Barco (origen [amsterdam]) (destino [origen]) (precio 45.0))
    (barco3 of Barco (origen [barcelona]) (destino [amsterdam]) (precio 90.0))
    (barco4 of Barco (origen [amsterdam]) (destino [barcelona]) (precio 90.0))
    (barco5 of Barco (origen [origen]) (destino [amsterdam]) (precio 45.0))
    (barco6 of Barco (origen [origen]) (destino [amsterdam]) (precio 45.0))

)

; Definició de MÒDULS
(defmodule MAIN (export ?ALL))

(defmodule Preguntes (import MAIN ?ALL) (export ?ALL))

(defmodule Seleccio (import MAIN ?ALL) (import Preguntes ?ALL) (export ?ALL))

(defmodule Construccio (import MAIN ?ALL) (import Preguntes ?ALL) (import Seleccio ?ALL) (export ?ALL))

(defmodule Escriptura (import MAIN ?ALL) (import Preguntes ?ALL) (import Seleccio ?ALL) (import Construccio ?ALL) (export ?ALL))

; Definició de TEMPLATES que poguem necessitar
(deftemplate MAIN::client 
    (slot tipus)
    (slot pressupost)
    (slot min-duracio)
    (slot max-duracio)
    (slot min-dies-per-ciutat)
    (slot max-dies-per-ciutat)
    (slot min-num-ciutats)
    (slot max-num-ciutats)
    (multislot interesos)
    (multislot valora)
)

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
    (printout t crlf)
    (bind ?resposta (readline))
    (bind ?resposta (lowcase ?resposta))
    (bind ?res (explode$ ?resposta))
    ?res
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


; Definició de REGLES

; Mòdul de PREGUNTES

(defrule MAIN::inici
    (declare (salience 10))
    =>
    (printout t "----------------------------------------" crlf)
    (printout t "    Agència de Viatges IA-Paradisus" crlf)
    (printout t "----------------------------------------" crlf)
    (focus Preguntes)
)

(defrule Preguntes::determina-tipus-client ""
   (not (tipus))
   =>
   (if (pregunta-si-o-no "Viatges sol? (si/no) ") 
       then (assert (client (tipus individual)))
       else 
       (if (pregunta-si-o-no "Viatges amb la teva parella? (si/no) ")
           then (assert (client (tipus parella) (valora (create$ [romàntic]))))
           else 
           (if (pregunta-si-o-no "Viatges amb la teva familia? (si/no) ")
                 then (if (pregunta-si-o-no "Tens nens petits? (si/no)") 
                        then (assert (client (tipus familia) (valora (create$ [nens]))))
                        else (assert (client (tipus familia))))
                 else (if (pregunta-si-o-no "Viatges amb un grup d'amics? (si/no)")
                        then  (assert (client (tipus grup) (valora (create$ [amics]))))
                        else  (assert (client (tipus otros)))
                 )
            )
        )
    )
    (assert (tipus))
)

(defrule Preguntes::determina-pressupost-client ""
   (not (pressupost))
   ?c <- (client)
   =>
   (bind ?r (fer-pregunta "Quin es el teu pressupost maxim? "))
   (while (< ?r 0) do (bind ?r (fer-pregunta "Quin es el teu pressupost maxim? ")))
   (modify ?c (pressupost ?r))
   (assert (pressupost)) 
)

(defrule Preguntes::determina-dies-client ""
   (not (dies))
   ?c <- (client)
   =>
   (bind ?r1 (fer-pregunta "Quants dies vols que duri el viatge com a mínim? "))
   (while (< ?r1 0) do (bind ?r1 (fer-pregunta "Quants dies vols que duri el viatge com a mínim? ")))
   (bind ?r2 (fer-pregunta "I com a màxim? "))
   (while (< ?r2 ?r1) do (bind ?r2 (fer-pregunta "I com a màxim? ")))
   (modify ?c (min-duracio ?r1) (max-duracio ?r2))
   (assert (dies)) 
)

(defrule Preguntes::determina-interesos-client ""
    (dies)
    (dies-per-ciutat)
    (not (interesos))
    ?c <- (client (valora $?v))
    =>
    (bind ?interesos (find-all-instances ((?i Interés)) TRUE))
    (printout t "Llista d'Interesos: " crlf)
    (bind ?nombres (create$))
    (loop-for-count (?i 1 (length$ ?interesos)) do 
        (bind ?inte (nth$ ?i ?interesos))
        (bind ?nom (send ?inte get-nombre))
        (if (not (member$ ?inte ?v)) then (bind ?nombres (insert$ ?nombres (+ (length$ ?nombres) 1) ?nom)))
    )
    (printout t ?nombres crlf)
    (bind ?r (pregunta-llista "Quins son els teus interessos? (d'entre la llista anterior)"))
    (bind ?l (create$))
    (loop-for-count (?i 1 (length$ ?r)) do
        (bind ?aux (nth$ ?i ?r))
        (if (member$ ?aux ?nombres) then 
            (bind ?j (troba_index ?aux ?nombres))
            (bind ?inst (nth$ ?j ?interesos))
            (bind ?l (insert$ ?l (+ (length$ ?l) 1) ?inst))
        )
    )
    (modify ?c (interesos ?l))
    (assert (interesos))
)

(defrule Preguntes::determina-dies-per-ciutat-client ""
   (not (dies-per-ciutat))
   ?c <- (client)
   =>
   (bind ?r1 (fer-pregunta "Quants dies vols estar a cada ciutat com a mínim? "))
   (while (< ?r1 0) do (bind ?r1 (fer-pregunta "Quants dies vols estar a cada ciutat com a mínim? ")))
   (bind ?r2 (fer-pregunta "I com a màxim? "))
   (while (< ?r2 ?r1) do (bind ?r2 (fer-pregunta "I com a màxim? ")))
   (modify ?c (min-dies-per-ciutat ?r1) (max-dies-per-ciutat ?r2))
   (assert (dies-per-ciutat)) 
)

(defrule Preguntes::determina-num-ciutats-client ""
    (dies)
    (dies-per-ciutat)
    (not (num-ciutats))
    ?c <- (client (min-duracio ?mind) (max-duracio ?maxd) (min-dies-per-ciutat ?mindpc) (max-dies-per-ciutat ?maxdpc))
    =>
    (bind ?ciutats (find-all-instances ((?ciu Ciudad)) TRUE))
    (bind ?num_ciutats (length$ ?ciutats))
    (if (> (/ ?maxd ?mindpc) (/ ?num_ciutats 2)) then 
        (modify ?c (min-num-ciutats (/ ?mind ?maxdpc)) (max-num-ciutats (/ ?num_ciutats 2)))
        else
        (modify ?c (min-num-ciutats (/ ?mind ?maxdpc)) (max-num-ciutats (/ ?maxd ?mindpc)))
        )
    (assert (num-ciutats))
)

(defrule Preguntes::fi-de-modul ""
    (declare (salience -10))
    (num-ciutats)
    =>
    (focus Seleccio)
)

   
; Mòdul de SELECCIÓ

(deftemplate MAIN::dades
    (multislot llocs-compatibles)
    (multislot ciutats-compatibles)
    (multislot qualitat-ciutats)
    (multislot allotjaments-compatibles)
    (multislot transports-compatibles)
)

(defrule Seleccio::inicialitza-dades ""
    (not (inicialitza-dades))
    =>
    (assert(dades (llocs-compatibles (create$)) (ciutats-compatibles (create$)) 
                 (allotjaments-compatibles (create$)) (transports-compatibles (create$))
                 (qualitat-ciutats (create$))))
    (assert (inicialitza-dades))
)

(defrule Seleccio::troba-llocs-compatibles ""
    ?c <- (client (interesos $?li))
    ?d <- (dades)
    (inicialitza-dades) 
    (not (llocs-compatibles))
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
    (assert (llocs-compatibles))
)

(defrule Seleccio::assigna-ciutats ""
    (llocs-compatibles)
    (not (ciutats-assignades))
    ?d <- (dades (llocs-compatibles $?ls))
    ?cl <- (client (min-duracio ?mind) (max-duracio ?maxd) (min-dies-per-ciutat ?mindpc) (max-dies-per-ciutat ?maxdpc))
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
    (assert (ciutats-assignades))
    (bind ?num_ciutats (length$ ?cs))
    (if (> (/ ?maxd ?mindpc) (/ ?num_ciutats 2)) then 
        (modify ?cl (min-num-ciutats (/ ?mind ?maxdpc)) (max-num-ciutats (/ ?num_ciutats 2)))
    )
)

(defrule Seleccio::assigna-allotjaments ""
    (ciutats-assignades)
    (not (allotjaments-assignats))
    ?d <- (dades (ciutats-compatibles $?cs))
    =>
    (bind ?list (create$))
    (loop-for-count (?i 1 (length$ ?cs)) do
        (bind ?c (nth$ ?i ?cs))
        (bind ?allotjs (find-all-instances ((?a Alojamiento)) (eq ?a:esta-en ?c)))
        (bind ?list (insert$ ?list (+ (length$ ?list) 1) ?allotjs))
    )
    (modify ?d (allotjaments-compatibles ?list))
    (assert (allotjaments-assignats))
)

(defrule Seleccio::fi-de-modul ""
    (declare (salience -10))
    (allotjaments-assignats)
    =>
    (focus Construccio)
)

; Mòdul de CONSTRUCCIÓ

(deftemplate viatge
    (slot preu-total)
    (slot duracio)
    (slot num-ciutats)
    (multislot ciutats)
    (multislot allotjaments)
    (multislot dies-ciutats)
    (multislot llocs-interes)
    (multislot transports)     
)

(deffunction troba_ciutat_max(?ciutats ?puntuacions)
    (bind ?max 0)
    (bind ?imax -1)
    (loop-for-count (?i 1 (length$ ?puntuacions)) do
        (bind ?c (nth$ ?i ?puntuacions))
        (if (> ?c ?max) then 
            (bind ?imax ?i)
            (bind ?max ?c))
    )
    (bind ?res (nth$ ?imax ?ciutats))
    ?imax
)

(defrule Construccio::selecciona-duracio ""
    (declare (salience 10))
    (not (duracio-seleccionada ?))
    ?c <- (client (min-duracio ?mind) (max-duracio ?maxd))
    =>
    (loop-for-count (?i ?mind ?maxd) do 
        (bind ?v (assert(viatge (duracio ?i))))
        (assert (duracio-seleccionada ?v))
    )
)

(defrule Construccio::selecciona-num-ciutats ""
    (declare (salience 5))
    ?c <- (client (min-num-ciutats ?minn) (max-num-ciutats ?maxn))
    ?v <- (viatge (duracio ?n))
    (not (num-ciutats-seleccionat ?v))
    (duracio-seleccionada ?v)
    =>
    (loop-for-count (?i (integer (+ ?minn 1)) (integer ?maxn)) do
        (bind ?v2 (assert (viatge (duracio ?n) (num-ciutats ?i))))
        (assert (num-ciutats-seleccionat ?v2))
    )
    (retract ?v)
)

(defrule Construccio::selecciona-ciutats ""
    ?d <- (dades (ciutats-compatibles $?cs) (qualitat-ciutats $?nums))
    ?v <- (viatge (num-ciutats ?c))
    (num-ciutats-seleccionat ?v)
    (not (ciutats-seleccionades ?v))
    =>
    (bind ?list (create$))
    (bind ?aux1 ?cs)
    (bind ?aux2 ?nums)
    (loop-for-count (?i 1 ?c) do
        (bind ?imax (troba_ciutat_max ?aux1 ?aux2))
        (bind ?cmax (nth$ ?imax ?aux1))
        (bind ?aux2 (replace$ ?aux2 ?imax ?imax 0))
        (bind ?list (insert$ ?list 1 ?cmax))
    )
    (modify ?v (ciutats ?list))
    (assert (ciutats-seleccionades ?v))
)

(defrule Construccio::selecciona-dies-per-ciutat "" 
    ?cl <- (client (min-dies-per-ciutat ?mindpc) (max-dies-per-ciutat ?maxdpc))
    ?v <- (viatge (duracio ?n) (num-ciutats ?c) (ciutats $?cs))
    (ciutats-seleccionades ?v)
    (not (dies-per-ciutat-seleccionats ?v))
    =>
    (bind ?dpc (integer (/ ?n ?c)))
    (bind ?list (create$))
    (loop-for-count (?i 1 ?c) do
        (bind ?list (insert$ ?list 1 ?dpc))
    )
    (bind ?rest (- ?n (* ?dpc ?c)))
    (loop-for-count (?i 1 ?rest) do 
        (bind ?list (replace$ ?list ?i ?i (+ (nth$ ?i ?list) 1)))
    )
    (modify ?v (dies-ciutats ?list))
    (assert (dies-per-ciutat-seleccionats ?v))
)

(defrule Construccio::selecciona-llocs-interes ""
    ?v <- (viatge (ciutats $?cs) (dies-ciutats $?dies))
    ?d <- (dades (llocs-compatibles $?lls))
    (dies-per-ciutat-seleccionats ?v)
    (not (llocs-interes-seleccionats ?v))
    =>
    (bind ?list (create$))
    (bind ?aux  (create$))
    (loop-for-count (?i 1 (length$ ?lls)) do 
        (bind ?ll (nth$ ?i ?lls))
        (if (member$ (send ?ll get-esta-en) ?cs) then (bind ?aux (insert$ ?aux (+ (length$ ?aux) 1) ?ll)))
    )
    (loop-for-count (?j 1 (length$ ?cs)) do 
        (bind ?n (nth$ ?j ?dies))
        (bind ?c (nth$ ?j ?cs))
        (loop-for-count (?k 1 ?n) do
            (bind ?index 1)
            (bind ?found 0) 
            (while (eq ?found 0) do
                (bind ?ll (nth$ ?index ?aux))
                (if (and (eq (send ?ll get-esta-en) ?c) (not (member$ ?ll ?list))) then 
                    (bind ?found 1)
                    (bind ?list (insert$ ?list (+ (length$ ?list) 1) ?ll))
                )
                (bind ?index (+ ?index 1))
                (if (> ?index (length$ ?aux)) then (bind ?found 1))
            )
        )
    )
    (modify ?v (llocs-interes ?list))
    (assert (llocs-interes-seleccionats ?v))
)

(defrule Construccio::selecciona-allotjaments ""
    ?v <- (viatge (ciutats $?cs) (dies-ciutats $?dpcs) (num-ciutats ?n))
    ?d <- (dades (allotjaments-compatibles $?as))
    ?cl <- (client (pressupost ?ps))
    (llocs-interes-seleccionats ?v)
    (not (allotjaments-seleccionats ?v))
    =>
    (bind ?presperciu (/ ?ps ?n))
    (bind ?list (create$))
    (loop-for-count (?i 1 (length$ ?cs)) do 
        (bind ?c (nth$ ?i ?cs))
        (bind ?dies (nth$ ?i ?dpcs))
        (bind ?prespernit (/ ?presperciu ?dies))
        (bind ?found 0)
        (bind ?j 1)
        (while (eq ?found 0) do
            (bind ?a (nth$ ?j ?as))
            (if (and (eq (send ?a get-esta-en) ?c) (< (send ?a get-precio) ?prespernit)) then 
                (bind ?list (insert$ ?list (+ (length$ ?list) 1) ?a))
                (bind ?found 1)
            )
            (bind ?j (+ ?j 1))
        )
    )
    (modify ?v (allotjaments ?list))
    (assert (allotjaments-seleccionats ?v))
)

(defrule Construccio::selecciona-transports ""
    ?v <- (viatge (ciutats $?cs))
    ?d <- (dades)
    ?t1 <- (object (is-a Medio_de_Transporte) (origen ?o1) (destino ?d1))
    ?t2 <- (object (is-a Medio_de_Transporte) (origen ?o2) (destino ?d2))
    (allotjaments-seleccionats ?v)
    (not (transports-seleccionats ?v))
    (test (and (eq ?o1 [origen]) (eq ?d1 (nth$ 1 ?cs)) (eq ?o2 (nth$ (length$ ?cs) ?cs)) (eq ?d2 [origen])))
    =>
    (bind ?transports_entre (find-all-instances ((?mt Medio_de_Transporte)) (and (member$ ?mt:origen ?cs) (member$ ?mt:destino ?cs))))
    (bind ?list (create$ ?t1 ?t2))
    (loop-for-count (?i 1 (- (length$ ?cs) 1)) do
        (bind ?o (nth$ ?i ?cs))
        (bind ?d (nth$ (+ ?i 1) ?cs))
        (bind ?found 0)
        (bind ?j 1)
        (while (eq ?found 0) do
            (bind ?t (nth$ ?j ?transports_entre))
            (if (and (eq (send ?t get-origen) ?o) (eq (send ?t get-destino) ?d)) then 
                (bind ?list (insert$ ?list (length$ ?list) ?t))
                (bind ?found 1)
            )
            (bind ?j (+ ?j 1))
            (if (> ?j (length$ ?transports_entre)) then (bind ?found 1))
        )
    )
    (modify ?v (transports ?list))
    (assert(transports-seleccionats ?v))
)

(defrule Construccio::calcula-preu-total ""
    ?v <- (viatge (allotjaments $?as) (llocs-interes $?lls) (transports $?ts) (dies-ciutats $?ns))
    (not (preu-total-calculat ?v))
    (transports-seleccionats ?v)
    =>
    (bind ?pt 0)
    (loop-for-count (?i 1 (length$ ?as)) do
        (bind ?a (nth$ ?i ?as))
        (bind ?n (nth$ ?i ?ns))
        (bind ?pt (+ ?pt (* ?n (send ?a get-precio))))
    )
    (loop-for-count (?j 1 (length$ ?lls)) do
        (bind ?ll (nth$ ?j ?lls))
        (bind ?pt (+ ?pt (send ?ll get-precio)))
    )
    (loop-for-count (?k 1 (length$ ?ts)) do
        (bind ?t (nth$ ?k ?ts))
        (bind ?pt (+ ?pt (send ?t get-precio)))
    )
    (modify ?v (preu-total ?pt))
    (assert (preu-total-calculat ?v))
    (assert (impresos 0))
)

(defrule Construccio::fi-de-modul
    (declare (salience -10))
    (forall (viatge) (preu-total-calculat ?v))
    =>
    (focus Escriptura)
)

; Mòdul d'ESCRIPTURA dels RESULTATS

(deftemplate Ciutats-Usades
    (multislot ciutats)
)

(defrule Escriptura::inici-modul ""
    (declare (salience 10))
    =>
    (assert (Ciutats-Usades) (ciutats (create$)))
)

(defrule Escriptura::impresio-resultats ""
    ?cl <- (client (pressupost ?pr))
    ?v <- (viatge (preu-total ?pt) (duracio ?d) (num-ciutats ?n) (ciutats $?cs) (allotjaments $?as)
            (dies-ciutats $?dpcs) (llocs-interes $?lls) (transports $?ts))
    ?cu <- (Ciutats-Usades (ciutats $?cus))
    (not (impresos 2))
    (not (impres ?v))
    (impresos ?imp)
    =>
    (bind ?valid 1)
    (bind ?i 1)
    (bind ?list (create$))
    (while (and (<= ?i (length$ ?cs)) (eq ?valid 1)) do 
        (bind ?ciu (nth$ ?i ?cs))
        (if (member$ ?ciu ?cus) then (bind ?valid 0))
        (bind ?i (+ ?i 1))
    )
    (if (and (<= ?pt ?pr) (eq ?valid 1)) then
        (printout t crlf)
        (printout t "VIAJE RECOMENDADO " (+ ?imp 1)  ":" crlf)
        (printout t "Precio total (persona): " ?pt " euros" crlf)
        (printout t "Duración del viaje: " ?d " dias" crlf)
        (printout t "Ciudades: ")
        (loop-for-count (?i 1 (length$ ?cs)) do 
            (bind ?ciu (nth$ ?i ?cs))
            (printout t (send ?ciu get-nombre) " (" (nth$ ?i ?dpcs) " dias)")
            (if (neq ?i (length$ ?cs)) then 
                (printout t ", ")
            )
            (bind ?list (insert$ ?list (+ (length$ ?list) 1) ?ciu))
        )
        (printout t crlf)
        (printout t "Visitas: ")
        (loop-for-count (?i 1 (length$ ?cs)) do
            (bind ?c (nth$ ?i ?cs))
            (printout t (send ?c get-nombre) ": ")
            (loop-for-count (?j 1 (length$ ?lls)) do
                (bind ?ll (nth$ ?j ?lls))
                (if (eq ?c (send ?ll get-esta-en)) then (printout t (send ?ll get-nombre) ", "))
            )
        )
        (printout t crlf)
        (printout t "Alojamiento: ")
        (loop-for-count (?i 1 (length$ ?cs)) do
            (bind ?c (nth$ ?i ?cs))
            (printout t (send ?c get-nombre) ": ")
            (bind ?a (nth$ ?i ?as))
            (printout t (send ?a get-nombre))
            (if (neq ?i (length$ ?cs)) then (printout t ", "))
        )
        (printout t crlf)
        (printout t "Viajes: ")
        (loop-for-count (?i 1 (length$ ?ts)) do
            (bind ?t (nth$ ?i ?ts))
            (bind ?o (send ?t get-origen))
            (bind ?d (send ?t get-destino))
            (printout t (send ?o get-nombre) "-" (send ?d get-nombre) ": ")
            (if (eq (class ?t) Bus) then (printout t "Bus"))
            (if (eq (class ?t) Avión) then (printout t "Avion"))
            (if (eq (class ?t) Tren) then (printout t "Tren"))
            (if (eq (class ?t) Barco) then (printout t "Barco"))
            (if (neq ?i (length$ ?ts)) then (printout t ", "))
        )
        (printout t crlf)
        (printout t crlf)
        (assert (impresos (+ ?imp 1)))
        (assert (impres ?v))
        (modify ?cu (ciutats (insert$ ?cus (+ (length$ ?cus) 1) ?list)))
    )
)

(defrule Escriptura::impresio-fallida ""
        (declare (salience -10))
        (not (impresos 2))
        =>
        (printout t "Ho sentim, no hi ha viatges que s'ajustin a les teves restriccions." crlf)
)

; Potser és més important escollir transport abans que allotjament.
; multislots de 1 en 1 en la part esquerra de la regla (maybe?)
