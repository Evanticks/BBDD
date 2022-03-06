import sys
import MySQLdb
def crear_usuario_tablas_insert():
    try:
        db = MySQLdb.connect("localhost","AMP","AMP")
    except MySQLdb.Error as e:
        print("No puedo conectar a la base de datos:",e)
        sys.exit(1)
    print("Hemos conseguido conectarnos")
    cursor=db.cursor()
    sql="create database roles;"
    cursor.execute(sql)
    cursor=db.cursor()
    sql="use roles;"
    cursor.execute(sql)
    cursor=db.cursor()
    sql="CREATE TABLE personaje (codpersonaje varchar (3),nombre varchar (15),altura decimal (3,2),peso decimal (3),raza varchar (10),CONSTRAINT pk_codpersonaje PRIMARY KEY (codpersonaje));"
    cursor.execute(sql)
    cursor=db.cursor()
    sql="CREATE TABLE armas (codarma varchar (3),nombre varchar (20),fuerza decimal (2),destreza decimal (2),inteligencia decimal (2),rareza varchar (10),nivel decimal (2),CONSTRAINT pk_armas PRIMARY KEY (codarma));"
    cursor.execute(sql)
    cursor=db.cursor()
    sql="CREATE TABLE equipar (codpersonaje varchar (3),codarma varchar (3),fecha date,CONSTRAINT pk_equipar PRIMARY KEY (codpersonaje,codarma,fecha));"
    cursor.execute(sql)
    cursor=db.cursor()
    sql="insert into personaje values ('001','Solaire','1.70','80','humano');"
    cursor.execute(sql)
    cursor=db.cursor()
    sql="insert into personaje values ('002','Artorias','1.90','90','hueco');"
    cursor.execute(sql)
    cursor=db.cursor()
    sql="insert into personaje values ('003','Gárgola','3.10','680','Gárgola');"
    cursor.execute(sql)
    cursor=db.cursor()
    sql="insert into armas values ('001','Espada Corta','8','10','0','D','5');"
    cursor.execute(sql)
    cursor=db.cursor()
    sql="insert into armas values ('002','Espada Larga','10','10','0','C','8');"
    cursor.execute(sql)
    cursor=db.cursor()
    sql="insert into armas values ('003','Espada Artorias','24','18','20','S','30');"
    cursor.execute(sql)
    cursor=db.cursor()
    sql="insert into armas values ('004','Hacha de Mano','8','8','0','D','6');"
    cursor.execute(sql)
    cursor=db.cursor()
    sql="insert into armas values ('005','Hacha de Gárgola','14','14','0','A','15');"
    cursor.execute(sql)
    cursor=db.cursor()
    sql="insert into armas values ('006','Hacha de Demonio','46','0','0','S','40');"
    cursor.execute(sql)
    cursor=db.cursor()
    sql="insert into equipar values ('002','003','2011-02-11');"
    cursor.execute(sql)
    cursor=db.cursor()
    sql="insert into equipar values ('003','005','2011/05/04');"
    cursor.execute(sql)
    cursor=db.cursor()
    sql="insert into equipar values ('001','002','2011/06/03');"
    cursor.execute(sql)
    cursor=db.cursor()
    sql="insert into equipar values ('004','001','2011/09/02');"
    cursor.execute(sql)
    cursor=db.cursor()
    sql="insert into equipar values ('001','006','2011/08/03');"
    cursor.execute(sql)
    cursor=db.cursor()
    sql="insert into equipar values ('002','004','2011/07/01');"
    cursor.execute(sql)
    db.commit()
    cursor=db.cursor()
    sql="alter table equipar add constraint fk_personequipar foreign key (codpersonaje) references personaje (codpersonaje);"
    cursor.execute(sql)
    cursor=db.cursor()
    sql="alter table equipar add constraint fk_armasequipar foreign key (codarma) references armas (codarma);"
    cursor.execute(sql)
    db.close()
    return


import sys
import MySQLdb
def conectarse ():
        db = MySQLdb.connect("localhost","AMP","AMP","roles")
        return db
        print("Conexión correcta.")