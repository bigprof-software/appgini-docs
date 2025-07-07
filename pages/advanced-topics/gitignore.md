---
title: Archivos de AppGini a ignorar en repositorios git
linkTitle: gitignore
slug: help/advanced-topics/gitignore
description: Archivos de AppGini a ignorar en repositorios git para evitar confirmar archivos innecesarios/inseguros en su repositorio.
keywords: gitignore, git, repositorio, AppGini, archivos, carpetas, ignorar
---

# Archivos de AppGini a ignorar en repositorios git

Si planea [usar un sistema de control de versiones como git para administrar su aplicación AppGini](/appgini/screencasts/how-to-use-git-with-appgini-to-manage-code-changes),
debe ignorar ciertos archivos y carpetas para evitar confirmar archivos innecesarios/inseguros
en su repositorio.

Pero primero, analicemos la forma recomendada de configurar su repositorio para una aplicación AppGini.
Las siguientes instrucciones asumen que está utilizando [git](https://git-scm.com/) como su sistema de control de versiones.
Git es el sistema de control de versiones más popular y es ampliamente utilizado por desarrolladores de todo el mundo.

## Estructura de repositorio recomendada para aplicaciones AppGini

Cuando genera una aplicación AppGini, se le pide que seleccione la carpeta de salida para los archivos generados.
Cuando la aplicación se genera dentro de esa carpeta, creará la siguiente estructura:

```
su-carpeta-de-aplicacion/
	admin/
	hooks/
	images/
	resources/
	templates/
	index.php
	.. # otros archivos
```

Donde `su-carpeta-de-aplicacion` es la carpeta que seleccionó al generar la aplicación.
**No recomendamos crear (inicializar) el repositorio git dentro de esta carpeta.**

La razón es que los datos del repositorio se almacenan en una carpeta `.git` dentro de la carpeta raíz del repositorio.
Esta carpeta podría cargarse en su servidor cuando implemente su aplicación, lo que provocaría la exposición
de los datos de su repositorio al público. Esto es un riesgo de seguridad.

En su lugar, recomendamos configurar la estructura de carpetas de la siguiente manera antes de generar la aplicación:

```
su-carpeta-de-aplicacion/
	app/
```

Luego, genere la aplicación dentro de la carpeta `app`. De esta manera, la carpeta raíz del repositorio será
`su-carpeta-de-aplicacion`, y la carpeta `.git` estará en el nivel raíz, no dentro de la carpeta de la aplicación.
Su estructura de carpetas después de generar la aplicación se verá así:

```
su-carpeta-de-aplicacion/
	app/
		admin/
		hooks/
		images/
		resources/
		templates/
		index.php
		.. # otros archivos
```

Después de inicializar el repositorio git en `su-carpeta-de-aplicacion` usando el comando `git init`, su
estructura de carpetas se verá así:

```
su-carpeta-de-aplicacion/
	.git/
	app/
		admin/
		hooks/
		images/
		resources/
		templates/
		index.php
		.. # otros archivos
```

Luego puede cargar de forma segura el contenido de la carpeta `app` en su servidor, sin exponer los
datos de su repositorio.

## Archivos y carpetas a ignorar en su repositorio git

Algunos archivos y carpetas generados por AppGini no están destinados a ser confirmados en su repositorio.
Esto se debe a que son generados dinámicamente por su aplicación AppGini, o porque contienen información confidencial
como los detalles de conexión a la base de datos.

Para ignorar estos archivos y carpetas, debe crear un archivo `.gitignore` en la raíz de su repositorio
y agregarle las siguientes líneas:

```
# ignorar archivos que contienen información confidencial
app/config.php
app/config.bak.php
app/file-uploader.php
app/admin/backups

# ignorar archivos generados dinámicamente por la aplicación AppGini
app/setup.md5
app/tmp
app/admin/tmp
app/plugins
app/import-csv
!app/import-csv/index.html
!app/import-csv/.htaccess

# ignorar archivos cargados por el usuario
app/images
!app/images/index.html
!app/images/blank.gif

# ignorar otros artefactos comunes
*.log
*.cache
*.zip
```

Esto le dirá a git que ignore los archivos y carpetas enumerados al confirmar cambios en su repositorio.

## CONSEJO: Almacene su archivo de proyecto dentro de su repositorio

Otra ventaja de configurar su repositorio como se describe anteriormente es que puede almacenar su archivo de proyecto AppGini
(el archivo `.axp`) dentro de su repositorio. De esta manera, puede realizar un seguimiento fácil de los cambios
en su archivo de proyecto y revertir a versiones anteriores si es necesario.

Para hacer esto, simplemente copie su archivo `.axp` a la raíz de su repositorio y confírmelo en su repositorio.
La estructura de carpetas de su repositorio se verá así:

```
su-carpeta-de-aplicacion/
	.git/
	app/
		admin/
		hooks/
		images/
		resources/
		templates/
		index.php
		.. # otros archivos
	su-aplicacion.axp
```

Donde `su-aplicacion.axp` es su archivo de proyecto AppGini. Tenga en cuenta que en el ejemplo anterior, el archivo de proyecto
se almacena en la raíz del repositorio, fuera de la carpeta `app`. Esto se recomienda para evitar exponer
su archivo de proyecto al público. El archivo de proyecto contiene toda la estructura y configuración de su base de datos,
por lo que es importante mantenerlo seguro.

## Temas relacionados

* [Uso de git con AppGini para administrar cambios de código](/appgini/screencasts/how-to-use-git-with-appgini-to-manage-code-changes)
