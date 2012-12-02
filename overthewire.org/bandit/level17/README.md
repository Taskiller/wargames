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

Challenge url is <a href="http://www.overthewire.org/wargames/bandit/bandit18.shtml">HERE</a>

<<CHALLENGE_CONTENT
Level 18

Level Goal
There are 2 files in the homedirectory: passwords.old and passwords.new. The password for the next level is in passwords.new and is the only line that has been changed between passwords.old and passwords.new
Commands you may need to solve this level
 - cat, grep, ls
CHALLENGE_CONTENT