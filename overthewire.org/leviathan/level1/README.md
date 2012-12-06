Challenge page is <a href="http://www.overthewire.org/wargames/leviathan/leviathan1.shtml">HERE</a>

<<CHALLENGE_CONTENT
Level 1

There is no information for this level.
If you would like to see the description of this level expanded, please consider to contribute to OTW!
CHALLENGE_CONTENT

Login
	Username: leviathan1
	Password: rioGegei8m


Comment by me:
	- There is a file in home directory with permission of the user in next level
	-r-sr-x---   1 leviathan2 leviathan1 7288 2012-06-28 21:23 check*
	- From debugging, 
		I set breakpoint at 

		0x08048558 <+132>:	call   0x804840c <strcmp@plt>

	- Then run the program until that line, and print the stack out. I found
	(gdb) x/5s $esp
		0xffffd700:	 "(\327\377\377$\327\377\377\070\327\377\377\271\205\004\b=,\352\367secret"
		0xffffd71b:	 "love"
		0xffffd720:	 "god"
		0xffffd724:	 "sex"
		0xffffd728:	 "abc"	<<< it's what i typed
	- So, I tried to put in [secret, love, god, sex] and one of them let me in
	- It opens a shell prompt, but it does not use the correct euid yet

	$ id
	uid=12001(leviathan1) gid=12001(leviathan1) euid=12002(leviathan2) groups=12002(leviathan2),12001(leviathan1)
	$ cat /etc/leviathan_pass/leviathan1
	cat: /etc/leviathan_pass/leviathan1: Permission denied

	- Then I use vi to write .c code, then compile and run with that prompt
	#include <stdlib.h>
	#include <unistd.h>
	#include <string.h>
	#include <stdio.h>
	void main(){
	setresuid(geteuid(), geteuid(), geteuid()); execlp("/bin/sh", "sh", "-i", NULL);
	}
	- At last, I can get the right permission for the shell. It's time to see the password
	$ id
	uid=12002(leviathan2) gid=12001(leviathan1) groups=12002(leviathan2),12001(leviathan1)
	$ cat /etc/leviathan_pass/leviathan2
	
