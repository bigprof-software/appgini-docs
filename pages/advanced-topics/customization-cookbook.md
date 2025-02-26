---
title: Customization Cookbook 
linkTitle: Customization Cookbook
slug: help/advanced-topics/customization-cookbook
keywords: customization, cookbook, recipes, hooks, footer-extras.php, tablename-dv.js
description: Quick recipes for common customizations.
---

# Customization Cookbook

This page contains quick recipes for common customizations that you can apply to your AppGini applications. This is a dynamic page that will be updated with new recipes over time.
So, bookmark this page and check back often!

## Disable the detail view layout buttons

Add the following code to `hooks/footer-extras.php` to disable the detail view layout buttons (the buttons that allow users to switch single, double, and triple column layouts in the detail view) in all tables:

```html
<script>AppGini.renderDVLayoutToolbar = () => {};</script>
```

If you'd like to disable the layout buttons only in certain tables, you can instead create the file `hooks/tablename-dv.js` if it doesn't already exist (replace `tablename` with the actual name of the table), and add the following code to it:

```js
AppGini.renderDVLayoutToolbar = () => {};
```

## Change the clickable icon for links in a table

If you want to change the clickable icon for links in a specific table and avoid having to manually update the icon after every project build, you can use the following solution. Create a file named `tablename-tv.js` in the `hooks` folder (replace `tablename` with the actual name of the table containing the link field), and add the following JavaScript code to it:

```js
$j(() => {
   $j('.tablename-fieldname .glyphicon').removeClass('glyphicon-globe').addClass('glyphicon-shopping-cart');
});
```

Replace `tablename` with the name of your table and `fieldname` with the name of your link field. This code changes the default globe icon (`glyphicon-globe`) to a shopping cart icon (`glyphicon-shopping-cart`). 

By placing this code in the `hooks` folder, your changes will persist even if you regenerate the app later.

