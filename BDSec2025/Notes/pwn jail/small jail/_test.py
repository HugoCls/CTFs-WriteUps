from _jail import safe_eval

def main():
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
    base_keywords = ['False', 'None', 'True', 'and', 'as', 'assert', 'async', 'await', 'break',
                     'class', 'continue', 'def', 'del', 'elif', 'else', 'except', 'finally',
                     'for', 'from', 'global', 'if', 'import', 'in', 'is', 'lambda', 'nonlocal',
                     'not', 'or', 'pass', 'raise', 'return', 'try', 'while', 'with', 'yield']

    commands = []
    for cmd in base_commands:
        commands.append(cmd)
        commands.append(f"{cmd}()")
    commands.extend(base_keywords)

    found_commands = []
    for command in commands:
        try:
            result = safe_eval(command)
            if result is not None:
                print(f"✅ {command} => {result}")
                found_commands.append((command,result))
        except Exception as e:
            # if "NameError" not in str(e):
            #     print(f"⚠️  {command} raised {e.__class__.__name__}: {e}")
            pass
    
    print("\n--- Successful Commands (No NameError or ValueError) ---")
    for cmd, resp in found_commands:
        print(f"{cmd} => {resp}")

if __name__ == "__main__":
    main()
