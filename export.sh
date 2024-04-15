#!/bin/bash

# Script to extract content from specified URLs and append it to local Markdown files

# full path to current script
script_path=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)

# List of URLs and their corresponding local file paths
urls=(
  "https://bigprof.com/appgini/help/working-with-generated-web-database-application/setup $script_path/pages/setup.md"
  "https://bigprof.com/appgini/help/working-with-generated-web-database-application/shortcut-keys $script_path/pages/shortcut-keys.md"
  "https://bigprof.com/appgini/help/advanced-topics/table-and-detail-view-classes $script_path/pages/table-and-detail-view-classes.md"
  "https://bigprof.com/appgini/help/advanced-topics/hooks/table-specific-hooks $script_path/pages/table-specific-hooks.md"
  "https://bigprof.com/appgini/help/working-with-generated-web-database-application/the-admin-interface $script_path/pages/the-admin-interface.md"
  "https://bigprof.com/appgini/help/advanced-topics/third-party-libraries-and-resources $script_path/pages/third-party-libraries-and-resources.md"
  "https://bigprof.com/appgini/help/advanced-topics/troubleshooting-errors-and-blank-pages $script_path/pages/troubleshooting-errors-and-blank-pages.md"
  "https://bigprof.com/appgini/help/advanced-topics/url-parameters $script_path/pages/url-parameters.md"
  "https://bigprof.com/appgini/help/useful-links $script_path/pages/useful-links.md"
  "https://bigprof.com/appgini/help/advanced-topics/hooks/using-lookup-fields-in-calculations $script_path/pages/using-lookup-fields-in-calculations.md"
  "https://bigprof.com/appgini/help/advanced-topics/hooks/WindowMessages-class $script_path/pages/WindowMessages-class.md"
  "https://bigprof.com/appgini/help/working-with-generated-web-database-application/working-with-filters $script_path/pages/working-with-filters.md"
  "https://bigprof.com/appgini/help/working-with-generated-web-database-application $script_path/pages/working-with-generated-web-database-application.md"
  "https://bigprof.com/appgini/help/working-with-projects/working-with-styles $script_path/pages/working-with-styles.md"
  "https://bigprof.com/appgini/help/working-with-generated-web-database-application/working-with-tables-and-records $script_path/pages/working-with-tables-and-records.md"
)

# Iterate over the list of URLs and file paths
for url_and_file in "${urls[@]}"; do
  # Split the URL and file path
  url=$(echo "$url_and_file" | cut -d ' ' -f 1)
  file=$(echo "$url_and_file" | cut -d ' ' -f 2)

  echo "Processing URL: $url"
  echo "Appending to file: $file"

  # Fetch the HTML content using curl, extract the desired portion using pup,
  # and convert it to Markdown using pandoc
  curl -s "$url" | pup '#content-content div.content' | pandoc -f html -t markdown >> "$file"

  echo "------------------------"
done