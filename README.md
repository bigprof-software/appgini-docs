# AppGini Documentation

This repository contains the source files (in Markdown format) used for the [AppGini documentation](https://bigprof.com/appgini/help).

[AppGini](https://bigprof.com/appgini/) is a web application development environment that dramatically reduces the time and effort required to create data-driven web applications.
It enables you to create data-driven web applications without having to write any code. You can use it to create custom web applications for
managing your data, your processes, and your customers.

## Document format

The documentation is written in extended Markdown format. Each page is a separate Markdown file in the `pages` directory.
This directory contains subdirectories for each section of the documentation, such as `working-with-projects`, `advanced-topics`, etc.
The `index.md` file in each subdirectory is the main page for that section.

*Front matter* is used to specify various information about each page. Currently supported front matter fields are:

* `title`: The title of the page (applied to the `<title>` tag in the generated HTML, as well as the page heading).
* `description`: A brief description of the page's content, applied to the `<meta name="description">` tag in the generated HTML.
* `keywords`: A comma-separated list of keywords for the page, applied to the `<meta name="keywords">` tag in the generated HTML.
* `linkTitle`: The title of the page as it *should* appear in the TOC men. Typically, this is a shorter version of the `title` field.
* `slug`: The URL of the page, relative to the root of the documentation. For example, `help/working-with-projects`.

In general, the front matter follows the same rules of [Hugo static site generator](https://gohugo.io/content-management/front-matter/),
though Hugo is not used to generate this documentation. Only the yaml dialect of front matter is supported.

## Contributing

If you'd like to contribute to the documentation, please fork this repository, make your changes, and submit a pull request.
