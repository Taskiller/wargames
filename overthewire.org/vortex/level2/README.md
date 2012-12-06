Challenge page is <a href="http://www.overthewire.org/wargames/vortex/vortex2.shtml">HERE</a>

<<CHALLENGE_CONTENT
Level 2

Level Goal:
Create a special tar file
Helpful Reading Material
	- GNU tar manual
Code listing (vortex2.c)
	 1 #include <stdlib.h>
	 2 #include <stdio.h>
	 3 #include <sys/types.h>
	 4 
	 5 
	 6 int main(int argc, char **argv)
	 7 {
	 8         char *args[] = { "/bin/tar", "cf", "/tmp/ownership.$$.tar", argv[1], argv[2], argv[3] };
	 9         execv(args[0], args);
	10 }

CHALLENGE_CONTENT

Comment by me:
	- try to read /etc/vortex_pass/vortex3
	- Run command: 
		./vortex2 -v /etc/vortex_pass/vortex3 
		(remark: The program requires 3 parameters, but if it has only 2, C language does not complain)
	- Usually, shell variable '$$' means 'Process ID' of the running process
	- But in this program, the '$$' is not being processed by Bash or Sh. So it remains '$$' in the file name '/tmp/ownership.$$.tar'
	- Sometimes, the server displays error such as:
		/bin/tar: U\211\345WVS\350Z: Cannot stat: No such file or directory
		/bin/tar: Exiting with failure status due to previous errors
		(I took a long time to figure it out that this error means nothing. The tar program still runs perfectly fine.)
	- To see output:
		tar -Oxvf '/tmp/ownership.$$.tar'
