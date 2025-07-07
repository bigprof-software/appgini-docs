---
title: Veo un error o una página en blanco en mi aplicación AppGini - ¿cómo solucionarlo?
linkTitle: Páginas en blanco y errores
slug: help/advanced-topics/troubleshooting-errors-and-blank-pages
---

# Veo un error o una página en blanco en mi aplicación AppGini - ¿cómo solucionarlo?

**En primer lugar:** ¿Ha realizado alguna personalización en su aplicación AppGini,
ya sea a través de
[hooks](https://bigprof.com/appgini/help/advanced-topics/hooks/) o
editando directamente algunos de los archivos generados fuera de los hooks? Si es así:

1.  Abra su archivo de proyecto AXP en AppGini.
2.  Genere la aplicación en una **nueva carpeta vacía**. Esto crearía una
    aplicación limpia, sin ninguna personalización.
3.  Ejecute su nueva aplicación en su navegador, intentando reproducir el error. Si
    el error no ocurre, entonces sabemos que hay algo mal en
    la personalización que ha realizado.
4.  Puede deshacer la personalización o, si desea depurarla
    más a fondo, siga leyendo a continuación los pasos para descubrir el error y
    depurarlo.

**Los pasos siguientes son útiles para encontrar la causa exacta del error,
ya sea en su código personalizado o en el código generado de su
aplicación.**

-   Presione F12 para abrir el inspector del navegador, luego haga clic en la
    pestaña 'Consola'. ¿Hay algún error reportado allí?

    ![Pestaña de la consola del inspector que muestra un error de ejemplo para una aplicación de AppGini.](https://cdn.bigprof.com/images/appgini-inspector-console-error.png)

-   Si no es así, y si puede acceder al área de administración:

    -   Vaya al menú *Utilidades* > *Ver/Reconstruir campos* y realice
        las correcciones sugeridas, si las hubiera.

        ![Página Ver/Reconstruir campos que muestra un botón de corrección](https://cdn.bigprof.com/images/appgini-rebuild-fields.png)

    -   Si no se informan problemas en la página *Ver/Reconstruir campos*, vaya al
        menú *Utilidades* nuevamente > *Registros de consultas*. ¿Hay algún error
        reportado? Si es así y se aplica alguna de las siguientes opciones:

        -   Ha realizado una personalización en el código generado, o
        -   tiene campos calculados en su aplicación, o
        -   tiene una o más consultas SQL personalizadas para campos de búsqueda,

        si es así, intente revisar su código para asegurarse de que las consultas SQL sean
        válidas. Puede utilizar la 'Herramienta interactiva de consultas SQL' en
        el menú *Utilidades* para probar su consulta. O puede usar herramientas de terceros
        como phpMyAdmin.

        ![Página de registros de consultas que muestra errores SQL de ejemplo](https://cdn.bigprof.com/images/appgini-query-logs-errors.png)

-   Si no encontró errores de SQL, abra el archivo `error_log` de su servidor y
    verifique si se informa algún error relacionado con su aplicación AppGini
    en él.

    -   La ubicación de ese archivo varía según el software de su servidor web
        y su sistema operativo. Debe consultar la documentación de su servidor web
        para saber dónde encontrar el archivo de registro de errores. Por ejemplo, para
        Apache en Linux, ese archivo está *normalmente* en
        `/var/log/apache2/error.log` (pero eso podría variar
        según la configuración de su entorno).

    Si encuentra uno o más errores reportados en el archivo de registro de errores, y
    ha realizado una personalización en el código generado, intente revisar
    su código y corregir cualquier error de sintaxis.

-   Si ninguna de las opciones anteriores se aplica a su aplicación AppGini, envíenos
    su archivo de proyecto AXP junto con cualquier mensaje de error,
    capturas de pantalla y/o cualquier otro detalle sobre el error y cómo
    reproducirlo. Puede enviarlos a través del formulario de contacto en
    <https://bigprof.com/appgini/support-request>
