#!/bin/bash

# this script loops recursively through all md files under 'pages'
# and tries to convert each one to pdf using pandoc
# if it works, deletes the pdf file and moves on to the next file
# if it fails, it prints an error message pointing to the file that failed

# pandoc settings:
# -f markdown+backtick_code_blocks+fenced_code_attributes+pipe_tables+yaml_metadata_block+raw_html
# -t pdf
# stabdalone

# loop through all md files under 'pages' and all subdirectories
find pages -name '*.md' | while read mdfile; do
  # convert the current md file to pdf
  pdfname="${mdfile%.md}.pdf"
  pandoc -f markdown+backtick_code_blocks+fenced_code_attributes+pipe_tables+yaml_metadata_block+raw_html -t pdf --standalone "$mdfile" -o "$pdfname" 2>/dev/null
  if [ $? -ne 0 ]; then
	echo "Error converting $mdfile to pdf"
  else
	rm "$pdfname"
  fi
done
