---

title: Magic files in the hooks folder
linkTitle: Magic files
slug: help/advanced-topics/hooks/magic-files

---

You can create some files with specific names inside the hooks folder that your AppGini-generated application would use to perform a specific task. These files are optional, meaning that if they exist, your application will automatically use them to alter a default behavior. But if they don't exist, the default behavior will apply.

## `tablename-dv.js`: modifying the behavior of the detail view through JavaScript

If you create a file in the hooks folder and name it `tablename-dv.js` (where *`tablename`* is the name of a table in your application), AppGini will automatically load that file and execute it as a JavaScript file in the browser whenever the detail view of the specified table is displayed. This is very useful to execute JavaScript code in the detail view.

For example, let's assume we have an *exams* table, and a score field in that table. We want to limit the contents of that field to a certain range of numbers, and warn the user if he enters a number outside that range. To do so, we could add some javascript code like the following in the magic `hooks/exams-dv.js` file.

```javascript
$j(function() { 
    $j('#score').on('change', function() {
        var score = parseInt($j('score').val());
        if(isNaN(score) || score > 100 || score < 0){
            alert('Score must be between 0 and 100!');
            $j('#score').focus();
        }
    });
});
```

Line 1 in the code above makes sure this code won't be executed until the page content and jQuery are loaded to avoid triggering an error.

## `tablename-tv.js`: modifying the behavior of a specific table through JavaScript

If you create a file in the hooks folder and name it `tablename-tv.js` (where *`tablename`* is the name of a table in your application), AppGini will automatically load that file and execute it as a JavaScript file in the browser whenever the specified table is displayed. This is very useful to modify the page content/layout or add custom behavior.

For an example of how this can be used to add new batch actions, please see the [`batch_actions()` hook documentation](/appgini/help/advanced-topics/hooks/multiple-record-batch-actions).

Please note that despite the `-tv` suffix, this file is always loaded when the specific table is being viewed, whether the table view is being displayed or not. If you want to execute code *only if* the table view is visible, you can perform this check in the `tablename-tv.js` file:

```javascript
$j(() => {
  if(!$j('.table_view').length) return;
      
  // any code added below will be executed only in table view
});
```

## `tablename.fieldname.csv`: changing the contents of options lists

![Option list example in an AppGini-generated application](https://cdn.bigprof.com/appgini-desktop/help/options-list-in-detail-view.png)

In AppGini, you can define a field as an options list so that your application users can select the value of the field from a set of options. For example, the Country field in the screenshot to the left is an options list.

Now, what happens if you want to modify the contents of that options list, for example to limit the list to some countries and remove the others? Normally, you would have to open your project in AppGini, go to the Country field, modify the list contents, regenerate your application, and upload it. That's a long way to go.

So, we provide an easier method that doesn't involve regenerating the application. Simply, create a text file in the generated hooks folder and name it like this pattern: `tablename.fieldname.csv` .. For example, for the Countries list in the screenshot, the file should be named `customers.Country.csv`. Next, fill this file with all the options you want the user to be able to choose from, separated by double semi-colons. Here are the file contents for a choice of just 3 countries as an example:

```
United States;;United Kingdom;;France
```

It's now very easy to edit this file using any text editor to add/remove/modify options, without having to regenerate your application. However, please beware that this file takes precedence over the options provided in your AppGini project. So, if you decide later to modify the options in your project file and regenerate your application, you should either delete the `tablename.fieldname.csv` hook file or update it with the new options.