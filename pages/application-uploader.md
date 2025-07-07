---
title: Cargador automático de aplicaciones
linkTitle: Carga de aplicaciones
slug: help/application-uploader
description: Aprenda a utilizar el cargador automático de aplicaciones en AppGini para cargar sus aplicaciones en su servidor. Esta función facilita mucho la implementación de sus aplicaciones.
keywords: cargador automático, cargar aplicaciones, implementar aplicaciones, cargador appgini, implementar appgini, cargar appgini, implementación continua, integración continua, CI/CD, appgini CI/CD, implementación continua appgini, integración continua appgini, seguridad del cargador, seguridad appgini
---

# Cargador automático de aplicaciones

A partir de AppGini 23.10, introdujimos una nueva función que facilita mucho la implementación (carga) de sus aplicaciones AppGini en su servidor. Al hacer clic en un solo botón 'Cargar', AppGini comprueba los archivos modificados en su aplicación y los carga en su servidor. Ya no necesita utilizar herramientas externas de FTP, SSH u otras herramientas de carga, y no tiene que preocuparse por cargar los archivos correctos en las carpetas correctas.

### Funciones inteligentes del cargador automático de archivos

*   **Carga solo los archivos que han cambiado**. Esto significa que si realiza cambios en su aplicación que solo provocan la modificación de unos pocos archivos, el cargador se encargará de detectar qué archivos se modificaron y solo cargará esos archivos. Esto es mucho más rápido que cargar todos los archivos cada vez.
*   **Carga solo los archivos necesarios**. El cargador solo cargará los archivos necesarios para ejecutar su aplicación. Ignorará los archivos que no son necesarios, como los archivos de registro, el archivo local `config.php` (que no debe cargarse en el servidor), etc.
*   **Carga los archivos en las carpetas correctas**. El cargador cargará los archivos en las carpetas correctas de su servidor. Por ejemplo, el archivo llamado `admin/index.php` en su aplicación se cargará en la carpeta `admin` de su servidor. Las carpetas que falten también se crearán automáticamente. Esto le ahorra mucho tiempo tratando de depurar por qué su aplicación no funciona después de cargarla.
*   **Clave de carga segura**. El cargador utiliza una clave de carga secreta para autenticarse en su servidor. Esta clave se crea la primera vez que utiliza el cargador. Es una cadena aleatoria de 32 caracteres que se almacena en la configuración de AppGini y en el archivo `file-uploader.php`. Todo esto sucede de forma transparente para usted, por lo que no tiene que preocuparse por ello. Solo tenga la seguridad de que nadie que intente acceder al cargador de archivos podrá hacerlo sin conocer la clave secreta.

    Además, la carga automática de archivos solo funciona a través de HTTPS. Esto es para evitar que alguien intercepte la clave de carga y la utilice para cargar archivos en su servidor.

### Cómo habilitar la carga automática de archivos

Para habilitar la carga automática de archivos, debe:

