Challenge page is <a href="http://www.overthewire.org/wargames/semtex/semtex1.shtml">HERE</a>

<<CHALLENGE_CONTENT
Level 1

Simple encryption
A password has been crypted using the /semtex/semtex1 tool.

The crypted password is HRXDZNWEAWWCP.

You have to reverse engineer the algorithm and decrypt the password.
You might try the -v switch for encrypt.

CHALLENGE_CONTENT

Comment by me:
 - To use encryption, call '/semtex/semtex1 AAAAAAAAAAAAAA -v' (-v is verbose)
 - Try varying the plain text to see how output is changed
 - The algorith is in form of output[m] = input[n] + C
 
