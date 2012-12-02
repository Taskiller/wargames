Challenge page is <a href="http://www.overthewire.org/wargames/vortex/vortex0.shtml">HERE</a>

<<CHALLENGE_CONTENT
Level 0

Level Goal:
Your goal is to connect to port 5842 on vortex.labs.overthewire.org and read in 4 unsigned integers in host byte order. Add these integers together and send back the results to get a username and password for vortex1. This information can be used to log in using SSH.
Note: vortex is on an 32bit x86 machine (meaning, a little endian architecture)
Helpful Reading Material
 - C Programming Introduction
 - Network Programming Tutorial
CHALLENGE_CONTENT

Comment by me:
 - on 32bit x86, an integer uses 4 bytes
 - Ruby pack/unpack uses 'V' to represent 32bit little-endian integer
 - sock.read and sock.gets will read until the stream is closed. So, don't use it at the first read, since it does not close the stream yet.
 - left commented code for non-blocking read version for future use

