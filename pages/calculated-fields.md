---

title: Calculated fields
linkTitle: Calculated fields
slug: help/calculated-fields

---

> Calculated fields feature is available in AppGini 5.80 and above.

## What are calculated fields?

As of AppGini 5.80, you can now configure one or more fields in your app as _calculated fields_. Calculated fields are read-only fields that get populated automatically with a value calculated from any formula you specify. The formula for a calculated field must be a MySQL-compatible SQL query that returns a single value. The value returned from the SQL query is saved to the calculated field whenever the record containing that field is accessed by users.

Calculated fields can be very helpful in numerous scenarios. For example, to automatically calculate and update the subtotal and total of an invoice, number of students enrolled to a course, average score of course, due date of an invoice (for example if you want to set a business rule to set a due date of an invoice to 15 days after issue date), most recent status of a shipment, flag overdue tasks, indicate if prospect customer should be contacted today ... etc. There are endless possibilities to applying calculated fields.

## Conditions for a field to become a calculated field

If you are trying to set a field as a calculated field, it must **NOT** meet any of the following conditions

* Fields not set as read only
* Primary key fields
* Required fields
* Text area and rich (HTML) area fields
* Auto-increment fields
* Unique fields
* Web/email link fields
* Image/file upload fields
* Map/video fields
* Lookup fields
* Options list fields
* Fields that have a data format specified (you can apply a data format in the calculation instead)
* Fields with default values (you can apply a default value in the calculation instead)

You'll see a clear error message in AppGini explaining why a field can't be set as a calculated field if any of the above conditions apply to that field.

