---
title: Debugging Table-specific hooks
linkTitle: Debugging Table hooks
slug: help/advanced-topics/hooks/debugging-table-specific-hooks
description: 
keywords: 
---

# Debugging Table-specific hooks

When writing custom hooks, it’s very common to face issues such as:

- Code never being executed.
- Hooks running, but not behaving as expected.
- Silent failures without visible error messages.

This section shows practical techniques to debug and troubleshoot your table‑specific hooks.

### 1. Verify that your hook is being called

Before debugging logic errors, first confirm that AppGini is actually calling your hook.

#### 1.1. Add a simple `die()` or `exit()`

Temporarily place a `die()` call at the beginning of the hook you are working on:

```php
function tablename_before_insert(&$data, $memberInfo, &$args) {
    die('DEBUG: tablename_before_insert() was called.');
    return true;
}
```

If you see the message when you insert a record, you know:

- The hook file is loaded.
- The correct function name is used.
- The hook is triggered at the expected time.

Remove `die()` after confirming.

#### 1.2. Log to a file

If you cannot interrupt output (for example, in production), write to a log file:

```php
function tablename_before_insert(&$data, $memberInfo, &$args) {
    $logFile = __DIR__ . '/tablename_debug.log';
    $logMsg  = date('Y-m-d H:i:s') . " before_insert called by {$memberInfo['username']}\n";

    @file_put_contents($logFile, $logMsg, FILE_APPEND);

    return true;
}
```

Check the log file to confirm that the hook is executed and when.

---

Below is the updated content for the two sections you mentioned, ready to replace **point 2** and adjust **point 7** in the proposed “Debugging table‑specific hooks” section.

---

### 2. Make sure you’re editing the correct hook and function

AppGini automatically generates skeleton hook files and functions for each table. This means:

- File names and function names are already correct when generated.
- Typos in function names are **unlikely** unless they were manually changed.

However, two common mistakes can still happen:

#### 2.1. Editing the wrong hook file (wrong table)

Each table has its own hook file in the `hooks` folder:

- Table `orders` → `hooks/orders.php`
- Table `customers` → `hooks/customers.php`
- And so on.

If you’re trying to debug a hook for the `orders` table but you accidentally edit `hooks/customers.php`, your changes will never run.

**Checklist:**

- Confirm the table name in AppGini (in the **Tables** pane).
- Open the corresponding `hooks/<tablename>.php` file.
- Make sure you haven’t mixed similar names (for example `order` vs `orders`, `invoice` vs `invoices`).

#### 2.2. Editing the wrong hook function (wrong event)

Each hook file contains multiple functions, one for each event:

```php
function orders_before_insert(&$data, $memberInfo, &$args) { ... }
function orders_after_insert($data, $memberInfo, &$args) { ... }
function orders_before_update(&$data, $memberInfo, &$args) { ... }
function orders_after_update($data, $memberInfo, &$args) { ... }
function orders_before_delete($selectedID, &$skipChecks, $memberInfo, &$args) { ... }
function orders_after_delete($selectedID, $memberInfo, &$args) { ... }
function orders_dv($selectedID, $memberInfo, &$html, &$args) { ... }
function orders_init(&$options, $memberInfo, &$args) { ... }
function orders_csv($query, $memberInfo, $args) { ... }
// etc.
```

If your code doesn’t run:

- Check whether you placed it in the hook that corresponds to the **actual action** you’re testing.

Examples:

- You want logic to run **before a record is saved for the first time** → Use `tablename_before_insert()`, not `tablename_after_insert()` or `tablename_before_update()`.
- You want logic to run when the user edits an existing record → Use `tablename_before_update()` or `tablename_after_update()`, not `tablename_before_insert()`.
- You want to modify the **table view behavior** (filters, CSV, default sort, etc.) → Use `tablename_init()`.
- You want to customize the **detail view form** (injecting HTML/JS) → Use `tablename_dv()`.

If you’re not sure which event is firing, you can temporarily add a `die('DEBUG: ...');` in each candidate hook and see which one is triggered when you perform the action.

