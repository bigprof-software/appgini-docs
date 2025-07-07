---
title: Uso de campos de búsqueda en cálculos
linkTitle: Uso de campos de búsqueda en cálculos
slug: help/advanced-topics/hooks/using-lookup-fields-in-calculations
---

# Uso de campos de búsqueda en cálculos

Al personalizar los hooks [`before_insert`, `after_insert`, `before_update` o
`after_update`](/appgini/help/advanced-topics/hooks/table-specific-hooks/) para realizar
un cálculo, es posible que se encuentre con un caso en el que uno o más campos de
la fórmula que está calculando sea un [campo de búsqueda (clave externa)](/appgini/help/working-with-projects/understanding-lookup-fields/).
En este caso, el valor de `$data['nombrecampo']` (donde `nombrecampo`
es el nombre del campo de búsqueda en cuestión) probablemente NO sea el valor
que le gustaría usar para su cálculo.

Para explicar esto, echemos un vistazo breve a cómo funcionan los campos de búsqueda. Un
campo de búsqueda es una forma de hacer referencia a un valor de una tabla en otra
tabla. Por ejemplo, podríamos estar almacenando el precio unitario del producto en la
tabla `productos` y querer usar ese mismo precio unitario en la
tabla `items_pedido` sin tener que volver a escribir manualmente el precio...
esto es importante no solo para ahorrar algunas pulsaciones de teclas durante la entrada de datos,
sino también para garantizar la integridad referencial... Si introduce el mismo
precio del producto en todas las tablas de su base de datos, será una pesadilla
actualizar el precio más tarde y asegurarse de que todas las tablas vean el precio actualizado.

Para evitar ese desorden, usamos campos de búsqueda. Un campo de búsqueda de precio unitario en
la tabla `items_pedido` no almacena el valor real del precio, sino
un valor de referencia que apunta a la ubicación del precio unitario
en la tabla `productos`. La mejor referencia posible a utilizar es la
clave principal del producto. Veamos un ejemplo con números para ver
esto en acción.

### Tabla de productos

 | ID   | Producto                      | Precio unitario |
 | ---- | ----------------------------- | --------------- |
 | 15   | Lindt HELLO Crunchy Nougat    | 2.05            |
 | 16   | Lindt CREATION Crème Brûlée   | 2.35            |
 | 18   | Lindt EXCELLENCE Menta        | 3.25            |
 | 19   | Lindt CREATION Pistacho     | 3.25            |

¡Eso estuvo delicioso! Cada entrada en la tabla anterior tiene un valor de clave principal `ID`,
que no dice mucho sobre el artículo en sí, pero se usa como
referencia a él. Entonces, si hablamos del producto n.º 18, sabemos que nos estamos
refiriendo a *Lindt EXCELLENCE Menta* con un precio de 3,25 $. Los campos de clave principal
generalmente (pero no necesariamente) se denominan `ID`.

Echemos ahora un vistazo a algunos datos de la tabla `items_pedido`.

### Tabla de artículos de pedido

  | ID   | ID de pedido | Producto | Precio unitario | Cantidad | Subtotal |
  | ---- | ----------- | -------- | --------------- | -------- | -------- |
  | 2024 | 305         | 15       | 15              | 1        |          |
  | 2025 | 305         | 18       | 18              | 3        |          |
  | 2026 | 306         | 18       | 18              | 1        |          |
  | 2027 | 307         | 19       | 19              | 2        |          |

Al igual que en la tabla `productos`, la columna `ID` anterior es el
campo de clave principal de la tabla `items_pedido`, una forma de identificar
de forma única cada fila. `IDPedido` es un campo de búsqueda de la tabla de pedidos
(no se muestra aquí ya que es irrelevante para nuestra discusión). `Producto` y
'Precio unitario' son ambos campos de búsqueda de la tabla de productos. Para
entender esto con un ejemplo, el artículo de pedido n.º 2024 es un pedido del
producto n.º 15, que es *Lindt HELLO Crunchy Nougat* y su precio es,
por supuesto, el del producto n.º 15, que es 2,05 $. Y la cantidad de *Lindt
HELLO Crunchy Nougat* pedida en este registro es 1.

Cuando su aplicación AppGini muestra la tabla `items_pedido`, no
muestra valores de referencia como los anteriores. Automáticamente
*une* ambas tablas y muestra resultados más legibles para humanos como los
siguientes

