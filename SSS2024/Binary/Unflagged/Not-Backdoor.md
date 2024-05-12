# Web Qualifiers: Not Backdoor
## Statement
> We found this strange file which claims to be a Windows NOT backdoor. Can you figure out what it actually is and what it's doing?

Author: **@Mocanu Gabriel**

## Analysis

We have a .exe file, and when launching `file` on it we understand that we have an archive.

Also when launching `strings` command we see this: 

"""This is not the flag; look somewhere else.
You chose flag no. %d; Here: %s
The flag is not here, either."""

Uncompress it w/ `tar -xvf not_backdoor.exe` gives us a `not_backdoor` exec file.

Using `strace` we see a hint: "Psst, try parsing an argument."

We launch the exec with a random argument: `strace ./not_backdoor -h`

```
write(1, "You chose flag no. 0; Here: <<<\24\37\35\\\33\33\0260\f_\1\31\n", 44You chose flag no. 0; Here: <<<\
                                                                                                              _
) = 44
```

I can't find further relevant informations.

Flag: ****