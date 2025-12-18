---
title: Useful AppGini PHP functions for use in custom code
linkTitle: AppGini PHP functions
slug: help/advanced-topics/programming-reference/useful-php-functions
keywords: AppGini PHP functions, sql(), sendmail(), PHPMailer, sendmail_handler(), sqlValue()
description: AppGini provides a number of useful PHP functions that you can use in your custom code to interact with your database and perform various tasks. 
---

# Useful AppGini PHP functions for use in custom code

> **Note**: This page is a work in progress. We'll be adding more functions and examples soon.

AppGini provides a number of useful PHP functions that you can use in your custom code to interact with your database and perform various tasks. Here's a list of some of these functions:

## `sql()`

This function is used to execute a SQL query.

### Syntax

```php
$options = [];
$result = sql($query, $options);
```

### Parameters

- `$query` (string): The SQL query to execute.
- **`$options`** (array): An associative array of options, passed by reference. This array is used to pass additional options to the function, but can also return error messages if the query fails. The following options are supported:
  - `silentErrors`: If set to `true`, the function will not display an error message if the query fails. Default is `false`.
  - `noSlowQueryLog`: If set to `true`, the function will not log slow queries. Default is `false`.
  - `noErrorQueryLog`: If set to `true`, the function will not log errors. Default is `false`.

> **Note**: Slow and error queries can be accessed from the query log page in the admin area (Utilties menu > Query log).

### Return value

The function returns a result set object on success, or `false` on failure. The result set object can be used to fetch rows returned by the query using the `db_fetch_assoc()`, `db_fetch_row()`, or `db_fetch_array()` functions.

### Example

```php
$options = ['silentErrors' => true];
$result = sql("SELECT * FROM `books`", $options);
if($result === false) {
  echo 'Failed to execute query: ' . $options['error'];
} else {
  while($row = db_fetch_assoc($result)) {
    echo $row['title'] . '<br>';
  }
}
```

## `sendmail()`

This function is used to send emails using the [PHPMailer library](https://github.com/PHPMailer/PHPMailer/) included as part of the generated files of AppGini apps. It supports sending emails to single or multiple recipients, and can use SMTP for sending emails, if configured via the Admin settings page under the Admin area. The function also supports adding CC, BCC recipients, and handling HTML content in the email body.

### Parameters

- **`$mail`** (array): An associative array containing the email details. The following keys are supported:
    - `to` (string|array): The recipient's email address or an array of recipients in the format `[[email, name]]`.
    - `name` (string, optional): The recipient's name (used if 'to' is a string).
    - `subject` (string, optional): The subject of the email.
    - `message` (string, optional): The body of the email.
    - `cc` (array, optional): An array of CC recipients in the format `[[email, name]]`.
    - `bcc` (array, optional): An array of BCC recipients in the format `[[email, name]]`.
    - `debug` (int, optional): Debug level for SMTP (0 to 4).
    - `tag` (mixed, optional): Custom tag to pass to the [`sendmail_handler` hook function](../hooks/global-hooks.md#sendmail_handler).

### Return value

- `true` on success.
- (string) containing the error message on failure.

### Examples

#### Sending a Single Email

```php
$result = sendmail([
    'to' => 'recipient@example.com',
    'name' => 'Recipient Name',
    'subject' => 'Test Email',
    'message' => 'This is a test email.'
]);

if ($result === true) {
    echo "Email sent successfully!";
} else {
    echo "Failed to send email: $result";
}
```

#### Sending an Email to Multiple Recipients

```php
$result = sendmail([
    'to' => [
        ['recipient1@example.com', 'Recipient One'],
        ['recipient2@example.com', 'Recipient Two']
    ],
    'subject' => 'Test Email to Multiple Recipients',
    'message' => 'This is a test email to multiple recipients.'
]);

if ($result === true) {
    echo "Email sent successfully!";
} else {
    echo "Failed to send email: $result";
}
```

#### Sending an Email with Attachments

To handle attachments, you can use the [`sendmail_handler` hook function](../hooks/global-hooks.md#sendmail_handler),
which is defined in the `hooks/__global.php` file. You can modify the `sendmail_handler` function to add attachments handling as follows:

```php
function sendmail_handler(&$pm) {
    // Check if attachments are provided in the tag
    if (!empty($pm->tag['attachments'])) {
        foreach ($pm->tag['attachments'] as $attachment) {
            $pm->addAttachment($attachment);
        }
    }
}
```

You can then send an email with attachments as follows:

```php
$result = sendmail([
    'to' => 'recipient@example.com',
    'name' => 'Recipient Name',
    'subject' => 'Test Email with Attachment',
    'message' => 'This is a test email with an attachment.',
    'tag' => [
        'attachments' => [
            '/path/to/attachment1.pdf',
            '/path/to/attachment2.jpg'
        ]
    ]
]);

if ($result === true) {
    echo "Email sent successfully!";
} else {
    echo "Failed to send email: $result";
}
```

## `sqlValue()`

This function is used to execute a SQL query and return a single value from the first row of the result set. This is a very convenient way to quickly execute a query and get a single value, without having to iterate through the result set.

### Syntax

```php
$value = sqlValue($query, $error);
```

### Parameters

- **`$query`** (string): The SQL query to execute.
- **`$error`** (string, optional): A variable passed by reference to store an error message if the query fails. If the query is successful, this variable will not be modified.

### Return value
- The function returns the value from the first row of the result set, or `false` if the query fails or returns no rows. In the case of failure, the `$error` variable (if provided) will contain the error message.

### Examples

#### Basic Usage without error handling

```php
$bookCount = sqlValue("SELECT COUNT(*) FROM `books`");
echo "Total number of books: $bookCount";
```

#### Usage with error handling

```php
$error = '';
$bookCount = sqlValue("SELECT COUNT(*) FROM `books`", $error);
if ($bookCount === false) {
    echo "Failed to get book count: $error";
} else {
    echo "Total number of books: $bookCount";
}
```


