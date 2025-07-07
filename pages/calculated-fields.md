---
title: Campos calculados
linkTitle: Campos calculados
slug: help/calculated-fields
description: Aprenda a configurar campos calculados en su aplicación AppGini. Los campos calculados son campos de solo lectura que se rellenan automáticamente con un valor calculado a partir de una consulta SQL SELECT.
keywords: campos calculados, campos de solo lectura, consulta SQL, MySQL, AppGini, cálculos automáticos, actualizaciones por lotes, línea de comandos
---

# Campos calculados

> La función de campos calculados está disponible en AppGini 5.80 y versiones posteriores.

## ¿Qué son los campos calculados?

A partir de AppGini 5.80, ahora puede configurar uno o más campos en su aplicación como _campos calculados_. Los campos calculados son campos de solo lectura que se rellenan automáticamente con un valor calculado a partir de cualquier fórmula que especifique. La fórmula para un campo calculado debe ser una consulta SQL compatible con MySQL que devuelva un solo valor. El valor devuelto por la consulta SQL se guarda en el campo calculado cada vez que los usuarios acceden al registro que contiene ese campo.

Los campos calculados pueden ser muy útiles en numerosos escenarios. Por ejemplo, para calcular y actualizar automáticamente el subtotal y el total de una factura, el número de estudiantes inscritos en un curso, la puntuación promedio del curso, la fecha de vencimiento de una factura (por ejemplo, si desea establecer una regla comercial para establecer una fecha de vencimiento de una factura a 15 días después de la fecha de emisión), el estado más reciente de un envío, marcar tareas vencidas, indicar si se debe contactar hoy a un cliente potencial, etc. Hay infinitas posibilidades para aplicar campos calculados.

## Condiciones para que un campo se convierta en un campo calculado

Si está intentando establecer un campo como un campo calculado, **NO** debe cumplir ninguna de las siguientes condiciones:

* Campos no establecidos como de solo lectura
* Campos de clave principal
* Campos obligatorios
* Campos de área de texto y área enriquecida (HTML)
* Campos de incremento automático
* Campos únicos
* Campos de enlace web/correo electrónico
* Campos de carga de imagen/archivo
* Campos de mapa/video
* Campos de búsqueda
* Campos de lista de opciones
* Campos que tienen un formato de datos especificado (puede aplicar un formato de datos en el cálculo en su lugar)
* Campos con valores predeterminados (puede aplicar un valor predeterminado en el cálculo en su lugar)

Verá un mensaje de error claro en AppGini que explica por qué un campo no se puede establecer como un campo calculado si alguna de las condiciones anteriores se aplica a ese campo.

