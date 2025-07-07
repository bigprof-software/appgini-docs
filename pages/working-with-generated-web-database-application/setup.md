---
title: Configuración de aplicaciones generadas por AppGini
linkTitle: Configuración de aplicaciones generadas por AppGini
keywords: configuración, appgini, aplicaciones generadas, base de datos, aplicaciones web, probar conexión, usuario administrador, captcha
description: Aprenda cómo configurar su aplicación de base de datos web generada por AppGini, incluyendo la resolución del captcha, el llenado de la información de la base de datos y la creación del usuario administrador.
slug: help/working-with-generated-web-database-application/setup
---

# Configuración de aplicaciones generadas por AppGini

## Acceso a su aplicación

Después de [cargar los archivos de su aplicación PHP](../application-uploader.md) a su servidor,
puede acceder a ella apuntando su navegador a la URL de la aplicación. Dependiendo de su servidor,
la URL podría verse así si cargó los archivos en la raíz del documento:

```plaintext
https://www.suserver.com/
```

O así si cargó los archivos en una subcarpeta llamada `miapp`:

```plaintext
https://www.suserver.com/miapp/
```

Reemplace `www.suserver.com` con el nombre de su servidor
(o dirección IP si está ejecutando el servidor en una intranet),
y `miapp` con la ruta a la carpeta donde cargó los archivos.

## Paso 1: Resuelva el captcha

La primera vez que acceda a su aplicación, se le presentará un captcha para resolver.
Esta es una medida de seguridad para evitar que los bots intenten acceder a su página de configuración.

![Captcha de configuración](https://cdn.bigprof.com/images/appgini-setup-01-captcha.png "Captcha de configuración")

Simplemente resuelva el captcha y haga clic en el botón `Enviar`. Tenga en cuenta que este paso
podría no mostrarse si su servidor no tiene instalada la biblioteca `GD`. En este caso,
simplemente salte al siguiente paso.

Si no puede resolver el captcha por cualquier motivo, puede deshabilitarlo editando el
archivo `definitions.php` generado y cambiando la siguiente línea:

```php
@define('FORCE_SETUP_CAPTCHA', true);
```

a:

```php
@define('FORCE_SETUP_CAPTCHA', false);
```

## Paso 2: El formulario de configuración

En el siguiente paso, debería ver la siguiente pantalla de introducción:

![Introducción a la configuración](https://cdn.bigprof.com/images/appgini-setup-02-setup-intro.png "Introducción a la configuración")

Haga clic en 'Continuar' para pasar a la lista de verificación de configuración:

![Lista de verificación de configuración](https://cdn.bigprof.com/images/appgini-setup-03-prepare-db-info.png "Lista de verificación de configuración")

Esto simplemente enumera la información de base de datos requerida que necesita tener a mano antes de continuar.
Por lo general, puede recuperar esta información de su panel de control de alojamiento.
En algunos casos, es posible que deba crear una nueva base de datos y un usuario para su aplicación,
lo que también puede hacer desde su panel de control de alojamiento, utilizando una herramienta como phpMyAdmin,
o mediante la línea de comandos.

Para obtener más detalles, consulte [cómo crear una nueva base de datos y usuario MySQL/MariaDB](../create-mysql-database-and-user.md).

Una vez que tenga la información requerida, haga clic en 'Continuar' para pasar al formulario de configuración de la base de datos:

![Formulario de configuración de la base de datos](https://cdn.bigprof.com/images/appgini-setup-04-setup-form.png "Formulario de configuración de la base de datos")

Complete la información requerida:

- **Servidor MySQL (host)**: Suele ser `localhost`, pero podría ser diferente según su proveedor de alojamiento.
- **Nombre de la base de datos**, **Nombre de usuario de MySQL** y **Contraseña de MySQL**: Estos son el nombre de la base de datos, el nombre de usuario y la contraseña que creó anteriormente.
- **Puerto MySQL**: Suele ser `3306`, pero podría ser diferente según su proveedor de alojamiento.

Después de escribir la información anterior, se realizará una prueba de conexión para garantizar que la aplicación pueda conectarse a la base de datos.
Si la prueba de conexión falla, verá un mensaje de error como el siguiente:

![Error de conexión a la base de datos](https://cdn.bigprof.com/images/appgini-setup-05-db-connection-error.png "Error de conexión a la base de datos")

En ese caso, verifique la información que ingresó y asegúrese de que sea correcta. Luego haga clic en el botón 'Reintentar' a la derecha del mensaje de error
para volver a probar la conexión.

Si la prueba de conexión tiene éxito, verá un mensaje de éxito como el siguiente:

![Éxito de la conexión a la base de datos](https://cdn.bigprof.com/images/appgini-setup-06-db-connection-success.png "Éxito de la conexión a la base de datos")

A continuación, proporcione el nombre de usuario, el correo electrónico y la contraseña de administrador deseados para su aplicación.
Este será el nombre de usuario y la contraseña que utilizará para iniciar sesión en el [área de administración](the-admin-interface.md) de su aplicación, donde
podrá administrar la configuración, los usuarios, los grupos y más de su aplicación.

Después de completar la información del administrador, haga clic en 'Enviar' para pasar al paso final.

## Paso 3: Finalización de la configuración

Su aplicación generada por AppGini intentará a continuación crear las tablas de base de datos necesarias y poblarlas con datos iniciales.
Si el proceso de configuración se completa con éxito, verá un mensaje de éxito como el siguiente:

![Éxito de la configuración](https://cdn.bigprof.com/images/appgini-setup-07-success.png "Éxito de la configuración")

Dependiendo de lo que quiera hacer a continuación, haga clic en una de las opciones proporcionadas.

¡Eso es todo! Ha configurado correctamente su aplicación generada por AppGini.
