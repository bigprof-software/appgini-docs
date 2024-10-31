---
title: The Media Tab
linkTitle: The Media Tab
slug: help/working-with-projects/media-tab
description: Learn how to configure your field to be displayed as a web-link, an image, a file, a google map or even a YouTube video.
keywords: media tab, link, image, file upload, google map, youtube video, geolocation, google maps api key
---

# The Media Tab

This tab allows you to configure your field to be displayed as a web-link, an image, a file, a google map or even a YouTube video.

## Link option

Configure the way your field behaves when clicked. It can be configured to open the detail view of the current record, a URL, an email link, or not be clickable at all.

![Link option](https://cdn.bigprof.com/appgini-desktop/help/appgini-5.40/link_appgini.png)

If you configure the field to display as a web-link and the user clicks that field, the link is opened in a new window.

![Link as displayed in the table view](https://cdn.bigprof.com/appgini-desktop/help/appgini-5.40/link-browser.png)

## The Image option

This option allows you to configure the field to be displayed as an image. You can allow users to upload jpg, jpeg, gif and png images. You can also configure the maximum allowed file size.

![Image option](https://cdn.bigprof.com/appgini-desktop/help/appgini-5.40/image_appgini.png)

You can choose how to display the image. It can be displayed as a zoomable thumbnail image in the table and detail view. You can also configure the thumbnail size.

This is an example of how the image is displayed in the detail view.

![Image thumbnail in the detail view](https://cdn.bigprof.com/appgini-desktop/help/appgini-5.40/image_detail_view.png)

And this is how the image is displayed in the table view.

![Image thumbnail in the table view](https://cdn.bigprof.com/appgini-desktop/help/appgini-5.40/image_field_tv.png)

## The File upload option

This option allows the user to upload many different file types. You can configure the field to be displayed as the field content, clickable icon or contents of another page.

![File upload option](https://cdn.bigprof.com/appgini-desktop/help/appgini-5.40/file_upload_appgini.png)

This is how the file upload field is displayed in the detail view.

![File upload field in the detail view](https://cdn.bigprof.com/appgini-desktop/help/appgini-5.40/file_upload_dv.png)

You can configure the field to be displayed as the field content, clickable icon or contents of another field.

![File upload field in the table view](https://cdn.bigprof.com/appgini-desktop/help/appgini-5.40/file_upload_browser.png)

## Google Maps

Google Map fields allow you to display a Google map in your application.

![Google Map field in a detail view form](https://cdn.bigprof.com/images/input-types-dv-google-map-24.18.png "Google Map field in a detail view form")


To create a Google Map field, set the data type of your field to `Varchar` or `Char` with a length of at least 200 characters. Then, under the **Media** tab in the field properties, select the **Google Map** option. This should open the **Google Map options** dialog (you can open it later by clicking the **Configure** button in the **Media** tab).

![Google Map option](https://cdn.bigprof.com/images/google-map-dialog-24.18.png "Google Map option")

> ***Note!*** Google Map fields require a [Google API key](../configure-google-maps-api-key.md) to work correctly. You can enter your Google API key in the **Admin settings** page of your application by following the steps below:
>
> 1. Sign in to your application as the super admin.
> 2. Go to the **Admin area** » **Utilities** menu » **Admin settings**.
> 3. Under the **Application** tab, enter your Google Maps API key in the **Google API key** field.
> 
>    ![Google Maps API key setting](https://cdn.bigprof.com/images/google-maps-api-key-setting-24.18.png "Google Maps API key setting")
>
>  If, instead of the Google map, you see an error message like *"Google Maps Platform rejected your request..."*, you need to provide a [correctly configured Google Maps API key](../configure-google-maps-api-key.md).

### Map behavior and location options

When configuring a field to display a Google map, the following options are available for setting up map behavior and location:

#### 1. Map from URL

Displays a map using a user-provided URL.

![Google Map field in a detail view form, based on a user-provided URL](https://cdn.bigprof.com/images/input-types-dv-google-map-24.18.png "Google Map field in a detail view form, based on a user-provided URL")

#### 2. Map with a pin of the user location at the time of saving a new record

Automatically pins the user's location when a new record is saved.

![Google Map field with user's current location](https://cdn.bigprof.com/images/input-types-dv-google-map-with-user-location-24.18.png "Google Map field with user's current location")

#### 3. Map with a pin of the user location at the time of saving a new or existing record

Same as the previous option, but also shows the user's location when saving an existing record.

#### 4. Map with a pin of the user location only if the user clicks *Capture my location*

Shows a pin only when the user chooses to capture their location manually.
   
![Google Map field with user's current location, captured manually](https://cdn.bigprof.com/images/input-types-dv-google-map-with-user-location-manual-24.18.png "Google Map field with user's current location, captured manually")

> Options 2, 3, and 4 were introduced in AppGini 24.18. They require the user's consent to access their location. If the user denies access, the map will not show their location.

### Map View Configuration

#### Table View (Thumbnail)

In the table view, the map field is displayed as a thumbnail image (static map). For option 1, the thumbnail map is generated from the URL provided by the user, without a pin/marker. For options 2, 3, and 4, the thumbnail map shows the user's location at the time of saving the record, with a pin/marker.

![Google Map field in the table view, showing a thumbnail map](https://cdn.bigprof.com/images/input-types-tv-google-map-24.18.png "Google Map field in the table view, showing a thumbnail map")

- **Width in pixels**: Set the width of the thumbnail map shown in the table view. Default is `50` pixels.
- **Height in pixels**: Set the height of the thumbnail map in the table view. Default is `50` pixels.

#### Detail View (Interactive Map)

- **Width**: Width is set automatically for the interactive map in the detail view to fit the available space.
- **Height in pixels**: Set the height of the interactive map shown in the detailed record view. Default is `360` pixels.

### Forcing the capture of the user's location

If you want to force the capture of the user's location when saving a new or existing record, set the Google map field as **Required** in AppGini. This will ensure that the user's location is captured before the record is saved.
If the user denies access to their location, an error message will be displayed, and the record will not be saved.

## YouTube video

This field accepts a YouTube URL and displays it as a movie in the detail view.

![YouTube video option](https://cdn.bigprof.com/appgini-desktop/help/appgini-5.40/youtube_field_appgini.png)

You can configure how to display the YouTube video in the detail view and the table view. Here is an example of how the YouTube video is displayed in the detail view.

![YouTube video in the detail view](https://cdn.bigprof.com/appgini-desktop/help/appgini-5.40/youtube_field_dv.png)

And this is how the YouTube video is displayed in the table view.

![YouTube video in the table view](https://cdn.bigprof.com/appgini-desktop/help/appgini-5.40/youtube_field_tv.png)


