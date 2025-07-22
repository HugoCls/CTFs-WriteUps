def i(n, o):
    arrayOfChar = [''] * 10
    arrayOfChar[0] = '('
    arrayOfChar[1] = 'W'
    arrayOfChar[2] = 'D'
    arrayOfChar[3] = ')'
    arrayOfChar[4] = 'T'
    arrayOfChar[5] = 'P'
    arrayOfChar[6] = ':'
    arrayOfChar[7] = '#'
    arrayOfChar[8] = '?'
    arrayOfChar[9] = 'T'

    arrayOfChar[0] = chr(ord(arrayOfChar[0]) ^ ord(n[1]))
    arrayOfChar[1] = chr(ord(arrayOfChar[1]) ^ ord(o[0]))
    arrayOfChar[2] = chr(ord(arrayOfChar[2]) ^ ord(o[4]))
    arrayOfChar[3] = chr(ord(arrayOfChar[3]) ^ ord(n[4]))
    arrayOfChar[4] = chr(ord(arrayOfChar[4]) ^ ord(n[7]))
    arrayOfChar[5] = chr(ord(arrayOfChar[5]) ^ ord(n[0]))
    arrayOfChar[6] = chr(ord(arrayOfChar[6]) ^ ord(o[2]))
    arrayOfChar[7] = chr(ord(arrayOfChar[7]) ^ ord(o[3]))
    arrayOfChar[8] = chr(ord(arrayOfChar[8]) ^ ord(n[6]))
    arrayOfChar[9] = chr(ord(arrayOfChar[9]) ^ ord(n[8]))

    return "FLAG{" + ''.join(arrayOfChar) + "}"

n_value = "codenameduchess"
o_value = "guest"
result = i(n_value, o_value)
print(result)
