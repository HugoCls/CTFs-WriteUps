

def vigenere_to_text(plaintext, key, action="encrypt"):
    '''
    Returns the encrypted or the decrypted version of a plaintext using the vigenere algorithm and [key] as a key of encryption.

    Parameters:
            plaintext (str): The text to encrypt
            key (int): The actual key
            action ["encrypt",] (str): wether the text has to be encrypted or decrypted

    Returns:
            cryptogram (str): The encrypted version of our text
    '''

    cryptogram = ""
    
    key = key.lower()
    N = len(key)

    # iterate over the given text
    for k in range(len(plaintext)):
        ch = plaintext[k]

        # The letter corresponds to a shift, we name it k_shift
        k_shift = ord(key[k % N]) - 97

        # We encrypt or decrypt the character depending of the user's choice
        if action == "encrypt":
            cryptogram += shift_chr(ch, k_shift)

        else:
            cryptogram += shift_chr(ch, -k_shift)

    return cryptogram
    

def shift_chr(ch, shift):
    '''
    Shifts a character using a shift according to Caesar method.
    
    For any special character, it does just return the same character

    Parameters:
            ch (str): The character to be encrypted/decrypted
            key (int): The key
    
    Returns:
            new_ch (str): The encrypted version of our character
    '''

    if ord(ch) not in [lower_k for lower_k in range(97, 97+26)] + [upper_k for upper_k in range(65, 65+26)]:
        new_ch = ch
    
    # check if a character is uppercase then encrypt it accordingly
    elif (ch.isupper()):
        new_ch = chr((ord(ch) + shift - 65) % 26 + 65)
    
    # by elimination, the character is lowercase, encrypt it accordingly
    else:
        new_ch = chr((ord(ch) + shift - 97) % 26 + 97)

    return new_ch