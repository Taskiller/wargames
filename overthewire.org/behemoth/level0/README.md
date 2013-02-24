URL: http://www.overthewire.org/wargames/behemoth/behemoth0.shtml

Comment from me:
	- file is located at: /behemoth/behemoth0
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

	   