---

### 3. Enable PHP error reporting

Sometimes a hook fails silently because of a PHP warning or fatal error.

#### 3.1. Enable error display in development

In your `config.php` or `hooks/__global.php`, you can temporarily add:

```php
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);
```

> **Important:**  
> Only do this in a development / test environment. On production servers, it is better to log errors rather than display them.

#### 3.2. Check `error_log`

If your hosting is configured to log errors, check `error_log` or your server’s log files for:

- Syntax errors in hook files.
- Undefined variable or function errors.
- Include path issues.

If AppGini pages load as a blank page, there is usually a fatal PHP error, which should be visible in the error log.

---

### 4. Use `error_message` in `before_*` hooks (AppGini 5.90+)

For `tablename_before_insert()` and `tablename_before_update()`, you can return `false` and show a custom error message to the user via `$args['error_message']`.

This is very useful to debug validation logic in a user‑friendly way.

```php
function orders_before_insert(&$data, $memberInfo, &$args) {
    if($data['total'] <= 0) {
        $args['error_message'] = 'Debug: total must be greater than 0.';
        return false; // user sees this message in the UI
    }

    return true;
}
```

You can start with “Debug:” messages while developing, then replace them later with user‑friendly text.

---

### 5. Inspecting `$data`, `$memberInfo` and `$args`

To understand what your hook receives, temporarily dump these variables.

#### 5.1. Simple `print_r()` inside `<pre>`

```php
function tablename_before_update(&$data, $memberInfo, &$args) {
    echo '<pre>';
    print_r($data);
    print_r($memberInfo);
    print_r($args);
    echo '</pre>';

    return false; // prevent the update while debugging
}
```

Use this in a development environment only, as it exposes internal details.

#### 5.2. Log arrays to file

For safer debugging, log serialized or JSON‑encoded data:

```php
function tablename_before_update(&$data, $memberInfo, &$args) {
    $logFile = __DIR__ . '/tablename_debug.log';

    $logData = [
        'time'        => date('Y-m-d H:i:s'),
        'hook'        => 'tablename_before_update',
        'selectedID'  => $data['selectedID'] ?? null,
        'data'        => $data,
        'memberInfo'  => $memberInfo,
        'old_data'    => $args['old_data'] ?? null
    ];

    @file_put_contents(
        $logFile,
        print_r($logData, true) . "\n----------------\n",
        FILE_APPEND
    );

    return true;
}
```

---

### 6. Debugging JavaScript injected from `tablename_dv()`

When you customize the detail view using `tablename_dv()`, debugging often involves both PHP and JavaScript.

#### 6.1. Check that your script is actually in the page

Inside your hook:

```php
function tablename_dv($selectedID, $memberInfo, &$html, &$args) {
    ob_start(); ?>
    <script>
    console.log('DEBUG: tablename_dv() JS loaded. SelectedID = <?php echo addslashes($selectedID); ?>');
    </script>
    <?php
    $html .= ob_get_clean();
}
```

Then open browser developer tools (F12) → Console and check for the message.

#### 6.2. Check jQuery usage

AppGini uses jQuery under the `$j` alias rather than `$`. Make sure your injected scripts use:

```js
$j(function() {
    // your code here
});
```

If you mistakenly use `$`, it may not work in some contexts.

---

### 7. Using SQL helper functions safely

When you execute SQL inside hooks, use AppGini’s helper functions, and choose the appropriate one based on the type of query.

#### 7.1. `sqlValue()` — for `SELECT` statements that return a single value

Use `sqlValue()` **only for `SELECT` queries** where you expect exactly one value (for example, a single column from one row):

```php
$approved = sqlValue("SELECT `approved` FROM `tablename` WHERE `id`='$id'");
```

- **Do not** use `sqlValue()` for `INSERT`, `UPDATE`, `DELETE`, or DDL statements.
- Using `sqlValue()` with non‑`SELECT` statements might return unexpected results or fail silently.

