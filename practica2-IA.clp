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

(defclass Ciudad-Con-Puerto
    (is-a Ciudad)
    (role concrete)
    (pattern-match reactive)
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
    (nens of Interés (nombre "niños"))
    (amics of Interés (nombre "amigos"))
    (riesgo of Interés (nombre "riesgo"))
    (cosmetica of Interés (nombre "cosmética"))
    (gastronomia of Interés (nombre "gastronomia"))
    (finanzas of Interés (nombre "finanzas"))
    (arte of Interés (nombre "arte"))
    (playa of Interés (nombre "playa"))

    (origen of Ciudad-Con-Puerto (nombre "Origen"))

    (barcelona of Ciudad-Con-Puerto (nombre "Barcelona"))
    (reina_sofia of Hotel (nombre "Hotel Reina Sofia") (precio 200) (esta-en [barcelona]))
    (el_ancla of Camping (nombre "Camping El Ancla") (precio 30) (esta-en [barcelona]))
    (macba of Sitio_de_Interés (nombre "MACBA") (precio 50) (satisface [arte] [cultura]) (esta-en [barcelona]))
    (sagrada_familia of Sitio_de_Interés (nombre "Sagrada Familia") (precio 100) (satisface [religion] [arte]) (esta-en [barcelona]))
    (barceloneta of Sitio_de_Interés (nombre "Platja de la Barceloneta") (precio 0) (satisface [relax] [playa] [amics]) (esta-en [barcelona]))
    (raval of Sitio_de_Interés (nombre "Barri del Born") (precio 0) (satisface [fiesta]) (esta-en [barcelona]))
    (bunkers of Sitio_de_Interés (nombre "Búnkers-El Carmel") (precio 0) (satisface [aventura] [amics]) (esta-en [barcelona]))

    (amsterdam of Ciudad-Con-Puerto (nombre "Amsterdam"))
    (the_bulldog_hotel of Hotel (nombre "The Bulldog Hotel") (precio 150) (esta-en [amsterdam]))
    (corendon_city_hotel of Hotel (nombre "Corendon City Hotel") (precio 86) (esta-en [amsterdam]))
    (hotel_notting_hill of Hotel (nombre "Hotel Notting Hill") (precio 131) (esta-en [amsterdam]))
    (camping_zeeburg of Camping (nombre "Camping Zeeburg") (precio 16) (esta-en [amsterdam]))
    (pension_homeland of Pensión (nombre "Pensión Homeland") (precio 46) (esta-en [amsterdam]))
    (rijksmuseum of Sitio_de_Interés (nombre "Rijksmuseum") (precio 20) (satisface [cultura] [arte]) (esta-en [amsterdam]))
    (vondelpark of Sitio_de_Interés (nombre "Vondelpark") (precio 0) (satisface [relax] [amics] [romantico]) (esta-en [amsterdam]))

    (paris of Ciudad (nombre "Paris"))
    (hotel_minerve of Hotel (nombre "Hotel MINERVE") (precio 105) (esta-en [paris]))
    (hotel_le_walt of Hotel (nombre "Hotel Le Walt") (precio 307) (esta-en [paris]))
    (enjoy_hostel of Pensión (nombre "Enjoy Hostel") (precio 82) (esta-en [paris]))
    (torre_eiffel of Sitio_de_Interés (nombre "Torre Eiffel") (precio 40) (satisface [romantico] [arte]) (esta-en [paris]))
    (museo_louvre of Sitio_de_Interés (nombre "Museo Louvre") (precio 20) (satisface [cultura] [arte]) (esta-en [paris]))
    (catedral_de_notredame of Sitio_de_Interés (nombre "Catedral de Notre-Dame") (precio 10) (satisface [religion] [cultura] [romantico]) (esta-en [paris]))

    (viena of Ciudad (nombre "Viena"))
    (boutique_hotel of Hotel (nombre "Boutique Hotel") (precio 69) (esta-en [viena]))
    (aparthotel_adadgio of Hotel (nombre "Aparthotel Adagio") (precio 131) (esta-en [viena]))
    (camping_wien_west of Pensión (nombre "Camping Wien West") (precio 15) (esta-en [viena]))
    (schonbrunn_palace of Sitio_de_Interés (nombre "Schonbrunn Palace") (precio 20) (satisface [cultura] [arte]) (esta-en [viena]))
    (st_stephen_cathedral of Sitio_de_Interés (nombre "St Stephen Cathedral") (precio 0) (satisface [religion] [cultura]) (esta-en [viena]))

    (roma of Ciudad-Con-Puerto (nombre "Roma"))
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

    (mariupol of Ciudad (nombre "Minsk"))
    (reikartz_hotel of Hotel (nombre "Hotel Reikartz") (precio 122) (esta-en [mariupol]))
    (spartak_hotel of Hotel (nombre "Hotel Spartak") (precio 85) (esta-en [mariupol]))
    (putin_hostel of Pensión (nombre "Putin Hostel") (precio 30) (esta-en [mariupol]))
    (bomb_crater of Sitio_de_Interés (nombre "Bomb Crater") (precio 10) (satisface [cultura] [riesgo]) (esta-en [mariupol]))
    (practica_tiro of Sitio_de_Interés (nombre "Practica de Tiro") (precio 0) (satisface [aventura] [riesgo]) (esta-en [mariupol]))

    (istanbul of Ciudad-Con-Puerto (nombre "Istanbul"))
    (mercure_hotel of Hotel (nombre "Hotel Mercure Istanbul") (precio 105) (esta-en [istanbul]))
    (almiral_palace_hotel of Hotel (nombre "Almiral Palace Hotel") (precio 90) (esta-en [istanbul]))
    (turc_hostel of Pensión (nombre "Turkish Hostel") (precio 25) (esta-en [istanbul]))
    (palazzo_hostel of Pensión (nombre "Palazzo Hostel") (precio 30) (esta-en [istanbul]))
    (hair_implant of Sitio_de_Interés (nombre "Implante de Pelo") (precio 100) (satisface [cosmetica]) (esta-en [istanbul]))
    (santa_sofia of Sitio_de_Interés (nombre "Santa Sofia") (precio 20) (satisface [cultura] [religion] [arte]) (esta-en [istanbul]))

    (londres of Ciudad-Con-Puerto (nombre "Londres"))
    (hilton_hotel of Hotel (nombre "Hilton Hotel") (precio 200) (esta-en [londres]))
    (novotel of Hotel (nombre "Novotel Hotel") (precio 150) (esta-en [londres]))
    (london_camping of Camping (nombre "London Camping") (precio 50) (esta-en [londres]))
    (london_apartment of Apartamento (nombre "London Apartment") (precio 100) (esta-en [londres]))
    (big_ben of Sitio_de_Interés (nombre "Big Ben") (precio 20) (satisface [cultura] [romantico]) (esta-en [londres]))
    (candem_town of Sitio_de_Interés (nombre "Candem Town") (precio 0) (satisface [gastronomia] [fiesta] [relax]) (esta-en [londres]))
    (london_eye of Sitio_de_Interés (nombre "London Eye") (precio 50) (satisface [romantico] [aventura]) (esta-en [londres]))
    
    (berlin of Ciudad (nombre "Berlín"))
    (intercity_hotel of Hotel (nombre "Intercity Hotel") (precio 130) (esta-en [berlin]))
    (monbijou of Hotel (nombre "Monbijou Hotel") (precio 97) (esta-en [berlin]))
    (berlin_camping of Camping (nombre "Berlin Camping") (precio 30) (esta-en [berlin]))
    (berlin_apartment of Apartamento (nombre "Berlin Apartment") (precio 80) (esta-en [berlin]))
    (puerta_de_berlin of Sitio_de_Interés (nombre "Puerta de Brandemburgo") (precio 0) (satisface [cultura] [relax]) (esta-en [berlin]))
    (berlin_spa of Sitio_de_Interés (nombre "Berlin Spa") (precio 50) (satisface [relax]) (esta-en [berlin]))
    (berlin_pub of Sitio_de_Interés (nombre "Berlin Pub") (precio 20) (satisface [fiesta] [gastronomia]) (esta-en [berlin]))

    (zurich of Ciudad (nombre "Zurich"))
    (ibis_hotel of Hotel (nombre "Ibis Hotel") (precio 130) (esta-en [zurich]))
    (zurich_hostel of Pensión (nombre "Zurich Hostel") (precio 30) (esta-en [zurich]))
    (zurich_camping of Camping (nombre "Zurich Camping") (precio 10) (esta-en [zurich]))
    (zurich_apartment of Apartamento (nombre "Zurich Apartment") (precio 87) (esta-en [zurich]))
    (bank of Sitio_de_Interés (nombre "Economy Center") (precio 0) (satisface [riesgo] [finanzas]) (esta-en [zurich]))
    (chocolate_factory of Sitio_de_Interés (nombre "Lindt Factory") (precio 20) (satisface [gastronomia]) (esta-en [zurich]))

    (lisbon of Ciudad-Con-Puerto (nombre "Lisbon"))
    (eurostars_hotel of Hotel (nombre "Eurostars Hotel") (precio 110) (esta-en [lisbon]))
    (lisbon_hostel of Pensión (nombre "Lisbon Hostel") (precio 27) (esta-en [lisbon]))
    (lisbon_camping of Camping (nombre "Lisbon Camping") (precio 8) (esta-en [lisbon]))
    (lisbon_apartment of Apartamento (nombre "Lisbon Apartment") (precio 73) (esta-en [lisbon]))
    (porta_do_sol of Sitio_de_Interés (nombre "Porta do Sol") (precio 10) (satisface [cultura] [romantico]) (esta-en [lisbon]))
    (lisbon_beach of Sitio_de_Interés (nombre "Lisbon Beach") (precio 0) (satisface [aventura] [nens] [amics] [relax] [fiesta]) (esta-en [lisbon]))

    (zagreb of Ciudad (nombre "Zagreb"))
    (zagreb_hotel of Hotel (nombre "Zagreb Hotel") (precio 100) (esta-en [zagreb]))
    (zagreb_hostel of Pensión (nombre "Zagreb Hostel") (precio 23) (esta-en [zagreb]))
    (zagreb_camping of Camping (nombre "Zagreb Camping") (precio 9) (esta-en [zagreb]))
    (zagreb_apartment of Apartamento (nombre "Zagreb Apartment") (precio 63) (esta-en [zagreb]))
    (zagreb_cathedral of Sitio_de_Interés (nombre "Zagreb Cathedral") (precio 8) (satisface [cultura] [religion] [arte]) (esta-en [zagreb]))
    (centro_masaje of Sitio_de_Interés (nombre "Centro de Masaje") (precio 50) (satisface [relax] [romantico]) (esta-en [zagreb]))

    (atenas of Ciudad-Con-Puerto (nombre "Atenas"))
    (atenas_hotel of Hotel (nombre "Atenas Hotel") (precio 113) (esta-en [atenas]))
    (atenas_hostel of Pensión (nombre "Atenas Hostel") (precio 33) (esta-en [atenas]))
    (atenas_camping of Camping (nombre "Atenas Camping") (precio 11) (esta-en [atenas]))
    (atenas_apartment of Apartamento (nombre "Atenas Apartment") (precio 71) (esta-en [atenas]))
    (parthenon of Sitio_de_Interés (nombre "Partenón") (precio 12) (satisface [cultura] [religion]) (esta-en [atenas]))
    (atenas_restaurant of Sitio_de_Interés (nombre "Restaurante de Atenas") (precio 20) (satisface [gastronomia]) (esta-en [atenas]))
    (atenas_beach of Sitio_de_Interés (nombre "Athens Long Beach") (precio 0) (satisface [playa]) (esta-en [atenas]))
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
    (slot riquesa)
    (slot min-duracio)
    (slot max-duracio)
    (slot min-dies-per-ciutat)
    (slot max-dies-per-ciutat)
    (slot min-num-ciutats)
    (slot max-num-ciutats)
    (slot fobia)
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
    (bind ?ciutats (find-all-instances((?c Ciudad)) TRUE))
    (loop-for-count (?i 1 (length$ ?ciutats)) do
        (bind ?c1 (nth$ ?i ?ciutats)) 
        (loop-for-count (?j 1 (length$ ?ciutats)) do 
            (bind ?c2 (nth$ ?j ?ciutats))
            (if (neq ?i ?j) then 
                (bind ?b (make-instance (gensym*) of Bus))
                (send ?b put-origen  ?c1)
                (send ?b put-destino ?c2)
                (send ?b put-precio (random 10 25))
                (bind ?t (make-instance (gensym*) of Tren))
                (send ?t put-origen  ?c1)
                (send ?t put-destino ?c2)
                (send ?t put-precio (random 20 50))
                (bind ?a (make-instance (gensym*) of Avión))
                (send ?a put-origen  ?c1)
                (send ?a put-destino ?c2)
                (send ?a put-precio (random 35 120))
                (if (and (eq (class ?c1) Ciudad-Con-Puerto) (eq (class ?c2) Ciudad-Con-Puerto)) then
                    (bind ?ba (make-instance (gensym*) of Barco))
                    (send ?ba put-origen  ?c1)
                    (send ?ba put-destino ?c2)
                    (send ?ba put-precio (random 30 70))
                )
            )
        )
    )

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
           then (assert (client (tipus parella) (valora (create$ [romantico]))))
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
   (if (< ?r 500) then 
        (modify ?c (pressupost ?r) (riquesa 1))
    else
        (if (< ?r 1500) then
        (modify ?c (pressupost ?r) (riquesa 2))
        else
            (if (< ?r 2500) then
                (modify ?c (pressupost ?r) (riquesa 3))
            else
                (modify ?c (pressupost ?r) (riquesa 4))
            )
        )
   )
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
   
   (if (pregunta-si-o-no "Tens por a volar? (si/no) ")
        then (modify ?c (min-duracio ?r1) (max-duracio ?r2) (fobia 1))
        else (modify ?c (min-duracio ?r1) (max-duracio ?r2) (fobia 0))
   )
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
            (bind ?k 1)
            (bind ?found 0)
            (while (and (eq ?found 0) (<= ?k (length$ ?interesos))) do
                (bind ?inst (nth$ ?k ?interesos))
                (if (eq ?aux (send ?inst get-nombre)) then 
                    (bind ?l (insert$ ?l (+ (length$ ?l) 1) ?inst))
                    (bind ?found 1)
                )
                (bind ?k (+ ?k 1))
            )
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
        (modify ?c (min-num-ciutats (/ ?mind ?maxdpc)) (max-num-ciutats (integer (+ (/ ?num_ciutats 2) 1))))
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
)

