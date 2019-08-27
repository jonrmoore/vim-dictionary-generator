import sys
from bs4 import BeautifulSoup as bs

def extract_data_from_file(filename):
    return bs(open(filename), 'html.parser')

soup = extract_data_from_file(sys.argv[1])

header = soup.find('div', class_='row entry-header')
for h in header:
    word_name = header.find('h1', class_='hword').string
    word_type = header.find('span', class_='fl').string
    print(word_name)
    print(word_type)
    print('======')
    print(header.h1)
    print(header.span)
    print('======')
    for c in header.children:
        print('header children:\n' + header.c)

# body = soup.find_all('div', class_='row entry-attr')
# for i in body:
#     def_num = i.find('span', class_='num').string
#     def_text = i.find('span', class_='dtText').string
#     print('#' + def_num + ', Def: ' + def_text)

