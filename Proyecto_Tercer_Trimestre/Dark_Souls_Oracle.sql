CONNECT SCOTT
TIGER

CREATE TABLE personaje (
codpersonaje varchar2 (3),
nombre varchar2 (15),
altura number (3,2),
peso number (3),
raza varchar2 (10),
CONSTRAINT pk_codpersonaje PRIMARY KEY (codpersonaje),
CONSTRAINT ck_codpersonaje CHECK (REGEXP_LIKE(codpersonaje,'^1.*$'))
);

CREATE TABLE armas (
codarma varchar2 (3),
nombre varchar2 (20),
fuerza number (2),
destreza number (2),
inteligencia number (2),
rareza varchar2 (10),
nivel number (2),
CONSTRAINT pk_armas PRIMARY KEY (codarma)
);


CREATE TABLE tesoro (
codtesoro varchar2 (3),
nombre varchar2 (20),
antiguedad date,
rareza varchar2 (10),
CONSTRAINT pk_codtesoro PRIMARY KEY (codtesoro),
CONSTRAINT ck_antiguedad CHECK (to_char(to_number(antiguedad,'YYYY')) < 2000)
);


CREATE TABLE mapa (
codmapa varchar2 (3),
codtesoro varchar2 (3),
nombre varchar2 (20) not null,
habitat varchar2 (20),
clima varchar2 (10),
temperatura number (2),
CONSTRAINT pk_codmapa PRIMARY KEY (codmapa),
CONSTRAINT fk_codtesoro FOREIGN KEY (codtesoro) REFERENCES tesoro (codtesoro),
CONSTRAINT ck_clima CHECK (clima in ('Lluvioso','Soleado','Nublado')),
CONSTRAINT ck_codmapa CHECK (REGEXP_LIKE(codmapa,'^0-.*$'))
);


CREATE TABLE ubicar (
codpersonaje varchar2 (3),
codmapa varchar2 (3),
fecha date,
CONSTRAINT pk_ubicar PRIMARY KEY (codpersonaje, codmapa),
CONSTRAINT ck_date CHECK (to_char(fecha,'YYYY') BETWEEN 2000 AND 2022)
);


CREATE TABLE equipar (
codpersonaje varchar2 (3),
codarma varchar2 (3),
fecha date,
CONSTRAINT pk_equipar PRIMARY KEY (codpersonaje,codarma,fecha),
CONSTRAINT fk_codpersonaje FOREIGN KEY (codpersonaje) REFERENCES personaje (codpersonaje),
CONSTRAINT fk_codarma FOREIGN KEY (codarma) REFERENCES armas (codarma)
);


insert into personaje values ('101','Solaire',1.70,80,'humano');
insert into personaje values ('102','Artorias',1.90,90,'hueco');
insert into personaje values ('103','Gargola',3.10,680,'Gárgola');
insert into armas values ('001','Espada Corta',8,10,0,'D',5);
insert into armas values ('002','Espada Larga',10,10,0,'C',8);
insert into armas values ('003','Espada Artorias',24,18,20,'S',30);
insert into armas values ('004','Hacha de Mano',8,8,0,'D',6);
insert into armas values ('005','Hacha de Gárgola',14,14,0,'A',15);
insert into armas values ('006','Hacha de Demonio',46,0,0,'S',40);
insert into equipar values ('102','003',to_date('2011/02/11','YYYY/MM/DD'));
insert into equipar values ('103','005',to_date('2011/05/04','YYYY/MM/DD'));
insert into equipar values ('101','002',to_date('2011/06/03','YYYY/MM/DD'));
insert into equipar values ('103','002',to_date('2011/09/02','YYYY/MM/DD'));
insert into equipar values ('101','006',to_date('2011/08/03','YYYY/MM/DD'));
insert into equipar values ('102','004',to_date('2011/07/01','YYYY/MM/DD'));
insert into tesoro values ('001','Arma perdida',to_date('1008/07/04','YYYY/MM/DD'),'S');
insert into tesoro values ('002','Collar Antiguo',to_date('1795/03/09','YYYY/MM/DD'),'C');
insert into tesoro values ('003','Perla Negra',to_date('1328/07/15','YYYY/MM/DD'),'A');
insert into tesoro values ('004','Tomo 4',to_date('1548/07/04','YYYY/MM/DD'),'B');
insert into mapa values ('0-1','001','Terreno pantanoso','Bosque','Lluvioso',18);
insert into mapa values ('0-2','003','Cumbre sinuosa','Montaña','Nublado',5);
insert into mapa values ('0-3','002','Mar de Azor','Mar','Lluvioso',20);
insert into mapa values ('0-4','004','Playa de Azor','Playa','Soleado',35);
insert into ubicar values ('101','0-1',to_date('2021/7/15','YYYY/MM/DD'));
insert into ubicar values ('102','0-2',to_date('2015/7/06','YYYY/MM/DD'));
insert into ubicar values ('103','0-3',to_date('2008/2/13','YYYY/MM/DD'));
commit;

