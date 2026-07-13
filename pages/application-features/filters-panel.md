---
title: Filters Panel
linkTitle: Filters Panel
slug: help/application-features/filters-panel
description: Using the filters panel to quickly filter records in table-view pages in AppGini.
keywords: filters panel, table view, filter controls, date range, numeric range, dropdown, checkbox
featured_image: https://cdn.bigprof.com/screencasts/filters-panel-in-action.gif
---

# Filters Panel

The filters panel is a collapsible sidebar on table-view pages that provides quick, in-page filter controls. Users can filter records by date ranges, numeric ranges, dropdown selections, and checkbox states without leaving the current page. This feature is available starting from [**AppGini 26.14**](https://bigprof.com/appgini/release-log#26.14).

![Filters panel in action](https://cdn.bigprof.com/screencasts/filters-panel-in-action.gif)


## Enabling the Filters Panel for a Table

The filters panel is configured at design time in AppGini. For each field in your AXP project, you can enable the **"Include in filters panel"** option in the field's settings dialog.

### Eligible field types

The option is available only for the following field types:

| Field type | Filter control rendered |
|---|---|
| **Numeric** (Integer, Decimal) | Numeric range (min–max) |
| **Date** | Date range with quick-date presets |
| **Date and time** | Date/time range with quick-date presets |
| **Option list** | Multi-select dropdown (up to 4 selections) |
| **Lookup** (non-autofill) | Multi-select dropdown showing parent table values (up to 4 selections) |

The option is **not available** yet for textual fields, auto-fill lookups, or file/image uploads.

### Field property location

In the AppGini field settings dialog, check the box labeled **"Include in filters panel"**:

![Include in filters panel option](https://cdn.bigprof.com/images/include-in-filters-panel-option.png)

## 10-Field Limit per Table

Each table can have a maximum of **10 fields** included in the filters panel.

If you select more than 10 eligible fields for a single table, AppGini will display a warning during app generation:

![Filters panel warning](https://cdn.bigprof.com/images/filters-panel-warning.png)

When this happens, only the **first 10** selected fields in the table are included in the generated app. The remaining fields are silently ignored. To fix this, go back to your field settings and deselect some fields until you have 10 or fewer per table.

## Using the Filters Panel

### Opening and closing

- Click the **filter icon button** on the left side of the table view to open the panel.
- Click the **× button** in the panel header or the **backdrop** (on mobile) to close it.
- A **red dot** on the filter button indicates that active filters are applied even when the panel is closed.
- On **mobile devices** (<768px), the panel opens as a full-height overlay with a semi-transparent backdrop.

### Applying filters

1. Set your desired filter values in the panel controls.
2. Click the **Apply Filters** button (enabled only when values have changed).
3. The page reloads showing filtered results.

### Filter types

- **Date range / Date and time range**: Two input fields (From/To) with a calendar picker. Use the **Quick dates** dropdown for presets like *Today*, *Yesterday*, *Month-to-date*, *Last month*, *Year-to-date*, and *Last year*.
- **Numeric range**: Min and Max input fields. Only records with values within the specified range are shown.
- **Select2 dropdown**: Multi-select dropdown (up to 4 values). Type to search, select multiple options. For lookup fields, values from the parent table are shown.
- **Checkbox (three-state)**: Toggle through three states — No filter (indeterminate) → Has value (checked) → Empty (unchecked).

### Saving filters

Click the **Save Filters** button to create a permanent link to the current filtered view. In the dialog:
1. Enter a title for the saved filter.
   
   > **Note:** If you provide an already existing title, the saved filter will be overwritten with the new settings.
2. Optionally copy the generated permalink or click **Copy link** to bookmark or share.
3. Click **Save** to store the filter (appears in the toolbar's saved filters dropdown for future use).

Guest users and tables where **Allow saving filters** is disabled cannot save filters (except for administrators).

### Clearing filters

Use the **Show All** button in the table toolbar to clear all active filters from both the filters panel and the filters page.

## Coexistence with the Filters Page

The filters panel works alongside the existing filters page (`Filters` button in the table toolbar). Both can be active simultaneously — each operates independently using its own range of filter indices (the filters page uses the first 20 groups, while the filters panel uses groups 31–40), and the table view shows results matching all applied filters from both sources.


