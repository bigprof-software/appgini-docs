---
title: Cómo crear una base de datos y un usuario MySQL/MariaDB
linkTitle: Crear base de datos y usuario MySQL
slug: help/create-mysql-database-and-user
keywords: crear base de datos mysql, crear usuario mysql, crear base de datos mariadb, crear usuario mariadb, cpanel, phpmyadmin, línea de comandos
description: Aprenda a crear una base de datos y un usuario MySQL o MariaDB utilizando cPanel, phpMyAdmin o la línea de comandos.
---

# Cómo crear una base de datos y un usuario MySQL/MariaDB

Antes de que pueda utilizar su aplicación de base de datos web generada por AppGini,
necesita tener una base de datos MySQL o MariaDB y un usuario con
permisos para acceder y modificar la base de datos.

A veces, su proveedor de alojamiento creará la base de datos y el usuario por usted.
En este caso, generalmente recibirá un correo electrónico con los detalles de la base de datos. Pero
en la mayoría de los casos, deberá crear la base de datos y el usuario usted mismo.

## Creación de una base de datos y un usuario mediante cPanel

La mayoría de los proveedores de alojamiento compartido ofrecen cPanel, un panel de control basado en web que
facilita la gestión de su cuenta de alojamiento. Estos son los pasos generales para
crear una base de datos y un usuario mediante cPanel:

1. Inicie sesión en su cuenta de cPanel.
2. Busque una sección llamada 'Bases de datos' y haga clic en 'Bases de datos MySQL'.
3. En la sección 'Crear nueva base de datos', ingrese un nombre para su base de datos y haga clic en 'Crear base de datos'.
   Debe especificar un nombre que sea relevante para su aplicación, ya que podría tener varias bases de datos
   en su cuenta de alojamiento. Por lo tanto, sería más fácil identificar la base de datos más adelante.
   ![Crear nueva base de datos en cPanel](https://cdn.bigprof.com/images/cpanel-create-database.jpeg "Crear nueva base de datos en cPanel")
4. Después de crear la base de datos, desplácese hacia abajo hasta la sección 'Agregar nuevo usuario'.
5. Ingrese un nombre de usuario y una contraseña para el nuevo usuario y haga clic en 'Crear usuario'.
   Asegúrese de utilizar una contraseña segura. Puede utilizar la herramienta 'Generador de contraseñas' para crear una contraseña segura.
   > Tome nota del nombre de la base de datos, el nombre de usuario y la contraseña que acaba de crear. Los necesitará
   al configurar su aplicación de base de datos web generada por AppGini.
6. Después de crear el usuario, desplácese hacia abajo hasta la sección 'Agregar usuario a la base de datos'.
7. Seleccione el usuario que creó en el menú desplegable 'Usuario' y la base de datos que creó en el menú desplegable 'Base de datos'.
8. Haga clic en 'Agregar'.
9. En la siguiente pantalla, seleccione 'Todos los privilegios' y haga clic en 'Realizar cambios'.
   > Al seleccionar 'Todos los privilegios', el usuario tendrá acceso completo a la base de datos. Esto es
   necesario para que su aplicación generada por AppGini pueda crear tablas y administrar datos.
   Pero si su esquema de base de datos ya se ha creado y no planea modificarlo,
   puede desmarcar los privilegios 'Crear', 'Alterar' y 'Eliminar'.

¡Eso es todo! Ha creado correctamente una base de datos y un usuario para su aplicación de base de datos web generada por AppGini.
El siguiente paso es [configurar su aplicación generada por AppGini](working-with-generated-web-database-application/setup.md)

> Si su proveedor de alojamiento proporciona otro panel de control, como Plesk, los pasos pueden ser ligeramente diferentes
> pero la idea general es la misma. Puede consultar la documentación de su proveedor de alojamiento para obtener más detalles.

## Creación de una base de datos y un usuario mediante phpMyAdmin

Es posible que su proveedor de alojamiento ofrezca phpMyAdmin, una herramienta basada en web que le permite administrar bases de datos MySQL.
Puede crear una base de datos y un usuario mediante phpMyAdmin de la siguiente manera:

1. Inicie sesión en su cuenta de phpMyAdmin.
2. Haga clic en la pestaña 'Bases de datos'.
3. Ingrese un nombre para su base de datos en el campo 'Crear base de datos' y haga clic en 'Crear'.
   ![Crear base de datos en phpMyAdmin](https://cdn.bigprof.com/images/phpmyadmin-new-database.png "Crear base de datos en phpMyAdmin")
4. Haga clic en la pestaña 'Privilegios'.
5. Haga clic en 'Agregar cuenta de usuario'.
6. Ingrese un nombre de usuario y una contraseña para el nuevo usuario.
7. En la sección 'Base de datos para la cuenta de usuario', seleccione la base de datos que creó.
8. Haga clic en 'Ir'.
9. En la siguiente pantalla, seleccione 'Todos los privilegios' y haga clic en 'Ir'.
   > Al seleccionar 'Todos los privilegios', el usuario tendrá acceso completo a la base de datos. Esto es
   necesario para que su aplicación generada por AppGini pueda crear tablas y administrar datos.
   Pero si su esquema de base de datos ya se ha creado y no planea modificarlo,
   puede desmarcar los privilegios 'Crear', 'Alterar' y 'Eliminar'.

¡Eso es todo! Ha creado correctamente una base de datos y un usuario para su aplicación de base de datos web generada por AppGini.
El siguiente paso es [configurar su aplicación generada por AppGini](working-with-generated-web-database-application/setup.md)

## Creación de una base de datos y un usuario mediante la línea de comandos

Si tiene acceso SSH a su servidor, puede crear una base de datos y un usuario mediante la línea de comandos.
Estos son los pasos generales:

1. Inicie sesión en su servidor mediante SSH.
2. Conéctese a MySQL mediante el siguiente comando:
   ```bash
   mysql
   ```
   Si el comando anterior produce un error, es posible que deba especificar la contraseña raíz de MySQL:
   ```bash
   mysql -u root -p
   ```
   Luego ingrese la contraseña raíz de MySQL cuando se le solicite.
3. Cree una nueva base de datos mediante el siguiente comando:
   ```sql
   CREATE DATABASE nombre_bd;
   ```
   Reemplace `nombre_bd` con el nombre que desea darle a su base de datos.
4. Cree un nuevo usuario mediante el siguiente comando:
   ```sql
   CREATE USER 'nombre_usuario'@'localhost' IDENTIFIED BY 'contraseña';
   ```
   Reemplace `nombre_usuario` con el nombre de usuario que desea darle a su usuario y `contraseña` con la contraseña que desea establecer.
   Asegúrese de utilizar una contraseña segura.
5. Otorgue al usuario acceso completo a la base de datos mediante el siguiente comando:
   ```sql
   GRANT ALL PRIVILEGES ON nombre_bd.* TO 'nombre_usuario'@'localhost';
   ```
   Reemplace `nombre_bd` con el nombre de la base de datos que creó y `nombre_usuario` con el nombre de usuario que creó.
6. Actualice los privilegios mediante el siguiente comando:
   ```sql
   FLUSH PRIVILEGES;
   ```

¡Eso es todo! Ha creado correctamente una base de datos y un usuario para su aplicación de base de datos web generada por AppGini.
El siguiente paso es [configurar su aplicación generada por AppGini](working-with-generated-web-database-application/setup.md)
