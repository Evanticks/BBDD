
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
raza varchar (10),
CONSTRAINT pk_codpersonaje PRIMARY KEY (codpersonaje)
);


CREATE TABLE armas (
codarma varchar (3),
nombre varchar (20),
fuerza decimal (2),
destreza decimal (2),
inteligencia decimal (2),
rareza varchar (10),
nivel decimal (2),
CONSTRAINT pk_armas PRIMARY KEY (codarma)
);

CREATE TABLE equipar (
codpersonaje varchar (3),
codarma varchar (3),
fecha date,
CONSTRAINT pk_equipar PRIMARY KEY (codpersonaje,codarma,fecha),
CONSTRAINT fk_codpersonaje FOREIGN KEY (codpersonaje) REFERENCES personaje (codpersonaje),
CONSTRAINT fk_codarma FOREIGN KEY (codarma) REFERENCES armas (codarma)
);


insert into personaje values ('001','Solaire','1.70','80','humano');
insert into personaje values ('002','Artorias','1.90','90','hueco');
insert into personaje values ('003','Gárgola','3.10','680','Gárgola');
insert into armas values ('001','Espada Corta','8','10','0','D','5');
insert into armas values ('002','Espada Larga','10','10','0','C','8');
insert into armas values ('003','Espada Artorias','24','18','20','S','30');
insert into armas values ('004','Hacha de Mano','8','8','0','D','6');
insert into armas values ('005','Hacha de Gárgola','14','14','0','A','15');
insert into armas values ('006','Hacha de Demonio','46','0','0','S','40');
insert into equipar values ('002','003','2011-02-11');
insert into equipar values ('003','005','2011/05/04');
insert into equipar values ('001','002','2011/06/03');
insert into equipar values ('003','002','2011/09/02');
insert into equipar values ('001','006','2011/08/03');
insert into equipar values ('002','004','2011/07/01');
commit;








alter table equipar add CONSTRAINT FK_armasequipar FOREIGN KEY (codarma) REFERENCES armas (codarma);
alter table equipar add CONSTRAINT FK_personequipar FOREIGN KEY (codpersonaje) REFERENCES personaje (codpersonaje);