---Añadir y borrar restricciones
ALTER TABLE personaje add CONSTRAINT ck_codpersonaje CHECK (codpersonaje ~ '^1.*$');
ALTER TABLE personaje DROP CONSTRAINT ck_codpersonaje;
ALTER TABLE personaje disable CONSTRAINT ck_codpersonaje;

---Modificación
alter table personaje add constitucion varchar(10);
alter table armas add rompibilidad number (2);
update personaje set constitucion = 'delgado' where nombre = 'Artorias';



---Consultas sencillas
------Muestra todas las armas.
Select * from armas;
------Muestra los nombres d elos personajes.
Select nombre from personaje;
------Muestra la suma de los niveles de las armas.
select sum(nivel) from armas;

---Vistas
------Lista de armas.
CREATE VIEW nombrearma as
select nombre from armas;
------Antiguedad de los tesoros.
create view antiguedad_tesoro as
select antiguedad from tesoro;

---Subconsultas
------Muestra los nombres de los personajes que tengan la espada 'Espada Larga'
Select nombre from personaje 
where codpersonaje in 
(select codpersonaje from equipar where codarma in 
(select codarma from armas where nombre = 'Espada Larga'));
------Muestra el nombre y la antiguedad del tesoro que enncuentra el personaje 'Artorias'
Select nombre,antiguedad from tesoro 
where codtesoro in (select codtesoro from mapa where codmapa 
in (select codmapa from ubicar where codpersonaje
in (select codpersonaje from personaje where nombre='Artorias')));

---Combinación de tablas (Join)
------Muestra todo acerca de las tablas mapa y tesoro.
select * from mapa,tesoro where tesoro.codtesoro=mapa.codtesoro;
------Muestra los nombres de los mapas y los tesoros empleando alias.
select m.nombre,t.nombre from mapa m,tesoro t where t.codtesoro=m.codtesoro;
---Inserción de registros. Consultas de datos anexados.
------Inserta un nuevo registro en personaje donde la altura,peso y raza sean las mismas que la de 'Artorias'. 
INSERT INTO personaje (SELECT '104','Ornstein',altura,peso,raza from personaje where nombre = 'Artorias');
---Modificación de registros. Consultas de actualización.
------Actualiza el nivel de las armas, de manera que todas tengan el nivel máximo.
UPDATE armas set nivel =(select max(nivel) from armas);
---Borrado de registros. Consultas de eliminación.
------Borra elregistro de la tabla mapa donde el el nombre sea 'Terreno pantanoso'.
delete from mapa where nombre= 'Terreno pantanoso';
---Group by y having
------Selecciona la raza y cuenta agrupando por raza donde el conteo sea igual a 1.
select raza, count (*) from personaje group by raza having count (*)=1;
---Outer joins. Combinaciones externas.
------Selecciona el nombre de los personajes y las coincidencias de ubicar.
select nombre from personaje right join ubicar on personaje.codpersonaje=ubicar.codpersonaje;
------Selecciona el nombre de las armas y las coincidencias en equipar donde esté agrupado por el nombre y orden descendente.
select nombre from armas left join equipar on armas.codarma=equipar.codarma group by nombre order by nombre desc;
---Consultas con operadores de conjuntos.
------Muestra el nombre de los personajes y nombres de tesoro.
select nombre from personaje union select nombre from tesoro;
------Muestra el conteo de los personajes y las armas.
select count (*) from personaje union select count (*) from armas;
---Subconsultas correlacionadas.
------Selecciona todo de mapa donde la temperatura sea la máxima de esa misma tabla.
select * from mapa where temperatura = (select max(temperatura) from mapa where codmapa= mapa.codmapa);
---Expresion de mayúsculas
------Muestra el nombre del personaje con cod 102 en mayúsculas.
select UPPER(nombre) from personaje where codpersonaje = '102';
---Expresión en fecha
---Muestra los tesoros con la antiguedad del mes de Julio.
select nombre,antiguedad from tesoro where to_char(antiguedad,'MM')=7;
---Distinct y alias.
---Cambia el nombre de la columna y haz que no se repitan, ordenado alfabéticamente.
select distinct raza,altura as datos from personaje order by raza;
---Consulta de datos anexados múltiple
insert into tesoro values 
('005',select nombre from armas where destreza=10,select fecha from ubicar where codmapa='0-2',select rareza from armas where nivel=5);