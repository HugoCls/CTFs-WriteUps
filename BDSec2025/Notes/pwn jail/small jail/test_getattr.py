
# def portal():
#     return "test"

# print("".join([chr(x) for x in [95,95,99,108,111,115,117,114,101,95,95]]))
# print(getattr(getattr(portal, "__closure__")[1], "cell_contents")[1])

def outer():
    x = 10
    y = (20,13)
    z = 30  # non utilisé
    def inner():
        return x + y
    return inner

f = outer()
print(getattr(getattr(f, "__closure__")[1], "cell_contents"))
print([cell.cell_contents for cell in f.__closure__])

import dis

dis.dis(b'\x95\x00U\x01[\x00\x00\x00\x00\x00\x00\x00\x00\x00:X\x00\x00a\x02\x00\x00U\x01$\x00S\x01$\x00')