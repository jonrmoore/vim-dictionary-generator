#!/bin/bash

dictionary=$HOME/.vim/dictionary/dictionary.txt
if [ -f $dictionary ]; then
    echo "$dictionary exists"
else
    html_doc=$HOME/.scripts/vim-dictionary-generator/temp.html
    base_url=https://www.merriam-webster.com/browse/dictionary
    word_dir=$HOME/.scripts/vim-dictionary-generator/urls
    # Remove all text files from ./urls/
    rm $word_dir/**.txt
    echo
    echo "================ Cleared url entries ==============="
    echo
    # For letters a ~ z
    for x in {a..z}
    do
        echo "BASE_URL + X $base_url/$x"
        # Path for the first page of each letter
        # is defined without any number
        wget -O $html_doc $base_url/$x
        #Feed to python scraper
        python3 ./scrape_dictionary.py $html_doc > $word_dir/$x.txt
        # Get the total number of pages for each letter
        # Note: An iteration such as 'for x in {2..110}'
        # does not work. Any number appended to the path
        # which is higher than the total number of pages
        # for that letter will result in multiple iterations
        # over the final page.
        total_pages=$(python3 ./gen_total_pages.py $html_doc)
        echo "TOTAL PAGES: $total_pages"
        # For each letter, scrape the URL for each of
        # its pages and feed to python script
        for ((i=1; i<=$total_pages; i++))
        do
            echo "Letter $x, Iteration $i"
            wget -O $html_doc $base_url/$x/$i
            python3 ./scrape_dictionary.py $html_doc >> $word_dir/$x.txt
        done
    done
fi