![Error de campo calculado en AppGini.](https://cdn.bigprof.com/appgini-desktop/help/calculated-field-error-message-for-non-read-only-field.png)

Además, si establece un campo como un campo calculado y luego realiza algunos cambios en el campo que impiden que sea un campo calculado, verá una advertencia al generar la aplicación de que se omitirá el cálculo, junto con el motivo de la omisión:

![Campo calculado omitido al generar una aplicación AppGini](https://cdn.bigprof.com/screencasts/skipping-calculated-field-on-app-generation.png)

## Cómo configurar un campo calculado

Los pasos básicos son:

1. Cree el campo (si ya existe, asegúrese de que cumpla las condiciones anteriores).
2. Establezca el campo como de solo lectura.
3. Vaya a la pestaña _Campo calculado_ y marque la opción _Calcular automáticamente el valor de este campo utilizando la siguiente consulta SQL_
4. Escriba la consulta SQL para calcular el valor del campo.

![](https://cdn.bigprof.com/screencasts/configure-calculated-field.gif)

**Nota importante**:

Las consultas SQL válidas para campos calculados deben ser consultas `SELECT` que devuelvan un solo valor. El valor devuelto debe ser del mismo tipo de datos que el campo calculado.
Por ejemplo, esta es una consulta válida para calcular el subtotal de una línea de factura multiplicando el precio unitario por la cantidad:

```sql
SELECT cantidad * precio_unitario FROM items_factura WHERE id='%ID%'
```

## Variables especiales para usar en consultas de campos calculados

En la consulta anterior, estamos utilizando la variable especial `%ID%`. Al ejecutar la consulta, esto se reemplazaría por el valor de la clave principal del registro actual. Se pueden utilizar las siguientes variables en las consultas:

* `%ID%` Se reemplazará con el valor de ID (clave principal) del registro actual antes de ejecutar la consulta.
* `%USERNAME%` Se reemplazará con el nombre de usuario actualmente conectado antes de ejecutar la consulta.
* `%GROUPID%` Se reemplazará con el ID de grupo del nombre de usuario actualmente conectado antes de ejecutar la consulta.
* `%GROUP%` Se reemplazará con el nombre de grupo del nombre de usuario actualmente conectado antes de ejecutar la consulta.
* `%TABLENAME%` Se reemplazará con el nombre de la tabla que contiene el campo calculado antes de ejecutar la consulta.
* `%PKFIELD%` Se reemplazará con el nombre del campo de clave principal de la tabla que contiene el campo calculado antes de ejecutar la consulta.

Asegúrese de utilizar comillas simples alrededor de las variables anteriores cuando las utilice en las consultas. No tiene que escribir manualmente la variable en la consulta en AppGini; puede colocar el cursor en la ubicación donde desea insertar la variable y luego hacer clic en la variable deseada a la derecha como se muestra en esta captura de pantalla:

![](https://cdn.bigprof.com/screencasts/inserting-placeholders-into-queries-for-calculated-fields-24.12.png)

Las variables especiales anteriores facilitan la escritura de consultas flexibles que dependen del usuario, grupo o registro actual. Por ejemplo, puede usar `%USERNAME%` para calcular las ventas totales realizadas por el usuario actualmente conectado, o usar `%GROUP%` para calcular las ventas totales realizadas por el grupo del usuario actualmente conectado. `%TABLENAME%` y `%PKFIELD%` se pueden usar para escribir consultas genéricas que se pueden copiar y pegar en otras tablas sin modificaciones.

## El ayudante de consultas

Para una entrada de consultas más rápida y precisa, recomendamos utilizar el _ayudante de consultas_. Haga clic en el botón _Ayudante de consultas_ debajo del cuadro de consulta para iniciar la ventana del ayudante de consultas, que se ve así:

![](https://cdn.bigprof.com/screencasts/calculated-field-query-helper.png)

La ventana del ayudante de consultas le permite insertar rápidamente varias piezas de código especiales en su consulta SQL. Simplemente coloque el cursor en la posición donde desea insertar la pieza de código, luego elija el código que desea insertar de los cuadros a la derecha o en la parte inferior del cuadro de consulta, luego haga clic en el botón _Insertar_.

Puede insertar variables especiales (como se explicó anteriormente), nombres de campos, funciones SQL o sentencias JOIN que unen la tabla del campo calculado con una o más de sus tablas principales o secundarias. Esto no solo le ahorra tiempo para escribir manualmente estos fragmentos, sino que también reduce los errores tipográficos y de sintaxis.

Por supuesto, el uso de campos calculados requiere cierto conocimiento del lenguaje SQL, específicamente la sentencia SQL SELECT. Hay muchos excelentes [tutoriales de SQL](https://www.w3schools.com/sql/sql_select.asp) disponibles en línea, así como la [referencia oficial de MySQL](https://dev.mysql.com/doc/refman/8.0/en/select.html). También enumeraremos algunos ejemplos a continuación que cubren algunos escenarios ampliamente utilizados. También puede [pedir ayuda a otros usuarios en nuestro foro](https://forums.appgini.com/).

En el siguiente screencast, creamos un nuevo campo 'Ventas' en la tabla de clientes y lo configuramos como un campo calculado que muestra el total de ventas realizadas a cada cliente, recuperando la suma del total de sus facturas pagadas. Usamos la ventana _Ayudante de consultas_ para escribir la consulta de forma rápida y precisa, incluida la unión entre las tablas de clientes y facturas.

<iframe width="706" height="397" src="https://www.youtube.com/embed/oERXyqM3zew?rel=0" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen=""></iframe>

## Depuración de su consulta

Puede depurar fácilmente su consulta SQL utilizando [phpMyAdmin](https://www.phpmyadmin.net/) o cualquier utilidad de administración de MySQL similar. Seleccione su base de datos, luego vaya a la pestaña SQL, donde puede escribir o pegar su consulta SQL. Reemplace `%ID%` con el valor de la clave principal del registro que desea probar. También reemplace cualquier otra variable con sus valores, si es necesario. Luego ejecute la consulta. La consulta debe devolver un solo valor, y ese debe ser el valor que espera en su campo calculado. Si este no es el caso, o si ve algún mensaje de error, debe editar la consulta y volver a intentarlo hasta que no se muestren errores y se devuelva el valor esperado.

## Actualización por lotes de campos calculados mediante la línea de comandos

_Agregado en AppGini 5.82_

Como se describe en los problemas conocidos a continuación, los campos calculados normalmente se actualizan solo cuando los usuarios acceden a ellos a través de la vista de tabla o detallada. A veces, desea actualizar una gran cantidad de registros sin tener que acceder a cada uno. Por lo tanto, agregamos un script de línea de comandos para hacer eso.

Línea de comandos significa que no se puede ejecutar desde el navegador. Solo puede ejecutarlo desde una ventana de terminal, o [instalarlo en el archivo crontab de su servidor](https://www.tecmint.com/run-php-script-as-normal-user-via-cron-job-scheduler/) para ejecutarlo según un cronograma.

Si su aplicación está alojada en su PC local con Windows (por ejemplo, usando [Xampp](https://bigprof.com/appgini/tips-and-tutorials/installing-local-testing-environment-xampp)), puede abrir una terminal de línea de comandos abriendo el menú Inicio de Windows y escribiendo `cmd` y luego presionando Enter.

Si su aplicación está alojada de forma remota en un servidor Linux, necesita tener acceso a la shell y conectarse a su servidor a través de un cliente SSH (por ejemplo, [PuTTY](https://www.putty.org/))

En ambos casos (línea de comandos de Windows y Linux), debe navegar a la carpeta donde está alojada su aplicación AppGini y ejecutar este comando:

```bash
php cli-update-calculated-fields.php
```

El comando anterior actualizaría todos los campos calculados en todas las tablas. Sin embargo, en tablas grandes, esto podría llevar mucho tiempo. Por lo tanto, la herramienta de línea de comandos proporciona varias opciones para controlar su comportamiento de la siguiente manera (puede obtener ayuda de la línea de comandos sobre la herramienta agregando `-h` después del comando anterior):

```
Argumentos admitidos:
  -t: lista de tablas separadas por comas para actualizar.
      todas las tablas se actualizarán si no se especifica este argumento
  -s: lista de números de registro iniciales separados por comas.
      El valor predeterminado es 0 (comienzo de cada tabla)
  -l: lista de recuentos de registros separados por comas para actualizar en cada tabla.
      El valor predeterminado es el recuento de registros - inicio
  -x: lista de tablas separadas por comas para excluir de la actualización,
      anula -t
  -u: nombre de usuario para usar en consultas que tienen el marcador de posición %USERNAME%.
      El valor predeterminado es el usuario administrador
  -h: muestra este mensaje de ayuda

Ejemplos:

php cli-update-calculated-fields.php
  Actualiza todos los registros de todas las tablas. No recomendado para bases de datos grandes.

php cli-update-calculated-fields.php -s 2000 -l 1000
  Actualiza 1000 registros a partir del registro n.º 2000 en todas las tablas.

php cli-update-calculated-fields.php -t clientes,pedidos -s 100,1000 -l 10,100
  Actualiza los registros 100:110 de la tabla de clientes y 1000:1100 de la tabla de pedidos.

php cli-update-calculated-fields.php -x clientes
  Actualiza todos los registros de todas las tablas excluyendo la tabla de clientes.

php cli-update-calculated-fields.php -u bob
  Actualiza todos los registros de todas las tablas como usuario bob.
```

## Ejemplos básicos de campos calculados

Para cálculos simples realizados en otros campos del mismo registro, enumeraremos algunos ejemplos comunes a continuación.

### Calcular el subtotal de una línea de factura multiplicando el precio unitario y la cantidad

Supongamos que tiene una aplicación para administrar facturas. El encabezado de la factura (número de factura, fecha de vencimiento, información del cliente, etc.) se almacena en la tabla `facturas`. Las líneas de la factura (artículo, cantidad, precio unitario, subtotal) se almacenan en la tabla `items_factura`. Le gustaría que el campo de subtotal se calcule automáticamente al agregar o editar una línea de factura.

Para configurar este cálculo, marcaríamos la opción de solo lectura para el campo `subtotal`, luego lo estableceríamos como un campo calculado y usaríamos esta consulta SQL para calcular su valor:

```sql
SELECT
`items_factura`.`precio_unitario` * `items_factura`.`cantidad`
FROM `items_factura`
WHERE `items_factura`.`id` = '%ID%'
```

### Código automático concatenando 2 o más campos

En algunos escenarios de entrada de datos, se requiere crear un código automático a partir de uno o más campos del registro. Esto es típico para códigos de productos, códigos de transacciones de inventario, etc.

Por ejemplo, supongamos que tenemos una tabla `productos`. Al definir un nuevo producto, nos gustaría que el código del producto sean las primeras 5 letras del campo `nombre` del producto, en mayúsculas, seguido del ID del departamento, `id_dept`, seguido de los caracteres `SN`, seguido del número de serie obtenido del campo de clave principal de incremento automático `id_producto`. Para configurar este esquema de codificación, crearíamos un campo de solo lectura, `codigo_producto`, estableceríamos su tipo de datos como `VarChar` de una longitud adecuada, 50 más o menos, lo estableceríamos como un campo calculado y usaríamos esta consulta SQL para calcular su valor:

```sql
SELECT CONCAT(
    UPPER(SUBSTRING(`productos`.`nombre`, 1, 5)),
    `productos`.`id_dept`,
    'SN',
    `productos`.`id_producto`
) FROM `productos`
WHERE `productos`.`id_producto` = '%ID%'
```

Cuando un usuario define un nuevo producto y lo guarda, el campo `codigo_producto` se establecería automáticamente según la consulta anterior en algo como `CELLP22SN302`.

## Ejemplos más avanzados de campos calculados

### Actualización del estado del lote a 'Consumible', 'Advertencia' o 'Caducado' según la fecha de caducidad

En este ejemplo, supongamos que tenemos una aplicación de inventario y, para cada lote de artículos que agregamos al inventario, tenemos una fecha de caducidad. Queremos actualizar automáticamente el campo `estado` de cada lote a `Consumible` si la fecha de caducidad es de 30 días o más en el futuro, `Advertencia` si es de menos de 30 días en el futuro, o `Caducado` si la fecha de caducidad es hoy o anterior.

Para hacerlo, debemos configurar el campo `estado` como de solo lectura, campo calculado, y usar una consulta como esta para el cálculo:

```sql
SELECT IF(
  DATEDIFF(`fecha_caducidad`, NOW()) > 30,
  'Consumible',
  IF(
    DATEDIFF(`fecha_caducidad`, NOW()) > 0,
    'Advertencia',
    'Caducado'
  )
) FROM `lotes`
WHERE `id` = '%ID%'
```

Aquí hay una breve explicación de la consulta anterior: La función SQL `IF()` acepta 3 parámetros: una condición para verificar, y un valor para devolver si la condición es verdadera, y un valor para devolver si es falsa. Por ejemplo, `IF(10 > 1, 'sí', 'no')` comprueba si 10 es mayor que 1 y devuelve 'sí' si es verdadero o 'no' si es falso. Por supuesto, esto debería devolver 'sí'. En la consulta anterior, _anidamos_ 2 expresiones IF para evaluar 3 casos en lugar de solo 2. `DATE_DIFF()` acepta 2 fechas y devuelve la diferencia entre ellas en días. `NOW()` devuelve la fecha/hora actual.

### Subtotal de la factura sumando los subtotales de los artículos de la factura

En este ejemplo, supongamos que tenemos una tabla `facturas` que incluye un campo `subtotal`. Queremos calcular el subtotal de la factura sumando los subtotales de todas las líneas de la factura (cada línea contiene un precio unitario y una cantidad que queremos multiplicar para obtener el subtotal de la línea). Debemos establecer el campo `subtotal` como un campo calculado de solo lectura. Y aquí hay una consulta que podemos usar para realizar este cálculo:

```sql
SELECT
  SUM(`items_factura`.`precio_unitario` * `items_factura`.`cantidad`)
FROM
  `facturas` LEFT JOIN
  `items_factura` ON `facturas`.`id` = `items_factura`.`id_factura`
WHERE
  `facturas`.`id` = '%ID%'
```

En la consulta anterior, estamos _uniendo_ la tabla `facturas` y la tabla `items_factura`. Esas 2 tablas están vinculadas a través del campo de búsqueda `id_factura` en la tabla `items_factura`. La línea 5 anterior realiza esta unión. La línea 2 multiplica la cantidad de cada artículo de la factura por su precio unitario y devuelve la suma de todos los artículos de la factura actual.

## ¿Busca más ayuda con las consultas?

Los campos calculados son una herramienta muy poderosa y existen muchos escenarios de uso diferentes. Intentamos cubrir algunos casos de uso comunes anteriormente, pero si necesita más ayuda, no dude en publicar su caso de uso en nuestro [foro](https://forums.appgini.com/). Actualizaremos con frecuencia esta página con más casos de uso, así que intente consultarla también más tarde.

Consulte [este tema del foro](https://forums.appgini.com/phpbb/viewtopic.php?f=2&t=4266#p17008) para obtener algunas notas excelentes sobre campos calculados de Jan de bizzworxx (¡gracias Jan!).

## Problemas conocidos

Las siguientes limitaciones se aplican a los campos calculados:

* Los campos calculados se reevalúan cada vez que se accede al registro o a sus registros secundarios en la vista de tabla, la vista detallada, la vista previa de impresión o la vista de tabla secundaria. Esto podría causar algunos problemas de rendimiento para consultas complejas. Esto se puede resolver usando [el almacenamiento en caché de consultas de MySQL](https://dev.mysql.com/doc/refman/5.7/en/query-cache.html).
* Los campos calculados se evalúan solo cuando se accede a sus registros/registros secundarios. Si se modifican los datos que afectan el cálculo y luego recupera el valor almacenado en el campo calculado a través de una aplicación de terceros, no reflejará los cambios hasta que se acceda a él a través de su propia aplicación AppGini.
* Del mismo modo, si el campo calculado se utiliza como un campo de título principal para un campo de búsqueda en otra tabla, es posible que el menú desplegable de búsqueda no muestre los valores calculados más actualizados hasta que se acceda a los registros del campo calculado en su aplicación AppGini.

La solución simple para el segundo y tercer problema anteriores es acceder al registro(s) que contiene el campo calculado en la vista de tabla en su aplicación AppGini para actualizarlos.
