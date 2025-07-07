---
title: Trabajar con tablas y registros
linkTitle: Trabajar con tablas y registros
slug: help/working-with-generated-web-database-application/working-with-tables-and-records
keywords: tablas, registros, vista de tabla, vista detallada, página de inicio, filtros, ordenación, paginación, registros secundarios, exportar registros, imprimir registros
description: Aprenda a trabajar con tablas y registros en su aplicación AppGini. Esta página explica la página de inicio, la vista de tabla, la vista detallada y cómo filtrar, ordenar y exportar registros.
---

# Trabajar con tablas y registros

Después de [configurar su aplicación AppGini](setup.md), puede comenzar a
trabajar con sus tablas y registros. Esta página lo guiará a través del
proceso de trabajo con tablas y registros en su aplicación AppGini.

## La página de inicio de la aplicación

Esta página proporciona enlaces a las tablas accesibles en su aplicación,
dependiendo de los permisos de grupo del usuario que ha iniciado sesión. En la siguiente
captura de pantalla, podemos ver la página de inicio de la [aplicación de ejemplo Northwind](https://northwind.demos.appgini.com/).

![página de inicio de la aplicación](https://cdn.bigprof.com/images/northwind-app-homepage-24.15.png "página de inicio de la aplicación")

### Grupos de tablas

La página de inicio muestra una lista de tablas accesibles para el usuario actual. AppGini permite
agrupar tablas relacionadas configurando **grupos de tablas** en el [panel de propiedades de la tabla](../working-with-projects/table-properties-pane.md).
La página de inicio mostraría entonces estos grupos como secciones desplegables, como se muestra en la captura de pantalla anterior.

### Ocultar enlace en la página de inicio

El [panel de propiedades de la tabla](../working-with-projects/table-properties-pane.md) en AppGini también le permite controlar si una tabla se muestra en la página de inicio o no.
Esto se puede hacer marcando la opción **Ocultar enlace en la página de inicio** en el panel de propiedades de la tabla.

### Título de la vista de tabla

El título de cada tabla en la página de inicio se muestra como un enlace. Al hacer clic en este enlace, accederá a la página de vista de tabla para esa tabla.
Puede personalizar el título de cada tabla en la página de inicio configurando la opción **Título de la vista de tabla** en el [panel de propiedades de la tabla](../working-with-projects/table-properties-pane.md).

### Descripción

También puede agregar una descripción a cada tabla en la página de inicio configurando la opción **Descripción** en el [panel de propiedades de la tabla](../working-with-projects/table-properties-pane.md).
Puede usar etiquetas HTML en la descripción para formatearla según sea necesario. Tenga en cuenta que, según la longitud de la descripción, puede ocultarse parcialmente en la página de inicio y
aparecerá una barra de desplazamiento vertical para permitirle desplazarse por la descripción.

Puede controlar la altura del cuadro de descripción en la página de inicio configurando la opción **Altura del panel de la tabla en la página de inicio (píxeles)**
en el [panel de propiedades del proyecto](../working-with-projects/project-properties-pane.md).

### Icono de tabla

Puede establecer un icono para cada tabla en la página de inicio configurando la opción **Icono de tabla** en el [panel de propiedades de la tabla](../working-with-projects/table-properties-pane.md).
Puede establecer esta opción haciendo clic en el icono a la izquierda del nombre de la tabla en el panel de propiedades de la tabla.

### Mostrar recuento de registros en la página de inicio

La opción **Mostrar recuento de registros en la página de inicio** en el [panel de propiedades de la tabla](../working-with-projects/table-properties-pane.md)
en AppGini se puede usar para mostrar el número de registros en cada tabla en la página de inicio.
Esto muestra el número de registros *accesibles* para el usuario actual en lugar del número total de registros en la tabla.

### Permitir agregar nuevos registros desde la página de inicio

La opción **Permitir agregar nuevos registros desde la página de inicio** en el [panel de propiedades de la tabla](../working-with-projects/table-properties-pane.md)
en AppGini se puede usar para mostrar un botón "Agregar nuevo" en la página de inicio para cada tabla.
Al hacer clic en este botón, se mostrará un cuadro de diálogo modal para agregar un nuevo registro a la tabla, como se muestra en la captura de pantalla a continuación.

![agregar nuevo pedido desde la página de inicio](https://cdn.bigprof.com/images/northwind-add-new-order-from-homepage-24.15.png "agregar nuevo pedido desde la página de inicio")

### Búsqueda de tablas

*Disponible en AppGini 24.13 y versiones posteriores*

La página de inicio también incluye un cuadro de búsqueda en la parte superior para permitirle buscar una tabla específica por su nombre.
Esto es útil cuando tiene una gran cantidad de tablas en su aplicación.

![buscar tablas](https://cdn.bigprof.com/screencasts/live-search-in-homepage.gif "buscar tablas")

Puede ocultar mediante programación el cuadro de búsqueda agregando este código al archivo `hooks/header-extras.php`:

```html
<script>AppGini.disableHomePageSearch = true;</script>
```

De forma predeterminada, solo puede buscar nombres de tablas. Si también desea buscar descripciones de tablas, puede agregar este código al archivo `hooks/header-extras.php`:

```html
<script>AppGini.homePageSearchDescriptions = true;</script>
```

### Visualización de los menús de navegación de tablas en la página de inicio

*Disponible en AppGini 24.14 y versiones posteriores*

Puede mostrar los menús de navegación en la página de inicio agregando este código al archivo `hooks/__bootstrap.php`:

```php
<?php define('HOMEPAGE_NAVMENUS', true); ?>
```

> **Nota:** Si el archivo `hooks/__bootstrap.php` no existe, simplemente créelo como un archivo vacío en la carpeta `hooks` de su proyecto, luego agréguele el código anterior.

## La página de vista de tabla

Al hacer clic en un enlace de tabla en la página de inicio, accederá a la página de vista de tabla.
Aquí puede navegar por los registros de datos de su tabla y editar, agregar y
eliminar registros. Como se muestra en la figura siguiente, la vista de tabla muestra los datos
en una tabla donde los registros aparecen en filas y cada columna representa un
campo de la tabla.

![vista de tabla de clientes](https://cdn.bigprof.com/images/northwind-customers-tv-24.15.png "vista de tabla de clientes")

Para cambiar los encabezados de columna mostrados, puede establecer la propiedad **Título** de cada campo en el [panel de propiedades del campo](../working-with-projects/field-properties-pane.md).

### Ordenación de registros

Se puede hacer clic en los encabezados de las columnas para ordenar los registros por la columna en la que se hizo clic.
Al hacer clic en el encabezado de una columna una vez, los registros se ordenan en orden ascendente, y al hacer clic de nuevo, los registros se ordenan en orden descendente.
La siguiente captura de pantalla muestra la tabla de clientes ordenada por la columna 'País' en orden ascendente.

![tv de clientes ordenada por país](https://cdn.bigprof.com/images/northwind-customers-tv-sorted-by-country-24.15.png "tv de clientes ordenada por país")

Para ordenar por varias columnas, haga clic en el botón [**Filtro**](#filtrado-de-registros) sobre la tabla. Desde allí, puede agregar múltiples criterios de ordenación.

### Búsqueda rápida

El cuadro de búsqueda rápida sobre la tabla le permite buscar registros que contengan un valor específico en cualquiera de los campos.
La búsqueda rápida no distingue entre mayúsculas y minúsculas y busca el valor ingresado en todos los campos de la tabla.
Los registros coincidentes se muestran en la vista de tabla, con el texto coincidente resaltado en un estilo diferente, como se muestra en la captura de pantalla a continuación.

![búsqueda rápida de tv de clientes](https://cdn.bigprof.com/images/northwind-customers-tv-quick-search-24.15.png "búsqueda rápida de tv de clientes")

Para borrar la búsqueda rápida, haga clic en el botón **(X)** en el extremo derecho del cuadro de búsqueda rápida.

### Filtrado de registros

Si bien la búsqueda rápida le permite buscar registros que contengan un valor específico en cualquier campo,
el filtrado le permite buscar registros según criterios más granulares.
Por ejemplo, la captura de pantalla a continuación muestra la página de filtros donde estamos filtrando clientes de los Estados Unidos,
que han realizado pedidos con un valor total entre $20,000 y $100,000.

![filtros de tv de clientes](https://cdn.bigprof.com/images/northwind-customers-filters-example.png "filtros de tv de clientes")

Para filtrar registros, haga clic en el botón **Filtro** sobre la vista de tabla. Esto mostrará la página de filtros,
donde puede establecer y combinar múltiples filtros para buscar registros específicos.

La página de filtros también permite a los usuarios especificar un orden de clasificación más granular para los registros,
permitiendo la clasificación por hasta cuatro campos en orden ascendente o descendente.

Los usuarios también pueden filtrar registros según la propiedad, lo que les permite filtrar registros de su propiedad, de su grupo o todos los registros.
Esta sección se muestra solo si el usuario actual tiene acceso a los registros de su grupo o a todos los registros.

> **Consejo profesional:** Puede utilizar el [plugin Creador de páginas de búsqueda](https://bigprof.com/appgini/applications/search-page-maker-plugin) para reemplazar
> la página de filtros predeterminada con una página de búsqueda más personalizada y fácil de usar. Por ejemplo, la captura de pantalla a continuación muestra los
> mismos filtros de la captura de pantalla anterior, pero definidos de una manera más fácil de usar utilizando el plugin Creador de páginas de búsqueda.
>
> ![filtros spm de tv de clientes](https://cdn.bigprof.com/images/northwind-customers-filters-spm.png "filtros spm de tv de clientes")

Después de definir los filtros, haga clic en el botón **Aplicar filtros** para aplicar los filtros y mostrar los registros filtrados en la vista de tabla.
Las columnas que se utilizan en los filtros mostrarán un icono de filtro en el encabezado de la columna, como se muestra en la captura de pantalla a continuación.

![filtros aplicados de tv de clientes](https://cdn.bigprof.com/images/northwind-customers-tv-filters-applied-24.15.png "filtros aplicados de tv de clientes")

Para borrar los filtros, haga clic en el botón **Mostrar todo** en la parte superior de la vista de tabla.

### Exportación de registros a CSV

Puede exportar los registros de la vista de tabla actual a un archivo CSV haciendo clic en el botón **Guardar CSV** sobre la tabla.
Esto descargará un archivo CSV que contiene los registros de la vista de tabla actual. Si ha aplicado filtros, búsqueda rápida u ordenación,
el archivo CSV exportado contendrá solo los registros que coincidan con los filtros y la ordenación aplicados.

Una vez que haya exportado los registros a un archivo CSV, puede abrirlo en una aplicación de hoja de cálculo como Microsoft Excel o Google Sheets.
Desde allí, puede analizar los datos, crear gráficos o compartir los datos con otros.

![csv de tv de clientes](https://cdn.bigprof.com/images/northwind-customers-tv-csv-24.15.png "csv de tv de clientes")

### Impresión de registros

Puede imprimir los registros de la vista de tabla actual haciendo clic en el botón **Vista previa de impresión** sobre la tabla.
Esto mostrará *todos* los registros de la vista de tabla actual en un formato imprimible, sin paginación.
Si ha aplicado filtros, búsqueda rápida u ordenación, la vista previa de impresión contendrá solo los registros que coincidan con los filtros y la ordenación aplicados.

Desde la vista previa de impresión, puede utilizar la funcionalidad de impresión del navegador para imprimir los registros o guardarlos como un archivo PDF.

![tvp de clientes](https://cdn.bigprof.com/images/northwind-customers-tvp-24.15.png "tvp de clientes")

### Visualización de la consulta SQL de la vista de tabla actual

*Disponible en AppGini 24.11 y versiones posteriores*

Si ha iniciado sesión como superadministrador, puede ver la consulta SQL utilizada para obtener los registros que se muestran en la vista de tabla actual.
Esto puede ser útil para crear informes personalizados o para fines de depuración. Si la vista de tabla actual está filtrada, la consulta SQL incluirá los filtros aplicados.
Para mostrar la consulta SQL, haga clic en el botón **SQL** sobre la vista de tabla.

Para copiar la consulta SQL, simplemente haga clic en cualquier parte del cuadro de consulta SQL. Esto copiará toda la consulta a su portapapeles, lista para pegarla en su editor SQL favorito.
Para ocultar la consulta SQL, vuelva a hacer clic en el botón **SQL**.

![consulta sql de tv de clientes](https://cdn.bigprof.com/images/northwind-customers-tv-sql-query-24.15.png "consulta sql de tv de clientes")

Para habilitar esta función, marque la opción **Permitir acceso de administrador a SQL de vista de tabla** en la sección **Configuración de seguridad** del panel de propiedades del proyecto en AppGini.

### Ocultar/Mostrar columnas

Es útil cuando hay muchas columnas en una tabla ocultar algunas de ellas para centrarse en las más importantes.
Para ello, haga clic en el icono **Ocultar/Mostrar columnas** en la parte superior derecha de la vista de tabla. Esto mostrará un cuadro de diálogo
donde puede seleccionar qué columnas ocultar o mostrar. Estas configuraciones se guardan en el almacenamiento local del navegador,
por lo que persisten entre sesiones para cada usuario.

![mostrar ocultar columnas de tv de clientes](https://cdn.bigprof.com/images/northwind-customers-tv-show-hide-columns-24.15.png "mostrar ocultar columnas de tv de clientes")

### Aplicación de acciones a múltiples registros

Puede aplicar acciones a múltiples registros en la vista de tabla seleccionando los registros a los que desea aplicar la acción.
Una vez que seleccione uno o más registros, aparecerá un botón **Más** en la parte superior de la vista de tabla. Al hacer clic en este botón, se muestra un menú con las acciones disponibles.

![menú más de tv de clientes](https://cdn.bigprof.com/images/northwind-customers-tv-more-menu-24.15.png "menú más de tv de clientes")

Las acciones disponibles dependen de los permisos del usuario que ha iniciado sesión. Por ejemplo,
los superadministradores pueden eliminar múltiples registros a la vez y pueden cambiar la propiedad de múltiples registros a la vez.

Para los usuarios que pueden acceder a la vista detallada (incluido el superadministrador), está disponible la acción **Vista previa de impresión de vista detallada**.
Esta acción le permite imprimir la vista detallada de múltiples registros a la vez.

Puede [agregar acciones personalizadas a este menú mediante hooks](../advanced-topics/hooks/multiple-record-batch-actions.md).

### Registros secundarios

*Disponible en AppGini 23.15 y versiones posteriores*

Si una tabla tiene una relación de uno a muchos con otra tabla (consulte [campos de búsqueda](../working-with-projects/understanding-lookup-fields.md)),
puede [configurar](../working-with-projects/understanding-lookup-fields.md#parentchildren-settings) la tabla principal para mostrar una columna de información secundaria para algunas o todas sus tablas secundarias.
Por ejemplo, puede mostrar el recuento de pedidos de cada cliente en la vista de tabla de clientes, en la columna *Pedidos del cliente*.
En las mismas columnas, puede crear directamente un nuevo pedido para un cliente haciendo clic en el botón **+**.

![modal de pedidos de clientes](https://cdn.bigprof.com/images/northwind-customers-orders-modal-24.15.png "modal de pedidos de clientes")

### Paginación

Si la tabla tiene muchos registros, la vista de tabla está paginada. Puede navegar entre páginas utilizando los controles de paginación en la parte inferior de la vista de tabla.
Estos incluyen los botones **Anterior** y **Siguiente**. También puede saltar a una página específica utilizando el menú desplegable **Ir a la página**.

![número de página de ir a tv de clientes](https://cdn.bigprof.com/images/northwind-customers-tv-goto-page-number-24.15.png "número de página de ir a tv de clientes")

A partir de AppGini 24.15, también puede controlar el número de registros que se muestran por página haciendo clic en el menú desplegable **Registros por página**.
Esta configuración se guarda en el almacenamiento local del navegador, por lo que persiste entre sesiones para cada usuario, para cada tabla.

![registros por página de tv de clientes](https://cdn.bigprof.com/images/northwind-customers-tv-records-per-page-24.15.png "registros por página de tv de clientes")

Si desea cambiar las opciones disponibles en el menú desplegable **Registros por página**, puede hacerlo agregando este código JavaScript al
archivo `hooks/footer-extras.php` o `hooks/header-extras.php`:

```html
<script>
  AppGini.config.recordsPerPageOptions = [10, 25, 50, 100, 250, 500];
</script>
```

Ajuste los valores de la matriz para que coincidan con las opciones deseadas.

---

## La vista detallada

Al hacer clic en un registro en la vista de tabla, accederá a la página de vista detallada.
Aquí puede ver y editar los detalles del registro seleccionado. La página de vista detallada
muestra los campos del registro en un diseño de formulario, donde puede editar los valores de los campos.

![vista detallada del cliente](https://cdn.bigprof.com/images/northwind-customers-dv-full-permissions-24.15.png "vista detallada del cliente")

La captura de pantalla anterior muestra la vista detallada de un registro de cliente en la
[aplicación de ejemplo Northwind](https://northwind.demos.appgini.com/customers_view.php?SelectedID=ANATR).
El usuario tiene todos los permisos en esta tabla, por lo que puede ver, editar y eliminar el registro. Para los usuarios
con permisos limitados, algunas de las acciones pueden no estar disponibles. Por ejemplo, un usuario con permisos de solo lectura
verá la vista detallada así:

![vista detallada del cliente de solo lectura](https://cdn.bigprof.com/images/northwind-customers-dv-read-only-24.15.png "vista detallada del cliente de solo lectura")

Para mayor claridad, asignemos un número a cada sección de la vista detallada para poder hacer referencia a ellas en las explicaciones siguientes:

![secciones de la vista detallada del cliente](https://cdn.bigprof.com/images/northwind-customers-dv-full-permissions-labeled-24.15.png "secciones de la vista detallada del cliente")

### Encabezado principal de la vista detallada (1)

El encabezado principal de la vista detallada muestra el título de la tabla, como se especifica en la propiedad de título del panel de propiedades de la tabla en AppGini.
También muestra el icono de la tabla, también especificado en el panel de propiedades de la tabla. Si el usuario tiene permiso para insertar nuevos registros, aquí se muestra un botón **Agregar nuevo**.

### Título de la vista detallada (2)

El título de la vista detallada se muestra en la parte superior del formulario. Este título se especifica en la propiedad **Título de la vista detallada** del panel de propiedades de la tabla en AppGini.

### Botón de información de administrador (3)

Si el usuario actual es un superadministrador, se muestra un botón **Información de administrador** en la parte superior derecha de la vista detallada.
Al hacer clic en este botón, se muestra un cuadro de diálogo que muestra el propietario del registro, el grupo propietario y las fechas de creación y última modificación del registro.
También permite al superadministrador asignar el registro a un propietario diferente, mostrar todos los registros del propietario o su grupo, y enviar un correo electrónico al propietario
o al grupo propietario.

![información de administrador de la vista detallada del cliente](https://cdn.bigprof.com/images/northwind-customers-dv-admin-info-menu-24.15.png "información de administrador de la vista detallada del cliente")

### Enlaces de registros secundarios (4)

Si la tabla actual tiene una relación de uno a muchos con otra tabla, y el enlace secundario está [configurado](../working-with-projects/understanding-lookup-fields.md#parentchildren-settings)
para mostrarse en la vista detallada, aquí se muestran los enlaces de registros secundarios. Al hacer clic en el enlace, se abre la vista de tabla de la tabla secundaria,
filtrada para mostrar solo los registros secundarios relacionados con el registro actual.

### Barra de herramientas de diseño de vista detallada (5)

*Disponible en AppGini 24.14 y versiones posteriores*

La barra de herramientas de diseño de vista detallada permite a los usuarios cambiar entre diferentes diseños de la vista detallada.
Según el ancho de la pantalla, los usuarios pueden cambiar entre diseños de 1, 2 o 3 columnas.
El último diseño seleccionado se guarda en el almacenamiento local del navegador, por lo que persiste entre sesiones para cada usuario
para cada tabla.

![barra de herramientas de diseño de vista detallada del cliente](https://cdn.bigprof.com/screencasts/dv-layout-switcher.gif "barra de herramientas de diseño de vista detallada del cliente")

### Acciones de la vista detallada (6)

Las acciones de la vista detallada permiten a los usuarios realizar diversas acciones en el registro actual. Las acciones disponibles dependen de los permisos del usuario que ha iniciado sesión.
El botón **< Atrás** permite a los usuarios volver a la vista de tabla.

El botón **Vista previa de impresión** permite a los usuarios obtener una vista previa de una versión de solo lectura del registro actual
para imprimir o guardar como PDF.

![vista previa de impresión de la vista detallada del cliente](https://cdn.bigprof.com/images/northwind-customers-dvp-24.15.png "vista previa de impresión de la vista detallada del cliente")

La página de vista previa de impresión se puede personalizar fácilmente para controlar el número de columnas y mostrar/ocultar registros secundarios.

Si el usuario tiene permiso para editar el registro actual, se muestra el botón **Guardar cambios**. Del mismo modo, si el usuario tiene permiso para eliminar el registro actual,
se muestra el botón **Eliminar**.

Para facilitar la navegación entre registros, se muestran los botones **Anterior** y **Siguiente**. Estos botones permiten a los usuarios navegar al registro anterior o siguiente
sin volver a la vista de tabla. El orden de los registros se basa en los filtros y la ordenación aplicados actualmente.

### Campos de la vista detallada (7)

Los campos de la vista detallada muestran los valores de los campos del registro. Los campos se muestran en el mismo
orden en que se definen en AppGini, en lugar del orden en que se definen en la base de datos.
Puede controlar el orden de los campos moviéndolos hacia arriba o hacia abajo en el panel del explorador de proyectos en AppGini.

Si el usuario actual no tiene permiso para editar campos, los campos se muestran en modo de solo lectura.

### Pestañas de registros secundarios (8)

Si la tabla actual tiene una relación de uno a muchos con una o más tablas secundarias,
y las pestañas secundarias están [configuradas](../working-with-projects/understanding-lookup-fields.md#parentchildren-settings)
para mostrarse en la vista detallada, aquí se muestran las pestañas de registros secundarios. El título y el icono de la pestaña también se pueden
configurar.

Solo los usuarios con permiso para ver los registros secundarios verán las pestañas secundarias.

### Adición de nuevos registros secundarios (9)

Si el usuario actual tiene permiso para agregar nuevos registros a una tabla secundaria, se muestra un botón **Agregar nuevo** en la parte superior de esa pestaña secundaria.
Al hacer clic en este botón, se abre un cuadro de diálogo modal para agregar un nuevo registro a la tabla secundaria, con el campo de búsqueda principal rellenado previamente con
el valor del registro actual (para que el nuevo registro secundario se vincule automáticamente al registro principal actual).

### Encabezados de tabla secundaria (10)

Los encabezados de la tabla secundaria muestran el título (leyenda) de los campos de la tabla secundaria. El título de cada campo se puede personalizar en el panel de propiedades del campo en AppGini.
Al hacer clic en el encabezado de una columna, los registros secundarios se ordenan por esa columna en orden ascendente. Al hacer clic de nuevo en el mismo encabezado de columna, los registros se ordenan en orden descendente.

### Abrir vista detallada de registro secundario (11)

Al hacer clic en este icono, se abre la vista detallada del registro secundario en un cuadro de diálogo modal.
Esto permite a los usuarios ver y, si tienen permiso, editar o eliminar el registro secundario sin salir de la vista detallada del registro principal.
Después de editar el registro secundario, la pestaña de registros secundarios se actualiza para reflejar los cambios.

### Paginación de registros secundarios (12)

Esta sección muestra los controles de paginación para los registros secundarios y la posición actual en la paginación.
Si solo hay una página de registros secundarios, los controles de paginación están ocultos.
