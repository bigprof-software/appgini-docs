---
title: De datos a paneles de control, una guía para la integración de Redash con AppGini
linkTitle: Integración de Redash
slug: help/connect-redash-to-appgini
keywords: redash, appgini, integración, panel de control, visualización de datos, sql, mysql, fuente de datos, consulta, visualización, gráfico, panel de control, alerta, rendimiento, réplica de lectura
description: Aprenda a integrar Redash con AppGini para crear visualizaciones interactivas, crear paneles dinámicos y compartir información con su equipo.
---

# De datos a paneles de control, una guía para la integración de Redash con AppGini

![Ejemplo de panel de control de Redash](https://cdn.bigprof.com/images/redash-dashboard-example-2.png)

## ¿Qué es Redash?

[Redash](https://redash.io) es una herramienta de visualización de datos y creación de paneles de control de código abierto que permite a los usuarios conectarse a diversas fuentes de datos, crear visualizaciones interactivas y crear paneles dinámicos. Proporciona una interfaz fácil de usar para consultar y explorar datos, lo que facilita el acceso y el análisis de datos a los usuarios no técnicos.

Redash admite una amplia gama de fuentes de datos, incluidas bases de datos relacionales (por ejemplo, bases de datos MySQL utilizadas en [aplicaciones AppGini](https://bigprof.com/appgini/)), bases de datos NoSQL, servicios de almacenamiento en la nube y API. Permite a los usuarios escribir consultas utilizando SQL u otros lenguajes de consulta específicos de la fuente de datos y visualizar los resultados en diferentes tipos de gráficos, como gráficos de barras, gráficos de líneas, gráficos circulares y más.

## Instalación de Redash en su servidor

Redash es una pila de varios componentes, que incluye una aplicación web Python, una base de datos PostgreSQL, un servidor Redis y varios otros componentes. Se puede instalar en un servidor Linux usando Docker, o en un servidor Windows usando una máquina virtual. El proceso de instalación está documentado en detalle en la [documentación de Redash](https://redash.io/help/open-source/setup).

Configurar Redash puede ser un poco desafiante, especialmente si no está familiarizado con Docker. Si no se siente cómodo con el proceso de instalación, podemos ayudarlo a configurar Redash por una pequeña tarifa. [Contáctenos](https://bigprof.com/appgini/support-request) para obtener más detalles.

## Conexión de Redash a su aplicación AppGini

Una vez que tenga Redash instalado y funcionando, puede conectarlo a su aplicación AppGini. Para hacer esto, deberá crear un usuario de MySQL _con acceso de solo lectura_ a su base de datos AppGini. ¿Por qué acceso de solo lectura? Porque Redash ejecutará consultas de solo lectura en su base de datos, y es una buena idea limitar su acceso para evitar cambios accidentales en sus datos.

Para crear un usuario de solo lectura, puede usar la siguiente consulta SQL en phpMyAdmin o cualquier otro cliente MySQL:

```sql
CREATE USER 'redash'@'%' IDENTIFIED BY 'contraseña-segura';
GRANT SELECT ON `nombre-de-su-base-de-datos`.* TO 'redash'@'%';
```

Reemplace `contraseña-segura` con una contraseña segura de su elección, y `nombre-de-su-base-de-datos` con el nombre de su base de datos AppGini. Si no está seguro del nombre de su base de datos, puede encontrarlo en el archivo `config.php` en la carpeta de su aplicación AppGini.

Una vez que haya creado el usuario, puede conectar Redash a su base de datos AppGini siguiendo los pasos a continuación:

1.  Inicie sesión en Redash como usuario administrador.
2.  Haga clic en el enlace "Configuración" en la esquina inferior izquierda de la página.
3.  Haga clic en "Fuentes de datos" en la barra lateral izquierda, luego haga clic en el botón "Nueva fuente de datos".
4.  En el cuadro de búsqueda, escriba "MySQL", luego haga clic en la fuente de datos "MySQL".
5.  Se le pedirá que proporcione un nombre para la fuente de datos. Puede usar "AppGini" o cualquier otro nombre que desee.
6.  En el campo "Host", ingrese la dirección IP o el nombre de host de su servidor MySQL. Si está ejecutando Redash en el mismo servidor que su aplicación AppGini, generalmente puede usar `localhost`.
7.  Deje el campo "Puerto" vacío a menos que esté utilizando un puerto no estándar para MySQL.
8.  Proporcione el nombre de usuario y la contraseña que creó anteriormente.
9.  Si su servidor MySQL está configurado para usar SSL, puede habilitar SSL marcando la casilla de verificación "Usar SSL".
10. Haga clic en el botón "Crear" para guardar la fuente de datos.
11. A continuación, haga clic en el botón "Probar conexión" para asegurarse de que Redash pueda conectarse a su base de datos AppGini.
12. Si la prueba de conexión es exitosa, haga clic en el botón "Guardar" para guardar la fuente de datos.

### Aquí hay una demostración en video que muestra los pasos anteriores

<video style="width: 100%; height: auto;" controls>
<source src="https://cdn.bigprof.com/screencasts/redash-add-appgini-mysql-data-source.mp4" type="video/mp4">
Su navegador no admite la etiqueta de video.
</video>

## Creación de una consulta en Redash

Una vez que haya conectado Redash a su base de datos AppGini, puede comenzar a crear consultas. Para crear una nueva consulta, siga estos pasos:

1.  Haga clic en el enlace "Consultas" en la barra lateral izquierda.
2.  Haga clic en el botón "Nueva consulta".
3.  Seleccione la fuente de datos "AppGini" que creó anteriormente en el menú desplegable "Fuente de datos" en la parte superior izquierda de la página.
4.  En el campo "Consulta", ingrese su consulta SQL. Puede usar el árbol "Esquema" a la izquierda para explorar las tablas y los campos de su base de datos y hacer clic en el botón » junto a una tabla o campo para insertarlo en su consulta.
5.  Haga clic en el botón "Ejecutar" para ejecutar la consulta y ver los resultados.
6.  Si la consulta se ejecuta correctamente, haga clic en el botón "Guardar" para guardar la consulta. Debe darle un nombre que describa lo que hace la consulta.
7.  Opcionalmente, puede hacer clic en el botón "Visualizar" para crear una visualización de los resultados de la consulta. Puede elegir entre una variedad de tipos de gráficos, incluidos gráficos de barras, gráficos de líneas, gráficos circulares y más.
8.  Una vez que haya terminado, haga clic en el botón "Guardar" para guardar la visualización.
9.  Para poder mostrar los resultados de la consulta o la visualización en un panel de control, debe hacer clic en el botón "Publicar". Esto también hará que la consulta o visualización esté disponible para otros usuarios de Redash.

### Aquí hay una demostración en video que muestra los pasos anteriores

<video style="width: 100%; height: auto;" controls>
<source src="https://cdn.bigprof.com/screencasts/redash-create-and-publish-query.mp4" type="video/mp4">
Su navegador no admite la etiqueta de video.
</video>

> **¡SUGERENCIA!** Puede usar el [plugin DataTalk para AppGini](https://bigprof.com/appgini/applications/datatalk-plugin) para crear las consultas que necesita en Redash.

El plugin le permite crear consultas simplemente describiéndolas en lenguaje natural. Aquí hay un video que muestra cómo funciona:

<video style="width: 100%; height: auto;" controls>
<source src="https://cdn.bigprof.com/screencasts/use-datatalk-plugin-to-create-redash-queries.mp4" type="video/mp4">
Su navegador no admite la etiqueta de video.
</video>

¡El plugin DataTalk le ahorra la molestia de escribir consultas SQL complejas. Y no necesita recordar los nombres de las tablas y los campos de su base de datos ni preocuparse por escribirlos mal. Simplemente describa lo que necesita en lenguaje natural y el plugin se encargará del resto!

## Creación de un panel de control en Redash

![Ejemplo de panel de control de Redash](https://cdn.bigprof.com/images/redash-dashboard-example-2.png)

Los paneles de control en Redash se componen de widgets. Cada widget puede mostrar los resultados de una consulta o una visualización. Para crear un panel de control, siga estos pasos:

1.  Haga clic en el enlace "Paneles de control" en la barra lateral izquierda.
2.  Haga clic en el botón "Nuevo panel de control".
3.  Dé un nombre a su panel de control y haga clic en el botón "Guardar".
4.  Haga clic en el botón "Agregar widget".
5.  Seleccione la consulta que desea mostrar en el widget en el menú desplegable "Consulta".
6.  Seleccione el tipo de visualización que desea utilizar en el menú desplegable "Visualización".
7.  Haga clic en el botón "Agregar al panel de control" para agregar el widget a su panel de control.
8.  Puede mover y cambiar el tamaño del widget para controlar su posición y tamaño en el panel de control.
9.  Repita los pasos 4-8 para agregar más widgets a su panel de control.
10. Finalmente, haga clic en el botón "Terminar edición" para guardar el panel de control.
11. Si desea compartir el panel de control con otros usuarios de Redash, puede hacer clic en el botón "Publicar".

## Creación de alertas en Redash

Redash le permite crear alertas que se activarán cuando los resultados de una consulta cumplan ciertas condiciones. Por ejemplo, puede crear una alerta que envíe un correo electrónico a un usuario cuando el número de pedidos en las últimas 24 horas supere un cierto umbral. Para crear una alerta, debe configurar la consulta subyacente para que se actualice automáticamente periódicamente. También necesita configurar destinos de alerta, que pueden ser direcciones de correo electrónico, canales de Slack, webhooks o varios otros destinos.

Aquí hay un ejemplo de una alerta que envía un correo electrónico al equipo de ventas cuando el número de pedidos en los últimos 7 días es cero:

![Ejemplo de alerta de Redash](https://cdn.bigprof.com/images/redash-alert-example.png)

## Profundice en Redash

Redash tiene una lista de reproducción de videos muy informativa en YouTube que entra en más detalles sobre la creación de consultas y paneles de control. Hemos incluido los videos a continuación para su conveniencia:

<div style="position: relative; width: 100%; padding-bottom: 56.25%; overflow: hidden;">
<iframe src="https://www.youtube-nocookie.com/embed/videoseries?si=pjSO5KiJFM2Dx5UD&amp;list=PLMIFYdGfSFcwzkOL7UIN1-Zou5URg2cDE" title="Reproductor de video de YouTube" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen="" style="position: absolute; top: 0; left: 0; width: 100%; height: 100%;"></iframe>
</div>

## Consideraciones de rendimiento al usar Redash

Redash es una gran herramienta para visualizar datos de su aplicación AppGini. Sin embargo, los usuarios pueden crear consultas complejas que pueden suponer una gran carga para su servidor de base de datos. Además, Redash permite a los usuarios crear consultas y paneles de control que se actualizan automáticamente periódicamente, a veces con una frecuencia de cada minuto aproximadamente. Esto puede suponer una gran carga para su servidor de base de datos, especialmente si tiene una gran cantidad de usuarios.

Una forma de evitar esto, sin limitar la funcionalidad de Redash, es [configurar una réplica de lectura separada de su base de datos MySQL](https://www.digitalocean.com/community/tutorials/how-to-set-up-replication-in-mysql) y conectar Redash a ella en lugar de a la base de datos principal. De esta manera, los usuarios de Redash consultarán la réplica de lectura en lugar de la base de datos principal, y esto no afectará el rendimiento de su aplicación AppGini.

## Conclusión

A lo largo de este tutorial, hemos cubierto la integración de [Redash](https://redash.io/) con [AppGini](https://bigprof.com/appgini/) para desbloquear capacidades avanzadas de visualización de datos y creación de paneles de control. Ha aprendido a configurar Redash en su servidor, conectarlo a su base de datos AppGini con seguridad mejorada a través del acceso de solo lectura y utilizar el [plugin DataTalk](https://bigprof.com/appgini/applications/datatalk-plugin) para facilitar la creación de consultas sin un conocimiento profundo de SQL. La guía paso a paso proporcionada ahora debería permitirle crear visualizaciones perspicaces, crear paneles interactivos y compartir sus hallazgos con facilidad.

A medida que aplique estas nuevas habilidades, tenga en cuenta las consideraciones de rendimiento vitales para mantener la capacidad de respuesta de su aplicación, especialmente la estrategia de emplear una réplica de lectura para su base de datos para mitigar la carga de consultas complejas y frecuentes. Con Redash como su herramienta de elección, está bien posicionado para elevar la experiencia de datos para su equipo y partes interesadas, asegurando que sus datos no solo sean informativos sino también procesables.
