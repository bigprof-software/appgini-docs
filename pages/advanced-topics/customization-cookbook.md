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


## Prepend a currency symbol to amount fields in the table view

If you'd like to prepend a currency symbol (e.g., ₹ for Indian Rupee) to amount fields in the table view of your AppGini application, you can use CSS for a simple solution. This method is more user-friendly than using **Data format** tab in AppGini and editing the `dataFormats.cfg` file and allows you to customize the display without affecting your database queries.

Open the generated `hooks/footer-extras.php` file in your project and add the following code at the end of the file:

```php
<?php if(Request::val('Print_x')) : ?>
  <style>
    /* format is: td.{tablename}-{fieldname} */
    td.orders-Total::before,
    td.order_details-UnitPrice::before,
    td.order_details-SubTotal::before  /* Attention: no comma (,) after last field! */
      { content: '₹'; }
  </style>
<?php else : ?>
  <style>
    td.orders-Total > a::before,
    td.order_details-UnitPrice > a::before,
    td.order_details-SubTotal > a::before  /* Attention: no comma (,) after last field! */
      { content: '₹'; }
  </style>
<?php endif; ?>
```

**Explanation of the Code**

- The **first block** (lines 2-8) specifies the currency symbol (`₹`) for the amount fields in the **print view**.
- The **second block** (lines 10-15) specifies the currency symbol (`₹`) for the amount fields in the **table view**.

You can replace `₹` with any currency symbol of your choice. For instance, `$` for USD or `€` for EUR.

To specify a currency symbol for a particular field, use the format `td.{tablename}-{fieldname}`. For example:

- For a table named `invoices` with an amount field named `total`, use the selector `td.invoices-total`.

Here’s an example of how the table view will look after applying the above code:

![Currency Symbol Example](https://cdn.bigprof.com/images/currency-symbol-in-table-view.png)


## Split radio button lookups into two columns

[Lookup fields](../working-with-projects/understanding-lookup-fields.md) in AppGini can be displayed either as a dropdown list or as radio buttons. If you have a lookup field with many options, displaying them as radio buttons can make the form too long and difficult to navigate.

![A radio button lookup field](https://cdn.bigprof.com/images/radio-button-lookup-field.png)

To improve the user experience, you can split the radio button options into two columns. This can be done by adding a simple CSS rule to your `hooks/footer-extras.php` file. First, we need to identify the exact name of the lookup field(s) we want to modify, which we can find in the AppGini project.

In the above screenshot, for example, the lookup field is named `ReportsTo`. To split the radio buttons into two columns, we can add the following CSS rule to the `hooks/footer-extras.php` file:

```html
<style>
/* CSS rule to split radio button lookup field into two columns */
/* Replace 'ReportsTo' with the actual name of your lookup field */
#ReportsTo-combo-list {
  br:nth-of-type(2n+1) { display: none; }
  label { width: 200px; } /* Adjust the width as needed */
}
</style>
```

Here is the same field after applying the above CSS rule:

![Radio button lookup field split into two columns](https://cdn.bigprof.com/images/radio-button-lookup-field-split.png)

If you have multiple lookup fields that you want to modify, you can combine them into a single CSS rule. For example, if you have two lookup fields named `ReportsTo` and `Status`, you can use the following CSS rule:

```html
<style>
/* CSS rule to split multiple radio button lookup fields into two columns */
/* Replace 'ReportsTo' and 'Status' with the actual names of your lookup fields */
#ReportsTo-combo-list,
#Status-combo-list {
  br:nth-of-type(2n+1) { display: none; }
  label { width: 200px; } /* Adjust the width as needed */
}
</style>
```

This will apply the same two-column layout to both lookup fields. You can adjust the width of the labels as needed to fit your design.

