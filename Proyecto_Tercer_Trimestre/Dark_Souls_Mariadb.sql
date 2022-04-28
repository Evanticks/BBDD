
GRANT ALL PRIVILEGES ON *.* TO 'SOULS'@'localhost' 
IDENTIFIED BY 'SOULS' WITH GRANT OPTION;

mysql -u SOULS -p
SOULS

create database rol;
use rol;

CREATE TABLE personaje (
codpersonaje varchar (3),
nombre varchar (15),
altura decimal (3,2),
peso decimal (3),
raza varchar (10) DEFAULT ('Humano'),
CONSTRAINT pk_codpersonaje PRIMARY KEY (codpersonaje),
CONSTRAINT ck_codpersonaje CHECK (codpersonaje REGEXP '^1.*'),
constraint ck_nombre CHECK (nombre REGEXP '^[A-Z][a-z]*')
);

CREATE TABLE armas (
codarma varchar (3),
nombre varchar (20) UNIQUE,
fuerza decimal (2),
destreza decimal (2),
inteligencia decimal (2),
rareza enum('D','C','B','A','S'),
nivel decimal (2),
CONSTRAINT pk_armas PRIMARY KEY (codarma)
);

CREATE TABLE tesoro (
codtesoro varchar (3),
nombre varchar (20),
antiguedad date,
rareza varchar (10),
CONSTRAINT pk_codtesoro PRIMARY KEY (codtesoro),
CONSTRAINT ck_antiguedad CHECK (antiguedad<str_to_date("2000","%Y"))
);


CREATE TABLE mapa (
codmapa varchar (3),
codtesoro varchar (3),
nombre varchar (20) not null,
habitat varchar (20),
clima enum('Lluvioso','Soleado','Nublado'),
temperatura decimal (2),
CONSTRAINT pk_codmapa PRIMARY KEY (codmapa),
CONSTRAINT fk_codtesoro FOREIGN KEY (codtesoro) REFERENCES tesoro (codtesoro),
CONSTRAINT ck_codmapa CHECK (codmapa REGEXP '^0-.*')
);


CREATE TABLE ubicar (
codpersonaje varchar (3),
codmapa varchar (3),
fecha date,
CONSTRAINT pk_ubicar PRIMARY KEY (codpersonaje, codmapa),
CONSTRAINT ck_fecha check (YEAR(fecha) between 2000 and 2022)
);


CREATE TABLE equipar (
codpersonaje varchar (3),
codarma varchar (3),
fecha date,
CONSTRAINT pk_equipar PRIMARY KEY (codpersonaje,codarma,fecha),
CONSTRAINT fk_codpersonaje FOREIGN KEY (codpersonaje) REFERENCES personaje (codpersonaje),
CONSTRAINT fk_codarma FOREIGN KEY (codarma) REFERENCES armas (codarma)
);


insert into personaje values ('101','Solaire',1.70,80,'humano');
insert into personaje values ('102','Artorias',1.90,90,'hueco');
insert into personaje values ('103','Gargola',3.10,680,'Gárgola');
insert into armas values ('101','Espada Corta',8,10,0,'D',5);
insert into armas values ('002','Espada Larga',10,10,0,'C',8);
insert into armas values ('003','Espada Artorias',24,18,20,'S',30);
insert into armas values ('004','Hacha de Mano',8,8,0,'D',6);
insert into armas values ('005','Hacha de Gárgola',14,14,0,'A',15);
insert into armas values ('006','Hacha de Demonio',46,0,0,'S',40);
insert into equipar values ('102','003','2011-02-11');
insert into equipar values ('103','005','2011/05/04');
insert into equipar values ('101','002','2011/06/03');
insert into equipar values ('103','002','2011/09/02');
insert into equipar values ('101','006','2011/08/03');
insert into equipar values ('102','004','2011/07/01');
insert into tesoro values ('001','Arma perdida','1008-7-04','S');
insert into tesoro values ('002','Collar Antiguo','1795-3-09','C');
insert into tesoro values ('003','Perla Negra','1328-7-15','A');
insert into tesoro values ('004','Tomo 4','1548-7-04','B');
insert into mapa values ('0-1','001','Terreno pantanoso','Bosque','Lluvioso',18);
insert into mapa values ('0-2','003','Cumbre sinuosa','Montaña','Nublado',5);
insert into mapa values ('0-3','002','Mar de Azor','Mar','Lluvioso',20);
insert into mapa values ('0-4','004','Playa de Azor','Playa','Soleado',35);
insert into ubicar values ('101','0-1','2021-7-15');
insert into ubicar values ('102','0-2','2015-7-06');
insert into ubicar values ('103','0-3','2008-2-13');
commit;








alter table equipar add CONSTRAINT FK_armasequipar FOREIGN KEY (codarma) REFERENCES armas (codarma);
alter table equipar add CONSTRAINT FK_personequipar FOREIGN KEY (codpersonaje) REFERENCES personaje (codpersonaje);