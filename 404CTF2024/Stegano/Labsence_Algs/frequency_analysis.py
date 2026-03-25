from vigenere import vigenere_to_text
import string

EN_REL_FREQ = {'A': 0.08167, 'B': 0.01492, 'C': 0.02782, 'D': 0.04253, 'E': 0.12702, 'F': 0.02228, 'G': 0.02015,
               'H': 0.06094, 'I': 0.06966, 'J': 0.00153, 'K': 0.00772, 'L': 0.04025, 'M': 0.02406, 'N': 0.06749,
               'O': 0.07507, 'P': 0.01929, 'Q': 0.00095, 'R': 0.05987, 'S': 0.06327, 'T': 0.09056, 'U': 0.02758,
               'V': 0.00978, 'W': 0.02360, 'X': 0.00150, 'Y': 0.01974, 'Z': 0.00074}

FR_REL_FREQ = {'A': 0.07636, 'B': 0.00901, 'C': 0.03260, 'D': 0.03669, 'E': 0.14715, 'F': 0.01066, 'G': 0.00866,
               'H': 0.00737, 'I': 0.07529, 'J': 0.00544, 'K': 0.00033, 'L': 0.05456, 'M': 0.02968, 'N': 0.07095,
               'O': 0.05134, 'P': 0.03005, 'Q': 0.01215, 'R': 0.06510, 'S': 0.07948, 'T': 0.07324, 'U': 0.05924,
               'V': 0.01525, 'W': 0.00092, 'X': 0.00490, 'Y': 0.00310, 'Z': 0.00136}


def get_letter_counts(text):
    """
    Returns the count of each letter in a given text
    """
    text_upper = text.upper()
    letter_counts = {}
    for index, letter in enumerate(string.ascii_uppercase):
        letter_counts[letter] = text_upper.count(letter)
    return letter_counts


def _get_letter_frequencies(text):
    """
    Returns the frequency of apparition of each letter in a given text
    """
    letter_counts = get_letter_counts(text)
    frequencies = {letter: count/len(text) for letter, count in letter_counts.items()}
    return frequencies


def Chi_square_approach(ciphertext, key_length):
    """
    Function to guess the key knowing the key_length for a text encrypted with vigenere algorithm

    Parameters:
            ciphertext (str): Encrypted text
            key_length (int): the length of the key to guess
    Returns:
            key (int): The final key guess
    """
    X_squares = {}

    # We split the text to blocks of the same size (key_length)
    split_text = []

    for i in range(0, len(ciphertext), key_length):
        split_text.append(ciphertext[i:i+key_length])

    split_text = split_text[:-1]

    # We loop on all the caracters of the key because we will guess them one by one
    for i in range(key_length):
        X_squares_i = {}

        # We create the column corresponding to the ith letter of each block
        column = ''.join(part[i] for part in split_text)

        # We calculate 26 times the Chi-squares of the given column, ciphered with each letter of the alphabet 
        for ch in [chr(lower_ch) for lower_ch in range(97, 97+26)]:
            # Shift of the column
            subtext_j = vigenere_to_text(column, ch, action="decrypt")
            
            # We remove the special caracters
            subtext_j = ''.join(char for char in subtext_j if ord(char) in [lower_k for lower_k in range(97, 97+26)])

            # We get the frequency of each caracter
            frequencies = _get_letter_frequencies(subtext_j)

            X_squares_i_ch = 0

            # We calculate Chi-square
            for letter in frequencies:
                X_squares_i_ch += (frequencies[letter] - FR_REL_FREQ[letter])**2 / FR_REL_FREQ[letter]
        
            X_squares_i[ch] = X_squares_i_ch
            #print(f"letter {i}:shift {ch}: X²:{X_squares_i_ch}")

        X_squares[i] = X_squares_i

    # Determine the element with the smallest Chi_square for letter of the key
    smallest_Chi_squares = {key: min(values, key=values.get) for key, values in X_squares.items()}

    # Concatenate the guessed elements in the order to create the final key
    guessed_key = ''.join(smallest_Chi_squares[key] for key in sorted(smallest_Chi_squares.keys()))
    
    # Decrypt the ciphered text
    plaintext = vigenere_to_text(ciphertext, guessed_key, action="decrypt")

    return plaintext, guessed_key