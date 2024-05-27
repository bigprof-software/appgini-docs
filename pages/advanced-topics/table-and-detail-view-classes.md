---
title: Table and detail view classes
linkTitle: Table and detail view classes
slug: help/advanced-topics/table-and-detail-view-classes
---

# Table and detail view classes

As of AppGini 5.60, a new advanced option was added to allow you to
specify one or more space-separated CSS class names to apply to the
table view and the detail view of a table. This option can be found by
selecting a table in your project, then clicking the **Template**
button in the table properties pane. This would open a dialog as shown below.

![How to open the template window in AppGini 5.60 and higher.](https://cdn.bigprof.com/images/table-view-template-dialog.png "How to open the template window in AppGini 5.60 and higher.")

Clicking the **Advanced** button will reveal even more options.

![](https://cdn.bigprof.com/images/table-view-template-dialog-advanced.png "The 'Advanced' button reveals options for changing table and detail view classes.")

You can specify CSS classes to apply to the table view and the detail
view. Most of the time, these would be [Bootstrap grid
classes](https://getbootstrap.com/css/#grid) . You could also select
classes form the drop-down at the right. For example, to set the table
view to display on the left part of the page, while the detail view on
the right part, you could use the class `col-md-6` for each. The result
would look something like this when you generate your application.

> TODO: Add a screenshot here.

Of course, to display the table and detail view on the same page, the
option **Display detail view in a separate page** must be *unchecked*
for that table.




