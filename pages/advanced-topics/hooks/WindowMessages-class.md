---
title: WindowMessages class
linkTitle: WindowMessages class
slug: help/advanced-topics/hooks/WindowMessages-class
---

# WindowMessages class


A class for displaying messages to the user on the next page load.

To add a message, use the `WindowMessages::add()` method:

```php
WindowMessages::add('Hello world!', 'alert alert-success');
```

The first parameter is the message to display, and the second parameter
is the CSS classes to apply to the message `<div>` container. The
second parameter is optional, and defaults to `alert alert-info`
if not specified.

The message(s) would be displayed on the next page load, and are
specific to the current browser window. That is, if you have multiple
browser windows open, each window will have its own set of messages.

To add a dismissable message, use the
`WindowMessages::addDismissable()` method:

```php
WindowMessages::addDismissable('Hello world!', 'alert alert-success');
```

Parameters are the same as the `WindowMessages::add()` method.

### How does it work?

The `WindowMessages` class works by assigning a unique ID to each
browser window. The ID is submitted with each request, and the messages
are stored in the session under that ID. When the page is loaded, the
messages are retrieved from the session and displayed.

The most significant part of this is that the messages are assigned to
the current browser window, and not the current session. This means that
if you have multiple browser windows open, each window will have its own
set of messages.

This is particularly useful after inserting a new record, where the user
is redirected to another page. In that case, if you'd like to display
some message to the user, you can use the `WindowMessages` class
to do so, and the message will be displayed on the redirected page. See
the example in [`tablename_after_insert()` hook
documentation](/appgini/help/advanced-topics/hooks/table-specific-hooks/#tablename_after_insert).

<video width="100%" controls>
    <source src="https://cdn.bigprof.com/screencasts/show-message-after-insert.mp4" type="video/mp4">
    Your browser does not support the video tag.
</video>

This is also useful for use in `tablename_after_update()` and
`tablename_after_delete()` hooks, where you can display a message
to the user after updating or deleting a record.

### Including the window ID when redirecting to another page

Your AppGini application already includes the window ID when redirecting
to another page, so you don't need to do anything special. But in case
you're using your own code to redirect to another page, you need to
include the window ID in the URL. You can do so by using the
`WindowMessages::windowIdQuery()` method, like this:

```php
$url = 'http://example.com/another-page.php?' . WindowMessages::windowIdQuery();
redirect($url);
```

### Including the window ID in a form in custom pages

Built-in AppGini pages already include the window ID in forms, so you
don't need to do anything special. But in case you're using your own
code to create a form in a custom page, you need to include the window
ID as a hidden field in the form. You can do so using this code where
you want the hidden field in the form:

```php
echo WindowMessages::includeWindowId();
```

### How to display the messages?

Your AppGini application already includes the code to display the
messages, so you don't need to do anything special. In case of [custom
pages](/appgini/help/advanced-topics/custom-limited-access-pages/)
however, you need to include the following code in your page where you
want the messages to be displayed:

```php
WindowMessages::getHtml();
```



