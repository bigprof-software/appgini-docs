---
title: Hooks (también conocidos como eventos)
linkTitle: Hooks/eventos
slug: help/advanced-topics/hooks
description: Los hooks (eventos) son medios de personalización avanzada de las aplicaciones generadas por AppGini. Le permiten personalizar el comportamiento de su aplicación de una manera que está separada del código generado. De esta manera, su código personalizado no se sobrescribe si regenera su aplicación más tarde, y su proyecto está listo para usar directamente después de la generación del código sin ninguna modificación adicional.
keywords: hooks, eventos, personalización, avanzado, código, generado, aplicación, persistente, código personalizado, generación de código, insertar, eliminar, editar, seleccionar, registros, acciones, comportamiento, apariencia, objeto DataList, tablename_init, función hook, tabla, propiedades de DataList, hooks globales, hooks específicos de tabla, links-home, links-navmenu, footer-extras, header-extras
---

# Hooks (también conocidos como eventos)

Los Hooks (eventos) de AppGini son medios de personalización avanzada de las aplicaciones generadas por AppGini. Le permiten personalizar el comportamiento de su aplicación de una manera que está separada del código generado. De esta manera, su código personalizado no se sobrescribe si regenera su aplicación más tarde, y su proyecto está listo para usar directamente después de la generación del código sin ninguna modificación adicional.

> ***Los hooks funcionan interceptando las acciones de los usuarios (inserciones, eliminaciones, ediciones, selección de registros, etc.) y controlando lo que sucede antes y después de estas acciones.***

## ¿Cómo funcionan los hooks?

Para utilizar los hooks, debe colocar las modificaciones de su código en la carpeta `hooks` generada. Esta carpeta contiene un conjunto de archivos que AppGini crea solo una vez y que no se sobrescriben más tarde. Estos archivos contienen funciones hook que puede definir. Su aplicación AppGini llama a estas funciones al realizar tareas específicas y ejecuta el código que usted define en ellas.

Por ejemplo, para enviar un correo electrónico de notificación cuando se agrega un nuevo pedido a la tabla `orders`, debe agregar el código de envío de correo en la función `orders_after_insert()` dentro del archivo `hooks/orders.php`. Esta función es llamada automáticamente por la aplicación generada por AppGini cada vez que se crea un nuevo registro en la tabla `orders`. Cualquier código que coloque dentro de esa función se ejecuta cuando se agrega un nuevo registro a esa tabla a través de la interfaz generada por AppGini.
