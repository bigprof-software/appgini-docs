---
title: Comprensión de los campos de búsqueda
linkTitle: Campos de búsqueda
slug: help/working-with-projects/understanding-lookup-fields
keywords: campos de búsqueda, claves externas, tabla principal, tabla secundaria, maestro detalle, configuración de padres e hijos, botones de opción, lista de opciones
description: Los campos de búsqueda son la forma en que AppGini vincula 2 campos de 2 tablas. Esta página explica cómo configurar campos de búsqueda, cómo aparecen en la aplicación generada y cómo configurar los ajustes de padres/hijos.
---

# Comprensión de los campos de búsqueda

## Claves externas en bases de datos relacionales

En el mundo de las bases de datos relacionales, una clave externa es un campo en una tabla que identifica de forma única una fila en otra tabla.
Por ejemplo, digamos que tenemos una tabla para almacenar pedidos y otra tabla para almacenar clientes. Cada pedido es realizado por un cliente, por lo que la tabla de pedidos debe tener un campo que identifique de forma única al cliente que realizó el pedido. Este campo se llama clave externa y vincula la tabla de pedidos con la tabla de clientes.

![Diagrama ER de ejemplo que muestra una clave externa que vincula pedidos con clientes](https://cdn.bigprof.com/images/simple-er-diagram.png "Diagrama ER de ejemplo que muestra una clave externa que vincula pedidos con clientes")

Uno podría preguntarse, ¿por qué no simplemente almacenar el nombre del cliente en la tabla de pedidos? La respuesta es que almacenar el nombre del cliente en la tabla de pedidos conduciría a la redundancia de datos. Por ejemplo, si un cliente cambia su nombre, tendríamos que actualizar todos los pedidos realizados por ese cliente. Esto no solo es engorroso sino también propenso a errores. Al usar una clave externa, solo almacenamos el ID del cliente en la tabla de pedidos, y el nombre del cliente se almacena en la tabla de clientes. De esta manera, si un cliente cambia su nombre, solo necesitamos actualizar la tabla de clientes, y todos los pedidos realizados por ese cliente reflejarían automáticamente el nuevo nombre.

El concepto anterior se conoce como ***normalización*** en el diseño de bases de datos. Es un conjunto de reglas que nos ayudan a diseñar bases de datos de una manera que minimice la redundancia de datos y garantice la integridad de los datos.

## Campos de búsqueda en AppGini

AppGini implementa el concepto de claves externas utilizando ***campos de búsqueda***. Al igual que las claves externas en las bases de datos relacionales, los campos de búsqueda en AppGini vinculan 2 campos de 2 tablas.
AppGini agrega algunas características interesantes a los campos de búsqueda, como mostrar los datos vinculados como un menú desplegable o botones de opción, y copiar automáticamente los registros secundarios al copiar los registros principales.
Además, AppGini le permite configurar los ajustes de padres/hijos para mostrar los registros secundarios debajo de la vista detallada del registro principal y para mostrar el recuento de registros secundarios en la vista de tabla de la tabla principal.

Discutiremos estas características con más detalle en las siguientes secciones.

La siguiente captura de pantalla de la [tabla de pedidos](https://northwind.demos.appgini.com/orders_view.php) de la [demostración en línea de Northwind](https://northwind.demos.appgini.com/) muestra una lista de pedidos. El campo "Cliente" es un campo de búsqueda que vincula cada pedido a un cliente en la tabla de clientes. El campo "Empleado" es otro campo de búsqueda que vincula cada pedido a un empleado en la tabla de empleados.

![Campos de búsqueda en la tabla de pedidos de la demostración en línea de Northwind](https://cdn.bigprof.com/images/lookup-fields-displayed-in-table-view.png "Campos de búsqueda en la tabla de pedidos de la demostración en línea de Northwind")

También puede ver la columna "Artículos del pedido" a la derecha de la tabla en la captura de pantalla anterior. Esta columna muestra el recuento de artículos de pedido para cada pedido. Y también le permite agregar nuevos artículos de pedido directamente desde la vista de tabla de pedidos. Esta es una característica que se puede habilitar en AppGini configurando los ajustes de padres/hijos, como veremos más adelante en esta página.

## Configuración de campos de búsqueda en AppGini

![Pestaña de campo de búsqueda en AppGini](https://cdn.bigprof.com/images/appgini-lookup-tab-24.14.png)

La captura de pantalla anterior muestra la pestaña de campo de búsqueda en el panel de propiedades del campo de AppGini. Esta pestaña es donde configura un campo como un campo de búsqueda. Aquí, estamos configurando el campo "Cliente" en la tabla de pedidos para que sea un campo de búsqueda que se vincule a la tabla de clientes. Revisemos las opciones en la pestaña de campo de búsqueda:

* **Tabla principal**: Esta es la tabla que contiene los datos de origen para el campo de búsqueda. En nuestro ejemplo, la tabla principal es la tabla de clientes.
* **Parte 1 del campo de título principal**: Este es el campo de la tabla principal que contiene los datos que se mostrarán en el campo de búsqueda. En nuestro ejemplo, el campo de título principal es el campo "CompanyName" en la tabla de clientes.
* **Parte 2 del campo de título principal**: Este es un campo opcional que se puede unir al primer campo para mostrar más datos en el campo de búsqueda. Por ejemplo, podría unir los campos "FirstName" y "LastName" en la tabla de clientes para mostrar el nombre completo en el campo de búsqueda.
* **Separador**: Este es el carácter (o caracteres) que separa los datos del primer y segundo campo en el campo de búsqueda. Por ejemplo, podría usar un carácter de espacio como separador para mostrar el nombre completo como "John Doe" en lugar de "JohnDoe".
* **Mostrar como botones de opción**: Si está marcado, el campo de búsqueda se mostrará como botones de opción en lugar de un menú desplegable. Esto es útil cuando tiene una pequeña cantidad de opciones para elegir.
  ![Un campo de búsqueda que se muestra como botones de opción en la vista detallada](https://cdn.bigprof.com/appgini-desktop/help/understanding-lookup-fields-4.png)
* **Heredar permisos de acceso**: Si está marcado, el campo de búsqueda heredará los permisos de acceso de la tabla principal. Esto es útil cuando desea restringir la lista de opciones en el campo de búsqueda según los permisos del usuario en la tabla principal.
* **Enlace al registro principal en la vista detallada**: Este menú desplegable le permite mostrar un enlace al registro principal en la vista detallada del registro secundario. Esto es útil cuando desea navegar rápidamente al registro principal desde el registro secundario.
  Están disponibles las siguientes opciones:
  * **Deshabilitado**: No se mostrará ningún enlace.
  * **Abrir registro principal en una ventana emergente modal**: El registro principal se mostrará en una ventana emergente modal.
  * **Abrir registro principal en la misma página**: El registro principal se mostrará en la misma página, navegando fuera del registro secundario.
  * **Abrir registro principal en una nueva ventana**: El registro principal se mostrará en una nueva pestaña o ventana del navegador.

Para establecer un campo como un campo de búsqueda en AppGini, cree un nuevo campo y, en su panel de propiedades, vaya a la pestaña "Campo de búsqueda", como se muestra en la captura de pantalla anterior. En el menú desplegable "Tabla principal", seleccione la tabla que contiene los datos de origen. En el menú desplegable "Parte 1 del campo de título principal", seleccione el campo de origen. Establezca otras opciones según sea necesario, como se describe anteriormente.

> **Nota**: AppGini cambiará el tipo de datos del campo de búsqueda para que sea el mismo que el de la clave principal de la tabla principal. Este es un comportamiento normal y no debe alterarlo.

## ¿Cómo aparecería el campo de búsqueda en la vista detallada de la aplicación generada?

![Campo de búsqueda en la vista detallada de la aplicación generada](https://cdn.bigprof.com/appgini-desktop/help/understanding-lookup-fields-2.png)

La captura de pantalla anterior muestra la vista detallada de la tabla de productos generada por AppGini. La vista detallada es donde los usuarios pueden editar los registros de la tabla. Los campos "Proveedor" y "Categoría" son campos de búsqueda que obtienen sus datos de las tablas de proveedores y productos, respectivamente. Estos datos se representan en un menú desplegable para cada campo.

Si elige mostrar el campo de búsqueda como botones de opción, la vista detallada se vería así:

![Un campo de búsqueda que se muestra como botones de opción en la vista detallada](https://cdn.bigprof.com/appgini-desktop/help/understanding-lookup-fields-4.png)

## Configuración de padres/hijos

<img src="https://cdn.bigprof.com/screencasts/parent-children-settings-button.png" style="float: right; margin-left: 1rem;">

Cuando configura un campo como un campo de búsqueda, la tabla principal que especifique para ese campo puede, a su vez, configurarse para mostrar un comportamiento especial. En AppGini, si hace clic en la tabla principal, debería ver un botón con la etiqueta Configuración de padres/hijos, como el de la derecha.

Al hacer clic en ese botón, se muestra la ventana Configuración de padres/hijos, como se muestra a continuación, que le permite habilitar la visualización de registros secundarios debajo de la vista detallada del registro principal.

![Ventana de configuración de padres/hijos en AppGini](https://cdn.bigprof.com/appgini-desktop/help/appgini-23.15-parent-children-settings.png)

Esta ventana enumera todas las tablas secundarias de la tabla actual (es decir, tablas que contienen un campo de búsqueda donde la tabla principal está configurada como la tabla actual). Seleccione una tabla secundaria de la cuadrícula de la izquierda para configurar su comportamiento relacionado en la tabla principal. Un ejemplo de tablas principales y secundarias son las tablas de pedidos y detalles_pedido. La tabla de pedidos es una tabla principal de detalles_pedido. Cada pedido guardado en la tabla de pedidos tendría uno o más artículos guardados en la tabla de detalles_pedido.

* **Mostrar pestaña debajo de la vista detallada** mostraría una lista de registros secundarios debajo de la vista detallada cuando seleccione un registro principal. Por ejemplo, así es como se ve un pedido en la vista detallada, donde los artículos del pedido se enumeran en la parte inferior.

    ![Registros secundarios que se muestran debajo de la vista detallada de un registro principal](https://cdn.bigprof.com/screencasts/orders-table-order-details-child-records.png)

	* **Mostrar icono** mostraría el icono de la tabla secundaria a la izquierda del nombre de la pestaña. Esto es útil cuando tiene muchas tablas secundarias y desea identificar rápidamente la tabla secundaria que está viendo.
	* **Cerrar automáticamente el modal después de guardar los cambios** cerraría automáticamente la ventana modal después de guardar los cambios en un registro secundario. Esto es útil cuando tiene muchos registros secundarios para editar y desea navegar rápidamente entre ellos.

* **Copiar registros secundarios al copiar el principal** copiaría los registros secundarios si el usuario copia el registro principal haciendo clic en el botón **Guardar como copia**. El campo de búsqueda en los registros secundarios copiados se establecería automáticamente en el nuevo registro principal. Esta es una función muy útil para escenarios como duplicar un pedido y todos sus artículos de pedido, un producto y todos los artículos de su lista de materiales, etc. Ahorra a los usuarios el tiempo de agregar manualmente registros secundarios desde cero.

    > Copiar registros secundarios requiere que la *extensión PHP cURL* esté instalada y habilitada en su servidor.

    A partir de [AppGini 5.81](https://bigprof.com/appgini/release-log), se agregó un nuevo parámetro de configuración, `$host`, en `config.php`. El valor de este parámetro se establece de forma predeterminada en el nombre de host de su servidor detectado automáticamente por PHP. Sin embargo, si la copia de registros secundarios no funciona (y la extensión PHP curl está habilitada), es posible que deba verificar y cambiar este valor manualmente editando el archivo de configuración. Es posible que PHP no detecte correctamente el nombre de host interno en los casos en que los servidores se encuentren detrás de NAT o equilibradores de carga, contenedores Docker o configuraciones de red similares.

* **Mostrar información secundaria en la vista de tabla**. A partir de AppGini 23.15, el cuadro de diálogo Configuración de padres/hijos incluye la opción **Mostrar recuento de hijos en la vista de tabla**. Al habilitar esta opción, se muestra el recuento de registros secundarios en la vista de tabla. También puede agregar nuevos registros secundarios directamente desde la vista de tabla habilitando la opción **Agregar nuevos hijos desde la vista de tabla**. La captura de pantalla a continuación muestra cómo se mostrarían ambas opciones en la vista de tabla de la tabla de pedidos, mostrando el recuento de artículos de pedido en cada pedido y permitiendo a los usuarios agregar nuevos artículos directamente desde la vista de tabla de pedidos.

    ![Visualización de información secundaria en la vista de tabla](https://cdn.bigprof.com/appgini-desktop/help/child-info-column-in-table-view.png)

    *Consulte también el [video tutorial](#visualización-de-información-secundaria-recuento--agregar-nuevo-en-la-vista-de-tabla) relacionado*

## Videotutoriales relacionados

### Campos de búsqueda de AppGini y páginas maestro-detalle

El siguiente video tutorial demuestra cómo configurar campos de búsqueda en AppGini y cómo configurar los ajustes de padres/hijos para mostrar los registros secundarios debajo de la vista detallada del registro principal.

<iframe width="854" height="464" src="https://www.youtube.com/embed/XQh-9S7yd34" frameborder="0" allowfullscreen=""></iframe>

### Uso de campos de búsqueda de autocompletar para completar automáticamente campos de otra tabla

Los campos de búsqueda de autocompletar son un tipo especial de campos de búsqueda que se completan automáticamente con datos de la tabla principal según
el valor de otro campo de búsqueda. El siguiente video tutorial demuestra cómo configurar campos de búsqueda de autocompletar en AppGini.

<iframe width="854" height="464" src="https://www.youtube.com/embed/bzAWn_YybxY" frameborder="0" allowfullscreen=""></iframe>

### Creación de menús desplegables en cascada con AppGini

Es posible configurar un campo de búsqueda para filtrar sus opciones según el valor de otro campo de búsqueda. Por ejemplo, podría configurar un campo de búsqueda para "País" y otro campo de búsqueda para "Ciudad". El campo "Ciudad" solo mostraría las ciudades del país seleccionado. El siguiente video tutorial demuestra cómo configurar menús desplegables en cascada en AppGini.

<iframe width="854" height="464" src="https://www.youtube.com/embed/ySABQLupBRs" frameborder="0" allowfullscreen=""></iframe>

### Visualización de información secundaria (recuento + agregar nuevo) en la vista de tabla

<video style="width: 100%; height: auto;" controls>
<source src="https://cdn.bigprof.com/screencasts/child-info-in-parent-table-view.mp4" type="video/mp4">
Su navegador no es compatible con la etiqueta de video.
</video>

## Consulta de campos de búsqueda en SQL

Aunque los campos de búsqueda muestran datos de la tabla principal en la aplicación generada, los datos reales almacenados en la base de datos son la clave principal del registro principal. Por ejemplo, el campo "Cliente" en la tabla de pedidos almacena el ID del cliente de la tabla de clientes. Así es como funcionan las claves externas en las bases de datos relacionales. Si necesita consultar los datos almacenados en un campo de búsqueda, debe unir la tabla principal a la tabla secundaria utilizando la clave principal almacenada en el campo de búsqueda.

Este tema se analiza con más detalle en la página [uso de campos de búsqueda en cálculos](../advanced-topics/hooks/using-lookup-fields-in-calculations.md).

> **Actualización:** A partir de [AppGini 24.11](https://bigprof.com/appgini/release-log), el usuario administrador puede acceder a la consulta SQL unida de cualquier tabla haciendo clic en el botón "SQL" en la vista de tabla. Para habilitar esta función, marque la opción **Permitir acceso de administrador a SQL de vista de tabla** en la sección **Configuración de seguridad** de las propiedades de la aplicación en AppGini.
>
> ![Mostrar consulta SQL de vista de tabla](https://cdn.bigprof.com/images/allow-admin-show-sql.gif)