### Tabla de artículos de pedido unida con la tabla de productos

  | ID   | ID de pedido | Producto                     | Precio unitario | Cantidad | Subtotal |
  | ---- | ----------- | ---------------------------- | --------------- | -------- | -------- |
  | 2024 | 305         | Lindt HELLO Crunchy Nougat   | 2.05            | 1        |          |
  | 2025 | 305         | Lindt EXCELLENCE Menta       | 3.25            | 3        |          |
  | 2026 | 306         | Lindt EXCELLENCE Menta       | 3.25            | 1        |          |
  | 2027 | 307         | Lindt CREATION Pistacho    | 3.25            | 2        |          |

Si más tarde realizamos alguna modificación en cualquier producto de la tabla `productos`,
como cambiar su nombre o precio unitario, los cambios se
reflejan automáticamente en la tabla `items_pedido` sin tener que
realizar ninguna entrada manual de datos.

Lo que queda ahora es escribir el código para calcular la columna de subtotal de
la tabla `items_pedido`. Queremos que este cálculo se aplique
cada vez que agreguemos un nuevo artículo de pedido y también cada vez que realicemos cambios en
cualquier artículo de pedido existente. Por lo tanto, debemos realizar el cálculo en
las funciones hook before_insert y before_update.

El código inicial que veo que muchos usuarios de AppGini escriben generalmente se parece a
esto:

```php
$data['Subtotal'] = $data['PrecioUnitario'] * $data['Cantidad'];
```

El problema con el código anterior es que `$data['PrecioUnitario']`
almacena la clave principal del producto principal (el valor del campo `ID`
del registro principal en `productos`). Por ejemplo, si estamos
calculando el subtotal del artículo de pedido n.º 2025, el código anterior mostraría
un subtotal de 18 x 3 = 54 $. Esto, por supuesto, no es correcto, ya que
el precio unitario de *Lindt EXCELLENCE Menta* es 3,25 $ y tenemos una
cantidad de 3 unidades. Por lo tanto, el subtotal correcto debería ser 3,25 $ x
3 = 9,75 $.

Lo que está mal con el código anterior es que no tuvimos en
cuenta el hecho de que el campo `PrecioUnitario` en `items_pedido` es
en realidad un campo de búsqueda. El valor almacenado no es el precio unitario, sino
el valor de la clave principal del producto principal. En consecuencia, deberíamos
recuperar el precio unitario real de la tabla de productos usando este
código:

```php
$PrecioUnitario = sqlValue(
   "SELECT PrecioUnitario FROM productos where ID='{$data['PrecioUnitario']}'"
);
```

El código anterior recupera el precio unitario de la tabla de productos dado
el valor de la clave principal almacenado en la tabla secundaria `items_pedido`,
`$data['PrecioUnitario']`, y almacena el precio unitario real en
`$PrecioUnitario`. Ahora podemos realizar el cálculo de la siguiente manera:

```php
$data['Subtotal'] = $PrecioUnitario * $data['Cantidad'];
```

Poniéndolo todo junto, cada vez que realicemos cálculos que
involucren campos de búsqueda, primero debemos recuperar los valores reales de
la tabla principal y usar esos valores recuperados en la fórmula de cálculo.
Es muy fácil de escribir una vez que entendemos cómo funciona. Para
resumir, aquí está nuestro código de subtotal:

```php
$PrecioUnitario = sqlValue(
  "SELECT PrecioUnitario FROM productos where ID='{$data['PrecioUnitario']}'"
);
$data['Subtotal'] = $PrecioUnitario * $data['Cantidad'];
```

Una nota final... algunas tablas contienen valores de clave principal no numéricos.
Por ejemplo, si la tabla `productos` anterior almacena claves principales como
`LHCN01`, `LEM01`... etc. en lugar de `18`, `19`, etc.,
entonces primero debemos escapar esas claves principales para evitar errores de consulta y
proteger contra ataques de inyección SQL:

```php
/* Escapar valores de búsqueda no numéricos antes de usarlos en consultas SQL */
$SafeUnitPriceLookup = makeSafe($data['PrecioUnitario']);

/*
  Ahora es seguro usar $SafeUnitPriceLookup para
  recuperar nuestro precio unitario
*/
$PrecioUnitario = sqlValue(
  "SELECT PrecioUnitario FROM productos where ID='{$SafeUnitPriceLookup}'"
);

/* Y aquí está nuestro cálculo */
$data['Subtotal'] = $PrecioUnitario * $data['Cantidad'];
```

En resumen, cada vez que trabaje con campos de búsqueda en sus
cálculos, primero debe recuperar los valores reales de la tabla principal
y luego usar esos valores en sus cálculos. Este es un concepto simple
que puede ahorrarle mucho tiempo y dolores de cabeza en el futuro.
