---
title: Clases de vista de tabla y detallada
linkTitle: Clases de vista de tabla y detallada
slug: help/advanced-topics/table-and-detail-view-classes
---

# Clases de vista de tabla y detallada

A partir de AppGini 5.60, se agregó una nueva opción avanzada para permitirle
especificar uno o más nombres de clases CSS separados por espacios para aplicar a la
vista de tabla y la vista detallada de una tabla. Esta opción se puede encontrar
seleccionando una tabla en su proyecto, luego haciendo clic en el botón **Plantilla**
en el panel de propiedades de la tabla. Esto abriría un cuadro de diálogo como se muestra a continuación.

![Cómo abrir la ventana de plantilla en AppGini 5.60 y superior.](https://cdn.bigprof.com/images/table-view-template-dialog.png "Cómo abrir la ventana de plantilla en AppGini 5.60 y superior.")

Al hacer clic en el botón **Avanzado** se revelarán aún más opciones.

![](https://cdn.bigprof.com/images/table-view-template-dialog-advanced.png "El botón 'Avanzado' revela opciones para cambiar las clases de vista de tabla y detallada.")

Puede especificar clases CSS para aplicar a la vista de tabla y la vista
detallada. La mayoría de las veces, estas serían [clases de cuadrícula de Bootstrap](https://getbootstrap.com/css/#grid). También podría seleccionar
clases del menú desplegable a la derecha. Por ejemplo, para configurar la vista de tabla
para que se muestre en la parte izquierda de la página, mientras que la vista detallada en
la parte derecha, podría usar la clase `col-md-6` para cada una. El resultado
se vería algo así cuando genere su aplicación.

> TODO: Añadir una captura de pantalla aquí.

Por supuesto, para mostrar la tabla y la vista detallada en la misma página, la
opción **Mostrar vista detallada en una página separada** debe estar *desmarcada*
para esa tabla.
