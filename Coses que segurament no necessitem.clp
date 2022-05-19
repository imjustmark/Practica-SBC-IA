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

(defclass Viaje
    (is-a USER)
    (role concrete)
    (pattern-match reactive)
    ;;; Expresa los días de duración.
    (slot duración
        (type INTEGER)
        (create-accessor read-write))
)