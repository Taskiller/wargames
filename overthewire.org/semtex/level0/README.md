Challenge page is <a href="http://www.overthewire.org/wargames/semtex/semtex0.shtml">HERE</a>

<<CHALLENGE_CONTENT
Level 0

Get a shell
semtex.labs.overthewire.org

x86/elf: Connect to port 24000
amd64/elf: Connect to port 24001
ppc/mach-O: Connect to port 24002

Receive data until the port is closed.

Every second byte you receive is trash, ignore it.
The other bytes are an executable that shows you the password.

Then login to semtex1@semtex.labs.overthewire.org
Thanks to mrx for the amd64 and ppc binaries!
Reading Material
 - Beej's guide to network programming

CHALLENGE_CONTENT