1.  **Establecer la URL de la aplicación** en la sección de configuración de Seguridad de las propiedades del proyecto. Esta es la URL que sus usuarios utilizarán para acceder a su aplicación. Debe proporcionar la URL completa de la página de inicio, incluido el protocolo (`https://`) pero sin `index.php` al final. Por ejemplo:

    https://example.com/catalog

    ![Establecer la URL de la aplicación](https://cdn.bigprof.com/images/appgini-app-url.png)

2.  **Cargar manualmente el archivo `file-uploader.php` generado en su servidor**. Esto solo debe hacerse una vez. Puede hacerlo utilizando cualquier herramienta FTP o SSH. Una vez que lo cargue, puede utilizar la carga automática para todos los cambios futuros. El archivo `file-uploader.php` se encuentra en la carpeta de inicio de su aplicación. Y debe cargarse en la carpeta correspondiente de su servidor. Entonces, para la URL de la aplicación de ejemplo anterior, ese archivo debería ser accesible en:

    https://example.com/catalog/file-uploader.php

### Cómo utilizar la carga automática de archivos

Después de haber establecido la URL de la aplicación y haber cargado `file-uploader.php` en su servidor, puede utilizar la carga automática de archivos haciendo clic en el botón 'Cargar' en AppGini. Este botón se puede encontrar en la parte superior del panel de propiedades del proyecto, junto al botón 'Ver archivos'. Solo es visible después de haber generado su aplicación.

![Botón Cargar en el panel de propiedades del proyecto](https://cdn.bigprof.com/images/appgini-upload-button-project-properties-pane.png)

También puede encontrar el botón 'Cargar' después de generar su aplicación en la ventana de estado:

![Botón Cargar en la ventana de estado](https://cdn.bigprof.com/images/appgini-upload-button-app-generator-status-window.png)

Después de hacer clic en el botón 'Cargar', AppGini realizará varias comprobaciones antes de cargar.

![Comprobaciones realizadas antes de cargar aplicaciones en AppGini](https://cdn.bigprof.com/images/appgini-app-uploader-start-checks-24.19.png)

En la captura de pantalla anterior, todas las comprobaciones se realizaron correctamente. El siguiente paso después de eso es comprobar si hay archivos modificados. Pero si alguna comprobación falla, verá un mensaje de error como este:

![Fallaron las comprobaciones de carga](https://cdn.bigprof.com/images/appgini-app-uploader-checks-failed-24.19.png)

Debe corregir los errores que se muestran en el mensaje antes de poder continuar con la carga. En el ejemplo anterior, el error es que el archivo `file-uploader.php` no se encuentra en el servidor. Debe cargarlo en el servidor como se explica en la sección [Cómo habilitar la carga automática de archivos](#cómo-habilitar-la-carga-automática-de-archivos) anterior, y luego volver a intentar la carga.

Si todas las comprobaciones pasan, AppGini buscará cambios en los archivos. Esto tardará un par de minutos aproximadamente, dependiendo del tamaño de su aplicación. Una vez que se complete el escaneo, AppGini le mostrará un resumen de los cambios detectados:

![Resultados del escaneo de archivos modificados](https://cdn.bigprof.com/images/appgini-upload-scanning-changed-files-24.19.png)

En la captura de pantalla anterior, AppGini detectó que se modificaron 36 archivos. Debe hacer clic en el botón que muestra el número de archivos modificados para comenzar la carga. En caso de que no se detecten cambios, verá un mensaje como este en su lugar:

![No se detectaron cambios](https://cdn.bigprof.com/images/appgini-upload-no-changes-detected-24.19.png)

Después de hacer clic en el botón para cargar los cambios, AppGini comenzará a cargar solo los archivos modificados en su servidor. La ventana de progreso de la carga le mostrará el progreso de la carga.

![Ventana de progreso de la carga](https://cdn.bigprof.com/images/appgini-upload-progrss-24.19.png?1)

Una vez completada la carga, AppGini le mostrará cuántos archivos se cargaron, cuántos se omitieron (porque no se modificaron/ignoraron) y cuántos fallaron, si los hubo, junto con una lista completa de los archivos cargados:

![Ventana de resultados de la carga](https://cdn.bigprof.com/images/appgini-upload-finished-24.19.png)

En caso de que alguna carga falle, se mostrará en rojo. Debe verificar el mensaje de error que se muestra para cada carga fallida y solucionar el problema. Por lo general, las cargas fallidas se deben a problemas de permisos de archivos en el servidor. Puede solucionar esto asegurándose de que la carpeta a la que está cargando su aplicación y cualquier subcarpeta sean editables por el software del servidor web (apache, nginx, etc.) que está utilizando. Por ejemplo, en la mayoría de las configuraciones de apache en linux, el usuario propietario de las carpetas de la aplicación debe ser `www-data`. Después de solucionar el problema, puede volver a intentar la carga haciendo clic en el botón 'Reintentar cargas fallidas':

![Botón Reintentar cargas fallidas](https://cdn.bigprof.com/images/appgini-upload-retry-failed.png)

### Solución de problemas

Si tiene problemas con la carga automática de archivos, compruebe lo siguiente:

*   **¿Ha configurado la URL de la aplicación?** Si no ha configurado la URL de la aplicación, el botón 'Cargar' mostrará un error. Consulte la sección [Cómo habilitar la carga automática de archivos](#cómo-habilitar-la-carga-automática-de-archivos) anterior para obtener más información.
*   **¿Ha cargado `file-uploader.php` en su servidor?** Si no ha cargado `file-uploader.php` en su servidor, las comprobaciones realizadas antes de cargar fallarán. Puede cargar `file-uploader.php` en su servidor utilizando cualquier herramienta FTP o SSH. Debe cargarse en la carpeta de inicio de su aplicación en su servidor.
*   **¿Su aplicación es accesible a través de HTTPS?**. La carga automática de archivos solo funciona a través de HTTPS. Esto es para evitar que alguien intercepte la clave de carga y la utilice para cargar archivos en su servidor. Asegúrese de que su servidor tenga un certificado SSL válido, no autofirmado, y asegúrese de que no esté caducado.
*   **Asegúrese de que la clave de carga secreta sea correcta**. La clave de carga secreta se puede recuperar desde la ventana de preferencias de AppGini. Si no coincide con la clave en el archivo `file-uploader.php` de su servidor, puede regenerar su aplicación y luego volver a cargar manualmente el nuevo archivo `file-uploader.php`, sobrescribiendo el antiguo en el servidor.

    _**Consejo:**_ Puede ver la clave de carga secreta almacenada en el archivo `file-uploader.php` abriéndolo en un editor de texto. La línea 2 contiene la clave, así:

    ```php
    <?php
       define('UPLOAD_KEY', '2DF5367D046FFE742277D04B107CF46B');
    ```

*   **¿Su antivirus está bloqueando la carga?** Algunos programas antivirus pueden bloquear el funcionamiento del cargador automático de archivos. Puede intentar deshabilitar su antivirus temporalmente para ver si está causando el problema. Si es así, puede agregar una excepción para AppGini.exe en la configuración de su antivirus.
*   **¿Está instalado curl en su PC?**. El cargador automático de archivos utiliza curl para cargar archivos en su servidor. Curl está instalado de forma predeterminada en las máquinas Windows modernas, Linux y MacOS. En PC con Windows más antiguas, puede descargar curl desde el [sitio web oficial de curl](https://curl.se/windows/).
*   **¿Tiene modsecurity o un firewall de aplicaciones web (WAF) similar instalado en su servidor?** Esto podría impedir que el cargador automático de archivos funcione. Si tiene un WAF instalado en su servidor, puede intentar agregar una excepción para el archivo `file-uploader.php` a la configuración del WAF. Para modsecurity, puede intentar agregar este código a un nuevo archivo dentro de `/etc/apache/mods-enabled/` (quizás llámelo `appgini.conf`) o similar, luego reinicie apache:

    ```apache
    <IfModule mod_security2.c>
       SecRule REQUEST_URI "/file-uploader.php$" id:300001,allow
    </IfModule>
    ```

    _**Sugerencia:**_ Revise los registros de errores de su servidor para ver si modsecurity está bloqueando las solicitudes a `file-uploader.php` o no.

*   **¿Está utilizando Cloudflare?** Cloudflare es un excelente servicio para proteger su sitio web, pero como también actúa como un firewall de aplicaciones web, podría impedir que el cargador automático de archivos funcione. Deberá agregar una excepción para el archivo `file-uploader.php` a las [reglas de firewall de Cloudflare](https://developers.cloudflare.com/waf/managed-rules/waf-exceptions/).
*   **¿Están configurados correctamente los permisos/propiedad de las carpetas?** Asegúrese de que la carpeta a la que está cargando su aplicación y cualquier subcarpeta sean editables por el software del servidor web (apache, nginx, etc.) que está utilizando. Por ejemplo, en la mayoría de las configuraciones de apache en linux, el usuario propietario de las carpetas de la aplicación debe ser `www-data`.

    Puede establecer la propiedad de la carpeta de la aplicación y todas sus subcarpetas en `www-data` ejecutando este comando en su servidor:

    ```bash
    sudo chown -R www-data:www-data /ruta/a/su/aplicacion
    ```

    Reemplace `/ruta/a/su/aplicacion` con la ruta real a su aplicación en su servidor.

    Si está utilizando un software de servidor web diferente o un sistema operativo diferente, es posible que deba utilizar un nombre de usuario/grupo diferente. Por ejemplo, en CentOS, el nombre de usuario/grupo suele ser `apache` en lugar de `www-data`.

    Si no está seguro de qué nombre de usuario/grupo usar, puede verificar el nombre de usuario/grupo del software del servidor web ejecutando este comando en su servidor:

    ```bash
    ps aux | egrep '(apache|nginx)'
    ```

    Esto le mostrará el nombre de usuario/grupo del software del servidor web.

### Consideraciones de seguridad

La carga automática de archivos es una gran característica, pero es importante comprender sus implicaciones de seguridad. Aquí hay algunas cosas a tener en cuenta:

* **El cargador automático de archivos utiliza HTTPS**. Esto es para evitar que alguien intercepte la clave de carga y la utilice para cargar archivos en su servidor. Asegúrese de que su servidor tenga un certificado SSL válido, no autofirmado, y asegúrese de que no esté caducado.

* **El cargador automático de archivos utiliza una clave de carga secreta**. La clave de carga secreta se puede recuperar desde la ventana de preferencias de AppGini, en la pestaña 'Cargador de aplicaciones'.

    ![Pestaña Cargador de aplicaciones en la ventana de preferencias de AppGini](https://cdn.bigprof.com/images/appgini-preferences-app-uploader.png)

    Asegúrese de mantener esta clave en secreto. Cualquiera que tenga acceso a esta clave puede cargar archivos ejecutables en su servidor y comprometerlo. Si cree que su clave ha sido comprometida, debe _inmediatamente_:

    1.  Eliminar el archivo `file-uploader.php` de su servidor.
    2.  Generar una nueva clave desde la ventana de preferencias de AppGini.
    3.  Regenerar su aplicación y cargar el nuevo `file-uploader.php` en su servidor.

    También recomendamos que elimine todos los archivos de la aplicación del servidor y utilice el cargador automático de archivos para volver a cargarlos.

* Durante el proceso de carga, la aplicación se establece en **modo de mantenimiento**. Esto significa que nadie puede acceder a la aplicación mientras se está cargando. Una vez completada la carga, la aplicación vuelve al modo normal.

* Para mayor seguridad, puede agregar una regla a su firewall de servidor o a Cloudflare (si lo está utilizando) para bloquear el acceso al archivo `file-uploader.php` desde todas las direcciones IP excepto la que está utilizando para cargar su aplicación.

    Si está utilizando Apache, puede agregar esta regla a su archivo `.htaccess` o al archivo de configuración de Apache de su sitio:

    ```
    <Files "file-uploader.php">
        Order allow,deny
        Deny from all
        Allow from 124.233.112.210
    </Files>
    ```

    Reemplace `124.233.112.210` con la dirección IP externa de la PC que está utilizando para cargar su aplicación.

    Para nginx, puede utilizar esta regla en su lugar:

    ```
    location ~* ^/file-uploader\.php$ {
      allow 124.233.112.210;
      deny all;
    }
    ```

    También podría especificar un rango de direcciones IP en las reglas anteriores utilizando la [notación CIDR](https://en.wikipedia.org/wiki/Classless_Inter-Domain_Routing#IPv4_CIDR_blocks) en lugar de una sola dirección IP.

* **Excluya el archivo `file-uploader.php` de su repositorio**. Si está utilizando un sistema de control de versiones como git, asegúrese de excluir el archivo `file-uploader.php` de su repositorio. Este archivo contiene la clave de carga secreta y no desea exponerla al público. Para excluir el archivo de su repositorio, puede agregarlo a su archivo `.gitignore`.
