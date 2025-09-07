---
title: Searching and filtering data
linkTitle: Searching and filtering data
slug: help/working-with-generated-web-database-application/working-with-filters
keywords: filters, data display, advanced search, matching conditions, saving filters
description: Learn how to effectively use filters in AppGini for advanced data display and search capabilities.
featured_image: https://cdn.bigprof.com/images/filters-page-blank-25.13.png
---

# Searching and filtering data

AppGini applications allow users to search and filter data easily.

## Quick search

Above the table view of each table in your app, you can find the quick search box, which allows you to enter keywords and filter the displayed records accordingly. This is a simple way to find specific records that contain a keyword in any field.

The screenshot below shows the results of a quick search for the word `united`, showing records where *any* field contains the word.

![Quick search results](https://cdn.bigprof.com/images/quick-search-results-25.13.png "Quick search results")

## Advanced search (filters)

Filters provide a more advanced way to search and filter data by configuring and combining multiple conditions.
The **Filter** button above the table view brings a filters page as shown below.

![Filters page](https://cdn.bigprof.com/images/filters-page-blank-25.13.png "Blank filters page")

### Filter groups and filter conditions

Filters are organized into groups, and each group can contain multiple conditions (up to 4 conditions per group). 
Conditions can be combined so that **all** or **any** of the conditions in a group must be met. Similarly, groups can be combined so that **all** or **any** of the groups must be met.

This makes it possible to create highly specific queries that can pinpoint exactly the records you want.

For example, if we wish to find all customers from France, Germany or
Mexico, whose company names begin with A, M or P, the filters would look
like this:


![Filters for customers from France, Germany or Mexico, whose company names begin with A, M or P](https://cdn.bigprof.com/images/advanced-filters-example-25.13.png "Filters for customers from France, Germany or Mexico, whose company names begin with A, M or P")


In the above example, we have two groups of conditions. The first group contains conditions for the country, while the second group contains conditions for the company name. The **Match all filter groups** option is checked, meaning that both groups must be satisfied for a record to be included in the results. Inside each group, the **Match all above conditions** option is *unchecked*, meaning that any condition within a group can be satisfied for the group to be considered a match.

Clicking **Apply filters** will execute the filter query and display the matching records. Here is an example of the results you might see:

![Filter results](https://cdn.bigprof.com/images/filters-search-results-25.13.png "Filter results")

The filter icon beside the company name and country column headers indicates that these columns are being filtered.

#### Comparison operators

Each filter condition is composed of:

* A field (e.g., "Country", "Company Name")
* A comparison operator (e.g., "equals", "contains", "starts with")

    ![](https://cdn.bigprof.com/appgini-desktop/help/working-with-filters-3.png "Comparison operators")
* A value to compare against (e.g., "France", "Acme Corp")

There are several comparison operators available for filters:

| Filter operator          | Matches records where the field      :           |
|--------------------------|--------------------------------------------------|
| Equal to                 | exactly equals the specified value. |
| Not equal to             | does not equal the specified value. |
| Greater than             | is greater than the specified value (for numbers/dates). |
| Greater than or equal to | is greater than or equal to the specified value (for numbers/dates). |
| Less than                | is less than the specified value (for numbers/dates). |
| Less than or equal to    | is less than or equal to the specified value (for numbers/dates). |
| Like                     | contains the specified value. `%` can be optionally used as a *wildcard*. For example, `A%` will match any value *starting with* "A", `%A` will match any value *ending with* "A", and `A%Z` will match any value *starting with* "A" and *ending with* "Z".
| Not like                 | does ***not*** contain the specified value. `%` can be optionally used as a *wildcard*. Examples: `A%` will match any value that doesn't start with "A", `%A` will match any value that doesn't end with "A", and `A%Z` will match any value that doesn't start with "A" and end with "Z".
| Is empty                 | is empty (i.e., has no value). When this operator is specified, the value box is ignored.
| Is not empty             | is not empty (i.e., has a value). When this operator is specified, the value box is ignored.


## Related screencasts

#### Saving filters for use later

<iframe width="640" height="390" src="https://www.youtube.com/embed/7gMWoVh62wU" frameborder="0" allowfullscreen=""></iframe>

#### Performing advanced search queries in AppGini using filters

<iframe width="640" height="390" src="https://www.youtube.com/embed/BNSFbWXWBJA" frameborder="0" allowfullscreen=""></iframe>



