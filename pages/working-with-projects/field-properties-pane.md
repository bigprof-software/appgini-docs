---
title: Panel de propiedades del campo
linkTitle: Propiedades del campo
slug: help/working-with-projects/field-properties-pane
description: El panel de propiedades del campo en AppGini le permite configurar las propiedades de los campos en sus tablas.
keywords: propiedades del campo, panel de propiedades del campo, propiedades del campo de appgini, panel de propiedades del campo de appgini, pestaña de medios, campo de búsqueda, lista de opciones, campo calculado, formato de datos, documentación técnica
---

# Panel de propiedades del campo

![Panel de propiedades del campo](https://cdn.bigprof.com/images/appgini-new-field-24.15.png)


### Título
El título del campo es el título del campo tal como aparecería en la vista de tabla y la vista detallada de su tabla en la aplicación web generada.

### Descripción
Esta sección le permite proporcionar una descripción opcional para el campo.

### Tipo de datos
(Menú desplegable) Este menú le permite elegir el tipo de datos que el campo almacenará en la base de datos de su aplicación.

### Longitud
Especifica el tamaño máximo de datos que se pueden almacenar en este campo. La forma en que funciona la propiedad Longitud depende del tipo de datos que elija para el campo.
Lea las directrices sobre tipos de datos que se muestran en la parte inferior de la ventana Propiedades para obtener más información.

### Precisión
Esta propiedad solo funciona con tipos de datos decimales (por ejemplo, Float, Double y Decimal). Especifica cuántos dígitos
mostrar después del punto decimal.

###  Caracteres máximos en la vista de tabla
Aplicable solo para tipos de datos textuales. Especifica el número de caracteres que se mostrarán en la vista de tabla para ese campo. Si es cero o está vacío, se muestra todo el
valor del campo. Esto es muy útil cuando tiene un campo largo y no desea mostrar todo su contenido en la vista de tabla para
evitar que la vista de tabla se vuelva demasiado ancha. Por lo tanto, puede configurarlo para que muestre solo los primeros 40 caracteres, por ejemplo.
Cuando los usuarios seleccionen el registro, el contenido completo del campo se mostrará en la vista detallada.

![AppGini_scNVswME9v](https://github.com/bigprof-software/appgini-docs/assets/168858457/7ad719c6-dcbd-4ac4-964d-fdd92179efe5)


### Predeterminado
Si especifica un valor predeterminado, se colocará en cualquier registro que el usuario cree mientras deja este campo vacío
(si el usuario desea un campo vacío, puede eliminar el valor predeterminado después de que se haya agregado el registro y luego actualizar el registro).
Si hace clic en el botón 'Valor automático' a la derecha del cuadro 'Predeterminado', puede seleccionar un valor automático para que se
inserte en el campo cuando se cree o cambie el registro. Esto solo funciona si el campo está configurado como de solo lectura.

### Valor automático
Puede configurar un campo para que contenga uno o más valores automáticos especificándolos en el menú desplegable.
El campo será de solo lectura y su valor se establecerá automáticamente por la aplicación.

![AppGini_rR91bDhpWk](https://github.com/bigprof-software/appgini-docs/assets/168858457/7244f2d8-665b-46a9-b972-ea8abf88865a)

### Solo lectura
Si está marcado, este campo se mostrará en la vista detallada pero no será editable.
Esto es útil en muchos escenarios, incluido forzar un valor predeterminado (o valor automático), campos calculados, campos que se completan mediante código personalizado o una aplicación de terceros, etc.

![AppGini_rlaTzMBsVl](https://github.com/bigprof-software/appgini-docs/assets/168858457/781c5ba8-d657-426c-a6b7-65e74ae2e713)

### Clave principal
Si marca esta opción, el campo actual será la clave principal de la tabla actual.
En AppGini, cada tabla debe tener un solo campo de clave principal para identificar de forma única los registros de la tabla (AppGini no admite claves principales de varios campos).

![AppGini_bI8MW1vvBU](https://github.com/bigprof-software/appgini-docs/assets/168858457/2f3e5609-4633-42ef-a93c-6cb138acef64)

### Relleno con ceros
Marque esta propiedad para rellenar a la izquierda los tipos de datos numéricos con ceros cuando se muestren, de modo que el número total de dígitos coincida con la propiedad 'Longitud' del campo.
Por ejemplo, si la longitud del campo es 5 y está configurado como relleno con ceros, un valor de campo de 22 se mostraría como 00022.

### Obligatorio
Si marca esta propiedad, los usuarios deben proporcionar un valor para este campo antes de enviar el formulario.
Si un usuario intenta enviar un registro mientras deja un campo obligatorio vacío, verá un mensaje de error similar al siguiente.
Si configura el campo como de solo lectura, de incremento automático u oculto en la vista detallada, esta propiedad se ignorará.

![AppGini_jCaXOiKufz](https://github.com/bigprof-software/appgini-docs/assets/168858457/0aa74d48-01c1-438d-8f7b-76e7c12f46ab)

### Área enriquecida (HTML)
Si está marcado, este campo se mostrará como un área enriquecida en la vista detallada. Un área enriquecida proporciona funciones de formato avanzadas que no están disponibles en un área de texto normal. Por ejemplo, puede cambiar la fuente/tamaño de fuente, los colores, agregar enlaces, agregar fotos, etc.

![AppGini_BNj6i82r3r](https://github.com/bigprof-software/appgini-docs/assets/168858457/3e5ee5eb-79b7-4bf9-833b-97d3f2e1e7f6)

### Incremento automático
Al definir las propiedades del campo ID (probablemente llamado "id"), busque una opción etiquetada como "Incremento automático". Esta opción aparece como una casilla de verificación con una selección de "Incremento automático".

### Único
Los valores de datos en este campo no se pueden repetir si marca esta propiedad. Esto es similar a la propiedad Clave principal, excepto que los campos únicos pueden estar vacíos (nulos).
Si un usuario intenta ingresar un valor que ya existe en un campo único, verá un mensaje de error como el siguiente.

![AppGini_d3pskp8FXm](https://github.com/bigprof-software/appgini-docs/assets/168858457/3e5f90a8-6750-4f47-9eb8-cf9ba275d2ac)

### Mostrar suma de columna
Esta opción solo está habilitada para campos numéricos. Actualmente, los campos de búsqueda no son compatibles (incluso si sus padres son numéricos).
Si marca esta opción, la vista de tabla generada incluirá una suma calculada de los valores almacenados en este campo para todos los registros.
Si se aplica un filtro a la vista de tabla, la suma se calculará solo para los registros filtrados en lugar de todos los registros.

![AppGini_mV8EBJjSMN](https://github.com/bigprof-software/appgini-docs/assets/168858457/284d849d-4cfe-4a45-bae5-531fb0ad8198)

### Área de texto
Si está marcado, este campo se mostrará como un área de texto en la vista detallada. Esto es útil si desea permitir varias líneas en un campo, por ejemplo, para ingresar direcciones o notas.

![AppGini_NVMbCU6ZpJ](https://github.com/bigprof-software/appgini-docs/assets/168858457/730161c5-eb3d-40ae-b3b7-54cbe0016bbc)

### Sin signo
Esta propiedad solo funciona para tipos de datos numéricos. Si la marca, el campo no aceptará valores de datos negativos.

### No filtrar
Si está marcado, el campo actual no se muestra en la página de filtros. Por lo tanto, los usuarios no podrán usar este campo para filtrar datos.

![AppGini_at2OowSjus](https://github.com/bigprof-software/appgini-docs/assets/168858457/78582b1d-f4d3-45e8-9fdd-52c2f99915dd)

### Binario
Esta propiedad solo funciona con los tipos de datos Char y VarChar. Obliga al campo a comportarse como un valor binario en lugar del comportamiento de texto predeterminado.
Por ejemplo, la lista (a,G,x,E,A,g) se ordena como (a,A,E,g,G,x) si se trata como valores de texto, y (A,E,G,a,g,x) si se trata como valores binarios.

### Casilla de verificación
Si marca esta propiedad, el campo se mostrará como una casilla de verificación, donde los usuarios pueden marcarla o desmarcarla.

![AppGini_lPMFSpxirq](https://github.com/bigprof-software/appgini-docs/assets/168858457/9fba7e3a-764d-44f2-85a0-b4b99df7b8f9)

### Ocultar en la vista de tabla
Si está marcado, el campo actual no se muestra en la vista de tabla. Esto puede ser útil si desea ocultar algunos campos o disminuir el ancho de las tablas.

![AppGini_ZTILEBmhaK](https://github.com/bigprof-software/appgini-docs/assets/168858457/3785b553-b15e-4035-ad53-03f16185543c)

### Ocultar en la vista detallada
Si está marcado, este campo no se mostrará en la vista detallada.

![AppGini_o49PVvFmMq](https://github.com/bigprof-software/appgini-docs/assets/168858457/ad747138-1d45-43e1-a334-c6066902f034)

### Alineación
Especifica la alineación del campo en la vista de tabla.

![AppGini_lJl6g3oWof](https://github.com/bigprof-software/appgini-docs/assets/168858457/00189a6e-9851-48e8-932a-496f4d9a1ce9)

### Ancho de columna (píxeles)
Especifica el ancho en píxeles de la columna que mostrará los datos de este campo en la vista de tabla.
Tenga en cuenta que el ancho especificado es el ancho mínimo (en lugar de exacto). Si el ancho total de todas las columnas en la vista de tabla es menor que el ancho de la página, cada columna se expandirá según la proporción de su ancho especificado con respecto al ancho total de la tabla.

### Medios, Campo de búsqueda, Lista de opciones... etc.
Las diversas opciones en estas pestañas especifican el comportamiento y la apariencia del campo actual.

![AppGini_YJdwqUy65o](https://github.com/bigprof-software/appgini-docs/assets/168858457/67b09a66-a71b-43fa-9db9-f794b2b7f9da)

### Pestaña Medios > Enlace
Configura este campo como un enlace a la vista detallada (el comportamiento predeterminado), un enlace a una URL, un enlace de correo electrónico o ningún enlace. Haga clic en el botón 'Configurar' para cambiar el comportamiento del enlace.

![AppGini_u1ZN8jSNjt](https://github.com/bigprof-software/appgini-docs/assets/168858457/137d8285-4874-4772-b9f6-5b4b3896e39e)

### Pestaña Medios > Imagen
Imagen Configura este campo para aceptar una carga de imagen y mostrarla como una imagen de tamaño completo o una miniatura.

Esto solo funciona si el campo tiene un tipo de datos textual (Char, Varchar, Text, etc.). Esto se debe a que el campo en realidad almacena el nombre del archivo de imagen, mientras que la imagen en sí se carga en el almacenamiento del servidor que ejecuta su aplicación AppGini.

![AppGini_gG1TJkJGDp](https://github.com/bigprof-software/appgini-docs/assets/168858457/20dbc750-eb05-428c-bdbb-1e4ce7d358a4)

### Pestaña Medios > Carga de archivos
Configura este campo como un campo de carga de archivos. Esto solo funciona si el campo tiene un tipo de datos textual (Char, Varchar, Text, etc.).
Esto se debe a que el campo en realidad almacena el nombre del archivo, mientras que el archivo en sí se carga en el almacenamiento del servidor que ejecuta su aplicación AppGini.
En la ventana de configuración, puede especificar el tamaño máximo de archivo en KB que los usuarios pueden cargar. Además, puede especificar si desea eliminar el archivo del servidor si se elimina el registro. También puede configurar cómo se muestra el campo a los usuarios.

![AppGini_TNckzO2MHt](https://github.com/bigprof-software/appgini-docs/assets/168858457/c7f6e8b7-910f-4d02-b09c-5b3a478c6c64)

### Pestaña Medios > Mapa de Google
Cuando está habilitado, este enlace aceptaría un enlace de Google Maps y mostraría el mapa relacionado incrustado en la página.

![AppGini_yitzk1mLH7](https://github.com/bigprof-software/appgini-docs/assets/168858457/2fbe19f3-70bb-4e82-8d8c-0b3bf038d8c7)

### Pestaña Medios > Video de Youtube
Cuando está habilitado, este enlace aceptaría un enlace de Youtube y mostraría el video relacionado incrustado en la página.

![AppGini_3ff5I6qgqx](https://github.com/bigprof-software/appgini-docs/assets/168858457/d2ab79f7-593f-4aac-ac8e-7a835b7c9973)

### Campo de búsqueda > Tabla principal
Si desea establecer este campo como un campo de búsqueda (clave externa), seleccione su tabla principal en este menú. Una tabla principal es la tabla que tiene el campo que contiene los datos de origen para el campo de búsqueda.
Para obtener más información sobre los campos de búsqueda, consulte la sección 'Comprensión de los campos de búsqueda' en la ayuda en línea.

![AppGini_jNsUIjNBmK](https://github.com/bigprof-software/appgini-docs/assets/168858457/9d32f830-ff2d-4d4f-a252-6fc4e75a5370)

### Campo de búsqueda > Avanzado...
La ventana avanzada le permite especificar una consulta SQL personalizada para completar el menú desplegable de búsqueda.
Normalmente, puede usar esto para filtrar los posibles valores para este campo de búsqueda. Por ejemplo, puede mostrar productos que no están descontinuados en lugar de todos los productos agregando una condición WHERE en la consulta SQL.

### Campo de búsqueda > Campo de título principal 1
Si este es un campo de búsqueda (clave externa), seleccione el campo que se utilizará como primera parte del título en este menú. Un título principal es el título o alias que aparece al usuario en el menú desplegable de búsqueda.
Para obtener más información sobre los campos de búsqueda, consulte la sección 'Comprensión de los campos de búsqueda' en la ayuda en línea.

![AppGini_BJblHapZLA](https://github.com/bigprof-software/appgini-docs/assets/168858457/379a1be6-425a-4df5-b0f7-9c27f4287d82)

### Campo de búsqueda > Separador
Si este es un campo de búsqueda (clave externa) y desea que su título se forme uniendo valores de 2 campos de título, escriba un separador aquí.
Por ejemplo, si la parte 1 del título es un campo llamado 'apellido', y la parte 2 es un campo llamado 'nombre', debe usar una coma seguida de un
espacio ',' como separador. Vea la captura de pantalla a continuación.

![AppGini_jLCg6vx72k](https://github.com/bigprof-software/appgini-docs/assets/168858457/d1361d50-bfbb-42c6-9bce-55b8da4c647f)

### Campo de búsqueda > Campo de título principal 2
Si este es un campo de búsqueda (clave externa), seleccione el campo que se utilizará como segunda parte del título en este menú. Un título principal es el título o alias que aparece al usuario en el menú desplegable de búsqueda.
Para obtener más información sobre los campos de búsqueda, consulte la sección 'Comprensión de los campos de búsqueda' en la ayuda en línea.

![AppGini_2VmbYdPyMx](https://github.com/bigprof-software/appgini-docs/assets/168858457/f4d671ed-b401-4ae5-aefd-e59ede55c11b)

### Propiedades del campo > Mostrar como botones de opción
Cuando esta opción está marcada, el campo de búsqueda se muestra como un conjunto de botones de opción en lugar de un menú desplegable. Esto solo se aplica si el campo de búsqueda no está configurado como 'Autocompletar'.

![AppGini_WiL0WHggir](https://github.com/bigprof-software/appgini-docs/assets/168858457/375f4ac0-e758-4ae6-be24-d91615224874)

### Propiedades del campo > Heredar permisos de acceso
Marque esta opción para limitar el contenido del menú desplegable de búsqueda solo a los registros principales que el miembro conectado puede ver. Si no está marcada, se enumeran todos los registros principales independientemente de los permisos del miembro.

![AppGini_nELOWUibN4](https://github.com/bigprof-software/appgini-docs/assets/168858457/0ac007ee-abe3-4259-bc36-28ccde0a5763)

### Propiedades del campo > Enlazar al registro principal en la vista detallada
En la vista detallada, los campos de búsqueda pueden tener un enlace adyacente al registro principal. Este menú desplegable especifica si se debe mostrar ese enlace y cómo se comporta el enlace cuando se hace clic.

![AppGini_tkO9m89sRq](https://github.com/bigprof-software/appgini-docs/assets/168858457/33d274c9-dee7-4bb0-bd5c-4d8b54cf8fdd)

### Lista de opciones > Valores de la lista
Si desea limitar los posibles valores de un campo a una lista específica de valores, escriba los valores permitidos aquí, separados por dos puntos y coma.
La primera captura de pantalla a continuación muestra un ejemplo de cómo especificar los valores de la lista. La segunda captura de pantalla debajo muestra cómo se mostrará el campo a los usuarios (las opciones se ordenan alfabéticamente en el menú desplegable).

![AppGini_P48IuTLrxY](https://github.com/bigprof-software/appgini-docs/assets/168858457/2db1c1e1-ba13-4b90-b693-c1751bb90a0d)

### Lista de opciones > ¡Lista rápida!
Elija un conjunto popular predefinido de opciones de la lista rápida en lugar de tener que escribirlas manualmente.
Para agregar su propia lista predefinida, cree un archivo de texto que contenga la lista y guárdelo en la carpeta 'add-ons' dentro de su carpeta de instalación de AppGini. La extensión de su archivo de lista debe ser '.Ist'.

![AppGini_W4eEPywd51](https://github.com/bigprof-software/appgini-docs/assets/168858457/9b2bc409-720a-4836-a557-b36bf0a10d81)

### Lista de opciones > Lista desplegable
Si elige mostrar una lista de opciones como una lista desplegable, los usuarios pueden seleccionar un valor del menú desplegable y pueden buscar valores escribiendo parte de su contenido en el cuadro de búsqueda.
Recomendado si tiene una gran cantidad de opciones.

![AppGini_Cc7Gs5XGGu](https://github.com/bigprof-software/appgini-docs/assets/168858457/92808c8d-9234-499d-9a4b-63c911c32911)

### Lista de opciones > Cuadro de lista de selección múltiple
Si elige mostrar una lista de opciones como un cuadro de lista de selección múltiple, los usuarios pueden seleccionar uno o más valores del menú desplegable y pueden buscar valores escribiendo parte de su contenido en el cuadro de búsqueda.
Para usar esta opción, el tipo de datos del campo debe ser un tipo TEXT o BLOB.
La captura de pantalla a continuación muestra un ejemplo en el que el usuario ha seleccionado 2 valores del menú desplegable.

![AppGini_3IrB4EUtGC](https://github.com/bigprof-software/appgini-docs/assets/168858457/83e87dc4-e240-4260-8c79-78e7cba3c31c)

### Lista de opciones > Botones de opción
Si este campo es una lista de opciones y elige mostrarlo como botones de opción, los valores de la lista se muestran como opciones de botones de opción, cada una en una línea separada. La ventaja de los botones de opción es que son muy fáciles de usar y el usuario puede ver todas las opciones posibles sin desplazarse.
Sin embargo, no se recomienda si tiene una gran cantidad de opciones, ya que esto hará que el formulario sea demasiado largo. Utilice una lista desplegable en este caso.
Las opciones se ordenan en el mismo orden en que las ingresa si elige botones de opción.
Para ocultar la opción 'Ninguno', configure el campo como obligatorio.

![AppGini_FxCj19ijih](https://github.com/bigprof-software/appgini-docs/assets/168858457/e7079346-61f7-4385-a76e-2edbc0857237)

### Formato de datos > Formatear este campo como
Utilice esta opción si desea aplicar un formato especial a los datos almacenados en este campo.
Ejemplos de formatos especiales incluyen formatos de moneda, formatos de fecha/hora, etc.
Puede agregar o editar formatos de datos editando el archivo `C:\Program Files\AppGini\add-ons\dataFormats.cfg` en un editor de texto.
Reglas: Cada formato de datos en una línea separada. La línea comienza con la descripción del formato de datos, seguida de un punto y coma (;) y un espacio, seguido del código de formato (escrito en sintaxis MySQL). La descripción del formato de datos no puede incluir puntos y comas.

![AppGini_8lyktlLxci](https://github.com/bigprof-software/appgini-docs/assets/168858457/2358b9fa-2c47-4956-b632-31d568611fb3)

### Campo calculado > Calcular automáticamente el valor de este campo utilizando la siguiente consulta SQL
Esta es una función avanzada que requiere algunos conocimientos de SQL.
En lugar de recibir la entrada del usuario o un valor predeterminado, los campos calculados se completan ejecutando la consulta SQL especificada y almacenando el valor devuelto.
La consulta SQL debe devolver un solo valor: una sola fila y una sola columna. Utilice el botón 'Ayudante de consulta' para abrir un editor de consultas avanzado que facilita mucho la creación de consultas. La lista de variables a la derecha le permite insertar marcadores de posición especiales en la consulta SQL, para que se reemplacen por sus
valores correspondientes antes de ejecutar la consulta. Para obtener más detalles y ejemplos, consulte la ayuda en línea.

### Mostrar página de documentación técnica en el área de administración
La documentación técnica es una forma de agregar comentarios/documentación a su aplicación. Si la opción 'Mostrar página de documentación técnica en el área de administración' está marcada, la documentación también será visible para el usuario administrador en lugar de solo en AppGini. El texto de la documentación puede incluir opcionalmente código HTML. También se pueden utilizar clases CSS de Bootstrap.
