---
title: Internationalization (i18n) and localizing your AppGini app
linkTitle: Internationalization (i18n)
slug: help/application-features/i18n-internationalization
description: Learn how to localize your AppGini app to any language you want, including translating the app interface, table and field names, and more.
keywords: internationalization, i18n, localization, language, translate, translation, localizing, localisation, appgini, app, application, table, field, name, title, interface, detail view, home page, group, title, application title, child table, tab, column, programmatically, access, localized, strings
---

# Internationalization (i18n) and localizing your AppGini app

AppGini applications are internationalization-ready, meaning you can easily localize your app to any language you want. 
This is done by translating the generated `language.php` file, which contains all the strings used in your app interface.

> AppGini provides a built-in translation tool to help you with this task as we'll see below.
> So you should not manually edit the `language.php` file.

In this page, we'll discuss how to localize your AppGini app to a new language. We'll also discuss how
to localize able and field names, which are not included in the `language.php` file.

## Localizing your app interface (`language.php`)

### Downloading a pre-translated language file

AppGini users have contributed translations to many languages. 
These are available for download from the [language files page](https://bigprof.com/appgini/download-language-files).
check that page to see if a translation for your desired language is already available. If it is, you can download it
into your application's main directory, replacing the existing `language.php` file.

As we introduce new features and strings in AppGini, the language file might become incomplete,
so you might need to update it from time to time.

In case you need to translate your app to a language that is not available in the language files page,
or if you need to update an existing translation, you can use the built-in translation tool in AppGini.

### Using the built-in translation tool

Starting with AppGini 22.11, we've added a built-in translation tool to help you translate your app to any language you want.
To use this tool, follow these steps:

1. Sign in to your application as admin.
2. Click the 'Admin area' link at the top of the page.
3. Open the 'Utilities' menu and click 'Translation tool'.

Here is a video showing how to use the translation tool:

<video style="width: 100%; height: auto;" controls>
  <source src="https://cdn.bigprof.com/screencasts/appgini-22.11-translation-tool.mp4" type="video/mp4">
  Your browser does not support the video tag.
</video>

In the above video, we're translating the words 'Admin area' into the Arabic words 'منطقة الإدارة'. 

### Language fallback

If a string is not found in the `language.php` file, AppGini will fall back to the English string,
which is included in the generated `defaultLang.php` file.

## Right to left (RTL) languages

AppGini supports right-to-left (RTL) languages, such as Arabic and Hebrew. 
To enable RTL support in your app, open your application's project file in AppGini,
click the 'Application theme' icon in the toolbar, and check the 'RTL' checkbox.

![Enable RTL support in your app](https://cdn.bigprof.com/images/enable-rtl-layout.png "Enable RTL support in your app")

## Localizing table and field names

The `language.php` file contains strings used in the app interface, such as buttons, labels, and messages.
However, it does not contain table and field names. To localize these, you can open the AXP project file in AppGini,
click on the table or field you want to localize, and enter the localized name in the 'Caption' box.

![Localizing table and field names](https://cdn.bigprof.com/images/localize-table-field-names.png "Localizing table and field names")

## Localizing the detail view (record editing form) title

By default, the title of the detail view (record editing form) is 'Detail view'. You can localize this title
by opening the AXP project file in AppGini, clicking the table you want to localize, and entering the localized
title in the 'Detail view title' box. See the screenshot below:

![How to change the detail view title](https://cdn.bigprof.com/images/detail-view-title.png "How to change the detail view title")

And here is the detail view of the orders table with the localized German title 'Bestelldetails':

![Detail view with localized title](https://cdn.bigprof.com/images/detail-view-localized-title.png "Detail view with localized title")

## Localizing the home page table group titles

AppGini allows you to group similar tables under a common title in the home page.
This makes it easier for users to navigate your app. You can use localized titles for these groups.
To set the table group title:

1. Open the AXP project file in AppGini.
2. Click the table you want to localize.
3. Click the button titled 'Table group' to open the 'Table groups' dialog.
4. Click the table group you want to localize.
5. Press **`F2`** or the 'Rename' button to rename the group.

![Localizing table group titles](https://cdn.bigprof.com/images/localize-table-group-titles.png "Localizing table group titles")

Here is the home page of the app with the table group title localized to Greek:

![Home page with localized table group title](https://cdn.bigprof.com/images/home-page-localized-table-group-title.png "Home page with localized table group title")

> **Note**: After renaming the table group to some non-Latin characters, you might see question marks or other unexpected characters in the group title
> in AppGini. This is a known issue in AppGini and does not affect the actual display of the group title in the app.

## Localizing the application title

The application title is displayed in the browser's title bar and in the top-left corner of the app.
You can set it to a localized title by opening the AXP project file in AppGini, clicking the topmost node
in the project browser tree at the left, then pressing **`F2`** to rename the application. Underscores in the application name
will be replaced with spaces in the displayed title.

Non-Latin characters in the application title would cause an error message and won't be accepted by AppGini.
As a workaround, you can set the application title to a Latin name, then, after generating the app, you can
edit the generated `hooks/header-extras.php` or `hooks/footer-extras.php` and add the following code:

```html
<script>
  const appTitle = 'Διαχειριστής Συντήρησης Ενοικιαζόμενης Περιουσίας';
  document.querySelector('a.navbar-brand').innerHTML = `<i class="glyphicon glyphicon-home"></i> ${appTitle}`;
  document.title = appTitle;
</script>
```

Replace the Greek text in the `appTitle` variable with your localized application title. Here is the result of the above code:

![Home page with localized table group title](https://cdn.bigprof.com/images/home-page-localized-table-group-title.png "Home page with localized table group title")

## Localizing the titles of child tables

When you have a parent table with child tables, for example, a parent table `shippers` with a child table `orders`,
you can configure the `shippers` table to display the child orders as a tab in the detail view as shown below:

![Child table as a tab in the detail view](https://cdn.bigprof.com/images/child-table-as-tab.png "Child table as a tab in the detail view")

You can also display the count of child orders as a column in the parent shippers table as shown below:

![Child table count as a column in the parent table](https://cdn.bigprof.com/images/child-table-count-as-column.png "Child table count as a column in the parent table")

For both of the above screenshots, the title of the child orders table is set as 'Orders via shipper'. We can localize this title
by opening the AXP project file in AppGini, clicking the parent table (in this case, `shippers`), then clicking the **Parent/children settings**
button to open the **Parent/children settings** dialog.

![Opening the parent/children settings dialog](https://cdn.bigprof.com/images/parent-children-settings.png "Opening the parent/children settings dialog")

Click the desired child table from the grid at the left if not already selected, then enter the localized title in the **Tab/Column title** box.

> **Note**: If the title contains non-Latin characters, you might see question marks or other unexpected characters in the title in the grid.
> This is a known issue in AppGini and does not affect the actual display of the title in the app.

## Programmatically accessing localized strings

You can access localized strings in your hooks using the PHP variable `$Translation`. This is an associative array
where the keys are English strings/short codes and the values are the localized strings. This variable is defined
in `language.php` and can be made available inside any PHP hook function by including the following line at the top of the function:

```php
global $Translation;
```

You can then access any localized string by its English string/short code as follows:

```php
echo $Translation['last modified']; // --> 'zuletzt geändert' in German
```

You can also access localized strings using the `AppGini.Translate._map` JavaScript object. For example:

```javascript
console.log(AppGini.Translate._map['last modified']); // --> 'zuletzt geändert' in German
```


