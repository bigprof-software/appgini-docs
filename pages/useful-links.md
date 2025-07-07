---
title: Enlaces útiles
linkTitle: Enlaces útiles
slug: help/useful-links
keywords: entorno de prueba, Xampp, servidor web, MySQL, PHP, cliente FTP, FileZilla, función de carga, función de carga de AppGini, curso en línea, personalización de aplicaciones AppGini, proveedores de alojamiento, Digital Ocean, Bluehost, Docker, contenedor Docker, gestión de código, software CVS, TortoiseGit, referencia HTML, referencia CSS, referencia Bootstrap 3, referencia API jQuery, referencia PHP, referencia SQL MySQL
description: Enlaces útiles para usuarios de AppGini, incluida la configuración de un entorno de prueba, la carga de código generado, un curso en línea sobre la personalización de aplicaciones AppGini, proveedores de alojamiento, ejecución de aplicaciones AppGini en Docker, gestión de código y material de referencia.
---

# Enlaces útiles

## Configuración de un entorno de prueba para sus aplicaciones web

Puede probar sus aplicaciones web generadas por AppGini en una máquina *local*
antes de implementarlas en línea. Para ello, necesita instalar un [servidor
web](http://httpd.apache.org/download.cgi),
[MySQL](http://dev.mysql.com/downloads/) y
[PHP](http://www.php.net/downloads.php). Por supuesto, instalar y
configurar todos estos programas es un gran dolor de cabeza. Afortunadamente,
hay una forma más fácil: descargue e instale
[Xampp](http://www.apachefriends.org/en/xampp-windows.html), una única
descarga que se encarga de todo el trabajo necesario de una sola vez.

**Nota:** Todas las herramientas anteriores son software gratuito y de código abierto.


## Carga del código generado a su servidor

### Carga mediante un cliente FTP *(NO recomendado)*

Para cargar el código generado a su servidor, podría utilizar un cliente FTP,
por ejemplo
[FileZilla](https://filezilla-project.org/download.php). Sin embargo,
esto podría causar problemas si no tiene mucho cuidado. Por ejemplo, podría
sobrescribir accidentalmente sus archivos de configuración del lado del servidor, o
podría cargar archivos en la estructura de directorios incorrecta. Además,
AppGini crea muchos archivos y directorios. Pero muchos de ellos no cambian
de una generación a otra. Por lo tanto, podría terminar
cargando innecesariamente muchos archivos que ya están en el servidor.

### Carga mediante la función de carga de AppGini *(RECOMENDADO)*

A partir de AppGini 23.10, puede utilizar la [función de carga integrada](application-uploader.md) para cargar
su código generado a su servidor. Esta función es mucho más segura y eficiente
que utilizar un cliente FTP. Solo carga los archivos que han cambiado
desde la última generación y no sobrescribe sus archivos de configuración
del lado del servidor. Todo lo que necesita hacer para cargar su código
es hacer clic en el botón `Cargar`, y AppGini se encargará del resto.


## Nuestro curso en línea sobre la personalización de aplicaciones AppGini

Hemos preparado un curso para usuarios avanzados de AppGini, a quienes les gustaría agregar más
funcionalidad a sus aplicaciones escribiendo código personalizado. A través de 4.5
horas de video, completará 30 ejemplos prácticos, con más de
500 líneas de código, que cubren las preguntas más comunes sobre hooks que recibimos
de los usuarios. [Vista previa del
curso](https://bigrof.com/appgini/udemy-customization-course).


## Proveedores de alojamiento

La mayoría de los proveedores de alojamiento admiten el alojamiento de las aplicaciones generadas por
AppGini listas para usar, ya que AppGini genera aplicaciones PHP que
se conectan a bases de datos MySQL. PHP y MySQL están muy disponibles
en casi cualquier proveedor de alojamiento.

Si está buscando un servicio de **alojamiento en la nube altamente confiable** y muy fácil de usar,
hemos estado utilizando [Digital
Ocean](https://m.do.co/c/d30b7a2609f4) durante muchos años y estamos bastante
contentos con su simplicidad y confiabilidad. Este [enlace
especial](https://m.do.co/c/d30b7a2609f4) le proporciona un crédito de 100 $ para
probar su servicio.

Sin embargo, Digital Ocean requiere cierta experiencia en la gestión de las actualizaciones de su servidor
y las instalaciones de software (aunque tienen [muchas guías
detalladas](https://www.digitalocean.com/community/tutorials) para ello).
Si está buscando un alojamiento administrado (donde el proveedor
se encarga de instalar, proteger y actualizar el software de su servidor,
así como de resolver la mayoría de los problemas técnicos),
[Bluehost](https://www.bluehost.com/) es una muy buena
opción.

Una buena fuente de información sobre proveedores de alojamiento es el
[foro webhostingtalk](https://www.webhostingtalk.com/).


## Ejecución de aplicaciones AppGini dentro de un contenedor Docker

Docker es una excelente manera de ejecutar sus aplicaciones AppGini en un entorno contenedorizado.
De esta manera, puede mover fácilmente sus aplicaciones entre
diferentes servidores, y puede ejecutar múltiples aplicaciones en el mismo
servidor sin preocuparse por los conflictos entre ellas. Consulte nuestra
[plantilla de guía para ejecutar aplicaciones AppGini en Docker](https://github.com/bigprof-software/appgini-on-docker).


## Gestión de código

Si planea editar manualmente el código generado, debe tener cuidado
de evitar sobrescribir sus modificaciones en caso de que regenere el código
más tarde. El software CVS ayuda enormemente a organizar y versionar su
código. Hace que sea muy fácil deshacer (revertir) cambios perjudiciales y fusionar
sus modificaciones en el código recién generado. Un programa excelente, fácil y
gratuito es [TortoiseGit](https://tortoisegit.org/). Tenemos un
[tutorial sobre cómo usarlo con el código de AppGini](/appgini/screencasts/how-to-use-git-with-appgini-to-manage-code-changes).


## Material de referencia

-   [Referencia de
    HTML](https://developer.mozilla.org/en-US/docs/Web/Guide/HTML/HTML5)
-   [Referencia de
    CSS](https://developer.mozilla.org/en-US/docs/Web/CSS/Reference)
-   [Referencia de Bootstrap 3](https://getbootstrap.com/docs/3.4/css/)
-   [Referencia de la API de jQuery](https://api.jquery.com/)
-   [Referencia de PHP](http://www.php.net/manual/en/)
-   [Referencia de SQL de
    MySQL](https://dev.mysql.com/doc/refman/8.0/en/sql-statements.html)
