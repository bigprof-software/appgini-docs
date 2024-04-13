---

title: Hooks (AKA events)
linkTitle: Hooks/events
slug: help/advanced-topics/hooks

---

AppGini Hooks (events) are means of advanced customization of AppGini-generated apps. They allow you to customize your application behavior in a way that is separate from the generated code. This way, your custom code doesn't get overwritten if you regenerate your app later, and your project is ready for use directly after code generation without any further modifications.

> ***Hooks work by intercepting users' actions (inserts, deletes, edits, selection of records, ... etc), and controlling what happens before and after these actions.***

## How do hooks work?

To use hooks, you should place your code modifications in the generated `hooks` folder. This folder contains a set of files that AppGini creates only once and they don't get overwritten later. These files contain hook functions that you can define. Your AppGini app calls these functions when performing specific tasks and executes the code you define in them.

For example, to send a notification email when a new order is added to the `orders` table, you should add the mail sending code in the `orders_after_insert()` function inside the `hooks/orders.php` file. This function is automatically called by the AppGini-generated application whenever a new record is created in the `orders` table. Any code you place inside that function is executed when a new record is added to that table through the AppGini-generated interface.