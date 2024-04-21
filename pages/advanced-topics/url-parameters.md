---
title: Special links and URL parameters
linkTitle: URL parameters
slug: help/advanced-topics/url-parameters
---

# Special links and URL parameters


By default, the links to various tables in your AppGini-generated
application pass no URL parameters, and thus display the default table
view \-- applying the default sorting and no filters. However, you can
add special parameters to the URL that allow you to control how the
table view data is displayed.

The default way to link to a table is to link to
`tablename_view.php` (where `tablename` is the name of
the concerned table). For example, if you have a table named *customers*
, the default table view link would be `customers_view.php`.

There are some special URL parameters that you can use as part of the
link to change what you are linking to. For example, if you want to link
to the customers table, sorted by country, rather than not sorted, the
link would be `customers_view.php?SortField=4`
(assuming country is the fourth field in the table as it appears in your
AppGini project). You can add other URL parameters to the link,
separating them by `&` character (note that only the first parameter you
add to the URL starts with a `?` character). You can add URL parameters in
any order.

Here is a very easy way to obtain the table view link if you want to
apply specific filters and sorting: select the concerned table in
AppGini, then check the option **Allow users to save filters** . This
would add a button down the filters page labeled **Save and apply
filters** . You can then go to the filters page of your table, define
the filters and sorting you wish to link to, and then click that button.
This will display a *permalink* to the table view that you can copy and
use to link to the filtered and sorted table. See the illustration
below.

![Obtain URL parameters from saved filters](https://cdn.bigprof.com/images/appgini/obtain-url-parameters-from-saved-filters.gif "Obtain URL parameters from saved filters")

You can then add this link to the homepage and/or the navigation menu
for other users to access it without having to redefine the filters and
sorting. To do so, just edit the generated `hooks/links-home.php`
(for adding the link to the homepage), and
`hooks/links-navmenu.php` (for adding the link to the navigation
menu).

## Here is a table listing common URL parameters and their usage

### `SortField`

* Default value: None
* Details: Specify the index of the field(s) to sort the table by. Examples:
  * `customers_view.php?SortField=4` sorts the table by the fourth field.
  * `customers_view.php?SortField=4,7` sorts the table by the fourth then the seventh field.

### `SortDirection`

* Default value: `asc`
* Details: If a `SortField` is provided, `SortDirection` determines the direction of sorting. Possible values: `asc`, `desc`. Example:
  * `customers_view.php?SortField=4&SortDirection=desc` sorts the table by the fourth field in descending order.

### `FilterAnd[x]`

* Default value: None
* Details: Please refer to [working with filters programmatically](/appgini/tips-and-tutorials/working-with-filters/part-1)

### `FilterField[x]`

* Default value: None
* Details: Please refer to [working with filters programmatically](/appgini/tips-and-tutorials/working-with-filters/part-1)

### `FilterOperator[x]`

* Default value: None
* Details: Please refer to [working with filters programmatically](/appgini/tips-and-tutorials/working-with-filters/part-1)

### `FilterValue[x]`

* Default value: None
* Details: Please refer to [working with filters programmatically](/appgini/tips-and-tutorials/working-with-filters/part-1)

### `SearchString`

* Default value: None
* Details: Displays records matching the provided search string. This is equivalent to typing a search term in the quick search box above the table view. Example:
  * `customers_view.php?SearchString=germany`

### `FirstRecord`

* Default value: 1
* Details: This is equivalent to navigating the table view using the next/previous buttons or the *Go to page* drop-down. Thus, you could use it to jump to a specific page instead of the default first page of the table. Example:
  * `customers_view.php?FirstRecord=21` jumps to page 3 (assuming 10 records per page).

### `Print_x`

* Default value: None
* Details: Used for displaying the print preview page. Example:
  * `customers_view.php?Print_x=1` displays the print preview of the table view.

### `addNew_x`

* Default value: None
* Details: If set to any non-zero value, displays the detail view for entering a new record if the user has insert permission to the table.

### `filterer_{fieldname}`

* Default value: None
* Details: `{fieldname}` is the name of a non-autofill lookup field (that is, a lookup field displaying a drop-down rather than being automatically filled). You should use this with `addNew_x` to set a default value for the specified lookup field. Set the value of this parameter to the value of the primary key of the parent record. For example, to start a new order, setting the customer to the one whose ID is 203:
  * `orders_view.php?addNew_x=1&filterer_customer_id=203`

### `SelectedID`

* Default value: None
* Details: If provided, displays the detail view for editing the record identified by the given primary key value. If the user doesn't have edit permission for the given record, a read-only detail view is displayed. Example:
  * `customers_view.php?SelectedID=203` displays the detail view for editing the customer whose primary key is 203.

### `dvprint_x`

* Default value: None
* Details: If set to any non-zero value, and a `SelectedID` value is also provided, displays the print preview of the detail view of the record specified. Example:
  * `customers_view.php?SelectedID=203&dvprint_x=1`

### `delete_x`

* Default value: None
* Details: If set to any non-zero value, and a `SelectedID` value is also provided, the specified record is *deleted* if the user has permission.
  > **Use this with extreme caution!**

### `noQuickSearchFocus`

* Default value: None
* Details: AppGini 5.90 and above
  * Passing `noQuickSearchFocus=1` when linking to a table view prevents auto-focusing of quick search button. This is useful for example when you embed a table view in another page and don't want the browser to "jump" down to the embedded page.