![Calculated field error in AppGini.](https://cdn.bigprof.com/screencasts/calculated-field-error-message-for-non-read-only-field.png)

Also, if you set a field as a calculated field, and later on make some changes to the field that prevent it from being a calculated field, you'll see a warning when generating the app that the calculation will be skipped, along with reason for skipping:

![Calculated field skipped when generating an AppGini app](https://cdn.bigprof.com/screencasts/skipping-calculated-field-on-app-generation.png)

## How to configure a calculated field

The basic steps are:

1. Set the field as read-only (and make sure the other settings mentioned above don't apply to it).
2. Click the _Calculated field_ tab.
3. Check the option _Automatically calculate the value of this field using the following SQL query_
4. Type the SQL query for calculating the field value.

![](https://cdn.bigprof.com/screencasts/configure-calculated-field.gif)

Valid SQL queries to use are those returning a single value to be saved in the calculated field. For example, this is a valid query to calculate the subtotal of an invoice line by multiplying the unit price by the quantity:

```sql
SELECT quantity * unit_price FROM invoice_items WHERE id='%ID%'
```

## Special variables for use in calculated field queries

In the above query, we're using the special variable `%ID%`. When executing the query, this would be replaced by the primary key value of the current record. The following variables can be used in queries:

* `%ID%` Will be replaced with the ID (primary key) value of the current record before executing the query.
* `%USERNAME%` Will be replaced with the currently logged username before executing the query.
* `%GROUPID%` Will be replaced with the group ID of the currently logged username before executing the query.
* `%GROUP%` Will be replaced with the group name of the currently logged username before executing the query.

Please make sure to use single quotes around the above variables when using them in queries. You don't have to manually type the variable into the query in AppGini; you can place the cursor at the location where you want to insert the variable, and then click the desired variable at the right as shown in this screenshot:

![](https://cdn.bigprof.com/screencasts/inserting-placeholders-into-queries-for-calculated-fields.png)

## The query helper

For quicker and more precise query entry, we recommend using the _query helper_. Click the _Query helper_ button below the query box to launch the query helper window, which looks like this:

![](https://cdn.bigprof.com/screencasts/calculated-field-query-helper.png)

The query helper window allows you to quickly insert various special code pieces into your SQL query. Just place the cursor at the position where you want to insert the piece of code, then choose the code you want to insert from the boxes at the right or the bottom of the query box, then click the _Insert_ button.

You can insert special variables (as explained above), field names, SQL functions, or JOIN statements that join the table of the calculated field with one or more of its parent or child tables. This not only saves you time for manually typing these snippets, but also reduces typos and syntax errors.

Of course, using calculated fields requires some knowledge of SQL language, specifically SQL SELECT statement. There are many great [SQL tutorials](https://www.w3schools.com/sql/sql_select.asp) available online, as well as the [official MySQL reference](https://dev.mysql.com/doc/refman/8.0/en/select.html). We'll also list a few examples below that cover some widely-used scenarios. You can also [ask for help from other users on our forum](https://forums.appgini.com/).

In the screencast below, we create a new 'Sales' field in the clients table, and configure it as a calculated field that displays the total of sales made to each client, by retrieving the sum of her paid invoices total. We use the _Query helper_ window to quickly and precisely write the query, including the join between the clients and invoices tables.

<iframe width="706" height="397" src="https://www.youtube.com/embed/oERXyqM3zew?rel=0" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen=""></iframe>

## Debugging your query

You can easily debug your SQL query using [phpMyAdmin](https://www.phpmyadmin.net/) or any similar MySQL admin utility. Select your database, then go to the SQL tab, where you can type or paste your SQL query. Replace `%ID%` with the primary key value of the record you wish to test. Also replace any other variables with their values, if needed. Then execute the query. The query should return a single value, and that should be the value you expect in your calculated field. If this is not the case, or if you see any error messages, you should edit the query and retry until no errors are shown and the expected value is returned.

## Batch-updating calculated fields via command line

_Added in AppGini 5.82_

As described in the known issues below, calculated fields are normally updated only when users access them via the table or detail view. Sometimes, you want to update a large number of records without having to access each one. So, we added a command line script for doing that.

Command line means it can't be run from the browser. You can run it only from a terminal window, or [install it to your server's crontab file](https://www.tecmint.com/run-php-script-as-normal-user-via-cron-job-scheduler/) to run it on a schedule.

If your app is hosted on your local Windows PC (for example using [Xampp](https://bigprof.com/appgini/tips-and-tutorials/installing-local-testing-environment-xampp)), you can open a command line terminal by opening the Windows Start menu and typing `cmd` then pressing Enter.

If your app is hosted remotely on a Linux server, you need to have shell access and connect to your server via an SSH client (for example [PuTTY](https://www.putty.org/))

In both cases (Windows and Linux command line), you should navigate to the folder where your AppGini app is hosted and run this command:

```bash
php cli-update-calculated-fields.php
```

The above command would update all calculated fields in all tables. However, on large tables, this might take a long time. So, the command line tool provides several options to control its behavior as follows (you can get command line help on the tool by adding `-h` after the above command):

```
Supported arguments:
  -t: comma-separated list of tables to update.
      all tables will be updated if this argument is not specified
  -s: comma-separated list of starting record numbers.
      Default is 0 (beginning of each table)
  -l: comma-separated list of records count to update in each table.
      Default is records count - start
  -x: comma-separated list of tables to exclude from updating,
      overrides -t
  -u: username to use in queries that have %USERNAME% placeholder.
      Default is admin user
  -h: displays this help message

Examples:

php cli-update-calculated-fields.php
  Updates all records of all tables. Not recommended for large databases.

php cli-update-calculated-fields.php -s 2000 -l 1000
  Updates 1000 records starting from rec# 2000 in all tables.

php cli-update-calculated-fields.php -t clients,orders -s 100,1000 -l 10,100
  Updates records 100:110 of clients table and 1000:1100 of orders table.

php cli-update-calculated-fields.php -x clients
  Updates all records of all tables excluding clients table.

php cli-update-calculated-fields.php -u bob
  Updates all records of all tables as user bob.
```

## Basic examples of calculated fields

For simple calculations performed on other fields of the same record, we'll list some common examples below.

### Calculate subtotal for an invoice line by multiplying unit price and quantity

Let's assume you have an app for managing invoices. The invoice header (invoice number, due date, customer info, ... etc) is stored in the `invoices` table. Invoice lines (item, quantity, unit price, subtotal) are stored in the `invoice_items` table. You'd like to have the subtotal field automatically calculated when adding or editing an invoice line.

To set up this calculation, we'd check the read-only option for the `subtotal` field, then set it as a calculated field, and use this SQL query for calculating its value:

```sql
SELECT
`invoice_items`.`unit_price` * `invoice_items`.`quantity`
FROM `invoice_items` 
WHERE `invoice_items`.`id` = '%ID%'
```

### Automatic code by concatenating 2 or more fields

In some data entry scenarios, it's required to create an automatic code given one or more fields in the record. This is typical for product codes, inventory transaction codes, ... etc.

For example, let's assume we have a `products` table. When defining a new product, we'd like the product code to be the first 5 letters of the product `name` field, capitalized, followed by department ID, `dept_id`, followed by the characters `SN`, followed by the serial number as obtained from the auto-increment primary key field `product_id`. To set up this coding scheme, we'd create a read-only field, `product_code`, set its data type as `VarChar` of a suitable length, 50 or so, set it as a calculated field, and use this SQL query for calculating its value:

```sql
SELECT CONCAT(
    UPPER(SUBSTRING(`products`.`name`, 1, 5)),
    `products`.`dept_id`,
    'SN',
    `products`.`product_id`
) FROM `products` 
WHERE `products`.`product_id` = '%ID%'
```

When a user defines a new product and saves it, the `product_code` field would be set automatically based on the above query to something like `CELLP22SN302`.

## More advanced examples of calculated fields

### Updating batch status to 'Consumable', 'Warning' or 'Expired' based on expiry date

In this example, let's assume we have an inventory app, and for each batch of items we add to inventory, we have an expiry date. We want to automatically update the `status` field of each batch to `Consumable` if expiry date is 30 days or more ahead, `Warning` if less than 30 days ahead, or `Expired` if expiry date is today or older.

To do so, we should configure the `status` field as read-only, calculated field, and use a query like this for the calculation:

```sql
SELECT IF(
  DATEDIFF(`expiry_date`, NOW()) > 30,
  'Consumable',
  IF(
    DATEDIFF(`expiry_date`, NOW()) > 0,
    'Warning',
    'Expired'
  )
) FROM `batches`
WHERE `id` = '%ID%'
```

Here is a brief explanation of the above query: The SQL `IF()` function accepts 3 parameters: a condition to check, and a value to return if the condition is true, and a value to return if false. For example, `IF(10 > 1, 'yes', 'no')` checks if 10 is greater than 1, and returns either 'yes' if true or 'no' if false. Of course, this should return 'yes'. In the above query, we _nested_ 2 IF expressions to evaluate 3 cases rather than just 2. `DATE_DIFF()` accepts 2 dates and returns the difference between them in days. `NOW()` returns the current date/time.

### Invoice subtotal by summing subtotals of invoice items

In this example, let's assume we have an `invoices` table that includes a `subtotal` field. We want to calculate the invoice subtotal by summing the subtotals of all lines of the invoice (each line contains a unit price and a quantity that we want to multiply to obtain the line subtotal). We should set the `subtotal` field as read-only calculated field. And here is a query we can use to perform this calculation:

```sql
SELECT
  SUM(`invoice_items`.`unit_price` * `invoice_items`.`quantity`)
FROM
  `invoices` LEFT JOIN
  `invoice_items` ON `invoices`.`id` = `invoice_items`.`invoice_id`
WHERE
  `invoices`.`id` = '%ID%'
```

In the above query, we are _joining_ the `invoices` table and the `invoice_items` table. Those 2 tables are linked through the `invoice_id` lookup field in `invoice_items` table. Line 5 above performs this join. Line 2 multiplies each invoice item's quantity by its unit price and returns the sum for all items in the current invoice.

## Looking for more help with queries?

Calculated fields is a very powerful tool, and there are so many different usage scenarios. We tried to cover some common use cases above, but if you need more help, feel free to post your usage case on our [forum](https://forums.appgini.com/). We'll be frequently updating this page with more usage cases, so try also checking it later.

Please see [this forum topic](https://forums.appgini.com/phpbb/viewtopic.php?f=2&t=4266#p17008) for some excellent notes on calculated fields by Jan from bizzworxx (thanks Jan!).

## Known issues

The following limitations apply to calculated fields:

* Calculated fields are re-evaluated every time the record or its child records are accessed in the table view, the detail view, the print preview or the child table view. This could cause some performance issues for complex queries. This can be resolved using [MySQL query caching](https://dev.mysql.com/doc/refman/5.7/en/query-cache.html).
* Calculated fields are evaluated only when their records/child records are accessed. If data that affects the calculation is changed, and you then retrieve the value stored in the calculated field through a third-party app, it won't reflect the changes until it's accessed through your AppGini app itself.
* Similarly, if the calculated field is used as a parent caption field for a lookup field in another table, the lookup drop-down might not display the most up-to-date calculated values until the records of the calculated field are accessed in your AppGini app.

The simple work-around for the second and third issues above is to access the record(s) containing the calculated field in the table view in your AppGini app to update them.
