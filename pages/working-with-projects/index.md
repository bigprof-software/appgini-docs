---
title: Proyectos de AppGini
description: Aprenda a trabajar con proyectos de AppGini, crear nuevos proyectos y guardarlos.
keywords: proyectos de appgini, ventana de proyecto de appgini, nuevo proyecto de appgini, explorador de proyectos de appgini, propiedades de proyecto de appgini, trabajar con proyectos
linkTitle: Trabajar con proyectos
slug: help/working-with-projects
---

# Proyectos de AppGini

## ¿Qué es un proyecto de AppGini?

Para crear una aplicación de base de datos web con AppGini, comienza creando un proyecto. En el proyecto, define sus tablas y campos de base de datos, y configura la apariencia y el comportamiento de su aplicación. Una vez que haya terminado de trabajar en su proyecto, puede generar el código PHP para su aplicación haciendo clic en el botón "Generar" en la barra de herramientas o presionando F5. AppGini luego guardará el código generado en una carpeta de su elección. Finalmente, puede implementar los archivos generados en su servidor web.

![El botón Generar en la barra de herramientas.](https://cdn.bigprof.com/appgini-desktop/help/magic-stick.png)

## ¿Cómo inicio un nuevo proyecto?

Para iniciar un nuevo proyecto en AppGini, siga estos pasos:

1. Inicie AppGini.
2. En el menú Archivo, seleccione Nuevo, o haga clic en el icono 'Nuevo proyecto' en la barra de herramientas.
3. Aparecerá una nueva ventana de proyecto, como se muestra a continuación.
4. De forma predeterminada, el proyecto se llama 'new_db'. Para cambiar el nombre, haga clic en el nombre del proyecto en la parte superior de la sección izquierda (el panel del explorador de proyectos), luego presione **` F2 `** y escriba el nuevo nombre.

### El nombre del proyecto

Tenga en cuenta que el nombre del proyecto que especifique en AppGini no tiene que coincidir con el nombre de la base de datos en su servidor. Se usa solo con fines de visualización y se usará como base para el título de la aplicación, que se muestra en la parte superior del panel de propiedades del proyecto (vea la captura de pantalla a continuación) y en la barra de título de la aplicación generada.

> Puede configurar el nombre real de la base de datos y las credenciales durante la configuración de la aplicación generada, lo que se explica en detalle [aquí](/appgini/help/working-with-generated-web-database-application/setup/).

## La ventana del proyecto

![Nueva ventana de proyecto](https://cdn.bigprof.com/appgini-desktop/help/appgini-new-project-24.12.png)

Esta es su área de trabajo. Esta ventana tiene dos secciones: el panel del explorador de proyectos a la izquierda le permite ver los componentes de su proyecto (el proyecto, las tablas y los campos) de una manera jerárquica fácil de navegar. La sección derecha es el panel de propiedades. Cuando hace clic en cualquier elemento en el explorador de proyectos, sus propiedades se muestran en el panel de propiedades.

En la parte inferior de la ventana del proyecto, encontrará el cuadro de búsqueda del proyecto. Puede usar este cuadro para encontrar rápidamente cualquier elemento en su proyecto escribiendo algunos caracteres de su nombre.

## ¿Cómo guardo un proyecto?

En la versión profesional de AppGini, los proyectos se pueden guardar como archivos de proyecto, con la extensión `.axp`. Puede abrirlos más tarde para continuar trabajando en su proyecto o modificarlo. La versión gratuita puede abrir archivos de proyecto pero no puede guardar cambios en ellos.

Para guardar un proyecto, haga clic en el icono 'Guardar' en la barra de herramientas o presione **` Ctrl `** + **` S `**. Se le pedirá que elija una ubicación para guardar su archivo de proyecto si no lo ha guardado antes. También puede guardar su proyecto seleccionando 'Guardar' en el menú Archivo.

> Nota: Guardar un archivo de proyecto no guarda los archivos de la aplicación generada. Para guardar los archivos de la aplicación generada, debe hacer clic en el botón 'Generar' en la barra de herramientas o presionar **` F5 `**.

## Guardado automático de proyectos

Puede configurar AppGini para que guarde automáticamente su proyecto cada pocos minutos. Para hacer esto, haga clic en el icono 'Preferencias de AppGini' en la barra de herramientas, luego marque la opción 'Intervalo de guardado automático (minutos)' y especifique el intervalo en minutos.

## Abrir un proyecto existente

Cuando inicie AppGini, verá el cuadro de diálogo '¿Cómo desea comenzar?'. Puede elegir iniciar un nuevo proyecto, abrir un proyecto existente o abrir el último proyecto. Si no ve este cuadro de diálogo, significa que lo deshabilitó antes. Puede habilitarlo nuevamente marcando la opción 'Mostrar cómo desea comenzar' en el cuadro de diálogo 'Preferencias de AppGini'.

También puede abrir un proyecto existente seleccionando 'Abrir' en el menú Archivo o haciendo clic en el icono 'Abrir proyecto' en la barra de herramientas. Luego, navegue a la ubicación de su archivo de proyecto y selecciónelo.

## Avanzado: El formato del archivo de proyecto

Los archivos de proyecto de AppGini tienen la extensión `.axp`. Son archivos XML que almacenan toda la información sobre su proyecto, incluidas las tablas, los campos y sus propiedades, así como la configuración del proyecto. Puede abrir un archivo `.axp` en un editor de texto/código para ver su contenido. También puede realizar modificaciones en el archivo, pero tenga cuidado de no dañarlo, ya que esto podría impedirle abrir el proyecto en AppGini.
