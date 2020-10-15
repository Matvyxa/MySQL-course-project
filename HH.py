from bs4 import BeautifulSoup as bs
import requests
from pprint import pprint

main_link = 'https://hh.ru/'
params = {'clusters':'true', 'area':'1', 'search_field':'name', 'enable_snippets':'true',
         'salary':' ','st':'searchVacancy', 'text':'Инженер+сметчик', 'from':'suggest_post'}
headers = {'User-agent':'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.75 Safari/537.36'}

response = requests.get(main_link + '/search/vacancy', params=params, headers=headers)
soup = bs(response.text, 'html.parser')

vacancy_items = soup.find('div', {'data-qa': 'vacancy-serp__results'}) \
    .find_all('div', {'class': 'vacancy-serp-item'})





