---
title: Input types supported by AppGini
linkTitle: Input types
slug: help/application-features/input-types
description: Learn about the different input types supported by AppGini, and how to create fields of each type.
keywords: input types, textbox, text area, rich area, checkbox, radio buttons, drop-down list, multi-select list, date, date and time, time, file upload, image upload, google map, youtube video, read-only
---

# Input types supported by AppGini

AppGini supports a variety of input types for fields in your tables. This page lists the supported input types and provides a brief description of each.
The screenshot below shows a sample detail view form with fields of different input types:

![Sample detail view form with fields of different input types](https://cdn.bigprof.com/images/input-types-dv-3-col.png "Sample detail view form with fields of different input types")

And this screenshot shows the corresponding table view:

![Sample table view with fields of different input types](https://cdn.bigprof.com/images/input-types-tv.png "Sample table view with fields of different input types")

Let's now go through the supported input types.

## Textbox

This is the most common input type. It allows users to enter text, numbers, or any other data. Here is a screenshot of a textbox field in a detail view form:

![Textbox field in a detail view form](https://cdn.bigprof.com/images/input-types-dv-textbox.png "Textbox field in a detail view form")

And here is a screenshot of a textbox field in a table view:

![Textbox field in a table view](https://cdn.bigprof.com/images/input-types-tv-textbox.png "Textbox field in a table view")

To create a textbox field, set the data type of your field to `Char`, `Varchar`, or any numeric type.
For `Char` and `Varchar` fields, you can specify the maximum length of the text that can be entered in the field.

## Text area

This input type is similar to the textbox, but it allows users to enter multiple lines of text. Here is a screenshot of a textarea field in a detail view form:

![Text area field in a detail view form](https://cdn.bigprof.com/images/input-types-dv-textarea.png "Text area field in a detail view form")

And here is a screenshot of a textarea field in a table view:

![Text area field in a table view](https://cdn.bigprof.com/images/input-types-tv-textarea.png "Text area field in a table view")

To create a textarea field, set the data type of your field to `Text`, `Tiny text`, `Medium text` or `Long text`, and check the **Text area** checkbox in the field properties.

> **Note**: You could also use the `Blob` data type and its variants to store large text data, but this is not recommended for text data, as it's less efficient than using the `Text` data types.

## Rich (HTML) area

This input type allows users to enter rich text, including formatted text, images, links, etc. Here is a screenshot of a rich area field in a detail view form:

![Rich area field in a detail view form](https://cdn.bigprof.com/images/input-types-dv-richtext.png "Rich area field in a detail view form")

And here is a screenshot of a rich area field in a table view:

![Rich area field in a table view](https://cdn.bigprof.com/images/input-types-rich-html-area.png "Rich area field in a table view")

To create a rich area field, set the data type of your field to `Text`, `Tiny text`, `Medium text` or `Long text`, and check the **Rich (HTML) area** checkbox in the field properties.

***TIP:*** If you name your field `description`, `comments`, `notes` or `details`, AppGini will automatically set the data type to `Text` and check the **Rich (HTML) area** checkbox for you.

## Checkbox

This input type allows users to check or uncheck a box. The text displayed next to the checkbox can be customized by setting the **Caption** property of the field. 
Here is a screenshot of a checkbox field in a detail view form:

![Checkbox field in a detail view form](https://cdn.bigprof.com/images/input-types-dv-checkbox.png "Checkbox field in a detail view form")

And here is a screenshot of a checked checkbox field in a table view:

![Checked checkbox field in a table view](https://cdn.bigprof.com/images/input-types-tv-checkbox.png "Checked checkbox field in a table view")

To create a checkbox field, check the **Check box** option in the field properties.

## Radio buttons

This input type allows users to select one option from a list of options.
Here is a screenshot of a radio buttons field in a detail view form:

![Radio buttons field in a detail view form](https://cdn.bigprof.com/images/input-types-dv-radio-buttons.png "Radio buttons field in a detail view form")

And here is a screenshot of a radio buttons field in a table view:

![Radio buttons field in a table view](https://cdn.bigprof.com/images/input-types-tv-radio-buttons.png "Radio buttons field in a table view")

Radio buttons can be created in two ways:

1. Under the **Options list** tab in the field properties, enter the options you want to display as radio buttons in the **List values** box, separated by double semicolons (`;;`).
   For example, to create a radio buttons field with options `Yes` and `No`, enter `Yes;;No` in the **List values** box. Below the **List values** box, 
   choose the **Radio buttons** option from the **Display the options as** property.

     **Hint:** The **Quick List** drop-down to the right of the **List values** box allows you to quickly add common options like months, days of the week, US states, etc.

2. If you have a table in your project that contains the options you want to display as radio buttons, you can link the field to that table. 
   To do this, go to the **Lookup field** tab in the field properties, and select the parent table and field that contains the options you want to display as radio buttons.
   Then, check the **Show as radio buttons** option.

   Please beware that this method is not suitable for large tables, as it will load all the records in the parent table to display the radio buttons,
   which can result in a huge form, as well as performance issues.

## Drop-down list

This input type allows users to select one option from a list of options. The list of options can be static (entered manually inside AppGini) or dynamic (fetched from a table in your application).
Here is a screenshot of a closed drop-down list field in a detail view form:

![Drop-down list field in a detail view form](https://cdn.bigprof.com/images/input-types-dv-drop-down-closed.png "Drop-down list field in a detail view form")

And here is a screenshot of an open drop-down list field in a detail view form:

![Drop-down list field in a detail view form](https://cdn.bigprof.com/images/input-types-dv-drop-down-open.png "Drop-down list field in a detail view form")

And here is how the drop-down list field looks in a table view:

![Drop-down list field in a table view](https://cdn.bigprof.com/images/input-types-tv-drop-down.png "Drop-down list field in a table view")

Drop-down list fields can be created in two ways:

1. Under the **Options list** tab in the field properties, enter the options you want to display in the drop-down list in the **List values** box, separated by double semicolons (`;;`).
   For example, to create a drop-down list field with options `Yes` and `No`, enter `Yes;;No` in the **List values** box. Below the **List values** box, 
   choose the **Drop-down list** option from the **Display the options as** property.

     **Hint:** The **Quick List** drop-down to the right of the **List values** box allows you to quickly add common options like months, days of the week, US states, etc.

2. If you have a table in your project that contains the options you want to display in the drop-down list, you can link the field to that table. 
   To do this, go to the **Lookup field** tab in the field properties, and select the parent table and field that contains the options you want to display in the drop-down list.
   
If the drop-down list contains more than a few options, a search box will be displayed at the top of the list to help users quickly find the desired option.

## Multi-select list

This input type allows users to select multiple options from a list of options.
Here is a screenshot of a closed multi-select list field in a detail view form:

![Multi-select list field in a detail view form](https://cdn.bigprof.com/images/input-types-dv-multiple-choice-drop-down-closed.png "Multi-select list field in a detail view form")

And here is a screenshot of an open multi-select list field in a detail view form:

![Multi-select list field in a detail view form](https://cdn.bigprof.com/images/input-types-dv-multiple-choice-drop-down-open.png "Multi-select list field in a detail view form")

And here is how the multi-select list field looks in a table view:

![Multi-select list field in a table view](https://cdn.bigprof.com/images/input-types-tv-multiple-choice-drop-down.png "Multi-select list field in a table view")

Multi-select list fields can be created under the **Options list** tab in the field properties. Enter
the options you want to display in the multi-select list in the **List values** box, separated by double semicolons (`;;`).
Make sure the data type of the field is set to `Text` (or any of its variants).

## Date

This input type allows users to select a date from a calendar. Here is a screenshot of a date field in a detail view form:

![Date field in a detail view form](https://cdn.bigprof.com/images/input-types-dv-date-pickup-closed.png "Date field in a detail view form")

And here is a screenshot of the date picker in an open state:

![Date field in a detail view form](https://cdn.bigprof.com/images/input-types-dv-date-pickup-open.png?2 "Date field in a detail view form")

And here is how the date field looks in a table view:

![Date field in a table view](https://cdn.bigprof.com/images/input-types-tv-date.png)

To create a date field, set the data type of your field to `Date`. If you name a field 
anything that ends with `date`, it will automatically be set to the `Date` data type.

To set the date format, you can do so under the **Localization settings** in the project properties.

## Date and time

This input type allows users to select a date and time from a calendar. Here is a screenshot of a date and time field in a detail view form:

![Date and time field in a detail view form](https://cdn.bigprof.com/images/input-types-dv-datetime-pickup-closed.png "Date and time field in a detail view form")

And here is a screenshot of the date and time picker in an open state:

![Date and time field in a detail view form](https://cdn.bigprof.com/images/input-types-dv-datetime-pickup-open.png "Date and time field in a detail view form")

And here is how the date and time field looks in a table view:

![Date and time field in a table view](https://cdn.bigprof.com/images/input-types-tv-datetime.png "Date and time field in a table view")

To create a date and time field, set the data type of your field to `Datetime`.

To set the date and time format, you can do so under the **Localization settings** in the project properties.

## Time

This input type allows users to select a time from a dropdown list. Here is a screenshot of a time field in a detail view form:

![Time field in a detail view form](https://cdn.bigprof.com/images/input-types-dv-time-pickup-closed.png "Time field in a detail view form")

And here is a screenshot of the time picker in an open state:

![Time field in a detail view form](https://cdn.bigprof.com/images/input-types-dv-time-pickup-open.png "Time field in a detail view form")

And here is how the time field looks in a table view:

![Time field in a table view](https://cdn.bigprof.com/images/input-types-tv-time.png "Time field in a table view")

To create a time field, set the data type of your field to `Time`. If you name a field
`time`, it will automatically be set to the `Time` data type.

To set the time format, you can do so under the **Localization settings** in the project properties.

## File upload

This input type allows users to upload files. Here is a screenshot of a file upload field in a detail view form:

![File upload field in a detail view form](https://cdn.bigprof.com/images/input-types-dv-file-upload.png "File upload field in a detail view form")

And here is a screenshot of a file upload field in a table view:

![File upload field in a table view](https://cdn.bigprof.com/images/input-types-tv-file.png "File upload field in a table view")

To create a file upload field, set the data type of your field to `Varchar` or `Char`. Then, under the **Media** tab in the field properties,
select the **File upload** option. This should open the **File upload options** dialog (you can open it later by clicking the **Configure** button in the **Media** tab).

This is how the **File upload options** dialog looks like:

![File upload options dialog](https://cdn.bigprof.com/images/file-upload-options-dialog.png "File upload options dialog")

In this dialog, you can specify the maximum file size allowed for upload, the allowed file types, and other options.

## Image upload

This input type allows users to upload images. Here is a screenshot of an image upload field in a detail view form:

![Image upload field in a detail view form](https://cdn.bigprof.com/images/input-types-dv-image.png "Image upload field in a detail view form")

And here is a screenshot of an image upload field in a table view:

![Image upload field in a table view](https://cdn.bigprof.com/images/input-types-tv-image.png "Image upload field in a table view")

To create an image upload field, set the data type of your field to `Varchar` or `Char`. Then, under the **Media** tab in the field properties,
select the **Image** option. This should open the **Image options** dialog (you can open it later by clicking the **Configure** button in the **Media** tab).

This is how the **Image options** dialog looks like:

![Image options dialog](https://cdn.bigprof.com/images/image-options-dialog.png "Image options dialog")

In this dialog, you can specify the maximum file size allowed for upload, thumbnail dimensions, zoom behavior, and other options.

If you name a field `image`, `photo` or `picture`, it will automatically be set as an image upload field.

## Google Map

This input type displays a Google map in the detail view. The map is interactive and allows users to zoom in and out, as well as move around.
Here is a screenshot of a Google Map field in a detail view form:

![Google Map field in a detail view form](https://cdn.bigprof.com/images/input-types-dv-google-map-24.18.png "Google Map field in a detail view form")

In the table view, as well as print view, the Google Map field displays a static map image:

![Google Map field in a table view](https://cdn.bigprof.com/images/input-types-tv-google-map.png "Google Map field in a table view")

In AppGini, you can configure the Google Map field to obtain the location from a Google Maps URL provided by the user.

In AppGini 24.18 and later, you can also configure the Google Map field to obtain the location of the user's device using the browser's geolocation API.
In this case, the field will display a map with a marker at the user's current location:

![Google Map field with user's current location](https://cdn.bigprof.com/images/input-types-dv-google-map-with-user-location-24.18.png "Google Map field with user's current location")

You can configure user location capture to take place automatically when the record is created and/or updated, or manually when the user clicks a button.

[Learn more about configuring Google Map fields in your AppGini project](../working-with-projects/media-tab.md#google-maps).

## YouTube video

This input type allows users to paste a YouTube video URL to display the video. Here is a screenshot of a YouTube video field in a detail view form:

![YouTube video field in a detail view form](https://cdn.bigprof.com/images/input-types-dv-youtube.png "YouTube video field in a detail view form")

And here is a screenshot of a YouTube video field in a table view:

![YouTube video field in a table view](https://cdn.bigprof.com/images/input-types-tv-youtube.png "YouTube video field in a table view")

To create a YouTube video field, set the data type of your field to `Varchar` or `Char` with a length of at least 200 characters. Then, under the **Media** tab in the field properties,
select the **YouTube video** option. This should open the **YouTube video options** dialog (you can open it later by clicking the **Configure** button in the **Media** tab).

This is how the **YouTube video options** dialog looks like:

![YouTube video options dialog](https://cdn.bigprof.com/images/youtube-video-options-dialog.png "YouTube video options dialog")

## Read-only

This is not exactly an input type, but it allows you to display a field in a read-only mode.
This is useful when you want to display a field that should not be edited by users. 

To create a read-only field, check the **Read-only** option in the field properties.

Here is a screenshot of a read-only field in a detail view form:

![Read-only field in a detail view form](https://cdn.bigprof.com/images/input-types-dv-read-only.png "Read-only field in a detail view form")

## Conclusion

AppGini supports a variety of input types for fields in your tables. This allows you to create rich and interactive forms that meet many different use cases.
You can mix and match these input types to create forms that are easy to use and provide a great user experience.

