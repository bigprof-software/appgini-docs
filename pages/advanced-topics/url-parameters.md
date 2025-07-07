---
title: Enlaces especiales y parámetros de URL
linkTitle: Parámetros de URL
slug: help/advanced-topics/url-parameters
---

# Enlaces especiales y parámetros de URL

De forma predeterminada, los enlaces a varias tablas en su aplicación generada por AppGini
no pasan parámetros de URL y, por lo tanto, muestran la vista de tabla predeterminada,
aplicando la ordenación predeterminada y sin filtros. Sin embargo, puede
agregar parámetros especiales a la URL que le permiten controlar cómo se muestran
los datos de la vista de tabla.

La forma predeterminada de enlazar a una tabla es enlazar a
`nombretabla_view.php` (donde `nombretabla` es el nombre de
la tabla en cuestión). Por ejemplo, si tiene una tabla llamada *clientes*,
el enlace de vista de tabla predeterminado sería `clientes_view.php`.

Hay algunos parámetros de URL especiales que puede usar como parte del
enlace para cambiar a qué está enlazando. Por ejemplo, si desea enlazar
a la tabla de clientes, ordenada por país, en lugar de no ordenada, el
enlace sería `clientes_view.php?SortField=4`
(suponiendo que el país es el cuarto campo de la tabla tal como aparece en su
proyecto AppGini). Puede agregar otros parámetros de URL al enlace,
separándolos con el carácter `&` (tenga en cuenta que solo el primer parámetro que
agregue a la URL comienza con un carácter `?`). Puede agregar parámetros de URL en
cualquier orden.

Aquí hay una forma muy fácil de obtener el enlace de la vista de tabla si desea
aplicar filtros y ordenación específicos: seleccione la tabla en cuestión en
AppGini, luego marque la opción **Permitir a los usuarios guardar filtros**. Esto
agregaría un botón debajo de la página de filtros con la etiqueta **Guardar y aplicar
filtros**. Luego puede ir a la página de filtros de su tabla, definir
los filtros y la ordenación a los que desea enlazar, y luego hacer clic en ese botón.
Esto mostrará un *enlace permanente* a la vista de tabla que puede copiar y
usar para enlazar a la tabla filtrada y ordenada. Vea la ilustración
a continuación.