#### 7.2. `sql()` — for `INSERT`, `UPDATE`, `DELETE`, and multi‑row `SELECT`

Use `sql()` in these cases:

- Executing `INSERT`, `UPDATE`, or `DELETE` statements.
- Running `SELECT` queries where you need multiple rows or need to loop through a result set.

Example (logging debug info and using the correct helper):

```php
function tablename_before_delete($selectedID, &$skipChecks, $memberInfo, &$args) {
    $id = makeSafe($selectedID);

    // safe SELECT for a single value → sqlValue()
    $query = "SELECT `approved` FROM `tablename` WHERE `id`='$id'";
    $approved = sqlValue($query);

    if($approved) {
        // example: log attempt using an INSERT → sql()
        $logQuery = sprintf(
            "INSERT INTO `delete_attempts_log` (`record_id`, `username`, `time`) 
             VALUES ('%s', '%s', NOW())",
            makeSafe($selectedID),
            makeSafe($memberInfo['username'])
        );
        sql($logQuery, $eo);

        return false;
    }

    return true;
}
```

#### 7.3. Always sanitize dynamic values with `makeSafe()`

Whenever you embed user input or dynamic values in SQL, use `makeSafe()`:

```php
$id       = makeSafe($selectedID);
$username = makeSafe($memberInfo['username']);

sql("INSERT INTO `log` (`id`, `user`) VALUES ('$id', '$username')", $eo);
```

This helps prevent SQL injection and ensures your queries are safe and stable.

---

### 8. Common pitfalls and how to detect them

#### 8.1. Using undefined variables

In `tablename_dv()` you might accidentally use the wrong variable name:

```php
function tablename_dv($selectedID, $memberInfo, &$html, &$args) {
    // WRONG: $mi is undefined
    if($mi['group'] != 'Admins') { ... }
}
```

This should be:

```php
if($memberInfo['group'] != 'Admins') { ... }
```

Check your PHP error log for “Undefined variable” or “Undefined index” warnings.

#### 8.2. Returning the wrong type

Hooks such as `tablename_before_insert()` and `tablename_before_update()` must return a boolean:

```php
return true;  // allow operation
return false; // cancel operation
```

Accidentally returning something else (for example, a string) may cause unexpected behavior.

#### 8.3. Overwriting `$options` in `tablename_init()`

`tablename_init()` receives `$options` as an object. Don’t overwrite it with another type:

```php
function tablename_init(&$options, $memberInfo, &$args) {
    // WRONG
    $options = [];  // this destroys the DataList object

    return true;
}
```

Instead, modify properties:

```php
function tablename_init(&$options, $memberInfo, &$args) {
    $options->AllowCSV = ($memberInfo['group'] == 'Admins') ? 1 : 0;
    return true;
}
```

---

### 9. A reusable debug helper

You can add a small helper in `hooks/__global.php` and reuse it in all table‑specific hooks:

```php
function appgini_debug_log($msg, $label = 'DEBUG') {
    $logFile = __DIR__ . '/appgini_debug.log';
    $time    = date('Y-m-d H:i:s');

    if(is_array($msg) || is_object($msg)) {
        $msg = print_r($msg, true);
    }

    @file_put_contents(
        $logFile,
        "[$time][$label] $msg\n",
        FILE_APPEND
    );
}
```

Then, inside any hook:

```php
function tablename_after_update($data, $memberInfo, &$args) {
    appgini_debug_log([
        'hook'      => 'tablename_after_update',
        'selectedID'=> $data['selectedID'] ?? null,
        'new_data'  => $data,
        'old_data'  => $args['old_data'] ?? null,
        'user'      => $memberInfo['username'] ?? ''
    ]);

    return true;
}
```

This gives you a single log file to inspect all hook behavior.

---

You can add this “Debugging table‑specific hooks” section near the bottom of the page (for example, after `tablename_csv()`), and optionally link to the general **Blank pages and errors** and **Troubleshooting** sections for more information on PHP errors and server‑level issues.