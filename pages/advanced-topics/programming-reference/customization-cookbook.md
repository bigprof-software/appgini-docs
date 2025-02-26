---
title: Customization Cookbook 
linkTitle: Customization Cookbook
slug: help/advanced-topics/programming-reference/customization-cookbook
keywords: 
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

