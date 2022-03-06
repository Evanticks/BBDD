from Dark_Souls_funciones import *
import sys
import MySQLdb


print('''
0.   Crea los usuarios, las tablas y los insert, el usuario será SOULS SOULS.
1.   Lista las estaturas de los personajes y dime cuántos hay.
2.   Escribe el nivel del arma y que muestre el nombre.
3.   Escribe el nombre del personaje y que muestre las rarezas de sus armas.
4.   Inserta nuevos personajes que puedan llevar equipadas armas nuevas.
5.   Elimina las armas que posea un personaje de tu elección.
6.   Aumenta un 10% la destreza de las armas que sean rareza "A".
7.   Salir de la base de datos.'''
)

opcion=int(input("Selecciona una de las opciones: "))
while opcion !=7:
    if opcion == 0:
        usuario=input("Escribe el nombre del administrador: ")
        contra=input("Escribe la contraseña: ")
        try:
            db = MySQLdb.connect("localhost",usuario,contra,)
        except MySQLdb.Error as e:
            print("No puedo conectar a la base de datos:",e)
            sys.exit(1)
        print("Conexión correcta.")
        cursor = db.cursor()
        try:
            sql="CREATE USER 'AMP'@'localhost' IDENTIFIED VIA mysql_native_password;""SET PASSWORD FOR 'AMP'@'localhost' = PASSWORD('AMP');"
            cursor.execute(sql)
            cursor = db.cursor()
            sql="GRANT ALL PRIVILEGES ON *.* TO 'AMP'@'localhost';"
            cursor.execute(sql)
            db.close()
            crear_usuario_tablas_insert()
        except:
            print("Hemos conseguido crar usuario,tabla y restricciones.")
    if opcion == 1:
        db=conectarse()
        cursor = db.cursor()
        sql="select altura from personaje;"
        cursor.execute(sql)
        registros = cursor.fetchall()
        for i in registros:
            print (i)
        cursor = db.cursor()
        sql="select count(codpersonaje) from personaje;"
        cursor.execute(sql)
        registros = cursor.fetchone()
        print ("Hay",registros,"Personajes")
        db.close()
    if opcion == 2:
        db=conectarse()
        cursor = db.cursor()
        ask=input("Qué nivel de arma quieres buscar?")
        sql=("select nombre from armas where nivel = " + ask)
        cursor.execute(sql)
        registros = cursor.fetchone()
        print ("Este arma",registros)
        db.close()
    if opcion == 3:
        nombre=input("Dime el nombre del personaje del que mostrar las rarezas.")
        db=conectarse()
        cursor = db.cursor()
        sql="select rareza from armas where codarma in (select codarma from equipar where codpersonaje in (select codpersonaje from personaje where nombre = '%s'))" % (nombre)
        cursor.execute(sql)
        registros = cursor.fetchall()
        for i in registros:
            print (i)
        db.close()
    if opcion == 4:
        cod=input("Dime el código. ")
        nombre=input("Dime el nombre del personaje a insertar: ")
        altura=input("DIme su altura: ")
        peso=input("DIme su peso: ")
        raza=input("Dime su raza: ")
        db=conectarse()
        cursor = db.cursor()
        sql="insert into personaje values ('%s','%s','%s','%s','%s')" % (cod,nombre,altura,peso,raza)
        cursor.execute(sql)
        db.commit()
        db.close()
    if opcion == 5:
        db=conectarse()
        nombre=input("Dime el nombre del personaje del que eliminar sus armas: ")
        cursor = db.cursor()
        sql="delete from armas where codarma in (select codarma from equipar where codpersonaje in (select codpersonaje from personaje where nombre= '%s'));" % (nombre)
        cursor.execute(sql)
        registros = cursor.fetchall()
        for i in registros:
            print (i)
        db.close()
    if opcion == 6:
        db=conectarse()
        cursor = db.cursor()
        sql="update armas set destreza=destreza+(destreza*0.1) where rareza = 'A';"
        cursor.execute(sql)
        db.commit()
        db.close()
    opcion=int(input("Selecciona una de las opciones: "))