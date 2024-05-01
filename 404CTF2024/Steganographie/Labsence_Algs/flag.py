import index_of_coincidence
from frequency_analysis import Chi_square_approach
from vigenere import vigenere_to_text

ciphertext = "Kl qsfwm, r'qc hm s'ynfefmmh wej rc peahxik xi eg lmgigg i uni voqevmmem fuv vkq srnk jcy psmryurnl yiyli hkppee ehv fuck ! Syuf ahkmi orw rmztuw kmsbijifq, w'aa xvvcr ha jq eelkwkpij. Rc hbiub : 404KJZ{RwBmxrzHtaBywVxybramqAlj}"

ciphertext_ = [e for e in ciphertext if ord(e) in [lower_k for lower_k in range(97, 97+26)] + [upper_k for upper_k in range(65, 65+26)]]

## FIND THE KEY LENGTH
# Index of Coincidence approach (based on letters percentage of apparition on english Language, ICenglish)
key_length = index_of_coincidence.find_key_length(ciphertext=ciphertext_, max_key_len=30)

print(f"Guessed key_lenght(index of coincidence): {key_length}")

## FIND THE KEY
# Chi-square approach
decryptedtext, guessedkey = Chi_square_approach(ciphertext_, key_length)
print(f"Guessed key(Chi-square): {guessedkey}")

deciphered_text = vigenere_to_text(ciphertext_, key=guessedkey, action="decrypt")

final_text = ""
j = 0

for i in range(len(ciphertext)):
    if ord(ciphertext[i]) not in [lower_k for lower_k in range(97, 97+26)] + [upper_k for upper_k in range(65, 65+26)]:
        final_text += ciphertext[i]
        j+=1
    else:
        final_text += deciphered_text[i-j]

## SAVE THE RESULT
with open("flag.txt", "w", encoding="utf-8") as f:
    f.write(final_text)