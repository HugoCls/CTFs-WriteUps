import string

EN_IC = 0.686


def get_blocks(text, size):
    """
    Function to get all the blocks of a certain size from a given text
    """
    blocks = [text[i:i+size] for i in range(0, len(text)-size, size)]
    return blocks


def get_columns(text_blocks):
    """
    Function to get all columns from blocks of texts 
    ex: ["azerzr","zdqscw", "pokjsd", ..] -> ["azp..", "zdo..", ..]
    """
    group_size = len(text_blocks[0])
    columns = []
    for letter_count in range(group_size):
        column = ''
        for group_count in range(len(text_blocks)):
            column += text_blocks[group_count][letter_count]
        columns.append(column)
    return columns

def get_letter_counts(text):
    text_upper = text.upper()
    letter_counts = {}
    for index, letter in enumerate(string.ascii_uppercase):
        letter_counts[letter] = text_upper.count(letter)
    return letter_counts


def _ic(letter_counts):
    """
    Function to get the index of coincidence of a given text which has this given letter_counts

    Parameters:
            letter_counts (dict{str:int}: A dict containing the number of occurences of every letter in the given text
    
    Returns:
            numerator/denominator (float): The IC corresponding to this text
    """
    numerator = sum([letter_counts[l]*(letter_counts[l]-1) for l in string.ascii_uppercase])
    text_size = sum(occurrences for occurrences in letter_counts.values())
    denominator = text_size*(text_size-1)
    return numerator/denominator


def find_key_length(ciphertext, max_key_len):
    """
    Function to guess the key_length of the key used to encrypt a text with the vigenere algorithm

    Parameters:
            ciphertext (str): Encrypted text
            max_key_len (int): limit of the range throught which we search the key
    Returns:
            key_len (int): The final key_length guess
    """
    min_diff = 10000
    key_len = 0

    candidates = []

    # For each key len between 1 and max_key_len, we will create columns in which each caracter is supposed to be ciphered the same way
    # If not, the ics will have bad values (close to ICrandom: 0.4.. )
    # If yes, the ics will be close to ICeng (0.0686)
    for candidate_length in range(1, max_key_len + 1):
        
        # We create the blocks of candidate_length len
        groups = get_blocks(text=ciphertext, size=candidate_length)

        # We create the columns
        columns = get_columns(groups)

        # We calculate the ICs
        ics = [_ic(letter_counts=get_letter_counts(text=column)) for column in columns]

        # We calculate the average of ICs
        delta_bar_ic = sum(ics) / len(ics)

        # If the average is closer to EN_IC than our best candidate, we take it as our best candidate
        if EN_IC-delta_bar_ic < min_diff:
            min_diff = EN_IC-delta_bar_ic
            key_len = candidate_length
        
        candidates.append((candidate_length, delta_bar_ic))

    # We return the candidates based on their closeness to EN_IC
    candidates = sorted(candidates, key=lambda x: abs(x[1] - EN_IC))

    print(f"Indexes of coincidence by k-lenght (10 best): {candidates[:10]}")
        
    return key_len