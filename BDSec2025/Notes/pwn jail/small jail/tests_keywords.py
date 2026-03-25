import socket
import time

def main():
    host = "96.126.114.185"
    port = 9969
    
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
    ]
    keywords = ['False', 'None', 'True', 'and', 'as', 'assert', 'async', 'await', 'break', 'class', 'continue', 'def', 'del', 'elif', 'else', 'except', 'finally', 'for', 'from', 'global', 'if', 'import', 'in', 'is', 'lambda', 'nonlocal', 'not', 'or', 'pass', 'raise', 'return', 'try', 'while', 'with', 'yield']

    commands = []
    for cmd in base_commands:
        commands.append(cmd)
        commands.append(cmd + '()')
        
    for cmd in keywords:
        commands.append(cmd)
        
    with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s:
        s.connect((host, port))

        data = s.recv(4096).decode()

        for command in commands:
            s.sendall(command.encode() + b"\n")

            response = s.recv(4096).decode()

            if "NameError" not in response:
                print(f"Trying command: {command}")
                print(f"Found command with response different from Error: NameError: {command}")
                print(response)

if __name__ == "__main__":
    main()