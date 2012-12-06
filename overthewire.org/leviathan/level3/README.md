Challenge page is <a href="http://www.overthewire.org/wargames/leviathan/leviathan3.shtml">HERE</a>

<<CHALLENGE_CONTENT
Level 3

There is no information for this level.
If you would like to see the description of this level expanded, please consider to contribute to OTW!
CHALLENGE_CONTENT

Login
	Username: leviathan3
	Password: Ahdiemoo1j

Comment by me:
	- To list all strings in the binary, use command: 'strings level3'

		/lib/ld-linux.so.2
		__gmon_start__
		libc.so.6
		_IO_stdin_used
		__printf_chk
		puts
		__stack_chk_fail
		stdin
		fgets
		system
		__libc_start_main
		GLIBC_2.4
		GLIBC_2.0
		GLIBC_2.3.4
		PTRh
		[^_]
		snlprintf
		[You've got shell]!
		/bin/sh
		bzzzzzzzzap. WRONG
		Enter the password> 
		secret

	- It is also hard for me to believe that the password is actually 'snlprintf'

		leviathan3@melissa:~$ ./level3 
		Enter the password> snlprintf
		[You've got shell]!
		$ id
		uid=12003(leviathan3) gid=12003(leviathan3) euid=12004(leviathan4) groups=12004(leviathan4),12003(leviathan3)
		$ cat /etc/leviathan_pass/leviathan4
		vuH0coox6m
		$ 

