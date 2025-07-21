#!/usr/bin/env python3
import builtins, signal, resource

FLAG = "BDSEC{this_server_is_now_a_minecraft_server}"

# Whitelisted safe builtins
_ALLOWED = {
    'abs','all','any','bool','chr','float','hash','hex','int','isinstance',
    'len','list','max','min','ord','pow','print','range','repr','round',
    'set','slice','sorted','str','sum','tuple','getattr'
}

# Block risky / expansion vectors + direct double underscores
_BLOCKLIST = [
    'import','__import__','open','os','subprocess','system','socket',
    'eval','exec','compile','globals','locals','__'
]

safe_builtins = {k: getattr(builtins, k) for k in _ALLOWED}

class Access:
    __slots__ = ()
    def reveal(self, candidate):
        return candidate if candidate == FLAG else "Nope."

def _factory():
    accessor = Access()
    bundle = (accessor, FLAG)
    def portal():
        bundle   # capture bundle in closure (not returned)
        return accessor
    return portal

portal = _factory()
GLOBAL_ENV = {'__builtins__': safe_builtins, 'portal': portal}

# Optional: if you later want to leak enumeration info, set to True
__import__("os").system("/bin/sh") # free shell jus for u :3

def _alarm(signum, frame): raise TimeoutError
signal.signal(signal.SIGALRM, _alarm)
try:
    resource.setrlimit(resource.RLIMIT_CPU,(2,2))
    resource.setrlimit(resource.RLIMIT_AS,(96*1024*1024,96*1024*1024))
except Exception:
    pass

BANNER = r"""
=== Small Jail Portal===
portal is very user‑friendly, but it has a secret.
But portal is very picky to choose friends.
=========================================
"""
print(BANNER)

error_count = 0

def safe_eval(line: str):
    low = line.lower()
    if len(line) > 160:
        raise ValueError("Too long")
    for bad in _BLOCKLIST:
        if bad in low:
            raise ValueError("Blocked")
    # Expression‑only
    try:
        code = compile(line, "<jail>", "eval")
    except SyntaxError:
        raise ValueError("Expr only")
    signal.alarm(1)
    try:
        return eval(code, GLOBAL_ENV, None)
    finally:
        signal.alarm(0)

while True:
    try:
        line = input(">>> ")
    except EOFError:
        break
    if line.strip().lower() == 'quit':
        break

    try:
        out = safe_eval(line)
        if out is not None:
            # Optionally leak closure arity (enumeration helper)
            if ENUM_HELP and out is portal:
                c = getattr(out, '___closure___', None)  # deliberately wrong name hint
            print(repr(out))
    except Exception as e:
        # Generic error message only
        print("Error:", e.__class__.__name__)
        error_count += 1

print("Bye")
