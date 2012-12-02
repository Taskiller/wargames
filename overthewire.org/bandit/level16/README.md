Challenge url is <a href="http://www.overthewire.org/wargames/bandit/bandit16.shtml">HERE</a>

<<CHALLENGE_CONTENT
Level 16

Level Goal
The password for the next level can be retrieved by submitting the password of the current level to port 30001 on localhost using SSL encryption.
Commands you may need to solve this level
 - ssh, telnet, nc, openssl, s_client, nmap
Helpful Reading Material
 - Secure Socket Layer/Transport Layer Security on Wikipedia
 - Testing SSL with commandline tools
CHALLENGE_CONTENT

Challenge url is <a href="http://www.overthewire.org/wargames/bandit/bandit17.shtml">HERE</a>

<<CHALLENGE_CONTENT
Level 17

Level Goal
The password for the next level can be retrieved by submitting the password of the current level to a port on localhost in the range 31000 to 32000. First find out which of these ports have a server listening on them. Then find out which of those speak SSL and which don't. There is only 1 server that will give the next password, the others will simply send back to you whatever you send to it.
Commands you may need to solve this level
 - ssh, telnet, nc, openssl, s_client, nmap
Helpful Reading Material
 - Port scanner on Wikipedia
CHALLENGE_CONTENT

Comment by me:
 - with nmap -sV these are the ports that are opened
    31046/tcp open  echo
    31518/tcp open  msdtc   Microsoft Distributed Transaction Coordinator (error)
    31691/tcp open  echo
    31790/tcp open  msdtc   Microsoft Distributed Transaction Coordinator (error)
    31960/tcp open  echo
 - There are 2 ports that are possible to send/receive SSL, but only one that returns correct result

