---
title: Parámetros de línea de comandos
linkTitle: Parámetros de línea de comandos
slug: help/advanced-topics/command-line-parameters
description: Parámetros de línea de comandos para automatizar AppGini, incluyendo la generación de aplicaciones a partir de archivos de proyecto, la especificación de rutas de salida y la carga de aplicaciones a servidores.
keywords: parámetros de línea de comandos, generar, salida, cargar, log, CI/CD, despliegue
---

# Parámetros de línea de comandos

> **Los parámetros de línea de comandos solo funcionan con [AppGini Pro](https://bigprof.com/appgini/order).**

Puede utilizar parámetros de línea de comandos para automatizar AppGini. Por ejemplo, puede agregar un comando para generar una aplicación AppGini como parte de su flujo de trabajo de despliegue en un archivo de procesamiento por lotes/script. Actualmente, se admiten los siguientes parámetros:

## `--generate`

**Uso:** `--generate "ruta\al\archivo\de\proyecto"`

(Añadido en AppGini 5.11). Genera la aplicación a partir del archivo de proyecto AXP proporcionado, utilizando la ruta de salida y la configuración de sobrescritura de archivos almacenada en el archivo de proyecto, y luego sale. Si la ruta al archivo de proyecto contiene espacios, utilice comillas dobles alrededor de la ruta del proyecto.

## `--log`  

**Uso:** `--log "ruta\al\archivo\de\registro"`

(Añadido en AppGini 5.81). Especifica una ruta a un archivo de registro para guardar el registro de salida al generar una aplicación. Si la ruta del archivo de registro contiene espacios, utilice comillas dobles alrededor de ella.

## `--open`

**Uso:** `--open "ruta\al\archivo\de\proyecto"`

(Añadido en AppGini 5.73). Abre el archivo de proyecto especificado en AppGini. Si la ruta al archivo de proyecto contiene espacios, utilice comillas dobles alrededor de la ruta del proyecto.

## `--output`  

**Uso:** `--output "ruta\a\la\carpeta\de\salida"`

(Añadido en AppGini 5.73). Especifica la ruta de salida a utilizar al generar una aplicación, sobrescribiendo la ruta almacenada في el archivo de proyecto. Se debe especificar un archivo de proyecto utilizando `--generate`. Si la ruta de salida contiene espacios, utilice comillas dobles alrededor de la ruta de salida.

## `--upload`

**Uso:** `--upload "URL"`

(Añadido en AppGini 24.19). Sube la aplicación generada a la URL especificada. La URL debe apuntar a la raíz de la aplicación AppGini en el servidor. Si no se proporciona la URL, la aplicación se subirá a la URL de la aplicación especificada en el archivo de proyecto. Esta opción debe combinarse con `--generate` o `--open` para especificar el archivo de proyecto. Si se combina con `--generate`, la aplicación se generará primero y luego se subirá. Si se combina con `--open`, la aplicación se subirá sin generarla. Para obtener más información sobre la carga de aplicaciones, consulte [Carga de aplicaciones AppGini](../application-uploader.md).

Esta característica es ideal para automatizar el despliegue de aplicaciones AppGini y se puede utilizar como parte de un pipeline de CI/CD (Integración Continua/Despliegue Continuo). Consulte el ejemplo en [Despliegue de una aplicación en múltiples servidores](#despliegue-de-una-aplicación-en-múltiples-servidores) a continuación.

## Ejemplos

El siguiente comando iniciaría AppGini y generaría una aplicación a partir de `myapp.axp` en la carpeta almacenada en el archivo de proyecto.

```batch
"C:\Program Files\AppGini\AppGini" --generate C:\projects\myapp.axp
```

El siguiente comando iniciaría AppGini y generaría una aplicación a partir de `myapp.axp` en la carpeta `C:\xampp\htdocs\myapp2`, sobrescribiendo la carpeta almacenada en el archivo de proyecto si es diferente. Si la carpeta especificada no existe, AppGini intentará crearla.

```batch
"C:\Program Files\AppGini\AppGini" --generate C:\projects\myapp.axp --output C:\xampp\htdocs\myapp2
```

El siguiente comando iniciaría AppGini, generaría una aplicación a partir de `myapp.axp` y guardaría el registro de salida en `C:\logs\myapp.log`.

```batch
"C:\Program Files\AppGini\AppGini" --generate C:\projects\myapp.axp --log C:\logs\myapp.log
```

## Despliegue de una aplicación en múltiples servidores

Puede utilizar los parámetros `--generate` y `--upload` para desplegar la misma aplicación en múltiples servidores. Por ejemplo, el siguiente archivo de procesamiento por lotes generaría una aplicación a partir de `myapp.axp` y la subiría a tres servidores diferentes:

```batch
"C:\Program Files\AppGini\AppGini" --generate C:\projects\myapp.axp --upload https://server1.com/myapp
"C:\Program Files\AppGini\AppGini" --open C:\projects\myapp.axp --upload https://server2.com/myapp
"C:\Program Files\AppGini\AppGini" --open C:\projects\myapp.axp --upload https://server3.com/myapp
```

Solo necesitamos generar la aplicación una vez, luego abrir el archivo de proyecto y subirlo a cada servidor.
