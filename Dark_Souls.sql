CREATE TABLE personaje (
    codpersonaje decimal (3),
    nombre varchar (15),
    altura decimal (3,2),
    peso decimal (3),
    raza varchar (10),
    codarma decimal (3),
CONSTRAINT pk_codpersonaje PRIMARY KEY (codpersonaje),
);

CREATE TABLE equipar (
    codpersonaje decimal (3),
    codarma decimal (3),
    fecha date,
CONSTRAINT pk_equipar PRIMARY KEY (codpersonaje,codarma,fecha),
CONSTRAINT fk_equipar FOREIGN KEY 

)

CREATE TABLE armas (
    codarma decimal (3),
    fuerza decimal (2),
    destreza decimal (2),
    inteligencia decimal (2),
    rareza varchar (10),
    durabilidad decimal (3),
    nivel decimal (2),

CONSTRAINT pk_armas PRIMARY KEY (codarmas)
);
