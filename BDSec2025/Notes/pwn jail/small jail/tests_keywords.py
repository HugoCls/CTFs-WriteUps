import socket
import time

def main():
    host = "96.126.114.185"
    port = 9969

    # Liste personnalisée de commandes à tester
    # Liste des mots/fonctions donnés (sans parenthèses)
    base_commands = [
        'abs', 'aiter', 'all', 'anext', 'any', 'ascii',
        'bin', 'bool', 'breakpoint', 'bytearray', 'bytes',
        'callable', 'chr', 'classmethod', 'compile', 'complex',
        'delattr', 'dict', 'dir', 'divmod',
        'enumerate', 'eval', 'exec',
        'filter', 'float', 'format', 'frozenset',
        'getattr', 'globals',
        'hasattr', 'hash', 'help', 'hex',
        'id', 'input', 'int', 'isinstance', 'issubclass', 'iter',
        'len', 'list', 'locals',
        'map', 'max', 'memoryview', 'min',
        'next',
        'object', 'oct', 'open', 'ord',
        'pow', 'print', 'property',
        'range', 'repr', 'reversed', 'round',
        'set', 'setattr', 'slice', 'sorted', 'staticmethod', 'str', 'sum', 'super',
        'tuple', 'type',
        'vars',
        'zip',
        '__import__',
        # Mots-clés python (sans parenthèses car ce sont des mots-clés)
        'False', 'None', 'True', 'and', 'as', 'assert', 'async', 'await', 'break', 'class', 'continue',
        'def', 'del', 'elif', 'else', 'except', 'finally', 'for', 'from', 'global', 'if', 'import',
        'in', 'is', 'lambda', 'nonlocal', 'not', 'or', 'pass', 'raise', 'return', 'try', 'while',
        'with', 'yield'
    ]

    # Générer liste finale avec les versions avec et sans ()
    commands = []
    for cmd in base_commands:
        commands.append(cmd)
        # Pour les mots-clés on n’ajoute pas les parenthèses
        if cmd.isidentifier() and cmd not in ['False', 'None', 'True', 'and', 'as', 'assert', 'async', 'await', 'break', 'class', 'continue', 'def', 'del', 'elif', 'else', 'except', 'finally', 'for', 'from', 'global', 'if', 'import', 'in', 'is', 'lambda', 'nonlocal', 'not', 'or', 'pass', 'raise', 'return', 'try', 'while', 'with', 'yield']:
            commands.append(cmd + '()')
        
    with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s:
        s.connect((host, port))

        # Lire message d'accueil
        data = s.recv(4096).decode()
        # print("Received:")
        # print(data)

        for command in commands:
            # print(f"Trying command: {command}")
            s.sendall(command.encode() + b"\n")

            response = s.recv(4096).decode()
            # print("Response:")
            # print(response)

            if "NameError" not in response:
                print(f"Trying command: {command}")
                print(f"Found command with response different from Error: NameError: {command}")
                print(response)
                
            # Optionnel : ralentir un peu pour ne pas saturer la connexion
            # time.sleep(0.01)

if __name__ == "__main__":
    main()
