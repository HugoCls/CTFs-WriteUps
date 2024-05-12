# Web Qualifiers: Black Hole
## Statement
> The program is trying to hide something from you.

Author: **@Mocanu Gabriel**

## Analysis

I tryed some commands like `file black_hole` `strings black_hole` `readelf -a black_hole` and open the file on itself on ghidra to get C code corresponding on the binary, but nothing concluding.

What I saw on the web is that we can also launch the program on an isolated environment and watch for the system calls. The tool is called **strace**.

## Exploitation

After installing strace and launching `strace ./black_hole` we see the flag at the end.

`write(3, "SSS{the_more_you_look_the_less_y"..., 48) = 48`

Unfortunately we are missing the rest, apparently the sequence is 48 caracters long.

After some research I learnt that write(3,...) = 48 means that a sequence was wrote in the 3rd opened file and 48 octets were successfuly written.

However when trying cat `../../../../dev/null` (3rd file in the strace logs), the document is empty.

We can apparently redirect the outputs so I tryed `./black_hole > flag.txt` but nothing happens.

Finaly I figured out that the ... are only due to a display in the terminal, increasing the caracters limit made it working:

The payload: `strace -s 10000 ./black_hole` gave me the result.

Flag: **SSS{the_more_you_look_the_less_you_actually_see}**