![Obtener parámetros de URL de filtros guardados](https://cdn.bigprof.com/images/appgini/obtain-url-parameters-from-saved-filters.gif "Obtener parámetros de URL de filtros guardados")

Luego puede agregar este enlace a la página de inicio y/o al menú de navegación
para que otros usuarios puedan acceder a él sin tener que redefinir los filtros y
la ordenación. Para hacerlo, simplemente edite el archivo `hooks/links-home.php` generado
(para agregar el enlace a la página de inicio) y
`hooks/links-navmenu.php` (para agregar el enlace al menú de navegación).

## Aquí hay una tabla que enumera los parámetros de URL comunes y su uso

### `SortField`

* Valor predeterminado: Ninguno
* Detalles: Especifique el índice del campo(s) por el cual ordenar la tabla. Ejemplos:
  * `clientes_view.php?SortField=4` ordena la tabla por el cuarto campo.
  * `clientes_view.php?SortField=4,7` ordena la tabla por el cuarto y luego por el séptimo campo.

### `SortDirection`

* Valor predeterminado: `asc`
* Detalles: Si se proporciona un `SortField`, `SortDirection` determina la dirección de la ordenación. Valores posibles: `asc`, `desc`. Ejemplo:
  * `clientes_view.php?SortField=4&SortDirection=desc` ordena la tabla por el cuarto campo en orden descendente.

### `FilterAnd[x]`

* Valor predeterminado: Ninguno
* Detalles: Consulte [trabajar con filtros mediante programación](/appgini/tips-and-tutorials/working-with-filters/part-1)

### `FilterField[x]`

* Valor predeterminado: Ninguno
* Detalles: Consulte [trabajar con filtros mediante programación](/appgini/tips-and-tutorials/working-with-filters/part-1)

### `FilterOperator[x]`

* Valor predeterminado: Ninguno
* Detalles: Consulte [trabajar con filtros mediante programación](/appgini/tips-and-tutorials/working-with-filters/part-1)

### `FilterValue[x]`

* Valor predeterminado: Ninguno
* Detalles: Consulte [trabajar con filtros mediante programación](/appgini/tips-and-tutorials/working-with-filters/part-1)

### `SearchString`

* Valor predeterminado: Ninguno
* Detalles: Muestra los registros que coinciden con la cadena de búsqueda proporcionada. Esto equivale a escribir un término de búsqueda en el cuadro de búsqueda rápida sobre la vista de tabla. Ejemplo:
  * `clientes_view.php?SearchString=alemania`

### `FirstRecord`

* Valor predeterminado: 1
* Detalles: Esto equivale a navegar por la vista de tabla utilizando los botones siguiente/anterior o el menú desplegable *Ir a la página*. Por lo tanto, podría usarlo para saltar a una página específica en lugar de la primera página predeterminada de la tabla. Ejemplo:
  * `clientes_view.php?FirstRecord=21` salta a la página 3 (suponiendo 10 registros por página).

### `Print_x`

* Valor predeterminado: Ninguno
* Detalles: Se utiliza para mostrar la página de vista previa de impresión. Ejemplo:
  * `clientes_view.php?Print_x=1` muestra la vista previa de impresión de la vista de tabla.

### `addNew_x`

* Valor predeterminado: Ninguno
* Detalles: Si se establece en cualquier valor distinto de cero, muestra la vista detallada para ingresar un nuevo registro si el usuario tiene permiso de inserción en la tabla.

### `filterer_{nombrecampo}`

* Valor predeterminado: Ninguno
* Detalles: `{nombrecampo}` es el nombre de un campo de búsqueda sin autocompletar (es decir, un campo de búsqueda que muestra un menú desplegable en lugar de llenarse automáticamente). Debe usar esto con `addNew_x` para establecer un valor predeterminado para el campo de búsqueda especificado. Establezca el valor de este parámetro en el valor de la clave principal del registro principal. Por ejemplo, para iniciar un nuevo pedido, estableciendo el cliente en aquel cuyo ID es 203:
  * `pedidos_view.php?addNew_x=1&filterer_id_cliente=203`

### `SelectedID`

* Valor predeterminado: Ninguno
* Detalles: Si se proporciona, muestra la vista detallada para editar el registro identificado por el valor de clave principal dado. Si el usuario no tiene permiso de edición para el registro dado, se muestra una vista detallada de solo lectura. Ejemplo:
  * `clientes_view.php?SelectedID=203` muestra la vista detallada para editar el cliente cuya clave principal es 203.

### `dvprint_x`

* Valor predeterminado: Ninguno
* Detalles: Si se establece en cualquier valor distinto de cero, y también se proporciona un valor `SelectedID`, muestra la vista previa de impresión de la vista detallada del registro especificado. Ejemplo:
  * `clientes_view.php?SelectedID=203&dvprint_x=1`

### `delete_x`

* Valor predeterminado: Ninguno
* Detalles: Si se establece en cualquier valor distinto de cero, y también se proporciona un valor `SelectedID`, el registro especificado se *elimina* si el usuario tiene permiso.
  > **¡Use esto con extrema precaución!**

### `noQuickSearchFocus`

* Valor predeterminado: Ninguno
* Detalles: AppGini 5.90 y superior
  * Pasar `noQuickSearchFocus=1` al enlazar a una vista de tabla evita el enfoque automático del botón de búsqueda rápida. Esto es útil, por ejemplo, cuando incrusta una vista de tabla en otra página y no desea que el navegador "salte" a la página incrustada.