(defrule Seleccio::inicialitza-dades ""
    (not (inicialitza-dades))
    =>
    (assert(dades (llocs-compatibles (create$)) (ciutats-compatibles (create$)) 
                 (allotjaments-compatibles (create$))
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
        (modify ?cl (min-num-ciutats (/ ?mind ?maxdpc)) (max-num-ciutats (integer (+ (/ ?num_ciutats 2) 1))))
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

(deftemplate MAIN::viatge
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
        (if (>= ?n ?i) then 
            (bind ?v2 (assert (viatge (duracio ?n) (num-ciutats ?i))))
            (assert (num-ciutats-seleccionat ?v2))
        )
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
    ?cl <- (client (tipus ?t) (pressupost ?ps) (riquesa ?r))
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
        (if (and (or (eq ?t familia) (eq ?t grup)) (< ?r 3)) then 
            (bind ?j 1)
            (while (and (eq ?found 0) (<= ?j (length$ ?as))) do
                (bind ?a (nth$ ?j ?as))
                (if (and (eq (send ?a get-esta-en) ?c) (< (send ?a get-precio) ?prespernit) (or (eq (class ?a) Camping) (eq (class ?a) Apartamento))) then 
                    (bind ?list (insert$ ?list (+ (length$ ?list) 1) ?a))
                    (bind ?found 1)
                )
                (bind ?j (+ ?j 1))
            )
            (bind ?j 1)
            (while (and (eq ?found 0) (<= ?j (length$ ?as))) do
                (bind ?a (nth$ ?j ?as))
                (if (and (eq (send ?a get-esta-en) ?c) (< (send ?a get-precio) ?prespernit)) then 
                    (bind ?list (insert$ ?list (+ (length$ ?list) 1) ?a))
                    (bind ?found 1)
                )
                (bind ?j (+ ?j 1))
            )
            (bind ?j 1)
            (while (and (eq ?found 0) (<= ?j (length$ ?as))) do
                (bind ?a (nth$ ?j ?as))
                (if (eq (send ?a get-esta-en) ?c) then 
                    (bind ?list (insert$ ?list (+ (length$ ?list) 1) ?a))
                    (bind ?found 1)
                )
                (bind ?j (+ ?j 1))
            )
        else    (if (> ?r 2) then 
                    (bind ?j 1)
                    (while (and (eq ?found 0) (<= ?j (length$ ?as))) do
                        (bind ?a (nth$ ?j ?as))
                        (if (and (eq (send ?a get-esta-en) ?c) (< (send ?a get-precio) ?prespernit) (eq (class ?a) Hotel)) then 
                            (bind ?list (insert$ ?list (+ (length$ ?list) 1) ?a))
                            (bind ?found 1)
                        )
                        (bind ?j (+ ?j 1))
                    )
                    (bind ?j 1)
                    (while (and (eq ?found 0) (<= ?j (length$ ?as))) do
                        (bind ?a (nth$ ?j ?as))
                        (if (and (eq (send ?a get-esta-en) ?c) (< (send ?a get-precio) ?prespernit)) then 
                            (bind ?list (insert$ ?list (+ (length$ ?list) 1) ?a))
                            (bind ?found 1)
                        )
                        (bind ?j (+ ?j 1))
                    )
                    (bind ?j 1)
                    (while (and (eq ?found 0) (<= ?j (length$ ?as))) do
                        (bind ?a (nth$ ?j ?as))
                        (if (eq (send ?a get-esta-en) ?c) then 
                            (bind ?list (insert$ ?list (+ (length$ ?list) 1) ?a))
                            (bind ?found 1)
                        )
                        (bind ?j (+ ?j 1))
                    )
                else    (if (and (< ?r 3) (neq ?t familia) (neq ?t grup)) then 
                            (bind ?alotjs (create$))
                            (loop-for-count (?j 1 (length$ ?as))
                                (bind ?a (nth$ ?j ?as))
                                (if (eq (send ?a get-esta-en) ?c) then 
                                    (bind ?alotjs (insert$ ?alotjs (+ (length$ ?alotjs) 1) ?a))
                                )
                            )
                            (bind ?min 999999)
                            (loop-for-count (?j 1 (length$ ?alotjs)) do 
                                (bind ?a (nth$ ?j ?alotjs))
                                (if (< (send ?a get-precio) ?min) then
                                    (bind ?min (send ?a get-precio))
                                    (bind ?amin ?a)
                                )
                            )
                            (bind ?list (insert$ ?list (+ (length$ ?list) 1) ?amin))
                    )
                )
        )
    )
    (modify ?v (allotjaments ?list))
    (assert (allotjaments-seleccionats ?v))
)

(defrule Construccio::selecciona-transports ""
    ?v <- (viatge (ciutats $?cs))
    ?cl <- (client (riquesa ?r) (fobia ?f))
    ?t1 <- (object (is-a Medio_de_Transporte) (origen ?o1) (destino ?d1))
    ?t2 <- (object (is-a Medio_de_Transporte) (origen ?o2) (destino ?d2))
    (allotjaments-seleccionats ?v)
    (not (transports-seleccionats ?v))
    (test (and (eq ?o1 [origen]) (eq ?d1 (nth$ 1 ?cs)) (eq ?o2 (nth$ (length$ ?cs) ?cs)) (eq ?d2 [origen])
            (or (and (eq ?f 1) (neq (class ?t1) Avión) (neq (class ?t2) Avión))
                (and (eq ?f 0) (> ?r 2) (eq (class ?t1) Avión) (eq (class ?t2) Avión))
                (and (eq ?f 1) (> ?r 2) (or (eq (class ?t1) Tren) (eq (class ?t1) Barco)) (or (eq (class ?t2) Tren) (eq (class ?t1) Barco)))
                (and (eq ?f 0) (= ?r 2) (or (eq (class ?t1) Tren) (eq (class ?t1) Barco)) (or (eq (class ?t2) Tren) (eq (class ?t2) Barco)))
                (and (eq ?f 0) (= ?r 1) (eq (class ?t1) Bus) (eq (class ?t2) Bus))
            )
          )
    )
    =>
    (bind ?transports_entre (find-all-instances ((?mt Medio_de_Transporte)) (and (member$ ?mt:origen ?cs) (member$ ?mt:destino ?cs))))
    (bind ?list (create$ ?t1 ?t2))
    (loop-for-count (?i 1 (- (length$ ?cs) 1)) do
        (bind ?o (nth$ ?i ?cs))
        (bind ?d (nth$ (+ ?i 1) ?cs))
        (bind ?list_trans (create$))
        (loop-for-count (?j 1 (length$ ?transports_entre)) do
            (bind ?t (nth$ ?j ?transports_entre))
            (if (and (eq (send ?t get-origen) ?o) (eq (send ?t get-destino) ?d)) then 
                (bind ?list_trans (insert$ ?list_trans (+ (length$ ?list_trans) 1) ?t))
            )
        )
        (bind ?found 0)
        (if (and (> ?r 2) (not (eq ?f 1))) then
            (bind ?j 1)
            (while (and (eq ?found 0) (<= ?j (length$ ?list_trans))) do
                (bind ?t (nth$ ?j ?list_trans))
                (if (eq (class ?t) Avión) then 
                    (bind ?list (insert$ ?list (length$ ?list) ?t))
                    (bind ?found 1)
                )
                (bind ?j (+ ?j 1))
            )
            (if (eq ?found 0) then
                (bind ?min 99999)
                (loop-for-count (?j 1 (length$ ?list_trans)) do 
                    (bind ?t (nth$ ?j ?list_trans))
                    (if (< (send ?t get-precio) ?min) then
                        (bind ?min (send ?t get-precio))
                        (bind ?tmin ?t)
                    )
                )
                (bind ?list (insert$ ?list (length$ ?list) ?tmin))
            )
        )
        (if (and (eq ?f 1) (> ?r 2)) then 
            (bind ?j 1)
            (while (and (eq ?found 0) (<= ?j (length$ ?list_trans))) do
                (bind ?t (nth$ ?j ?list_trans))
                (if (or (eq (class ?t) Tren) (eq (class ?t) Barco)) then 
                    (bind ?list (insert$ ?list (length$ ?list) ?t))
                    (bind ?found 1)
                )
                (bind ?j (+ ?j 1))
            )
            (while (and (eq ?found 0) (<= ?j (length$ ?list_trans))) do
                (bind ?t (nth$ ?j ?list_trans))
                (if (eq (class ?t) Bus) then 
                    (bind ?list (insert$ ?list (length$ ?list) ?t))
                    (bind ?found 1)
                )
                (bind ?j (+ ?j 1))
            )
            (if (eq ?found 0) then
                (bind ?min 99999)
                (loop-for-count (?j 1 (length$ ?list_trans)) do 
                    (bind ?t (nth$ ?j ?list_trans))
                    (if (< (send ?t get-precio) ?min) then
                        (bind ?min (send ?t get-precio))
                        (bind ?tmin ?t)
                    )
                )
                (bind ?list (insert$ ?list (length$ ?list) ?tmin))
            )
        )
        (if (and (eq ?f 1) (< ?r 3)) then
            (bind ?min 99999)
            (loop-for-count (?j 1 (length$ ?list_trans)) do 
                (bind ?t (nth$ ?j ?list_trans))
                (if (and (< (send ?t get-precio) ?min) (neq (class ?t) Avión)) then
                    (bind ?min (send ?t get-precio))
                    (bind ?tmin ?t)
                )
            )
            (bind ?list (insert$ ?list (length$ ?list) ?tmin))
        )
        (if (and (eq ?f 0) (< ?r 3)) then
            (bind ?min 99999)
            (loop-for-count (?j 1 (length$ ?list_trans)) do 
                (bind ?t (nth$ ?j ?list_trans))
                (if (< (send ?t get-precio) ?min) then
                    (bind ?min (send ?t get-precio))
                    (bind ?tmin ?t)
                )
            )
            (bind ?list (insert$ ?list (length$ ?list) ?tmin))
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
    (not (impresos 2))
    (not (impres ?v))
    (impresos ?imp)
    =>
    (if (<= ?pt ?pr) then
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
    )
)

(defrule Escriptura::impresio-alternativa ""
        (declare (salience -5))
        ?cl <- (client (pressupost ?pr))
        ?v <- (viatge (preu-total ?pt) (duracio ?d) (num-ciutats ?n) (ciutats $?cs) (allotjaments $?as)
            (dies-ciutats $?dpcs) (llocs-interes $?lls) (transports $?ts))
        (not (impresos 2))
        (not (impres ?v))
        (impresos ?imp)
        =>
        (printout t "Ho sentim, no hi ha viatges que s'ajustin a les teves restriccions." crlf)
        (bind ?resta (- ?pt ?pr))
        (printout t "Però hem trobat aquest viatge, que es passa " ?resta " euros del pressupost." crlf)
        (printout t "Precio total (persona): " ?pt " euros" crlf)
        (printout t "Duración del viaje: " ?d " dias" crlf)
        (printout t "Ciudades: ")
        (loop-for-count (?i 1 (length$ ?cs)) do 
            (bind ?ciu (nth$ ?i ?cs))
            (printout t (send ?ciu get-nombre) " (" (nth$ ?i ?dpcs) " dias)")
            (if (neq ?i (length$ ?cs)) then 
                (printout t ", ")
            )
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
)

(defrule Escriptura::impresio-fallida ""
    (declare (salience -10))
    (not (impresos 2))
    =>
    (printout t "Ho sentim, no hi ha viatges que s'ajustin a les teves restriccions." crlf)
)