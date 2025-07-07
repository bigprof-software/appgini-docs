---
title: Trabajar con la aplicación de base de datos web generada
linkTitle: Trabajar con la aplicación web generada
slug: help/working-with-generated-web-database-application
description: Aprenda a trabajar con la aplicación de base de datos web generada.
keywords: trabajar con aplicación web generada, aplicación web generada, aplicación de base de datos web generada
---

# Trabajar con la aplicación de base de datos web generada

Después de generar la aplicación PHP basada en su proyecto, el siguiente
paso es cargar los archivos a su servidor y configurar la base de datos. Los
archivos generados se guardan en una carpeta que usted especifique. A continuación se muestra una captura de pantalla
de una carpeta que contiene archivos generados a partir de un proyecto.

![Una carpeta que contiene archivos generados a partir de un proyecto de AppGini](https://cdn.bigprof.com/appgini-desktop/help/working-with-generated-web-app.png "Una carpeta que contiene archivos generados a partir de un proyecto de AppGini")

Para cargar los archivos generados, debe utilizar un cliente FTP. Un programa muy bueno
(y de código abierto) es
[FileZilla](https://filezilla-project.org/download.php).

Debe cargar toda la carpeta a su servidor web. Asegúrese de que
su servidor web esté configurado correctamente para ejecutar archivos .php como scripts PHP
(de lo contrario, probablemente se tratarán como archivos de texto y todo su
código fuente se mostrará en los navegadores de los visitantes).

Después de cargar los archivos, está listo para configurar la base de datos. ¡Continuemos!

> **¡Nota de seguridad IMPORTANTE!**
Su base de datos contiene información importante que no desea que ninguna
persona no autorizada manipule... Por lo tanto, solo los usuarios autorizados deben
tener acceso a su base de datos.

La aplicación AppGini generada implementa un sistema de gestión de usuarios avanzado,
pero intuitivo. Este sistema permite a los usuarios iniciar sesión en
la aplicación generada y tener permisos limitados de los que usted (el
administrador) tiene control total.

El administrador tiene acceso a un [área de
administración](/appgini/help/working-with-generated-web-database-application/the-admin-interface/)
donde puede definir grupos. Cada grupo tiene sus propios permisos sobre cada
tabla de su aplicación.

Por ejemplo, digamos que ha creado una aplicación para almacenar
contactos de clientes, contactos de proveedores y contactos de empleados. El
administrador puede definir un grupo llamado 'RRHH' que puede ver y editar solo los
contactos de los empleados, un grupo llamado 'Ventas' que puede ver y editar
solo los contactos de los clientes, y un grupo llamado 'Adquisiciones' que
puede ver y editar solo los contactos de los proveedores. Cada grupo puede tener uno
o más miembros, y cada miembro hereda los permisos de su grupo. El
siguiente diagrama explica esto gráficamente.

![Grupos de usuarios y permisos en AppGini](https://cdn.bigprof.com/images/group.gif "Grupos de usuarios y permisos en AppGini")

Si un usuario del grupo Ventas intenta acceder a la tabla Proveedores, no
se le permitirá. Si un usuario anónimo intenta acceder a cualquier tabla, no
se le permitirá. Si el administrador cambia los permisos de acceso de un
grupo, a todos los miembros de ese grupo se les otorgarán instantáneamente los nuevos
permisos (y se les denegarán los antiguos).

Puede establecer los permisos de los usuarios anónimos en AppGini antes de la generación de
archivos. Y puede cambiarlos más tarde desde el [área de
administración](/appgini/help/working-with-generated-web-database-application/the-admin-interface/).
Tenga mucho cuidado al establecer los permisos anónimos para evitar
comprometer sus datos.

## Un resumen de los archivos generados

Para cada tabla de su proyecto, AppGini generará varios archivos. Por
ejemplo, en la lista de archivos anterior, la tabla "categorías" tiene estos
archivos:

-   `templates/categories_templateDV.html` Este archivo contiene la
    plantilla que controla el diseño del formulario de vista detallada de la
    tabla. Este formulario es donde los usuarios pueden ingresar nuevos registros o editar
    los existentes.

-   `templates/categories_templateDVP.html` Este archivo contiene la
    plantilla que controla el diseño del formulario de vista detallada imprimible
    de la tabla.

-   `templates/categories_templateTV.html` Este archivo contiene la
    plantilla para mostrar cada registro en la vista de tabla. La vista de tabla
    es una lista de los registros de la tabla.

-   `templates/categories_templateTVS.html` Es lo mismo que
    `categories_templateTV.html`, excepto que controla la plantilla
    solo para el registro seleccionado. Cuando los usuarios hacen clic en un registro en la
    vista de tabla para seleccionarlo, el registro seleccionado se resalta en la
    vista de tabla y su contenido se muestra en la vista detallada para
    editarlo o eliminarlo.

-   `templates/children-categories.php` Si la tabla de categorías se
    muestra como secundaria de otra tabla, este es el archivo utilizado para
    formatear la vista secundaria.

-   `categories_dml.php` Este archivo contiene el código que controla
    lo que sucede al insertar un nuevo registro en la tabla, editar un
    registro existente o eliminar un registro.

    Este archivo también contiene la función `form()` que controla la
    visualización de la vista detallada, utilizando el archivo de plantilla `categories_templateDV.html`.

-   `categories_autofill.php` Si tiene [campos de búsqueda de
    autocompletar](/appgini/help/working-with-projects/understanding-lookup-fields/)
    en su tabla, este archivo contiene el código para completar estos
    campos de autocompletar. Este archivo se llama a través de una solicitud ajax y
    envía código javascript al navegador.

-   `categories_view.php` Esta es la página controladora que une todos
    los archivos anteriores en una sola página. Puede controlar varias
    opciones de visualización y permisos en esta página.
