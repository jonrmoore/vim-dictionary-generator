import sys
from bs4 import BeautifulSoup

def extract_data_from_file(filename):
    return BeautifulSoup(open(filename), 'html.parser')

soup = extract_data_from_file(sys.argv[1])
entries = soup.find('div', class_="entries").find_all('a')

for entry in entries:
    print('https://www.merriam-webster.com/dictionary/' + entry.string)

