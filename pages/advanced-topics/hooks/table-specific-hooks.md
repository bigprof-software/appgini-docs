---
title: Table-specific hooks
linkTitle: Table-specific hooks
slug: help/advanced-topics/hooks/table-specific-hooks
description: Table-specific hooks are functions that get called when a new record is added, when a record is edited, when a record is deleted, ... etc. These hooks are table-specific. That's why each table in your project has its own hook file.
keywords: table-specific hooks, hooks, table, insert, update, delete, record, edit, add, new, data, memberInfo, args, options, header, footer, init, before_insert, after_insert, before_update, after_update, before_delete, after_delete, dv, csv, batch_actions, multiple record batch actions
---

For each table in your project, AppGini generates a hook file named the same as the table
name inside the `hooks` folder. This file contains hook functions that get called when
a new record is added, when a record is edited, when a record is
deleted, ... etc. These hooks are table-specific. That's why each
table in your project has its own hook file.

*The following hook functions are defined in this file:*

- [`tablename_before_insert()`](#tablename_before_insert)
- [`tablename_after_insert()`](#tablename_after_insert)
- [`tablename_before_update()`](#tablename_before_update)
- [`tablename_after_update()`](#tablename_after_update)
- [`tablename_before_delete()`](#tablename_before_delete)
- [`tablename_after_delete()`](#tablename_after_delete)
- [`tablename_dv()`](#tablename_dv)
- [`tablename_csv()`](#tablename_csv)
- [`tablename_init()`](#tablename_init)
- [`tablename_header()`](#tablename_header)
- [`tablename_footer()`](#tablename_footer)
- [`tablename_batch_actions()`](/appgini/help/advanced-topics/hooks/multiple-record-batch-actions)




## `tablename_init()`


Called before rendering the page. This is a very powerful hook that
allows you to control all aspects of how the page is rendered. If you
open the generated `hooks/tablename.php` file in a text editor (where
tablename is the name of the concerned table), you can see this function
defined as follows:

```php
function tablename_init(&$options, $memberInfo, &$args) {

    return true;
} 
```


### Parameters

-   `$options` (passed by reference so that it can be modified
    inside this hook function) a DataList object that sets options for
    rendering the page. Please refer to
    [DataList](/appgini/help/advanced-topics/hooks/DataList-object) for more
    details.
-   `$memberInfo` is an array containing details of the member
    who signed in. Please refer to
    [memberInfo](/appgini/help/advanced-topics/hooks/memberInfo-array)
    for more details.
-   `$args` is currently not used but is reserved for future
    uses.


### Return value

`true` to render the page. `false` to cancel the operation
(which could be useful for error handling to display an error message to
the user and stop displaying any data).


### Example

The following example checks that the logged user belongs to the admin
group and accordingly allows CSV downloading of records. If the user is
not a member of the admin group, CSV downloads are disabled.

```php
function tablename_init(&$options, $memberInfo, &$args) {

    if($memberInfo['group'] == 'Admins') {
        $options->AllowCSV = 1;
    } else {
        $options->AllowCSV = 0;
    }

    return true;
} 
```

> There is another example in the [Tips and tutorials
section](/appgini/tips-and-tutorials) that uses the `tablename_init` hook
to [modify part of the table view
query](/appgini/tips-and-tutorials/customize-tableview-data). Another
example uses the `tablename_init` hook to [apply a default filter to a
table](/appgini/tips-and-tutorials/apply-default-filter).



## `tablename_header()`


Called before displaying page content. Can be used to return a
customized header template for the table. If you open the generated
`hooks/tablename.php` file in a text editor (where `tablename` is the name
of the concerned table), you can see this function defined as follows:

```php
function tablename_header($contentType, $memberInfo, &$args) {
    $header='';

    switch($contentType) {
        case 'tableview':
            $header='';
            break;

        case 'detailview':
            $header='';
            break;

        case 'tableview+detailview':
            $header='';
            break;

        case 'print-tableview':
            $header='';
            break;

        case 'print-detailview':
            $header='';
            break;

        case 'filters':
            $header='';
            break;
    }

    return $header;
}
```


### Parameters

-   `$contentType` specifies the type of view that will be
    displayed. Takes one of the following values: `tableview`,
    `detailview`, `tableview+detailview`, `print-tableview`,
    `print-detailview` or `filters`.
-   `$memberInfo` is an array containing details of the member
    who signed in. Please refer to
    [memberInfo](/appgini/help/advanced-topics/hooks/memberInfo-array)
    for more details.
-   `$args` is currently not used but is reserved for future
    uses.


### Return value

String containing the HTML header code. If empty, the default
`header.php` is used. If you want to include the default header
besides your customized header, include the `<%%HEADER%%>` placeholder
in the returned string. Note: If you have a customized header-extras.php
file (see [the contents of the hooks
folder](/appgini/help/advanced-topics/hooks/folder-contents) for more
info), it won't be included in the page if you don't include the
`<%%HEADER%%>` placeholder in the return string.


### Example

The following example displays today's date and current time above the
print-preview pages, so that the printed document shows this data.
Notice that the placeholder \<%%HEADER%%\> is included so that the
original header is still output to users. The modified code is at lines
18 and 22.

```php
function tablename_header($contentType, $memberInfo, &$args) {
    $header='';

    switch($contentType) {
        case 'tableview':
            $header='';
            break;

        case 'detailview':
            $header='';
            break;

        case 'tableview+detailview':
            $header='';
            break;

        case 'print-tableview':
            $header='<%%HEADER%%><div align="right">'.date('r').'</div>';
            break;

        case 'print-detailview':
            $header='<%%HEADER%%><div align="right">'.date('r').'</div>';
            break;

        case 'filters':
            $header='';
            break;
    }

    return $header;
}
```




## `tablename_footer()`


Called after displaying page content. Can be used to return a customized
footer template for the table. If you open the generated
`hooks/tablename.php` file in a text editor (where tablename is the name
of the concerned table), you can see this function defined as follows:

```php
function tablename_footer($contentType, $memberInfo, &$args) {
    $footer='';

    switch($contentType) {
        case 'tableview':
            $footer='';
            break;

        case 'detailview':
            $footer='';
            break;

        case 'tableview+detailview':
            $footer='';
            break;

        case 'print-tableview':
            $footer='';
            break;

        case 'print-detailview':
            $footer='';
            break;

        case 'filters':
            $footer='';
            break;
    }

    return $footer;
}
```


### Parameters

-   `$contentType` specifies the type of view that will be
    displayed. Takes one of the following values: `tableview`,
    `detailview`, `tableview+detailview`, `print-tableview`,
    `print-detailview` or `filters`.
-   `$memberInfo` is an array containing details of the member
    who signed in. Please refer to
    [memberInfo](/appgini/help/advanced-topics/hooks/memberInfo-array)
    for more details.
-   `$args` is currently not used but is reserved for future
    uses.


### Return value

String containing the HTML footer code. If empty, the default
`footer.php` is used. If you want to include the default footer
besides your customized footer, include the `<%%FOOTER%%>` placeholder
in the returned string. Note: If you have a customized footer-extras.php
file (see [the contents of the hooks
folder](/appgini/help/advanced-topics/hooks/folder-contents) for more
info), it won't be included in the page if you don't include the
`<%%FOOTER%%>` placeholder in the return string.


### Example

Please refer to the above example for tablename_header.



## `tablename_before_insert()`


Called before executing the insert query. If you open the generated
`hooks/tablename.php` file in a text editor (where tablename is the name
of the concerned table), you can see this function defined as follows:

```php
function tablename_before_insert(&$data, $memberInfo, &$args) {

    return true;
}
```


### Parameters

-   `$data` An associative array where the keys are field names
    and the values are the field data values to be inserted into the new
    record. This array is passed by reference so that modifications to
    it apply to the insert query.
-   `$memberInfo` is an array containing details of the member
    who signed in. Please refer to
    [memberInfo](/appgini/help/advanced-topics/hooks/memberInfo-array)
    for more details.
-   `$args` was not in use prior to AppGini 5.90. As of AppGini
    5.90, it's used for exchanging further data as follows:
    -   `$args['error_message']` can be set inside the hook
        function to display an error message to user in case of
        returning `false` .


### Return value

A boolean `true` to perform the insert operation, or `false`
to cancel it.

*As of AppGini 5.90* , if returning `false` , an error message
string (no HTML tags allowed) can be displayed to users by passing it
through `$args['error_message']` .


### Example 1

In this example, let's assume that our table contains the fields:
unit_price, quantity and total. We want to automatically calculate the
value of the total field by multiplying quantity and unit_price.

```php
function tablename_before_insert(&$data, $memberInfo, &$args) {

    $data['total'] = $data['quantity'] * $data['unit_price'];

    return true;
}
```

**See also:** [Using lookup fields in calculations](/appgini/help/advanced-topics/hooks/using-lookup-fields-in-calculations).


### Example 2 (AppGini 5.90+)

In this example, let's assume that we have a `job_orders` table,
and we want to make sure the `duration` field value must be higher
than 3. If not, we'll reject the record with an error message.

```php
function job_orders_before_insert(&$data, $memberInfo, &$args) {

    if($data['duration'] <= 3) {
        $args['error_message'] = 'Error: Duration must be higher than 3.';
        return false;
    }

    return true;
}
```




## `tablename_after_insert()`


Called after executing the insert query (but before executing the
ownership insert query). If you open the generated `hooks/tablename.php`
file in a text editor (where tablename is the name of the concerned
table), you can see this function defined as follows:

```php
function tablename_after_insert($data, $memberInfo, &$args) {

    return true;
}
```


### Parameters

-   `$data` is an associative array where the keys are field
    names and the values are the field data values that were inserted
    into the new record. It also includes the item
    `$data['selectedID']` which stores the value of the primary key
    for the new record.
-   `$memberInfo` is an array containing details of the member
    who signed in. Please refer to
    [memberInfo](/appgini/help/advanced-topics/hooks/memberInfo-array)
    for more details.
-   `$args` is currently not used but is reserved for future
    uses.


### Return value

A boolean `true` to perform the ownership insert operation or
`false` to cancel it. Warning: if a `false` is returned, the
new record will have no ownership info.


### Example 1

The following example sends a notification email to an employee when a
user submits a new record. The email contains the record data.

```php
function tablename_after_insert($data, $memberInfo, &$args) {

    // to compose a message containing the submitted data,
    // we need to iterate through the $data array
    foreach($data as $field => $value) {
        $messageData .= "$field: $value \n";
    }

    sendmail([
        'to' => 'employee@company.com',
        'name' => 'Recipient Name',        
        'subject' => 'A new record needs your attention',        
        'message' => "The following new record was submitted by {$memberInfo['username']}: \n\n" . $messageData
    ]);
    
    return true;
}
```

### Example 2

The following example works with apps created by AppGini 23.17 or above.
It uses the [`WindowMessages`
class](https://bigprof.com/appgini/help/advanced-topics/hooks/WindowMessages-class)
to display a custom message to the user after a record is inserted. In
this example, we're displaying a sample instruction for the user to
follow after he's added a new record to the orders table reminding him
to add order items.

```php
  function orders_after_insert($data, $memberInfo, &$args) {

        WindowMessages::add('Next step: Add order items for this order!');
        
        return true;
    }
```




## `tablename_before_update()`


Called before executing the update query. If you open the generated
`hooks/tablename.php` file in a text editor (where tablename is the name
of the concerned table), you can see this function defined as follows:

```php
function tablename_before_update(&$data, $memberInfo, &$args) {

    return true;
}
```


### Parameters

-   `$data` An associative array where the keys are field names
    and the values are the new data values to update the field with.
    This array is passed by reference so that modifications to it apply
    to the update query. This array includes the item
    `$data['selectedID']` which stores the value of the primary key
    for the record to be updated.
-   `$memberInfo` is an array containing details of the member
    who signed in. Please refer to
    [memberInfo](/appgini/help/advanced-topics/hooks/memberInfo-array)
    for more details.
-   `$args` was not in use prior to AppGini 5.90. As of AppGini
    5.90, it's used for exchanging further data as follows:
    -   `$args['error_message']` can be set inside the hook
        function to display an error message to user in case of
        returning `false` .
    -   `$args['old_data']` is an associative array
        containing existing record values. This is useful for comparing
        the new values passed through the `$data` parameter
        to the stored values in the record before the actual update
        operation is performed.


### Return value

`true` to perform the update operation or `false` to cancel
it.

*As of AppGini 5.90* , if returning `false` , an error message
string (no HTML tags allowed) can be displayed to users by passing it
through `$args['error_message']` (See example 2 for
[tablename_before_insert](#tablename_before_insert) ).


### Example

Let's say we have an orders table. When a user makes changes to a
record and saves them, we want to automatically calculate the value of
the *total* field using the fields *subtotal* , *discount* and
*sales_tax* , where discount and sales_tax are stored as percentages
(i.e. a discount value of 10 means 10% of subtotal):

```php
function tablename_before_update(&$data, $memberInfo, &$args) {
    
    // calculate total after applying discount
    $data['total'] = $data['subtotal'] * (1 - $data['discount'] / 100);
    
    // calculate total after applying sales tax 
    $data['total'] = $data['total'] * (1 + $data['sales_tax'] / 100); 
    
    return true;
}
```



### Another example

Let's say that we want to prevent updates to any records in a
particular table that are older than 30 days. To do so, we would
customize the *tablename* _before_update() hooks like this:

```php
function tablename_before_update(&$data, $memberInfo, &$args) {
    
    // get the creation date of the record
    $creationDate=sqlValue("select dateAdded from membership_userrecords
        where tableName='tablename' and pkValue='{$data['selectedID']}'");
    
    // if the record is older than 30 days, deny changes 
    if($creationDate < strtotime('30 days ago')) return false;
    
    return true;
}
```

*Don't forget to replace `tablename` at line 5 above, with the actual
name of your table.*


## `tablename_after_update()`


Called after executing the update query and before executing the
ownership update query. If you open the generated `hooks/tablename.php`
file in a text editor (where tablename is the name of the concerned
table), you can see this function defined as follows:

```php
function tablename_after_update($data, $memberInfo, &$args) {

    return true;
}
```


### Parameters

-   `$data` is an associative array where the keys are field
    names and the values are the field data values that were inserted
    into the new record. It also includes the item
    `$data['selectedID']` which stores the value of the primary key
    for the new record.
-   `$memberInfo` is an array containing details of the member
    who signed in. Please refer to
    [memberInfo](/appgini/help/advanced-topics/hooks/memberInfo-array)
    for more details.
-   `$args` was not in use prior to AppGini 5.90. As of AppGini
    5.90, it's used for exchanging further data as follows:
    -   `$args['old_data']` is an associative array
        containing old record values that existed before the update
        operation. This is useful for comparing the new values passed
        through the `$data` parameter to the old values of
        the record that existed before the update operation. You could
        use this for example for auditing purposes.


### Return value

`true` to perform the ownership update operation or `false` to
cancel it.


### Example

Please refer to the example for `tablename_after_insert` hook above.



## `tablename_before_delete()`


Called before deleting a record (and before performing child records
check). If you open the generated `hooks/tablename.php` file in a text
editor (where tablename is the name of the concerned table), you can see
this function defined as follows:

```php
function tablename_before_delete($selectedID, &$skipChecks, $memberInfo, &$args) {

    return true;
}
```


### Parameters

-   `$selectedID` is the primary key value of the record to be
    deleted.
-   `$skipChecks` is a flag passed by reference that determines
    whether child records check should be performed or not. If you set
    \$skipChecks to `true` inside this hook function, no child
    records check will be made. If you set it to `false` , the
    check will be performed.
-   `$memberInfo` is an array containing details of the member
    who signed in. Please refer to
    [memberInfo](/appgini/help/advanced-topics/hooks/memberInfo-array)
    for more details.
-   `$args` is currently not used but is reserved for future
    uses.


### Return value

`true` to perform the delete operation or `false` to cancel
it.


### Example

In this example, we'll assume that our table contains a checkbox field
named *approved* . We want to allow deleting of the record only if that
field is not checked (set to 0). If the field is checked (set to 1), it
won't be deleted unless the user is a member of the Admins group.

```php
function tablename_before_delete($selectedID, &$skipChecks, $memberInfo, &$args) {
    
    // We'll perform the 'approved' check only if the user
    // is not a member of the 'Admins' group.
    
    if($memberInfo['group']!='Admins') {
        $id=makeSafe($SelectedID);
        $approved=sqlValue("select `approved` from `tablename` where `id`='$id'");
        
        // if the record is approved, don't allow deleting it
        if($approved) return false;
    }
    
    return true;
}
```

We assumed in the above example that the primary key field of the table
is named *id*. Also, notice in line 7 the use of the `makeSafe()`
function, which prepares variables to be used safely inside SQL queries.
In line 8, we used the `sqlValue()` function which performs a SQL query
that we know returns a single value. It's a shortcut function that
saves us the effort of processing a MySQL result set.




## `tablename_after_delete()`


Called after deleting a record. If you open the generated
`hooks/tablename.php` file in a text editor (where tablename is the name
of the concerned table), you can see this function defined as follows:

```php
function tablename_after_delete($selectedID, $memberInfo, &$args) {

}
```


### Parameters

-   `$selectedID` is the primary key value of the deleted
    record.
-   `$memberInfo` is an array containing details of the member
    who signed in. Please refer to
    [memberInfo](/appgini/help/advanced-topics/hooks/memberInfo-array)
    for more details.
-   `$args` is currently not used but is reserved for future
    uses.


### Return value

None.


### Example

This example logs the date and time a record was deleted and who deleted
it.

```php
function tablename_after_delete($selectedID, $memberInfo, &$args) {
    // log file
    $logFile='deletes.log';
    
    // attempt to open the log file for appending
    if(!$fp = @fopen($logFile, 'a')) return;
    
    // write log data: date/time, username, IP, record ID
    $datetime=date('r');
    fwrite($fp, "$datetime,{$memberInfo['username']},{$memberInfo['IP']},$selectedID\n");
    fclose($fp);
}
```




## `tablename_dv()`


Called when a user requests to view the detail view (before displaying
the detail view). If you open the generated `hooks/tablename.php` file
in a text editor (where tablename is the name of the concerned table),
you can see this function defined as follows:

```php
function tablename_dv($selectedID, $memberInfo, &$html, &$args) {

}
```


### Parameters

-   `$selectedID` The primary key value of the record selected.
    It's set to `false` if no record is selected (i.e. the
    detail view will be displayed to enter a new record).
-   `$memberInfo` is an array containing details of the member
    who signed in. Please refer to
    [memberInfo](/appgini/help/advanced-topics/hooks/memberInfo-array)
    for more details.
-   `$html` (passed by reference so that it can be modified
    inside this hook function) the HTML code of the form ready to be
    displayed. This could be useful for manipulating the code before
    displaying it using regular expressions, \... etc.
-   `$args` is currently not used but is reserved for future
    uses.


### Return value

None.


### Example

The following example sets the price field as read-only for non-admin
users. The example demonstrates how to \"inject\" JavaScript code to the
detail view to change its behavior. Please note that setting a field as
read-only via JavaScript is not sufficient to prevent modifying it.
Power users can easily circumvent this. So, you have to also force this
server-side, for example using the [before_update
hook](#tablename_before_update) .

```php
function tablename_dv($selectedID, $memberInfo, &$html, &$args) {
    /* current user is not an admin? */
    if($mi['group'] != 'Admins') {
        ob_start();
        ?>
        <script>
            $j(function() {
                $j('#price').prop('readonly', true);
            })
        </script>
        <?php
        $html .= ob_get_clean();
    }
}
```




## `tablename_csv()`


Called when a user requests to download table data as a CSV file (by
clicking the SAVE CSV button). If you open the generated
`hooks/tablename.php` file in a text editor (where tablename is the name
of the concerned table), you can see this function defined as follows:

```php
function tablename_csv($query, $memberInfo, $args) {

    return $query;
}
```


### Parameters

-   `$query` contains the query that will be executed to return
    the data in the CSV file.
-   `$memberInfo` is an array containing details of the member
    who signed in. Please refer to
    [memberInfo](/appgini/help/advanced-topics/hooks/memberInfo-array)
    for more details.
-   `$args` is currently not used but is reserved for future
    uses.


### Return value

A string containing the query to use for fetching the CSV data. If
`false` or empty is returned, the default query is used.


### Example

The following example modifies the SQL query used to limit records
retrieved to 10 records only if the user requesting the CSV file is not
an admin.

```php
function tablename_csv($query, $memberInfo, $args) {

    // return only the first 10 records for non-admin users.
    if($memberInfo['group']!='Admins') {
        $query.=" limit 10";
    }
    
    return $query;
}
```



