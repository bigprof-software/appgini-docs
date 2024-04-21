---
title: DataList object
linkTitle: DataList object
slug: help/advanced-topics/hooks/DataList-object
description: The DataList object is passed to the tablename_init hook function and exposes many options that you can control to affect the behavior and appearance of each of the AppGini-generated table pages that users see.
keywords: DataList object, tablename_init, hook function, table, appearance, behavior, DataList properties
---

# DataList object

The `DataList` object exposes many options that you can control to affect the behavior and appearance of each of the AppGini-generated table pages that users see.  
  
`DataList` object is passed to the [`tablename_init`](/appgini/help/advanced-topics/hooks/table-specific-hooks#tablename_init) hook function. This hook function is called before displaying data to users. So, you can control the various appearance and behavior options by modifying this object inside that hook function.  
  
## Here is a list of the editable properties of the `DataList` object

### `AllowCSV`

Setting this property to `1` allows users to download table records as a CSV file. Setting it to `0` disables this.

### `AllowDeleteOfParents`

Setting this property to `1` allows users who have delete permissions to delete a record even if it has child records in other tables. Setting it to `0` disables this.

### `AllowFilters`

Setting this property to `1` allows users to access the filters page to view and modify filters. Setting it to `0` disables this.

### `AllowPrinting`

Setting this property to `1` allows users to access the 'Print preview' page. Setting it to `0` disables this.

### `AllowSavingFilters`

Setting this property to `1` allows users to save filters as HTML code to access them quickly later. Setting it to `0` disables this.

### `AllowSorting`

Setting this property to `1` allows users to sort table records. Setting it to `0` disables this.

### `CSVSeparator`

Specifies the field separator to use when downloading data as a CSV file. The default is comma (,).

### `ColCaption`

An array that specifies the titles of columns displayed in the table view.

### `ColNumber`

An array that specifies which fields to use in the table view. It works by selecting some (or all) of the fields listed in the `QueryFieldsTV` property explained below.

### `ColWidth`

An array that specifies the width of each column in the table view. If the `ShowTableHeader` property (explained below) is set to `1`, the `ColWidth` property is overridden by the width values specified in the table view template file (`templates/tablename_templateTV.html`).

### `DefaultSortDirection`

A string that can be set to `'asc'` or `'desc'`. Please see the `DefaultSortField` property below.

### `DefaultSortField`

Specifies the field to use for default sorting of the table view records. This property can be set to a number to specify which field to sort by from the `QueryFieldsTV` property explained below. Alternatively, it can be set to a string specifying an explicit field name or MySQL expression to use for default sorting.

### `DVClasses`

Was added in AppGini 5.60. Additional CSS classes to apply to the detail view container (space-separated)

### `FilterPage`

Specifies a custom search page to use when users click on the FILTERS button. If no value is provided, the default filters page is used. You can use this feature to create advanced search forms for your tables. Please see [Creating customized search forms](/appgini/tips-and-tutorials/customized-search-forms) for a detailed example.

### `PrimaryKey`

A string that specifies the name of the primary key field for the table. You shouldn't change this value.

### `QueryFieldsCSV`

An associative array specifying the fields used in the query that fetches data when users request to download a CSV file. The array keys represent the field names or MySQL expressions used in the query. The array values represent the column titles to display in the CSV file.

### `QueryFieldsFilters`

An associative array specifying the fields used in the filters page. The array keys represent the field names. The array values represent the field titles to display in the filters page.

### `QueryFieldsTV`

An associative array specifying the fields that can be displayed in the table view. The array keys represent the field names or MySQL expressions used in the query. The array values represent the column titles. The fields actually displayed in the table view are specified in the `ColNumber` array explained above.

### `QueryFrom`

A string that specifies the contents of the FROM part of the query used in the table view and the CSV file.

### `QuickSearch`

A number that specifies how to display the quick search box. It can take any of the following values:

*   `0`: no quick search box shown.
*   `1`: quick box shown on the top left of the table view.
*   `2`: quick box shown on the top center of the table view.
*   `3`: quick box shown on the top right of the table view.

**Update:** As of AppGini 5.20 and above, setting this property to `0` hides the quick search box, and setting it to any non-zero value displays the quick search box. The position of the box is determined by the screen size.

### `QuickSearchText`

A string that specifies the title to display besides the quick search box.

### `RecordsPerPage`

A number that specifies how many records to show per page in the table view.

### `RedirectAfterInsert`

If users are allowed to add new records to the table, this property specifies the URL to which users will be redirected after adding the new record.

### `SelectedTemplate`

A string that specifies the path to the HTML template file to use for formatting a currently-selected record in the table view.

### `SeparateDV`

A number that is set to `1` to display the detail view in a separate page, or `0` to display it below the table view.

### `ShowTableHeader`

A number that is set to `1` (the default) to display column titles above the table view. Table titles are specified in the `ColCaption` property explained above. If set to `0`, column titles are not displayed (this is useful if you need to change the horizontal layout of fields in the template file `templates/tablename_templateTV.html` to a different non-horizontal layout).

### `TableTitle`

The title that will be displayed above the table view.

### `Template`

A string that specifies the path to the HTML template file to use for formatting all records in the table view except the currently-selected one.

### `TemplateDV`

Was added in AppGini 5.61. A string that specifies the path (relative to the main directory of the application) to the HTML template file to use for displaying the detail view.

### `TemplateDVP`

Was added in AppGini 5.61. A string that specifies the path (relative to the main directory of the application) to the HTML template file to use for displaying the print preview of the detail view.

### `TVClasses`

Was added in AppGini 5.60. Additional CSS classes to apply to the table view container (space-separated)

## Inspecting the `DataList` object

For debugging purposes, you can inspect the contents of the `DataList` object by adding the following code into the `tablename_init` hook function in the generated `hooks/tablename.php` file (replace `tablename` by the actual name of the concerned table):

```php
function tablename_init(&$options, $memberInfo, &$args) {
    ob_start();
    $xc = get_object_vars($options);
    ksort($xc);
    print_r($xc);
    $c = ob_get_clean();
    echo "<pre>" . htmlspecialchars($c) . "</pre>";
 
    return TRUE;
}
```

The above code will output the contents of the `DataList` object to the browser above the table view. You can use this to inspect, debug and change the various properties. But you should use this carefully in a protected environment for testing purposes only.

