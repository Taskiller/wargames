Challenge page is <a href="http://www.overthewire.org/wargames/semtex/semtex4.shtml">HERE</a>

<<CHALLENGE_CONTENT
Level 4

Ptrace your way
Pass prints the password for the level you are on. Try to make it print the next level's password.
This time it is not so easy:
/semtex/semtex4: ELF 32-bit LSB executable, Intel 80386, version 1 (SYSV), statically linked, for GNU/Linux 2.6.15, stripped
Tip :
 - Pass uses geteuid() to get its information.
 - Read man ptrace

CHALLENGE_CONTENT

Comment by me:
	- Info about ptrace
		- http://www.linuxjournal.com/article/6210
		- http://linux.die.net/man/2/ptrace
		- http://www.linuxjournal.com/article/6100
		- http://linuxgazette.net/81/sandeep.html
		- http://mikecvet.wordpress.com/2010/08/14/ptrace-tutorial/
	- ORIG_EAX is 11 , may need to include from <sys/reg.h>
	- System call numbers locate in file /usr/include/asm/unistd_32.h
	  or unistd_32.h with kernel 2.6.38
	  or ex. http://code.google.com/p/source-comment/source/browse/trunk/linux-2.6.38/arch/x86/include/asm/unistd_32.h?spec=svn1064&r=1064
	- It is actually sys call number 201 to '__NR_geteuid32'
