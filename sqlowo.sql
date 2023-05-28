CREATE TABLE alumno (
    run_alumno    INTEGER NOT NULL,
    nombre_alumno VARCHAR(200) NOT NULL,
    ap_alumno     VARCHAR(200) NOT NULL,
    PRIMARY KEY (run_alumno)
);

CREATE TABLE apoderado (
    run_apoderado    INTEGER NOT NULL,
    nombre_apoderado VARCHAR(200) NOT NULL,
    ap_apoderado     VARCHAR(200) NOT NULL,
    mail_apoderado   VARCHAR(200) NOT NULL,
    PRIMARY KEY (run_apoderado)
);

CREATE TABLE colegio (
    id_colegio     INTEGER NOT NULL,
    nombre_colegio VARCHAR(200) NOT NULL,
    PRIMARY KEY (id_colegio)
);

CREATE TABLE curso (
    id           INTEGER NOT NULL,
    nombre_curso INTEGER NOT NULL,
    anno_curso   DATE NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE metodo_pago (
    id_metodo     INTEGER NOT NULL,
    nombre_metodo VARCHAR(200) NOT NULL,
    PRIMARY KEY (id_metodo)
);

CREATE TABLE pago (
    id_pago        INTEGER NOT NULL,
    monto_pagado   INTEGER NOT NULL,
    monto_restante INTEGER NOT NULL,
    fecha_pago     DATE NOT NULL,
    PRIMARY KEY (id_pago)
);

CREATE TABLE plan_gira (
    id_plan      INTEGER NOT NULL,
    nombre_plan  VARCHAR(200) NOT NULL,
    monto_alumno INTEGER NOT NULL,
    PRIMARY KEY (id_plan)
);

ALTER TABLE alumno
    ADD CONSTRAINT alumno_curso_fk FOREIGN KEY (run_alumno)
        REFERENCES curso (id)
        ON DELETE CASCADE;
        
ALTER TABLE alumno
    ADD CONSTRAINT alumno_plan_gira_fk FOREIGN KEY (nombre_alumno)
        REFERENCES plan_gira (id_plan);

ALTER TABLE curso
    ADD CONSTRAINT curso_colegio_fk FOREIGN KEY (nombre_curso)
        REFERENCES colegio (id_colegio);

ALTER TABLE pago
    ADD CONSTRAINT pago_alumno_fk FOREIGN KEY (monto_pagado)
        REFERENCES alumno (run_alumno);

ALTER TABLE pago
    ADD CONSTRAINT pago_metodo_pago_fk FOREIGN KEY (fecha_pago)
        REFERENCES metodo_pago (id_metodo);