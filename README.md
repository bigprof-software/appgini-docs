# Documentación de AppGini

Este repositorio contiene los archivos fuente (en formato Markdown) utilizados para la [documentación de AppGini](https://bigprof.com/appgini/help).

[AppGini](https://bigprof.com/appgini/) es un entorno de desarrollo de aplicaciones web que reduce drásticamente el tiempo y el esfuerzo necesarios para crear aplicaciones web basadas en datos.
Permite crear aplicaciones web basadas en datos sin tener que escribir ningún código. Puede utilizarlo para crear aplicaciones web personalizadas para
gestionar sus datos, sus procesos y sus clientes.

## Formato del documento

La documentación está escrita en formato Markdown extendido. Cada página es un archivo Markdown independiente en el directorio `pages`.
Este directorio contiene subdirectorios para cada sección de la documentación, como `working-with-projects`, `advanced-topics`, etc.
El archivo `index.md` de cada subdirectorio es la página principal de esa sección.

La *información preliminar* (front matter) se utiliza para especificar diversa información sobre cada página. Actualmente, los campos de información preliminar admitidos son:

* `title`: El título de la página (aplicado a la etiqueta `<title>` en el HTML generado, así como al encabezado de la página).
* `description`: Una breve descripción del contenido de la página, aplicada a la etiqueta `<meta name="description">` en el HTML generado.
* `keywords`: Una lista de palabras clave separadas por comas para la página, aplicada a la etiqueta `<meta name="keywords">` en el HTML generado.
* `linkTitle`: El título de la página tal como *debería* aparecer en el menú TDC (Tabla de Contenidos). Normalmente, esta es una versión más corta del campo `title`.
* `slug`: La URL de la página, relativa a la raíz de la documentación. Por ejemplo, `help/working-with-projects`.

En general, la información preliminar sigue las mismas reglas del [generador de sitios estáticos Hugo](https://gohugo.io/content-management/front-matter/),
aunque Hugo no se utiliza para generar esta documentación. Solo se admite el dialecto yaml de la información preliminar.

## Contribuir

Si desea contribuir a la documentación, por favor, haga un fork de este repositorio, realice sus cambios y envíe una pull request.
