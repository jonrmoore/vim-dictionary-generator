#!/bin/bash

if [ -f ./all_urls.txt ]; then
    echo "Removing all_urls.txt"
    rm ./all_urls.txt
fi
for file in ./urls/*.txt; do
    echo $file
    cat $file >> ./all_urls.txt
done

all_urls=$HOME/.scripts/vim-dictionary-generator/all_urls.txt

while IFS= read -r line; do
    echo "Text: $line"
    wget -O $html_doc $line
    python3 scrape_defs.py $html_doc
done < "$file"

