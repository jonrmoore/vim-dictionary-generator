import sys
from bs4 import BeautifulSoup as bs

# def

with open('./all_urls.txt', 'r') as f:
    urls = f.readlines()
    for i in urls:
        print(i)
