---

title: Global hooks
linkTitle: Global hooks
slug: help/advanced-topics/hooks/global-hooks
description: Global hook functions are defined in the generated `hooks/__global.php` file. This file contains hook functions that get called when a new member signs up, when a member signs in successfully and when a member fails to sign in. You could also define your own PHP functions here and they'll be visible to all your AppGini application pages.
keywords: global hooks, login_ok, login_failed, member_activity, sendmail_handler, child_records_config

---

Global hook functions are defined in the generated `hooks/__global.php` file. This file contains hook functions that get called when a new member signs up, when a member signs in successfully and when a member fails to sign in. You could also define your own PHP functions here and they'll be visible to all your AppGini application pages.  
  
_The following hook functions are defined in this file:_

* [`login_ok()`](#login_ok)
* [`login_failed()`](#login_failed)
* [`member_activity()`](#member_activity)
* [`sendmail_handler()`](#sendmail_handler)
* [`child_records_config()`](#child_records_config)

## `login_ok()`

This hook function is called when a member successfully signs in. It can be used for example to redirect members to specific pages rather than the home page, or to save a log of members' activity, … etc. If you open the generated `hooks/__global.php` file in a text editor, you can see this function defined as follows:

```php
function login_ok($memberInfo, &$args) {
 
    return '';
}
```

### Parameters:  

*   `$memberInfo` is an array containing details of the member who signed in. Please refer to [`memberInfo`](/appgini/help/advanced-topics/hooks/memberInfo-array) for more details.
*   `$args` is currently not implemented but is reserved for future use.

  
### Return value:  

A string containing the URL to redirect the member to. It can be a relative or absolute URL. If the return string is empty, the member is redirected to the homepage (`index.php`), which is the default behavior.  
  
  
### Example:  

Let's add code to save a log of members' login activity. Each time a member signs in, we'll record his username, IP address, login date and time into a log file. Here's how the hook function looks like after adding this code:

```php
function login_ok($memberInfo, &$args) {
    // the log file where we'll save member activity
    $logFile = 'members.log';
 
    // the member details we'll be saving into the file
    $username = $memberInfo['username'];
    $ip = $memberInfo['IP'];
    $date = date('m/d/Y');
    $time = date('h:i:s a');
 
    // open the log file and append member login details
    file_put_contents($logFile, "$date,$time,$username,$ip\n", FILE_APPEND);
 
    return '';
}
```

## `login_failed()`

This hook function is called when a login attempt fails. It can be used for example to log login errors. If you open the generated `hooks/__global.php` file in a text editor, you can see this function defined as follows:

```php
function login_failed($attempt, &$args) {
 
}
```

### Parameters:

*   `$attempt` is an associative array containing details of the failed login attempt. It contains the following keys:
    * `username`: the username entered during the login attempt.
    * `password`: the password entered during the login attempt.
    * `IP`: the IP address of the client attempting to log in.
*   `$args` is currently not implemented but is reserved for future use.

### Return value:

None.

### Example:

To notify the admin when a user fails to log in, we can add this code into the `login_failed()` function:

```php
function login_failed($attempt, &$args){
    // email of admin
    $adminEmail = 'admin@domain.com';
 
    // someone trying to log as admin?
    if($attempt['username'] == 'admin'){
 
        // send the email
        @mail(
            $adminEmail, // email recipient
            "Failed login attempt", // email subject
            "Someone from {$attempt['IP']} tried to log in ".
            "as admin using the password {$attempt['password']}.", // message
            "From: $adminEmail"
        );
    }
}
```

## `member_activity()`

This hook function is called when a new member signs up. If you open the generated `hooks/__global.php` file in a text editor, you can see this function defined as follows:

```php
function member_activity($memberInfo, $activity, &$args){
    switch($activity){
        case 'pending':
            break;
 
        case 'automatic':
            break;
 
        case 'profile':
            break;
 
        case 'password':
            break;
 
    }
}
```

### Parameters:

*   `$memberInfo` is an associative array containing details of the member who signed up. Please refer to [`memberInfo`](/appgini/help/advanced-topics/hooks/memberInfo-array) for more details.
*   `$activity` is a string indicating the type of activity. It can be one of the following values:
    * `pending`: the member signed up but his account is pending approval by the admin.
    * `automatic`: the member signed up and his account is automatically approved.
    * `profile`: the member updated his profile.
    * `password`: the member changed his password.
*   `$args` is currently not implemented but is reserved for future use.

### Return value:

None.

### Example:

This example sends a welcome email to new users who were automatically approved, and a 'please wait' email for new users pending approval. 

```php
function member_activity($memberInfo, $activity, &$args){
    switch($activity){
        case 'pending':
            // send 'please wait' email to new user
            @mail(
                $memberInfo['email'], // email recipient
                "Thank you for signing up at our website!", // subject
                 
                "Dear {$memberInfo['username']}, \n\n".
                "We'll review and approve your new account within a few hours.\n\n".
                "Thank you.", // message
 
                "From: support@domain.com" // the "From" address the user will see
            );
            break;
 
        case 'automatic':
            // send 'welcome' email to new user
            @mail(
                $memberInfo['email'], // email recipient
                "Thank you for signing up at our website!", // subject
                 
                "Dear {$memberInfo['username']}, \n\n".
                "You can now log into our website from this page:\n".
                "http://www.domain.com/appgini\n\n".
                "Thank you.", // message
 
                "From: support@domain.com" // the "From" address the user will see
            );
            break;
 
        case 'profile':
            break;
 
        case 'password':
            break;
 
    }
}
```

## `sendmail_handler()`

This hook function is called when AppGini sends an email using the `sendmail()` function. It can be used to modify the email before it's sent. If you open the generated `hooks/__global.php` file in a text editor, you can see this function defined as follows:

```php
function sendmail_handler(&$pm) {

}
```

### Parameters:

*   `$pm` is a PHPMailer object, passed by reference. Please refer to [PHPMailer project on Github](https://github.com/PHPMailer/PHPMailer) for more details.

### Return value:

None.

## `child_records_config()`

This hook function was added in AppGini 22.14, and can be used to modify the default configuration of
the [child records section in the detail view](/appgini/help/working-with-projects/understanding-lookup-fields#parent-children-settings).

If you open the generated `hooks/__global.php` file in a text editor, you can see this function defined as follows:

```php
function child_records_config($childTable, $childLookupField, &$config) {
 
}
```

### Parameters:

*   `$childTable` is the name of the child table.
*   `$childLookupField` is the name of the lookup field in the child table.
*   `$config` is an associative array containing the configuration for displaying child records for the current user, passed by reference. The default configuration, is stored in the `$pcConfig` array defined in the generated `parent-children.php` file.

### Return value:

None.