---
title: How to obtain a Google Maps API key?
linkTitle: Google Maps API key
slug: help/configure-google-maps-api-key
description: Learn how to obtain a Google Maps API key to enable Google Maps support in your AppGini apps.
keywords: google maps, api key, appgini, google cloud console
---

# How to obtain a Google Maps API key?

> **TLDR;** To enable [Google Maps support](application-features/input-types.md#google-map) in your AppGini apps, you need to enable Maps Embed API and Maps 
> Static API in your Google Cloud console, create an API key and copy it to AppGini.

Obtaining a Google API key can be quite challenging due to the complex, ever-changing interface of 
Google Cloud console. So, we are listing the specific steps in detail to get you started quickly.

Following are the steps to obtain a Google Maps API key (last updated October 22, 2019).

> **Note:** You need a Google account to proceed. If you don't have one, you should create one first (it's free).

1. Go to [Google Cloud Console dashboard](https://console.cloud.google.com/home/dashboard) and sign in with your Google credentials if needed.

2. Select the default project or a different one from the drop-down on the top left (or create a new one). 
     ![Select project](https://cdn.bigprof.com/screencasts/google-cloud-platform-dashboard-with-default-project-selected.png "Select project")

3. Open **APIs & Services** menu on the left and click on **Library**. 

    ![APIs & Services -> Library](https://cdn.bigprof.com/screencasts/gcp-apis-and-services-menu-library.png "APIs & Services -> Library")

4. In the next page, type *maps embed* in the search box. This should display some results like so: 

	![Search for Maps Embed API](https://cdn.bigprof.com/screencasts/gcp-api-library-search-for-maps-embed.png "Search for Maps Embed API")

5. Click on **Maps Embed API** and then click **Enable** button: 

	![Enable Maps Embed API](https://cdn.bigprof.com/screencasts/gcp-api-library-maps-embed-api-enable.png "Enable Maps Embed API")

6. If all goes fine, you should see the **Maps Embed API** metrics page: 

    ![Maps Embed API metrics](https://cdn.bigprof.com/screencasts/gcp-maps-embed-api-metrics.png "Maps Embed API metrics")

7. Click the "hamburger" button at the top left of the page to open the left navigation menu. From there, open **APIs & Services** and click **Library**: 

	![APIs & Services -> Library](https://cdn.bigprof.com/screencasts/gcp-maps-embed-api-navmenu-apis-and-services-library.png "APIs & Services -> Library")

8.  This should re-open the API search page. Type *maps static* in the search box, then click **Maps Static API** and enable it.

9.  Next, open the navigation menu » **APIs & Services** » **Credentials**: 

	![APIs & Services -> Credentials](https://cdn.bigprof.com/screencasts/gcp-apis-and-services-credentials-menu.png "APIs & Services -> Credentials")

10.  In the credentials page, click the button **Create credentials** and select **API key** from the menu: 

	![Create API key](https://cdn.bigprof.com/screencasts/gcp-apis-and-services-credentials-create-api-key.png "Create API key")

11.  You should see a dialog containing your API key, similar to this: 
    
	![API key dialog](https://cdn.bigprof.com/screencasts/gcp-apis-and-services-api-key-created.png "API key dialog")

12. Google allows a free usage quota that is generous enough for most small apps. We highly recommend that you choose 
    **Restrict key** and follow the instructions to limit key usage to your server IP/domain to avoid someone stealing 
	and abusing your key, causing unnecessary costs.

Your API key is finally ready to copy and use in your AppGini apps. To do so, sign in to your AppGini app as the super admin, 
then go to the **Admin Area** » **Utilities** menu » **Admin settings**. Under the **Application** tab, paste your API key in the
**Google Maps API key** field and save the settings.

![Paste API key in AppGini](https://cdn.bigprof.com/images/google-maps-api-key-setting.png "Paste API key in AppGini")

