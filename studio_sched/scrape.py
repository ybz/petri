import requests

from parse import parse_sched

PAGE_URL = "http://www.studioc.co.il/%D7%94%D7%A1%D7%A0%D7%99%D7%A4%D7%99%D7%9D_%D7%A9%D7%9C%D7%A0%D7%95/%D7%AA%D7%9C_%D7%90%D7%91%D7%99%D7%91_-_%D7%93%D7%99%D7%96%D7%A0%D7%92%D7%95%D7%A3/%D7%9C%D7%95%D7%96_%D7%A9%D7%99%D7%A2%D7%95%D7%A8%D7%99%D7%9D/"

DEV = True

def fetch_sched_text():
    if DEV:
        text = open('./source.html','r').read()
    else:
        req = requests.get(PAGE_URL)
        req.encoding = 'utf-8'
        text = req.text
    return text

def scrape_sched():
    return parse_sched(fetch_sched_text())
