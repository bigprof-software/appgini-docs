---
title: Establecer el propietario del registro secundario para que coincida con el propietario de su registro principal
linkTitle: Propietarios de registros
slug: help/record-owners
keywords: propietario del registro, registro principal, registro secundario, propietario, automático, tabla principal, tabla secundaria, campo de búsqueda, permisos, edición, usuario propietario, Corregir propietarios de registros, utilidad
description: Aprenda cómo establecer el propietario de un registro secundario para que coincida con el propietario de su registro principal en AppGini, y cómo actualizar el propietario de los registros secundarios existentes.
---

# Establecer el propietario del registro secundario para que coincida con el propietario de su registro principal

## Acerca de esta función

A partir de AppGini 24.10, puede establecer el propietario de un registro secundario en función del propietario de su registro principal. Esto es útil en muchos escenarios, por ejemplo:

*   Tiene una tabla de `proyectos` y otra tabla de `tareas`. Cada tarea pertenece a un proyecto. Desea establecer el propietario de cada tarea como el propietario de su proyecto principal.
*   Tiene una tabla de `pedidos` y otra tabla de `detalles_pedido`. Cada artículo de pedido pertenece a un pedido. Desea establecer el propietario de cada artículo de pedido como el propietario de su pedido principal.

Esto es especialmente útil si establece los permisos de la tabla secundaria para permitir la edición solo por parte del propietario del registro. Si el usuario Bob crea un proyecto, y luego la usuaria Alice agrega una tarea a ese proyecto, es posible que desee que la tarea sea propiedad de Bob para que él pueda editarla.

Para establecer el propietario de un registro secundario como el propietario de su registro principal, debe hacer lo siguiente:

1.  En AppGini, vaya a la tabla de los registros secundarios (por ejemplo, `tareas` o `detalles_pedido` en los ejemplos anteriores).

2.  En la sección **Configuración de la vista detallada**, abra el menú desplegable **Propietario del registro** y seleccione el campo de búsqueda que apunta a la tabla principal (por ejemplo, `IDProyecto` o `IDPedido` en los ejemplos anteriores).

    ![Propietario del registro](https://cdn.bigprof.com/images/setting-child-record-owner.png)

3.  Regenere y cargue su aplicación AppGini.

Ahora, cada vez que se cree o edite un artículo de pedido, su usuario propietario se establecerá como el propietario de su pedido principal.

## Actualización del propietario de los registros secundarios existentes

Si ya tiene registros secundarios existentes, la configuración anterior no se aplicará a ellos a menos que actualice cada registro manualmente. Esto puede ser un problema si tiene muchos registros. Es por eso que también hemos agregado una utilidad para actualizar masivamente el propietario de los registros secundarios existentes.

Para utilizar esta utilidad, siga estos pasos:

1.  Inicie sesión como administrador en su aplicación AppGini.

2.  Vaya al área de administración y abra el menú **Utilidades**.

3.  Haga clic en **Corregir propietarios de registros**.

    ![Utilidades /> Corregir propietarios de registros](https://cdn.bigprof.com/images/utilties-fix-record-owners.png)

4.  Esto abrirá una página que enumera todas las tablas donde se puede actualizar el propietario de los registros secundarios. Haga clic en el botón **Iniciar** sobre la lista de tablas.

    ![Página Corregir propietarios de registros](https://cdn.bigprof.com/images/admin-area-fix-record-owners-page.png)

5.  Deje la página abierta hasta que se complete el proceso. Esto puede llevar un tiempo si tiene muchos registros.

6.  Una vez que se complete el proceso, el botón mostrará el mensaje **Hecho**. Ahora puede cerrar la página o navegar a otra página.

    ![Página Corregir propietarios de registros hecha](https://cdn.bigprof.com/images/admin-area-fix-record-owners-page-done.png)

## Un ejemplo práctico: Establecer el gerente de ventas del país como propietario de todos los pedidos y artículos de pedido de ese país

<video style="width: 100%; height: auto;" controls>
<source src="https://cdn.bigprof.com/screencasts/setting-automatic-record-owners-based-on-parent-table.mp4" type="video/mp4">
<a href="https://cdn.bigprof.com/screencasts/setting-automatic-record-owners-based-on-parent-table.mp4">Ver el vídeo de demostración</a>
</video>

En esta demostración, estamos utilizando la aplicación de ejemplo Northwind. Configuramos el propietario del registro de la tabla `orders` para que sea el campo `CustomerID`, que es un campo de búsqueda que apunta a la tabla `customers`. Esto significa que el propietario de cada pedido sería el mismo que el propietario del registro del cliente al que pertenece.

También configuramos el propietario del registro de la tabla `order_details` para que sea el campo `OrderID`, que a su vez es un campo de búsqueda que apunta a la tabla `orders`. Esto significa que el propietario de cada artículo de pedido sería el mismo que el propietario del pedido al que pertenece.

De esta manera, el propietario del registro del cliente sería el propietario de todos los pedidos y artículos de pedido pertenecientes a ese cliente. Luego, enumeraremos todos los clientes de Alemania y estableceremos al gerente de ventas de Alemania como propietario de todos los registros de los clientes alemanes.

Si un vendedor crea un pedido para un cliente alemán, el gerente de ventas de Alemania se convertiría en el propietario de ese pedido y de todos los artículos de pedido pertenecientes a ese pedido.

Para aplicar esto a los pedidos y artículos de pedido alemanes existentes, utilizamos la utilidad **Corregir propietarios de registros** para actualizar el propietario de todos los pedidos y artículos de pedido existentes.
