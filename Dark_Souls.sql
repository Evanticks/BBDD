CREATE TABLE personaje (
codpersonaje varchar (3),
nombre varchar (15),
altura decimal (3,2),
peso decimal (3),
raza varchar (10),
CONSTRAINT pk_codpersonaje PRIMARY KEY (codpersonaje)
);

CREATE TABLE equipar (
codpersonaje varchar (3),
codarma varchar (3),
fecha date,
CONSTRAINT pk_equipar PRIMARY KEY (codpersonaje,codarma,fecha),
CONSTRAINT fk_codpersonaje FOREIGN KEY (codpersonaje) REFERENCES personaje (codpersonaje)
);

CREATE TABLE armas (
codarma varchar (3),
fuerza decimal (2),
destreza decimal (2),
inteligencia decimal (2),
rareza varchar (10),
durabilidad decimal (3),
nivel decimal (2),
CONSTRAINT pk_armas PRIMARY KEY (codarma)
);
