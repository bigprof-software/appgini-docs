---
title: Client-side Custom JavaScript Validation Functions
linkTitle: Client-side validation
slug: help/advanced-topics/hooks/client-side-validation
description: Learn how to add custom JavaScript validation functions to your AppGini app to validate data on the client side before submission.
keywords: client-side validation, custom validation, JavaScript validation, AppGini validation, customValidateData
---

# Client-side Custom JavaScript Validation Functions

> This feature is available in AppGini 24.18 and above.

If you define a JavaScript function with the special name `{tablename}_customValidateData`
(where `{tablename}` is the name of a table in your app), it will automatically be called during detail view form submission.
And if it returns `false`, the form will not be submitted. You can define custom validation functions in any of 
the following locations:

* `hooks/header-extras.php`
* `hooks/footer-extras.php`
* `{tablename}-dv.js`
* [`{tablename}_dv()` hook function](table-specific-hooks.md#tablename_dv) in `hooks/{tablename}.php`

A boolean `insertMode` argument is passed to the function, which indicates the submission purpose as follows:

* `true`: submission purpose is to insert a new record.
* `false`: submission purpose is to update an existing record.

The function should return a boolean (`true` or `false`), which determines whether the form would be submitted or not.

### Usage notes

* Built-in validation functios are *still* called and processed. So, if your custom validation function returns `true` while the
built-in validation doesn't pass, the form *will not* be submitted.

* Before returning `false`, you should indicate to the user the reason for the failed check. We recommend using
the `AppGini.modalError()` function for that.

* This function is run in *synchronous* mode. So if you need to issue an ajax/fetch request during validation, make sure
to run it in synchronous mode as well (for example, set `async` parameter to `false` if using `jQuery.ajax`) otherwise
it won't be evaluated before form submission.

* This function runs in the client-side to provide a better user experience during submission, but it can be easily
circumvented by the user. You should implement server-side validation as well to enforce data integrity by adding
validation checks in `hooks/{tablename}.php` in the [`{tablename}_before_insert()`](table-specific-hooks.md#tablename_before_insert)
and [`{tablename}_before_update()`](table-specific-hooks.md#tablename_before_update) hook functions.

### Example

Let's say we have a table named `customers` with a phone number field named `phone`. We want to make sure that the phone number
is in the format `+1234567890` where `+` is a required prefix followed by 10 digits. To implement this, add the following code 
to `hooks/orders-dv.js` (create it if it doesn't exist):

```javascript
function customers_customValidateData(insertMode) {
  var phone = $j('#phone').val();
  if(!phone.match(/^\+\d{10}$/)) {
	AppGini.modalError('Phone number must be in the format +1234567890');
	return false;
  }

  return true;
}
```

