---
title: Working with tables and records
linkTitle: Working with tables and records
slug: help/working-with-generated-web-database-application/working-with-tables-and-records
keywords: tables, records, table view, detail view, homepage, filters, sorting, pagination, child records, export records, print records
description: Learn how to work with tables and records in your AppGini application. This page explains the homepage, table view, detail view, and how to filter, sort, and export records.
---

# Working with tables and records

After [setting up your AppGini application](setup.md), you can start
working with your tables and records. This page will guide you through
the process of working with tables and records in your AppGini
application.

## The application homepage

This page provides links to accessible tables in your application,
depending on the group permissions of the logged user. In the following
screenshot, we can see the homepage of the [Northwind sample application](https://northwind.demos.appgini.com/).

![app homepage](https://cdn.bigprof.com/images/northwind-app-homepage-24.15.png "app homepage")

### Table groups

The homepage shows a list of tables accessible to the current user. AppGini allows
you to group related tables together by configuring **table groups** under the [table properties pane](../working-with-projects/table-properties-pane.md).
The homepage would then show these groups as collapsible sections, as shown in the screenshot above.

### Hide link in homepage

The [table properties pane](../working-with-projects/table-properties-pane.md) in AppGini also allows you to control whether a table is shown in the homepage or not.
This can be done by checking the option **Hide link in homepage** in the table properties pane.

### Table view title

The title of each table in the homepage is shown as a link. Clicking this link will take you to the table view page for that table.
You can customize the title of each table in the homepage by setting the **Table view title** option in the [table properties pane](../working-with-projects/table-properties-pane.md).

### Description

You can also add a description to each table in the homepage by setting the **Description** option in the [table properties pane](../working-with-projects/table-properties-pane.md).
You can use HTML tags in the description to format it as needed. Please note that based on the length of the description, it may be partially hidden in the homepage, and
a vertical scrollbar will appear to allow you to scroll through the description.

You can control the height of the description box in the homepage by setting the **Height of table panel in homepage (pixels)**
option in the [project properties pane](../working-with-projects/project-properties-pane.md).

### Table icon

You can set an icon for each table in the homepage by setting the **Table icon** option in the [table properties pane](../working-with-projects/table-properties-pane.md).
You can set this option by clicking the icon to the left of the table name in the table properties pane.

### Show record count in homepage

The option **Show record count in homepage** in the [table properties pane](../working-with-projects/table-properties-pane.md)
in AppGini can be used to display the number of records in each table in the homepage.
This displays the number of records *accessible* to the current user rather than the total number of records in the table.

### Allow adding new records from homepage

The option **Allow adding new records from homepage** in the [table properties pane](../working-with-projects/table-properties-pane.md)
in AppGini can be used to display an "Add new" button in the homepage for each table.
Clicking this button will display a modal dialog to add a new record to the table, as shown in the screenshot below.

![add new order from homepage](https://cdn.bigprof.com/images/northwind-add-new-order-from-homepage-24.15.png "add new order from homepage")

### Searching for tables

*Available in AppGini 24.13 and later*

The homepage also includes a search box at the top to allow you to search for a specific table by its name.
This is useful when you have a large number of tables in your application. 

![search for tables](https://cdn.bigprof.com/screencasts/live-search-in-homepage.gif "search for tables")

You can programmatically hide the search box by adding this code to the `hooks/header-extras.php` file:

```html
<script>AppGini.disableHomePageSearch = true;</script>
```

By default, you can search for table names only. If you want to search for table descriptions as well, you can add this code to the `hooks/header-extras.php` file:

```html
<script>AppGini.homePageSearchDescriptions = true;</script>
```

### Displaying the table navigation menus in the homepage

*Available in AppGini 24.14 and later*

You can display the navigation menus in the homepage by adding this code to the `hooks/__bootstrap.php` file:

```php
<?php define('HOMEPAGE_NAVMENUS', true); ?>
```

> **Note:** If the `hooks/__bootstrap.php` file doesn't exist, just create it as an empty file in the `hooks` folder of your project, then add the above code to it.

## The Table View page

Clicking on a table link in the homepage takes you to the table view page.
Here you can navigate data records of your table and edit, add and
delete records. As shown in the figure below, the table view shows data
in a table where records appear in rows, and each column represents a
field of the table.

![customers table view](https://cdn.bigprof.com/images/northwind-customers-tv-24.15.png "customers table view")

To change the displayed column headers, you can set the **Caption** property of each field in the [field properties pane](../working-with-projects/field-properties-pane.md).

### Sorting records

Column headers can be clicked to sort records by the clicked column. 
Clicking a column header once sorts the records in ascending order, and clicking it again sorts the records in descending order.
The following screenshot shows the customers table sorted by the 'Country' column in ascending order.

![customers tv sorted by country](https://cdn.bigprof.com/images/northwind-customers-tv-sorted-by-country-24.15.png "customers tv sorted by country")

To sort by multiple columns, click the [**Filter** button](#filtering-records) above the table. From there, you can add multiple sorting criteria.

### Quick search

The quick search box above the table allows you to search for records containing a specific value in any of the fields.
The quick search is case-insensitive and searches for the entered value in all fields of the table.
The matching records are displayed in the table view, with the matching text highlighted in a different style, as shown in the screenshot below.

![customers tv quick search](https://cdn.bigprof.com/images/northwind-customers-tv-quick-search-24.15.png "customers tv quick search")

To clear the quick search, click the **(X)** button at the right end of the quick search box.

### Filtering records

While quick search allows you to search for records containing a specific value in any field, 
filtering allows you to search for records based on more granular criteria.
For example, the screenshot below shows the filters page where we are filtering customers from the United States,
who have placed orders with a total value between $20,000 and $100,000.

![customers tv filters](https://cdn.bigprof.com/images/northwind-customers-filters-example.png "customers tv filters")

To filter records, click the **Filter** button above the table view. This will display the filters page, 
where you can set and combine multiple filters to search for specific records.

The filters page also allows users to specify a more granular sorting order for the records,
allowing sorting by up to four fields in ascending or descending order.

Users can also filter records based on ownership, allowing them to filter records owned by themselves, their group, or all records.
This section is displayed only if the current user has the access to records of their group or all records.

> **Pro Tip:** You can use the [Search Page Maker plugin](https://bigprof.com/appgini/applications/search-page-maker-plugin) to replace
> the default filters page with a more customized and user-friendly search page. For example, the screenshot below shows the
> same filters from the previous screenshot, but defined in a more user-friendly way using the Search Page Maker plugin.
>
> ![customers tv filters spm](https://cdn.bigprof.com/images/northwind-customers-filters-spm.png "customers tv filters spm")

After defining the filters, click the **Apply filters** button to apply the filters and display the filtered records in the table view.
Columns that are used in the filters would show a filter icon in the column header, as shown in the screenshot below.

![customers tv filters applied](https://cdn.bigprof.com/images/northwind-customers-tv-filters-applied-24.15.png "customers tv filters applied")

To clear the filters, click the **Show All** button at the top of the table view.

### Exporting records to CSV

You can export the records in the current table view to a CSV file by clicking the **Save CSV** button above the table.
This will download a CSV file containing the records in the current table view. If you've applied any filters, quick search, or sorting,
the exported CSV file will contain only the records that match the applied filters and sorting.

Once you've exported the records to a CSV file, you can open it in a spreadsheet application like Microsoft Excel or Google Sheets.
From there, you can analyze the data, create charts, or share the data with others.

![customers tv csv](https://cdn.bigprof.com/images/northwind-customers-tv-csv-24.15.png "customers tv csv")

### Printing records

You can print the records in the current table view by clicking the **Print Preview** button above the table.
This will display *all* records in the current table view in a print-friendly format, without pagination.
If you've applied any filters, quick search, or sorting, the print preview will contain only the records that match the applied filters and sorting.

From the print preview, you can use the browser's print functionality to print the records or save them as a PDF file.

![customers tvp](https://cdn.bigprof.com/images/northwind-customers-tvp-24.15.png "customers tvp")

### Viewing the SQL query of the current table view

*Available in AppGini 24.11 and later*

If you are signed in as the super admin, you can view the SQL query used to fetch the records displayed in the current table view.
This can be useful for creating custom reports or for debugging purposes. If the current table view is filtered, the SQL query will include the filters applied.
To display the SQL query, click the **SQL** button above the table view.

To copy the SQL query, just click anywhere in the SQL query box. This would copy the entire query to your clipboard, ready to be pasted into your favorite SQL editor.
To hide the SQL query, click the **SQL** button again.

![customers tv sql query](https://cdn.bigprof.com/images/northwind-customers-tv-sql-query-24.15.png "customers tv sql query")

To enable this feature, check the option **Allow admin access to table view SQL** under the **Security settings** section of the project properties pane in AppGini.

### Hide/Show columns

It's useful when there are many columns in a table to hide some of them to focus on the most important ones.
To do so, click the **Hide/Show columns** icon at the top right of the table view. This will display a dialog
where you can select which columns to hide or show. These settings are saved in the browser's local storage, 
so they persist across sessions for each user.

![customers tv show hide columns](https://cdn.bigprof.com/images/northwind-customers-tv-show-hide-columns-24.15.png "customers tv show hide columns")

### Applying actions to multiple records

You can apply actions to multiple records in the table view by selecting the records you want to apply the action to.
Once you select one or more records, a **More** button appears at the top of the table view. Clicking this button displays a menu with the available actions.

![customers tv more menu](https://cdn.bigprof.com/images/northwind-customers-tv-more-menu-24.15.png "customers tv more menu")

The available actions depend on the permissions of the logged user. For example,
super admins can delete multiple records at once, and can change the ownership of multiple records at once.

For users who can access the detail view (inclucing the super admin), the **Print Preview Detail View** action is available.
This action allows you to print the detail view of multiple records at once.

You can [add custom actions to this menu by using hooks](../advanced-topics/hooks/multiple-record-batch-actions.md).

### Child records

*Available in AppGini 23.15 and later*

If a table has a one-to-many relationship with another table (see [lookup fields](../working-with-projects/understanding-lookup-fields.md)),
you can [configure](../working-with-projects/understanding-lookup-fields.md#parentchildren-settings) the parent table to display a child info column for some or all of its child tables.
For example, you can display the count of orders of each customer in the customers table view, in the *Customer's orders* column.
In the same columns, you can directly create a new order for a customer by clicking the **+** button.

![customers orders modal](https://cdn.bigprof.com/images/northwind-customers-orders-modal-24.15.png "customers orders modal")

### Pagination

If the table has many records, the table view is paginated. You can navigate between pages using the pagination controls at the bottom of the table view.
These include the **Previous** and **Next** buttons. You can also jump to a specific page using the **Go to page** dropdown.

![customers tv goto page number](https://cdn.bigprof.com/images/northwind-customers-tv-goto-page-number-24.15.png "customers tv goto page number")

As of AppGini 24.15, you can also control the number of records displayed per page by clicking the **Records per page** dropdown.
This setting is saved in the browser's local storage, so it persists across sessions for each user, for each table.

![customers tv records per page](https://cdn.bigprof.com/images/northwind-customers-tv-records-per-page-24.15.png "customers tv records per page")

If you want to change the available options in the **Records per page** dropdown, you can do so by adding this JavaScript code to
the `hooks/footer-extras.php` or `hooks/header-extras.php` file:

```html
<script>
  AppGini.config.recordsPerPageOptions = [10, 25, 50, 100, 250, 500];
</script>
```

Adjust the values in the array to match the desired options.

---

## The Detail View

Clicking on a record in the table view takes you to the detail view page.
Here you can view and edit the details of the selected record. The detail view page
shows the record fields in a form layout, where you can edit the values of the fields.

![customer detail view](https://cdn.bigprof.com/images/northwind-customers-dv-full-permissions-24.15.png "customer detail view")

The above screenshot shows the detail view of a customer record in the 
[Northwind sample application](https://northwind.demos.appgini.com/customers_view.php?SelectedID=ANATR).
The user has full permissions on this table, so they can view, edit and delete the record. For users
with limited permissions, some of the actions may be unavailable. For example, a user with read-only permissions
will see the detail view like this:

![customer detail view read-only](https://cdn.bigprof.com/images/northwind-customers-dv-read-only-24.15.png "customer detail view read-only")

For clarity, let's assign a number to each section of the detail view so we can refer to them in the explanations below:

![customer detail view sections](https://cdn.bigprof.com/images/northwind-customers-dv-full-permissions-labeled-24.15.png "customer detail view sections")

### Detail view main header (1)

The main header of the detail view shows the title of the table, as specified in the caption property of the table properties pane in AppGini.
It also shows the table icon, also specified in the table properties pane. If the user has the permission to insert new records, an **Add New** button is displayed here.

### Detail view title (2)

The title of the detail view is shown at the top of the form. This title is specified in the **Detail view title** property of the table properties pane in AppGini.

### Admin info button (3)

If the current user is a super admin, an **Admin info** button is displayed at the top right of the detail view.
Clicking this button displays a dialog that displays the record owner, owner group, and the record creation and last modification dates.
It also allows the super admin to assign the record to a different owner, show all records of the owner or their group, and email the owner
or the owner group.

![customer detail view admin info](https://cdn.bigprof.com/images/northwind-customers-dv-admin-info-menu-24.15.png "customer detail view admin info")

### Child record links (4)

If the current table has a one-to-many relationship with another table, and the child link is [configured](../working-with-projects/understanding-lookup-fields.md#parentchildren-settings)
to be displayed in the detail view, the child record links are displayed here. Clicking the link opens the table view of the child table, 
filtered to show only the child records related to the current record.

### Detail view layout toolbar (5)

*Available in AppGini 24.14 and later*

The detail view layout toolbar allows users to switch between different layouts of the detail view.
Based on the screen width, users may be able to switch between 1-column, 2-column, or 3-column layouts.
The sast-selected layout is saved in the browser's local storage, so it persists across sessions for each user
for each table.

![customer detail view layout toolbar](https://cdn.bigprof.com/screencasts/dv-layout-switcher.gif "customer detail view layout toolbar")

### Detail view actions (6)

The detail view actions allow users to perform various actions on the current record. The available actions depend on the permissions of the logged user.
The **< Back** button allows users to return to the table view. 

The **Print Preview** button allows users to preview a read-only version of the current record
for printing or saving as a PDF.

![customer detail view print preview](https://cdn.bigprof.com/images/northwind-customers-dvp-24.15.png "customer detail view print preview")

The print preview page can be easily customized to control the number of columns and display/hide child records.

If the user has the permission to edit the current record, the **Save Changes** button is displayed. Similarly, if the user has the permission to delete the current record,
the **Delete** button is displayed.

To allow easier navigation between records, the **Previous** and **Next** buttons are displayed. These buttons allow users to navigate to the previous or next record
without returning to the table view. The order of records is based on the currently applied filters and sorting.

### Detail view fields (7)

The detail view fields show the values of the record fields. The fields are displayed in the same
order as they are defined in AppGini, rather than the order they are defined in the database.
You can control the order of fields by moving them up or down in the project browser pane in AppGini.

If the current user doesn't have the permission to edit fields, the fields are displayed in a read-only mode.

### Child record tabs (8)

If the current table has a one-to-many relationship with one or more child tables,
and the child tabs are [configured](../working-with-projects/understanding-lookup-fields.md#parentchildren-settings)
to be displayed in the detail view, the child record tabs are displayed here. The tab title and icon can be
configured as well.

Only users with the permission to view the child records will see the child tabs.

### Adding new child records (9)

If the current user has the permission to add new records to a child table, an **Add New** button is displayed at the top of that child tab.
Clicking this button opens a modal dialog to add a new record to the child table, with the parent lookup field pre-filled with
the current record's value (so that the new child record is automatically linked to the current parent record).

### Child table headers (10)

The child table headers show the title (caption) of the fields in the child table. The title of each field can be customized in the field properties pane in AppGini.
Clicking a column header sorts the child records by that column in ascending order. Clicking the same column header again sorts the records in descending order.

### Open child record detail view (11)

Clicking this icon opens the detail view of the child record in a modal dialog. 
This allows users to view and, if they have the permission, edit or delete the child record without leaving the parent record detail view.
After editing the child record, the child records tab is refreshed to reflect the changes.

### Child records pagination (12)

This sections shows the pagination controls for the child records and the current position in the pagination.
If there is only one page of child records, the pagination controls are hidden.

