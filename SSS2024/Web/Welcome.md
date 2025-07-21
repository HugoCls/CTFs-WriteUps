# Web Qualifiers: Welcome
## Statement
> Always be patient.

> Get the flag from Welcome.

Author: **@Mocanu Gabriel**

## Analysis

In the welcome page we learn that there are 4 parts for the flag and they give us a part already.

By watching the source code we see that the second part is **svyr_**.

Moreover by watching in the network tab of our browser we see a call to a .js script which is `/static/hidden.js?v=1715287404002`.

The actual file:
```
/*
JavaScript is pretty cool. It is mainly used in the development of web pages.
You will have to read some JS code in your journey as a hacker.
This one is on us, but maybe you will have to dig deeper in your next
adventure. The third part of the flag is: **`unf_`**.
*/

document.getElementById("hidden").style.color = 'white';

var d = new Date(),
    minutes = d.getMinutes().toString().length == 1 ? '0'+d.getMinutes() : d.getMinutes(),
    hours = d.getHours().toString().length == 1 ? '0'+d.getHours() : d.getHours(),
    ampm = d.getHours() >= 12 ? 'pm' : 'am',
    months = ['Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec'],
    days = ['Sun','Mon','Tue','Wed','Thu','Fri','Sat'];

var chunker = /((?:\((?:\([^()]+\)|[^()]+)+\)|\[(?:\[[^[\]]*\]|['"][^'"]*['"]|[^[\]'"]+)+\]|\\.|[^ >+~,(\[\\]+)+|[>+~])(\s*,\s*)?((?:.|\r|\n)*)/g,
        done = 0,
        toString = Object.prototype.toString,
        hasDuplicate = false,
        baseHasDuplicate = true;
```

We habe the third part of the flag: **`unf_`**.

After some reseach we see that a logo.png image contains the last part of the flag which is: **`srryvatf}`**

And moreover on the CSS code there is the first part of the flag: **`FFF{rirel_`**

By concataining the parts here is the actual "flag" FFF{rirel_svyr_unf_srryvatf}

## Exploitation

We can guess that the flag was ciphered with caesar algorithm as we have FFF istead of SSS, with a shift of 13 we find a correct sentence.

Note: I spent 2 hours reversing the `/console` directory before doing the easy things :()

Flag: **SSS{every_file_has_feelings}**