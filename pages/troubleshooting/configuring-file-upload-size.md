---
title: Configuración del tamaño de carga de archivos/imágenes en aplicaciones AppGini
linkTitle: Tamaño de carga de archivos
slug: help/troubleshooting/configuring-file-upload-size
description: Aprenda a configurar el tamaño máximo de carga de archivos/imágenes en las aplicaciones AppGini.
keywords: carga de archivos, carga de imágenes, tamaño de archivo, tamaño de imagen, límite de carga, php.ini, upload_max_filesize, post_max_size
---

# No puedo cargar archivos/imágenes grandes en mi aplicación AppGini

Cuando crea un campo de carga de archivos o imágenes en su aplicación AppGini,
puede configurar el tamaño máximo de archivo que se puede cargar.
Esto se puede hacer en la pestaña de medios, haciendo clic en el botón **Configurar**,
y estableciendo el tamaño máximo de archivo en kilobytes.

![Configuración del tamaño de carga de archivos en AppGini](https://cdn.bigprof.com/images/configure-upload-size-24.18.png)

Sin embargo, es posible que aún tenga problemas para cargar archivos grandes, incluso si están dentro del límite configurado.
Esto se debe a que el servidor en el que está alojada su aplicación AppGini podría tener un límite inferior establecido en su configuración de PHP.

Para solucionar esto, debe aumentar la configuración de `upload_max_filesize` y `post_max_size` en el archivo `php.ini` de su servidor.
He aquí cómo hacerlo:

## Paso 1: Localice el archivo `php.ini`

Localice el archivo `php.ini` en su servidor. Si no sabe dónde está, la forma más fácil de verificarlo es ir al área de administración de su aplicación AppGini, abrir el menú Utilidades y hacer clic en el enlace **Estado del servidor**. Desde allí, busque `php.ini` en la página que se abre. La ruta al archivo `php.ini` debería mostrarse allí.

![Localización del archivo php.ini en la página de estado del servidor](https://cdn.bigprof.com/images/php-ini-location-24.18.png)

Si no ve el enlace **Estado del servidor** en el menú Utilidades, significa que se ha deshabilitado en su proyecto AppGini. Puede habilitar esa página en su proyecto AXP en la sección **Configuración de seguridad** > **Permitir acceso de administrador a la página de estado del servidor**.

![Habilitación de la página de estado del servidor en el proyecto AppGini](https://cdn.bigprof.com/images/enable-server-status-24.18.png)

Alternativamente, puede consultar el panel de control de su servidor o pedir ayuda a su proveedor de alojamiento para localizar el archivo `php.ini`.

## Paso 2: Verifique y actualice el valor de `upload_max_filesize`

Abra el archivo `php.ini` en un editor de texto y busque la configuración `upload_max_filesize`. Podría verse así:

```ini
upload_max_filesize = 2M
```

Cambie el valor al tamaño máximo de archivo deseado. Por ejemplo, para permitir cargas de 10 MB, cámbielo a:

```ini
upload_max_filesize = 10M
```

## Paso 3: Verifique y actualice el valor de `post_max_size`

A continuación, busque la configuración `post_max_size` en el archivo `php.ini`. Podría verse así:

```ini
post_max_size = 8M
```

Cambie el valor al tamaño máximo de archivo deseado. Por ejemplo, para permitir cargas de 10 MB, cámbielo a:

```ini
post_max_size = 10M
```

## Paso 4: Guarde y reinicie su servidor web

Guarde el archivo `php.ini` y reinicie su servidor web. Si no está seguro de cómo reiniciar su servidor web, puede pedir ayuda a su proveedor de alojamiento.

Finalmente, intente cargar el archivo grande nuevamente en su aplicación AppGini. Debería funcionar ahora.
