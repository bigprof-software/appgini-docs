---

title: Shortcut keys
linkTitle: Shortcut keys
slug: help/working-with-generated-web-database-application/shortcut-keys

---

> The following shirtcut keys can be used in AppGini apps as of AppGini
5.90.

**Note:** Unless otherwise specified (*1*) , pressing the shortcut keys
below focuses (highlights) the related link/button (rather than
performing the action itself \-- this is intended to prevent doing any
unintended action by mistake if pressing the wrong shortcut key
combination). After a link is focused, you could press **` ENTER `**
to actually activate the link, **` TAB `** to navigate to the next
link, or **` SHIFT `** + **` TAB `** to navigate to the previous
link.

> (*1*) Wherever the shortcut listings below mention *\"instant action\"*
> , this is an exception to the above rule, meaning that pressing this
> particular shortcut keys combination would instantly apply the related
> action.

#### General shortcuts available in all pages

-   **` CTRL `** or **` SHIFT `** + **` F1 `** : Display available shortcuts (and enable/disabled shortcut keys).
-   **` ALT `** + **` 0 `** : Homepage.
-   **` ALT `** + **` 1 `** to **` 9 `** : Open available navigation menus.    
-   **` ALT `** + **` M `** : Import CSV data (if you have permission to).
-   **` ALT `** + **` A `** : Admin area (if you're signed in as admin).    
-   **` ALT `** + **` P `** : User profile.
-   **` ALT `** + **` P `** then **` SHIFT `** + **` TAB `** : Sign out.

#### Homepage

-   **` SHIFT `** + **` F2 `** : Highlight first table group.
-   **` CTRL `** + **` F2 `** : Highlight the first table link.

#### Table view

-   **` ALT `** + **` Q `** : Quick search (type your search then press **` ENTER `** ).
-   **` ALT `** + **` SHIFT `** + Q: Clear quick search *(instant action)*.
-   **` F2 `** : same as **` ALT `** + **` Q `**.    
-   **` SHIFT `** + **` F2 `** : First button in the buttons bar above the table.
-   **` ALT `** + **` F2 `** : First element in the bottom navigation bar.
-   **` CTRL `** + **` F2 `** : First record selector checkbox.
    - You can then navigate to other records using **` CTRL `** + **` ↑ `** and **` CTRL `** + **` ↓ `**.    
    - **Tip:** to open the currently highlighted record in the detail view, press **` TAB `** then **` ENTER `**.    
-   **` ALT `** + **` CTRL `** + **` S `** : Select/unselect all records.
-   **` ALT `** + **` CTRL `** + **` M `** : Open **More** menu.    
-   **` CTRL `** + **` ← `** : Previous page *(instant action)*.
-   **` CTRL `** + **` → `** : Next page *(instant action)*.

#### Detail view

-   **` F2 `** : First field in form.
-   **` SHIFT `** + **` F2 `** : First button in the action buttons at the right of the form.
-   **` CTRL `** + **` F2 `** : First child record.    
-   **` ALT `** + **` I `**: Show/hide admin information menu (if you're signed in as admin).    
-   **` F8 `** : First child link (from the child links above the detail view form).
-   **` SHIFT `** + **` F8 `** : First child tab.
-   **` ALT `** + **` F8 `** : First navigation button in child tab.    
-   **` CTRL `** + **` ← `** : Previous record *(instant action)*.
-   **` CTRL `** + **` → `** : Next record *(instant action)*.
-   **` CTRL `** + **` ↑ `** : Same as **` CTRL `** + **` ← `**.
-   **` CTRL `** + **` ↓ `** : Same as **` CTRL `** + **` → `**.    
-   **` CTRL `** + **` ENTER `** : Save Changes *(instant action)*.
-   **` ALT `** + **` X `** : Back to table view, discarding any changes made *(instant action)*.

#### Filters page:

-   **` F2 `** : First filter.
-   **` SHIFT `** + **` F2 `** : Apply filters button.
-   **` CTRL `** + **` ENTER `** : Apply filters *(instant action)*.
-   **` CTRL `** + **` SHIFT `** + **` ENTER `** : Save and apply filters *(instant action)*.
-   **` ALT `** + **` X `** : Cancel and go back to table view *(instant action)*.

#### Print preview of table view:

-   **` SHIFT `** + **` F2 `** : Print button.
-   **` ALT `** + **` X `** : Back *(instant action)*.

#### Print preview of detail view:

-   **` SHIFT `** + **` F2 `** : Print button.
-   **` SHIFT `** + **` F8 `** : First child tab. You can then press
    **` ENTER `** to expand/collapse children records.
-   **` ALT `** + **` X `** : Back to detail view *(instant action)*.    
-   **` CTRL `** + **` ← `** : Previous record's detail view *(instant action)*.
-   **` CTRL `** + **` → `** : Next record's detail view *(instant action)*.
-   **` CTRL `** + **` ↑ `** : Same as **` CTRL `** + **` ← `**.
-   **` CTRL `** + **` ↓ `** : Same as **` CTRL `** + **` → `**.

#### (AppGini 5.91+) Hide 'keyboard shortcuts reference' link

In AppGini 5.91 and above, the shortcuts window includes a link at the
bottom that points to this page. This makes it easy for your app users
to see a full reference. You can remove this link if desired by adding
this line to `hooks/footer-extras.php`:

```javascript
<script>_noShortcutsReference = true;</script>
```
