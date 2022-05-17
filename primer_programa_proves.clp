;;; ---------------------------------------------------------
;;; ontologia-IA-2.clp
;;; Translated by owl2clips
;;; Translated to CLIPS from ontology ontologia-IA-2.owl
;;; :Date 15/05/2022 12:36:02

(defclass Viaje
    (is-a USER)
    (role concrete)
    (pattern-match reactive)
    ;;; Expresa los días de duración.
    (slot duración
        (type INTEGER)
        (create-accessor read-write))
)

(defclass Ciudad
    (is-a Viaje)
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
    (is-a Viaje)
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

(defclass Cliente
    (is-a USER)
    (role concrete)
    (pattern-match reactive)
    (slot está_interesado_en
        (type INSTANCE)
        (create-accessor read-write))
    (multislot solicita
        (type INSTANCE)
        (create-accessor read-write))
    (slot nombre
        (type STRING)
        (create-accessor read-write))
    (slot presupuesto
        (type FLOAT)
        (create-accessor read-write))
)

(defclass Familia
    (is-a Cliente)
    (role concrete)
    (pattern-match reactive)
)

(defclass Grupo
    (is-a Cliente)
    (role concrete)
    (pattern-match reactive)
)

(defclass Individual
    (is-a Cliente)
    (role concrete)
    (pattern-match reactive)
)

(defclass Pareja
    (is-a Cliente)
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

(definstances instances
    (aventura of Interés (nombre "aventura"))
    (religion of Interés (nombre "religión"))
    (juan of Individual (nombre "juan") (presupuesto 1500) (está_interesado_en [aventura]))
    (barcelona of Ciudad (nombre "barcelona"))
    (reina_sofia of Hotel (nombre "Hotel Reina Sofia") (precio 200))
    (macba of Sitio_de_Interés (nombre "MACBA") (precio 50) (satisface [aventura]))
    (sagrada_familia of Sitio_de_Interés (nombre "Sagrada Familia") (precio 100) (satisface [religion]))
    (barceloneta of Sitio_de_Interés (nombre "barceloneta") (precio 0) (satisface [aventura]))
    (raval of Sitio_de_Interés (nombre "raval") (precio 23.8) (satisface [aventura]))
)


(defmessage-handler Sitio_de_Interés get-nombre-interes ()
    (send ?self:satisface get-nombre)
)

(defmessage-handler Cliente get-nombre-interes ()
    (send ?self:está_interesado_en get-nombre)
)

(defrule cliente-e-interes
    ?p1 <- (object (is-a Cliente))
    =>
    (printout t "A " (send ?p1 get-nombre) " le gusta " (send ?p1 get-nombre-interes) crlf)
)

(defrule interes-y-lugar
    ?p1 <- (object (is-a Cliente) (nombre ?n1) (está_interesado_en ?i1))
    ?l1 <- (object (is-a Sitio_de_Interés) (satisface ?i2))
    (test (eq ?i1 ?i2))
    =>
    (printout t (send ?p1 get-nombre) " debería ir a " (send ?l1 get-nombre) ", le costará " (send ?l1 get-precio) crlf)
)
