# Web Qualifiers: Mirror Me
## Statement
> Reverse the binary to find out the combination of two numbers that returns the flag. Get the flag from 141.85.224.99:31338 using netcat.

Author: **@Mocanu Gabriel**

## Analysis

We have a binary file which asks for two numbers and tell us that these are not the nice couple.

I tryed using strace, strings and other commands but the most relevant informations were given by Ghidra.

Indeed, after watching the reconstructed C code from the binary file highlights two relevant functions:

```C
uint max_mirror(void)
  uint uVar1;
  uint uVar2;
  int iVar3;
  uint local_24;
  uint local_20;
  
  uVar1 = 0;
  for (local_24 = 999; 100 < local_24; local_24 = local_24 - 1) {
    for (local_20 = local_24; 100 < local_20; local_20 = local_20 - 1) {
      uVar2 = local_20 * local_24;
      iVar3 = check_cond(uVar2);
      if ((iVar3 != 0) && (uVar1 < uVar2)) {
        uVar1 = uVar2;
      }
    }
  }
  return uVar1;
```

```C
bool check_cond(ulong param_1)

{
  ulong local_30;
  ulong local_20;
  
  local_20 = 0;
  for (local_30 = param_1; local_30 != 0; local_30 = local_30 / 10) {
    local_20 = local_30 % 10 + local_20 * 10;
  }
  return local_20 == param_1;
}
```

The `check_cond` function checks if a number is a palindrome (ex: 1234 is reversed as 4321 ans is not a palindrome but 1221 is equals to its reverse).

And also, the `max_mirror` returns the biggest palindrome from the product of two numbers lower than 1000.

## Exploitation

To reproduce this situation, I created this script to guess the numbers.

```Python
def is_palindrome(number):
    # Convert the number to a string for easy manipulation
    number_str = str(number)
    # Reverse the string
    reversed_str = number_str[::-1]
    # Check if the number is equal to its reverse
    return number_str == reversed_str


def max_mirror():
    max_product = 0
    max_x, max_y = 0,0
    for x in range(999, 99, -1):
        for y in range(x, 99, -1):
            product = y * x

            if is_palindrome(product) and max_product < product:
                max_product = product
                max_x = x
                max_y = y

    return max_product, max_x, max_y

print(max_mirror())
```

Thanks to that, we have the biggest palyndrome of two < 1000 numbers. x=993 y=913 x*y=906609.

As we have to put the biggest number on first we can use `nc 141.85.224.99 31338` and input x then y.

It opens a shell on the remote machine, after some research we find that there is a file named flag in `home/ctf/` directory.

Then `cat home/ctf/flag` gives us the flag.

Flag: **SSS{Mirror_mirror_on_the_wall_who_is_the_fairest_of_them_all}**