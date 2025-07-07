---
title: Objeto DataList
linkTitle: Objeto DataList
slug: help/advanced-topics/hooks/DataList-object
description: El objeto DataList se pasa a la función hook tablename_init y expone muchas opciones que puede controlar para afectar el comportamiento y la apariencia de cada una de las páginas de tabla generadas por AppGini que ven los usuarios.
keywords: Objeto DataList, tablename_init, función hook, tabla, apariencia, comportamiento, propiedades de DataList
---

# Objeto DataList

El objeto `DataList` expone muchas opciones que puede controlar para afectar el comportamiento y la apariencia de cada una de las páginas de tabla generadas por AppGini que ven los usuarios.

El objeto `DataList` se pasa a la función hook [`tablename_init`](/appgini/help/advanced-topics/hooks/table-specific-hooks/#tablename_init). Esta función hook se llama antes de mostrar los datos a los usuarios. Por lo tanto, puede controlar las diversas opciones de apariencia y comportamiento modificando este objeto dentro de esa función hook.

## Aquí hay una lista de las propiedades editables del objeto `DataList`

### `AllowCSV`

Establecer esta propiedad en `1` permite a los usuarios descargar registros de tabla como un archivo CSV. Establecerlo en `0` deshabilita esto.

### `AllowDeleteOfParents`

Establecer esta propiedad en `1` permite a los usuarios que tienen permisos de eliminación eliminar un registro incluso si tiene registros secundarios en otras tablas. Establecerlo en `0` deshabilita esto.

### `AllowFilters`

Establecer esta propiedad en `1` permite a los usuarios acceder a la página de filtros para ver y modificar filtros. Establecerlo en `0` deshabilita esto.

### `AllowPrinting`

Establecer esta propiedad en `1` permite a los usuarios acceder a la página 'Vista previa de impresión'. Establecerlo en `0` deshabilita esto.

### `AllowSavingFilters`

Establecer esta propiedad en `1` permite a los usuarios guardar filtros como código HTML para acceder a ellos rápidamente más tarde. Establecerlo en `0` deshabilita esto.

### `AllowSorting`

Establecer esta propiedad en `1` permite a los usuarios ordenar los registros de la tabla. Establecerlo en `0` deshabilita esto.

### `CSVSeparator`

Especifica el separador de campos a utilizar al descargar datos como un archivo CSV. El valor predeterminado es coma (,).

### `ColCaption`

Una matriz que especifica los títulos de las columnas que se muestran en la vista de tabla.

### `ColNumber`

Una matriz que especifica qué campos usar en la vista de tabla. Funciona seleccionando algunos (o todos) los campos enumerados en la propiedad `QueryFieldsTV` que se explica a continuación.

### `ColWidth`

Una matriz que especifica el ancho de cada columna en la vista de tabla. Si la propiedad `ShowTableHeader` (explicada a continuación) se establece en `1`, la propiedad `ColWidth` se anula con los valores de ancho especificados en el archivo de plantilla de la vista de tabla (`templates/tablename_templateTV.html`).

### `DefaultSortDirection`

Una cadena que se puede establecer en `'asc'` o `'desc'`. Consulte la propiedad `DefaultSortField` a continuación.

### `DefaultSortField`

Especifica el campo que se utilizará para la ordenación predeterminada de los registros de la vista de tabla. Esta propiedad se puede establecer en un número para especificar qué campo ordenar de la propiedad `QueryFieldsTV` que se explica a continuación. Alternativamente, se puede establecer en una cadena que especifique un nombre de campo explícito o una expresión MySQL para usar en la ordenación predeterminada.

### `DVClasses`

Se agregó en AppGini 5.60. Clases CSS adicionales para aplicar al contenedor de la vista detallada (separadas por espacios).

### `FilterPage`

Especifica una página de búsqueda personalizada para usar cuando los usuarios hacen clic en el botón FILTROS. Si no se proporciona ningún valor, se utiliza la página de filtros predeterminada. Puede utilizar esta función para crear formularios de búsqueda avanzada para sus tablas. Consulte [Creación de formularios de búsqueda personalizados](/appgini/tips-and-tutorials/customized-search-forms) para obtener un ejemplo detallado.

### `PrimaryKey`

Una cadena que especifica el nombre del campo de clave principal de la tabla. No debe cambiar este valor.

### `QueryFieldsCSV`

Una matriz asociativa que especifica los campos utilizados en la consulta que recupera datos cuando los usuarios solicitan descargar un archivo CSV. Las claves de la matriz representan los nombres de los campos o las expresiones MySQL utilizadas en la consulta. Los valores de la matriz representan los títulos de las columnas que se mostrarán en el archivo CSV.

### `QueryFieldsFilters`

Una matriz asociativa que especifica los campos utilizados en la página de filtros. Las claves de la matriz representan los nombres de los campos. Los valores de la matriz representan los títulos de los campos que se mostrarán en la página de filtros.

### `QueryFieldsTV`

Una matriz asociativa que especifica los campos que se pueden mostrar en la vista de tabla. Las claves de la matriz representan los nombres de los campos o las expresiones MySQL utilizadas en la consulta. Los valores de la matriz representan los títulos de las columnas. Los campos que realmente se muestran en la vista de tabla se especifican en la matriz `ColNumber` explicada anteriormente.

### `QueryFrom`

Una cadena que especifica el contenido de la parte FROM de la consulta utilizada en la vista de tabla y el archivo CSV.

### `QuickSearch`

Un número que especifica cómo mostrar el cuadro de búsqueda rápida. Puede tomar cualquiera de los siguientes valores:

*   `0`: no se muestra ningún cuadro de búsqueda rápida.
*   `1`: cuadro rápido que se muestra en la parte superior izquierda de la vista de tabla.
*   `2`: cuadro rápido que se muestra en la parte superior central de la vista de tabla.
*   `3`: cuadro rápido que se muestra en la parte superior derecha de la vista de tabla.

**Actualización:** A partir de AppGini 5.20 y versiones posteriores, establecer esta propiedad en `0` oculta el cuadro de búsqueda rápida, y establecerla en cualquier valor distinto de cero muestra el cuadro de búsqueda rápida. La posición del cuadro está determinada por el tamaño de la pantalla.

### `QuickSearchText`

Una cadena que especifica el título que se mostrará junto al cuadro de búsqueda rápida.

### `RecordsPerPage`

Un número que especifica cuántos registros mostrar por página en la vista de tabla.

### `RedirectAfterInsert`

Si los usuarios pueden agregar nuevos registros a la tabla, esta propiedad especifica la URL a la que se redirigirá a los usuarios después de agregar el nuevo registro.

### `SelectedTemplate`

Una cadena que especifica la ruta al archivo de plantilla HTML que se utilizará para formatear un registro actualmente seleccionado en la vista de tabla.

### `SeparateDV`

Un número que se establece en `1` para mostrar la vista detallada en una página separada, o `0` para mostrarla debajo de la vista de tabla.

### `ShowTableHeader`

Un número que se establece en `1` (el valor predeterminado) para mostrar los títulos de las columnas sobre la vista de tabla. Los títulos de las tablas se especifican en la propiedad `ColCaption` explicada anteriormente. Si se establece en `0`, no se muestran los títulos de las columnas (esto es útil si necesita cambiar el diseño horizontal de los campos en el archivo de plantilla `templates/tablename_templateTV.html` a un diseño no horizontal diferente).

### `TableTitle`

El título que se mostrará sobre la vista de tabla.

### `Template`

Una cadena que especifica la ruta al archivo de plantilla HTML que se utilizará para formatear todos los registros en la vista de tabla, excepto el actualmente seleccionado.

### `TemplateDV`

Se agregó en AppGini 5.61. Una cadena que especifica la ruta (relativa al directorio principal de la aplicación) al archivo de plantilla HTML que se utilizará para mostrar la vista detallada.

### `TemplateDVP`

Se agregó en AppGini 5.61. Una cadena que especifica la ruta (relativa al directorio principal de la aplicación) al archivo de plantilla HTML que se utilizará para mostrar la vista previa de impresión de la vista detallada.

### `TVClasses`

Se agregó en AppGini 5.60. Clases CSS adicionales para aplicar al contenedor de la vista de tabla (separadas por espacios).

## Inspeccionar el objeto `DataList`

Para fines de depuración, puede inspeccionar el contenido del objeto `DataList` agregando el siguiente código en la función hook `tablename_init` en el archivo generado `hooks/tablename.php` (reemplace `tablename` por el nombre real de la tabla en cuestión):

```php
function tablename_init(&$options, $memberInfo, &$args) {
    ob_start();
    $xc = get_object_vars($options);
    ksort($xc);
    print_r($xc);
    $c = ob_get_clean();
    echo "<pre>" . htmlspecialchars($c) . "</pre>";
 
    return TRUE;
}
```

El código anterior mostrará el contenido del objeto `DataList` en el navegador sobre la vista de tabla. Puede usar esto para inspeccionar, depurar y cambiar las diversas propiedades. Pero debe usar esto con cuidado en un entorno protegido solo para fines de prueba.
