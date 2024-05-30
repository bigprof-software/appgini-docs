---
title: Setting the child record owner to match the owner of its parent record
linkTitle: Record owners
slug: help/record-owners
keywords: record owner, parent record, child record, owner, automatic, parent table, child table, lookup field, permissions, editing, owner user, Fix record owners, utility
description: Learn how to set the owner of a child record to match the owner of its parent record in AppGini, and how to update the owner of existing child records.
---

# Setting the child record owner to match the owner of its parent record

## About this feature

As of AppGini 24.10, you can set the owner of a child record based on the owner of its parent record. This is useful in many scenarios, for example:

*   You have a table of `projects` and another table of `tasks`. Each task belongs to a project. You want to set the owner of each task to the owner of its parent project.
*   You have a table of `orders` and another table of `order_details`. Each order item belongs to an order. You want to set the owner of each order item to the owner of its parent order.

This is specially useful if you set the permissions of the child table to allow editing only by the owner of the record. If user Bob creates a project, then user Alice adds a task to that project, you might want the task to be owned by Bob so he can edit it.

To set the owner of a child record to the owner of its parent record, you need to do the following:

1.  In AppGini, go to the table of the child records (e.g. `tasks` or `order_details` in the above examples).
    
2.  Under the **Detail view settings** section, open the **Record owner** dropdown and select the lookup field that points to the parent table (e.g. `ProjectID` or `OrderID` in the above examples).
    
    ![Record owner](https://cdn.bigprof.com/images/setting-child-record-owner.png)
    
3.  Regenerate and upload your AppGini application.
    

Now, whenever an order item is created or edited, its owner user will be set to the owner of its parent order.

## Updating the owner of existing child records

If you already have existing child records, the above setting will not apply to them unless you update each record manually. This can be a pain if you have many records. That's why we've also added a utility to mass update the owner of existing child records.

To use this utility, follow these steps:

1.  Sign in as an administrator to your AppGini application.
    
2.  Go to the admin area and open the **Utilities** menu.
    
3.  Click on **Fix record owners**.
    
    ![Utilties /> Fix record owners](https://cdn.bigprof.com/images/utilties-fix-record-owners.png)
    
4.  This would open a page that lists all tables where the owner of child records can be updated. Click the **Start** button above the list of tables.
    
    ![Fix record owners page](https://cdn.bigprof.com/images/admin-area-fix-record-owners-page.png)
    
5.  Leave the page open until the process is complete. This might take a while if you have many records.
    
6.  Once the process is complete, the button would display the message **Done**. You can now close the page or navigate to another page.
    
    ![Fix record owners page done](https://cdn.bigprof.com/images/admin-area-fix-record-owners-page-done.png)
    

## A practical example: Set the country sales manager as the owner of all orders and order items of that country

<video style="width: 100%; height: auto;" controls>
<source src="https://cdn.bigprof.com/screencasts/setting-automatic-record-owners-based-on-parent-table.mp4" type="video/mp4">
<a href="https://cdn.bigprof.com/screencasts/setting-automatic-record-owners-based-on-parent-table.mp4">Watch the video screencast</a>
</video>

In this screencast, we are using the Northwind sample application. We configure the record owner of the `orders` table to be the `CustomerID` field, which is a lookup field pointing to the `customers` table. This means that the owner of each order would be the same as the owner of the customer record it belongs to.

We also configure the record owner of the `order_details` table to be the `OrderID` field, which in turn is a lookup field pointing to the `orders` table. This means that the owner of each order item would be the same as the owner of the order it belongs to.

This way, the owner of the customer record would be the owner of all orders and order items belonging to that customer. We'll then list all customers from Germany and set the sales manager of Germany as the owner of all German customers' records.

If a sales person creates an order for a German customer, the sales manager of Germany would become the owner of that order and all order items belonging to that order.

To apply this to existing German orders and order items, we use the **Fix record owners** utility to update the owner of all existing orders and order items.

