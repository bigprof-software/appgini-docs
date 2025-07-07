---
title: Generación de la aplicación PHP
linkTitle: Generación de la aplicación PHP
slug: help/working-with-projects/generating-the-php-application
---

# Generación de la aplicación PHP


![El icono 'Generar aplicación'](https://cdn.bigprof.com/images/generate-app-icon.png)

Después de haber terminado de trabajar con su proyecto (definiendo tablas, campos y estilos), lo único que queda ahora es iniciar su aplicación. Haga clic en el icono 'Generar aplicación'. Se le pedirá que seleccione (o cree) una carpeta de salida.


!['Especificar carpeta de salida' diálogo](https://cdn.bigprof.com/screencasts/specify-output-folder-dialog.png)

Si ha generado código para el proyecto abierto anteriormente, este cuadro de diálogo mostrará, de forma predeterminada, la misma carpeta de salida utilizada anteriormente. Puede seleccionar la carpeta de salida utilizando el botón _Examinar..._ para navegar a cualquier otra carpeta.

Al hacer clic en el botón de la carpeta amarilla, puede cambiar la carpeta de salida a la carpeta principal de la especificada actualmente. _Igual que el archivo de proyecto_ establecería la carpeta de salida en la misma que la carpeta que contiene el archivo de proyecto AXP, y _Última carpeta utilizada_ establecería la carpeta de salida en la que utilizó por última vez (¡cuidado! esto podría contener una aplicación generada por un archivo de proyecto diferente).


Si elige una carpeta que ya contiene código generado previamente, verá una ventana que enumera todos los archivos que se generarán. Puede especificar en esta ventana (que se muestra a continuación) qué archivos sobrescribir y cuáles omitir.


!['Seleccionar archivos para sobrescribir' diálogo](https://cdn.bigprof.com/appgini-desktop/help/generating-php-application-3.png)


Finalmente, una ventana de registro (que se muestra a continuación) informa los eventos que ocurrieron durante la generación de archivos: verificación de errores, archivos sobrescritos, archivos omitidos, archivos fallidos e instrucciones para implementar la aplicación generada. Puede guardar el registro para referencia futura si hace clic en el botón "Guardar registro". En este punto, ha terminado con AppGini. El siguiente paso es cargar y configurar su aplicación PHP.


![Registro de archivos generados](https://cdn.bigprof.com/appgini-desktop/help/generating-php-application-4.png)


**Consejo:** Si desea personalizar algunos de los archivos generados y no desea que AppGini los sobrescriba si regenera su proyecto más tarde, configúrelos como de solo lectura. Esta es una forma muy fácil de conservar su código personalizado. AppGini simplemente informará que no pudo sobrescribir ese archivo y continuará generando los otros archivos normalmente.

Para una gestión de código más avanzada, debería considerar el uso de [hooks](/appgini/help/advanced-topics/hooks/). Los hooks le permiten agregar más funcionalidad y personalizar el comportamiento de su aplicación sin perder sus personalizaciones cada vez que regenere la aplicación más tarde.
