Challenge page is <a href="">HERE</a>

<<CHALLENGE_CONTENT


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
	- It is actually sys call number 201 to '__NR_geteuid32'
