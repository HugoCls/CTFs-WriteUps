# Web Qualifiers: The Talker
## Statement
> What's it saying? Use SSH to connect to connect@141.85.224.99:2222 using password c0nn3ct and find out the flag.

Author: **@Mocanu Gabriel**

## Analysis

When using `strace` we observe that the binary opens the file flag in the parent directory.

`openat(AT_FDCWD, "../flag", O_RDONLY)`

By creating such a file localy, we can see that it correctly reads it, then waits.
```
read(4, "aaaaa\n\n", 128)               = 7
close(4)                                = 0
clock_nanosleep(CLOCK_REALTIME, 0, {tv_sec=10, tv_nsec=0}, 0x7ffd1d5a3e20) = 0
sendto(3, "aaaaa\n\n", 7, 0, {sa_family=AF_INET, sin_port=htons(4444), sin_addr=inet_addr("127.0.0.1")}, 16) = 7
```

If we have a working socket server in the machine, we should receive the content of the flag file in the parent directory.

## Exploitation

This part became a little bit harder as we cannot access `/ctf` folder & we also need to setup a socket server while most of the commands don't work (nano vim.. )

Flag: ****

