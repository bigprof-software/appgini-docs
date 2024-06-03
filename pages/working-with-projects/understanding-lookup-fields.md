---
title: Understanding lookup fields
linkTitle: Lookup fields
slug: help/working-with-projects/understanding-lookup-fields
keywords: lookup fields, foreign keys, parent table, child table, master detail, parent children settings, radio buttons, options list
description: Lookup fields are how AppGini links 2 fields from 2 tables together. This page explains how to set up lookup fields, how they appear in the generated application, and how to configure parent/children settings.
---

# Understanding lookup fields

## Foreign keys in relational databases

In the world of relational databases, a foreign key is a field in a table that uniquely identifies a row in another table.
For example, let's say we have a table for storing orders and another table for storing customers. Each order is placed by a customer, so the orders table should have a field that uniquely identifies the customer who placed the order. This field is called a foreign key, and it links the orders table to the customers table.

![Example ER diagram showing a foreign key linking orders to customers](https://cdn.bigprof.com/images/simple-er-diagram.png "Example ER diagram showing a foreign key linking orders to customers")

One might ask, why not just store the customer name in the orders table? The answer is that storing the customer name in the orders table would lead to data redundancy. For example, if a customer changes their name, we would have to update all orders placed by that customer. This is not only cumbersome but also error-prone. By using a foreign key, we only store the customer ID in the orders table, and the customer name is stored in the customers table. This way, if a customer changes their name, we only need to update the customers table, and all orders placed by that customer would automatically reflect the new name.

The above concept is referred to as ***normalization*** in database design. It's a set of rules that help us design databases in a way that minimizes data redundancy and ensures data integrity.

## Lookup fields in AppGini

AppGini implements the concept of foreign keys using ***lookup fields***. Just like foreign keys in relational databases, lookup fields in AppGini link 2 fields from 2 tables together.
AppGini adds some interesting features to lookup fields, such as displaying the linked data as a drop-down menu or radio buttons, and automatically copying child records when copying parent records.
Also, AppGini allows you to configure parent/children settings to display child records below the detail view of the parent record, and to display the count of child records in the table view of the parent table.

We'll discuss these features in more detail in the following sections.

The following screenshot from the [orders table](https://northwind.demos.appgini.com/orders_view.php) of the [Northwind online demo](https://northwind.demos.appgini.com/) shows a list of orders. The "Customer" field is a lookup field that links each order to a customer in the customers table. The "Employee" field is another lookup field that links each order to an employee in the employees table.

![Lookup fields in the orders table of the Northwind online demo](https://cdn.bigprof.com/images/lookup-fields-displayed-in-table-view.png "Lookup fields in the orders table of the Northwind online demo")

You can also see the "Order items" column at the right of the table in the above screenshot. This column displays the count of order items for each order. And it also allows you to add new order items directly from the table view of orders. This is a feature that can be enabled in AppGini by configuring parent/children settings, as we'll see later in this page.

## Configuring lookup fields in AppGini

![Lookup field tab in AppGini](https://cdn.bigprof.com/images/appgini-lookup-tab-24.14.png)

The above screenshot shows the lookup field tab in the field properties pane of AppGini. This tab is where you configure a field as a lookup field. Here, we are configuring the "Customer" field in the orders table to be a lookup field that links to the customers table. Let's review the options in the lookup field tab:

* **Parent table**: This is the table that contains the source data for the lookup field. In our example, the parent table is the customers table.
* **Parent caption field part 1**: This is the field in the parent table that contains the data to be displayed in the lookup field. In our example, the parent caption field is the "CompanyName" field in the customers table.
* **Parent caption field part 2**: This is an optional field that can be joined to the first field to display more data in the lookup field. For example, you could join the "FirstName" and "LastName" fields in the customers table to display the full name in the lookup field.
* **Separator**: This is the character (or characters) that separates the data from the first and second fields in the lookup field. For example, you could use a space character as a separator to display the full name as "John Doe" instead of "JohnDoe".
* **Show as radio buttons**: If checked, the lookup field will be displayed as radio buttons instead of a drop-down menu. This is useful when you have a small number of options to choose from.
  ![A lookup field displayed as radio buttons in the detail view](https://cdn.bigprof.com/appgini-desktop/help/understanding-lookup-fields-4.png)
* **Inherit access permissions**: If checked, the lookup field will inherit the access permissions of the parent table. This is useful when you want to restrict the list of options in the lookup field based on the user's permissions in the parent table.
* **Link to parent record in detail view**: This drop-down menu allows you to display a link to the parent record in the detail view of the child record. This is useful when you want to quickly navigate to the parent record from the child record.
  The following options are available:
  * **Disabled**: No link will be displayed.
  * **Open parent record in a modal popup window**: The parent record will be displayed in a modal popup window.
  * **Open parent record in the same page**: The parent record will be displayed in the same page, navigating away from the child record.
  * **Open parent record in a new window**: The parent record will be displayed in a new browser tab or window.

To set a field as a lookup field in AppGini, create a new field and, in its properties pane, go to the "Lookup field" tab, as displayed in the above screenshot. From the "Parent table" drop-down, select the table that contains the source data. From the "Parent caption field part 1" drop-down, select the source field. Set other options as needed, as described above.

> **Note**: AppGini will change the data type of the lookup field to be the same as that of the primary key of the parent table. This is normal behavior and you shouldn't alter it.

## How would the lookup field appear in the detail view of the generated application?

![Lookup field in the detail view of the generated application](https://cdn.bigprof.com/appgini-desktop/help/understanding-lookup-fields-2.png)

The above screenshot shows the detail view of the products table as generated by AppGini. The detail view is where users can edit records of the table. The "Supplier" and "Category" fields are lookup fields that bring their data from the suppliers and products tables, respectively. This data is represented in a drop-down menu for each field. 

If you choose to display the lookup field as radio buttons, the detail view would look like this:

![A lookup field displayed as radio buttons in the detail view](https://cdn.bigprof.com/appgini-desktop/help/understanding-lookup-fields-4.png)

## Parent/Children settings

<img src="https://cdn.bigprof.com/screencasts/parent-children-settings-button.png" style="float: right; margin-left: 1rem;">

When you configure a field as a lookup field, the parent table you specify for that field can, in turn, be configured to show some special behavior. In AppGini, if you click the parent table, you should see a button labeled Parent/Children settings, like the one to the right.

Clicking that button displays the Parent/Children settings window - as shown below, which allows you to enable displaying child records below the detail view of the parent record.

![Parent/Children settings window in AppGini](https://cdn.bigprof.com/appgini-desktop/help/appgini-23.15-parent-children-settings.png)

This window lists all child tables of the current table (that is, tables that contains a lookup field where the parent table is set to the current table). Select a child table from the grid at the left to configure its related behavior in the parent table. An example of parent and child tables is the orders and order_details tables. The orders table is a parent table of order_details. Every order saved in the orders table would have one or more items saved in the order_details table.

* **Show tab below detail view** would display a list of child records below the detail view when you select a parent record. For example, this is how an order looks like in the detail view, where the order items are listed at the bottom.

    ![Child records displayed below the detail view of a parent record](https://cdn.bigprof.com/screencasts/orders-table-order-details-child-records.png)

	* **Show icon** would display the child table icon to the left of the tab name. This is useful when you have many child tables and you want to quickly identify the child table you're looking at.
	* **Auto close modal after saving changes** would automatically close the modal window after saving changes to a child record. This is useful when you have many child records to edit and you want to quickly navigate between them.

* **Copy child records when copying parent** would copy child records if the user copies the parent record by clicking the **Save As Copy** button. The lookup field in the copied child records would be automatically set to the new parent record. This is a very handy feature for scenarios like duplicating an order and all its order items, a product, and all the items in its bill of materials, ... etc. It saves users the time to manually add child records from scratch.

    > Copying child records requires *cURL PHP extension* to be installed and enabled on your server.

    As of [AppGini 5.81](https://bigprof.com/appgini/release-log), a new configuration parameter, `$host`, was added in `config.php`. The value of this parameter is set by default to the host name of your server as automatically detected by PHP. However, if copying of child records is not working (and curl PHP extension is enabled), you might need to check and change this value manually by editing the config file. PHP might not detect the internal host name correctly in cases where servers are behind NAT or load balancers, Docker containers, or similar network configurations.

* **Display child info in the table view**. Starting with AppGini 23.15, the Parent/Children settings dialog includes the option **Show count of children in table view**. Enabling this option displays the count of child records in the table view. You can also add new child records directly from the table view by enabling the option **Add new children from table view**. The screenshot below shows how both options would be displayed in the table view of the orders table, showing the count of order items in each order, and allowing users to add new items directly from the table view of orders.

    ![Displaying child info in the table view](https://cdn.bigprof.com/appgini-desktop/help/child-info-column-in-table-view.png)

    *See also the related [video tutorial](#displaying-child-info-count-add-new-in-the-table-view)*

## Related screencasts

### AppGini lookup fields and master detail pages 

The following video tutorial demonstrates how to set up lookup fields in AppGini and how to configure parent/children settings to display child records below the detail view of the parent record.

<iframe width="854" height="464" src="https://www.youtube.com/embed/XQh-9S7yd34" frameborder="0" allowfullscreen=""></iframe>

### Using auto-fill lookup fields to automatically populate fields from another table

Auto-fill lookup fields are a special type of lookup fields that is automatically filled with data from the parent table based
on the value of another lookup field. The following video tutorial demonstrates how to set up auto-fill lookup fields in AppGini.

<iframe width="854" height="464" src="https://www.youtube.com/embed/bzAWn_YybxY" frameborder="0" allowfullscreen=""></iframe>

### Creating cascading drop-downs with AppGini

It's possible to set up a lookup field to filter its options based on the value of another lookup field. For example, you could set up a lookup field for "Country" and another lookup field for "City". The "City" field would only show cities in the selected country. The following video tutorial demonstrates how to set up cascading drop-downs in AppGini.

<iframe width="854" height="464" src="https://www.youtube.com/embed/ySABQLupBRs" frameborder="0" allowfullscreen=""></iframe>

### Displaying child info (count + add new) in the table view

<video style="width: 100%; height: auto;" controls>
<source src="https://cdn.bigprof.com/screencasts/child-info-in-parent-table-view.mp4" type="video/mp4">
Your browser does not support the video tag.
</video>

## Querying lookup fields in SQL

Although lookup fields display data from the parent table in the generated application, the actual data stored in the database is the primary key of the parent record. For example, the "Customer" field in the orders table stores the customer ID from the customers table. This is how foreign keys work in relational databases. If you need to query the data stored in a lookup field, you should join the parent table to the child table using the primary key stored in the lookup field.

This topic is discussed in more detail in the [using lookup fields in calculations](../advanced-topics/hooks/using-lookup-fields-in-calculations.md) page.

