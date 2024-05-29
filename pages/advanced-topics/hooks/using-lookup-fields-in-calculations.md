---
title: Using lookup fields in calculations
linkTitle: Using lookup fields in calculations
slug: help/advanced-topics/hooks/using-lookup-fields-in-calculations
---

# Using lookup fields in calculations

When customizing the [`before_insert`, `after_insert`, `before_update` or
`after_update`
hooks](/appgini/help/advanced-topics/hooks/table-specific-hooks/) to make
a calculation, you might encounter a case where one or more fields in
the formula you're calculating is a [lookup field (foreign
key)](/appgini/help/working-with-projects/understanding-lookup-fields/) .
In this case, the value of `$data['fieldname']` (where `fieldname`
is the name of the concerned lookup field) is probably NOT the value
you'd like to use for your calculation.

To explain that, let's have a brief look at how lookup fields work. A
lookup field is a way of referencing a value from one table in another
table. For example, we might be storing product unit price in the
`products` table and want to use that same unit price in the
`order_items` table without having to manually re-type the price ...
this is important not just to save a few keystrokes during data entry,
but to also ensure referential integrity ... If you throw the same
product price into every table in your database, it will be a nightmare
to update the price later and make sure all tables see the updated
price.

To avoid that mess, we use lookup fields. A unit price lookup field in
the `order_items` table doesn't store the actual price value but
rather a reference value that points to the location of the unit price
in the `products` table. The best possible reference to use is the
primary key of the product. Let's have an example with numbers to see
this in action.

### Products table

 | ID   | Product                       | Unit price   |
 | ---- | ----------------------------- | ------------ |
 | 15   | Lindt HELLO Crunchy Nougat    | 2.05         |
 | 16   | Lindt CREATION Crème Brûlée   | 2.35         |
 | 18   | Lindt EXCELLENCE Mint         | 3.25         |
 | 19   | Lindt CREATION Pistachio      | 3.25         |

That was yummy! Each entry in the above table has a primary key `ID`
value, which doesn't tell much about the item itself but is used as a
reference to it. So, if we talk about product #18, we know we are
referring to *Lindt EXCELLENCE Mint* priced at $3.25. Primary key
fields are usually (but not necessarily) named `ID`.

Let's now have a look at some data from the `order_items` table.

### Order Items table

  | ID   | Order ID | Product | Unit price | Quantity | Subtotal |
  | ---- | -------- | ------- | ---------- | -------- | -------- |
  | 2024 | 305      | 15      | 15         | 1        |          |
  | 2025 | 305      | 18      | 18         | 3        |          |
  | 2026 | 306      | 18      | 18         | 1        |          |
  | 2027 | 307      | 19      | 19         | 2        |          |

Similar to the `products` table, the `ID` column above is the
primary key field of the `order_items` table, a way of uniquely
identifying each row. `OrderID` is a lookup field to the orders table
(not shown here as it's irrelevant to our discussion). `Product` and
'Unit Price' are both lookup fields to the products table. To
understand this with an example, order item #2024 is an order for
product #15, which is *Lindt HELLO Crunchy Nougat* and its price is of
course that of product #15 which is $2.05. And the quantity of *Lindt
HELLO Crunchy Nougat* ordered in this record is 1.

When your AppGini application displays the `order_items` table, it
doesn't display reference values like the above. It automatically
*joins* both tables and displays more human-readable results like the
ones below

### Order Items table joined with Products table

  | ID   | Order ID | Product                      | Unit price   | Quantity | Subtotal |
  | ---- | -------- | ---------------------------- | ------------ | -------- | -------- |
  | 2024 | 305      | Lindt HELLO Crunchy Nougat   | 2.05         | 1        |          |
  | 2025 | 305      | Lindt EXCELLENCE Mint        | 3.25         | 3        |          |
  | 2026 | 306      | Lindt EXCELLENCE Mint        | 3.25         | 1        |          |
  | 2027 | 307      | Lindt CREATION Pistachio     | 3.25         | 2        |          |

If we later make any modifications to any product in the `products`
table, like changing its name or unit price, the changes are
automatically reflected in the `order_items` table without having to
perform any manual data entry.

What remains now is to write code for calculating the subtotal column of
the `order_items` table. We want this calculation to be applied
whenever we add a new order item and also whenever we make changes to
any existing order item. Therefore, we should perform the calculation in
both the before_insert and before_update hook functions.

The initial code I see many AppGini users write usually looks something
like this:

```php
$data['Subtotal'] = $data['UnitPrice'] * $data['Quantity'];
```

The problem with the above code is that `$data['UnitPrice']`
stores the primary key of the parent product (the value of the `ID`
field from the parent record in `products`). For example, if we're
calculating the subtotal of order item #2025, the above code would
display a subtotal of 18 x 3 = $54. This is of course not correct, as
the unit price for *Lindt EXCELLENCE Mint* is $3.25 and we have a
quantity of 3 units. Therefore, the correct subtotal should be $3.25 x
3 = $9.75.

What's wrong with the above code is that we didn't take into
consideration the fact that `UnitPrice` field in `order_items` is
actually a lookup field. The stored value is not the unit price but
rather the primary key value of the parent product. Accordingly, we
should retrieve the actual unit price from the products table using this
code:

```php
$UnitPrice = sqlValue(
   "SELECT UnitPrice FROM products where ID='{$data['UnitPrice']}'"
); 
```

The above code retrieves the unit price from the products table given
the primary key value stored in the child `order_items` table,
`$data['UnitPrice']` , and stores the actual unit price in
`$UnitPrice` . We can now perform the calculation as follows:

```php
$data['Subtotal'] = $UnitPrice * $data['Quantity'];
```

Putting it all together, whenever we are performing calculations that
involve lookup fields, we should first retrieve the actual values from
the parent table and use those retrieved values in the calculation
formula. It's very easy to write once we understand how it works. To
sum up, here is our subtotal code:

```php
$UnitPrice = sqlValue(
  "SELECT UnitPrice FROM products where ID='{$data['UnitPrice']}'"
);
$data['Subtotal'] = $UnitPrice * $data['Quantity'];
```

One final note ... some tables contain non-numeric primary key values.
For example, if the above `products` table stores primary keys as
`LHCN01`, `LEM01` ... etc rather than `18`, `19` and so on,
then we should escape those primary keys first to avoid query errors and 
protect against SQL injection attacks:

```php
/* Escape non-numeric lookup values before using them in SQL queries */
$SafeUnitPriceLookup = makeSafe($data['UnitPrice']);

/*
  Now it's safe to use $SafeUnitPriceLookup to
  retrieve our unit price
*/
$UnitPrice = sqlValue(
  "SELECT UnitPrice FROM products where ID='{$SafeUnitPriceLookup}'"
);

/* And here is our calculation */
$data['Subtotal'] = $UnitPrice * $data['Quantity'];
```

To summarize, whenever you are working with lookup fields in your
calculations, you should first retrieve the actual values from the parent
table and then use those values in your calculations. This is a simple
concept that can save you a lot of time and headaches in the future.


