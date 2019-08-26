import sys
from bs4 import BeautifulSoup

def extract_data_from_file(filename):
    return BeautifulSoup(open(filename), 'html.parser')

soup = extract_data_from_file(sys.argv[1])
pages_text = soup.find('span', class_='counters').string # Ex) Returns 'pages 1 to 75'
total_pages = pages_text[pages_text.rindex(' ')+1:]

# Will pipe to ./urls/ in Bash script
print(total_pages)

