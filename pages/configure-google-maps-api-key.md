---
title: ¿Cómo obtener una clave API de Google Maps?
linkTitle: Clave API de Google Maps
slug: help/configure-google-maps-api-key
description: Aprenda cómo obtener una clave API de Google Maps para habilitar la compatibilidad con Google Maps en sus aplicaciones AppGini.
keywords: google maps, clave api, appgini, google cloud console
---

# ¿Cómo obtener una clave API de Google Maps?

> **TLDR;** Para habilitar la [compatibilidad con Google Maps](application-features/input-types.md#google-map) en sus aplicaciones AppGini, necesita habilitar Maps Embed API y Maps
> Static API en su consola de Google Cloud, crear una clave API y copiarla en AppGini. También debería
> [restringir la clave](https://developers.google.com/maps/documentation/javascript/get-api-key#restrict_key) a la IP/dominio de su servidor para evitar abusos.

Obtener una clave API de Google puede ser bastante desafiante debido a la interfaz compleja y en constante cambio de
la consola de Google Cloud. Por lo tanto, enumeramos los pasos específicos en detalle para que pueda comenzar rápidamente.

A continuación se detallan los pasos para obtener una clave API de Google Maps (última actualización el 22 de octubre de 2019).

> **Nota:** Necesita una cuenta de Google para continuar. Si no tiene una, primero debe crear una (es gratis).

1. Vaya al [panel de control de Google Cloud Console](https://console.cloud.google.com/home/dashboard) e inicie sesión con sus credenciales de Google si es necesario.

2. Seleccione el proyecto predeterminado u otro diferente del menú desplegable en la parte superior izquierda (o cree uno nuevo).
     ![Seleccionar proyecto](https://cdn.bigprof.com/screencasts/google-cloud-platform-dashboard-with-default-project-selected.png "Seleccionar proyecto")

3. Abra el menú **API y servicios** a la izquierda y haga clic en **Biblioteca**.

    ![API y servicios -> Biblioteca](https://cdn.bigprof.com/screencasts/gcp-apis-and-services-menu-library.png "API y servicios -> Biblioteca")

4. En la página siguiente, escriba *maps embed* en el cuadro de búsqueda. Esto debería mostrar algunos resultados como este:

	![Buscar Maps Embed API](https://cdn.bigprof.com/screencasts/gcp-api-library-search-for-maps-embed.png "Buscar Maps Embed API")

5. Haga clic en **Maps Embed API** y luego haga clic en el botón **Habilitar**:

	![Habilitar Maps Embed API](https://cdn.bigprof.com/screencasts/gcp-api-library-maps-embed-api-enable.png "Habilitar Maps Embed API")

6. Si todo va bien, debería ver la página de métricas de **Maps Embed API**:

    ![Métricas de Maps Embed API](https://cdn.bigprof.com/screencasts/gcp-maps-embed-api-metrics.png "Métricas de Maps Embed API")

7. Haga clic en el botón de "hamburguesa" en la parte superior izquierda de la página para abrir el menú de navegación izquierdo. Desde allí, abra **API y servicios** y haga clic en **Biblioteca**:

	![API y servicios -> Biblioteca](https://cdn.bigprof.com/screencasts/gcp-maps-embed-api-navmenu-apis-and-services-library.png "API y servicios -> Biblioteca")

8.  Esto debería volver a abrir la página de búsqueda de API. Escriba *maps static* en el cuadro de búsqueda, luego haga clic en **Maps Static API** y habilítela.

9.  A continuación, abra el menú de navegación » **API y servicios** » **Credenciales**:

	![API y servicios -> Credenciales](https://cdn.bigprof.com/screencasts/gcp-apis-and-services-credentials-menu.png "API y servicios -> Credenciales")

10. En la página de credenciales, haga clic en el botón **Crear credenciales** y seleccione **Clave API** del menú:

	![Crear clave API](https://cdn.bigprof.com/screencasts/gcp-apis-and-services-credentials-create-api-key.png "Crear clave API")

11. Debería ver un cuadro de diálogo que contiene su clave API, similar a este:

	![Cuadro de diálogo de clave API](https://cdn.bigprof.com/screencasts/gcp-apis-and-services-api-key-created.png "Cuadro de diálogo de clave API")

12. Google permite una cuota de uso gratuito que es lo suficientemente generosa para la mayoría de las aplicaciones pequeñas. Le recomendamos encarecidamente que elija
    [**Restringir clave**](https://developers.google.com/maps/documentation/javascript/get-api-key#restrict_key)
	y siga las instrucciones para limitar el uso de la clave a la IP/dominio de su servidor para evitar que alguien robe
	y abuse de su clave, causando costos innecesarios.

Su clave API finalmente está lista para copiar y usar en sus aplicaciones AppGini. Para hacerlo, inicie sesión en su aplicación AppGini como superadministrador,
luego vaya al **Área de administración** » menú **Utilidades** » **Configuración de administración**. En la pestaña **Aplicación**, pegue su clave API en el
campo **Clave API de Google Maps** y guarde la configuración.

![Pegar clave API en AppGini](https://cdn.bigprof.com/images/google-maps-api-key-setting.png "Pegar clave API en AppGini")
