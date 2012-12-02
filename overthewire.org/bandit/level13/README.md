Challenge url is <a href="http://www.overthewire.org/wargames/bandit/bandit13.shtml">HERE</a>

<<CHALLENGE_CONTENT
Level 13

Level Goal
The password for the next level is stored in the file data.txt, which is a hexdump of a file that has been repeatedly compressed. For this level it may be useful to create a directory under /tmp in which you can work using mkdir. For example: mkdir /tmp/myname123. Then copy the datafile using cp, and rename it using mv (read the manpages!)
Commands you may need to solve this level
 - grep, sort, uniq, strings, base64, tr, tar, gzip, bzip2, xxd, mkdir, cp, mv
Helpful Reading Material
 - Hex dump on Wikipedia
CHALLENGE_CONTENT

Challenge url is <a href="http://www.overthewire.org/wargames/bandit/bandit14.shtml">HERE</a>

<<CHALLENGE_CONTENT
Level 14

Level Goal
The password for the next level is stored in /etc/bandit_pass/bandit14 and can only be read by user bandit14. For this level, you don't get the next password, but you get a private SSH key that can be used to log into the next level. 
Note: localhost is a hostname that refers to the machine you are working on
Commands you may need to solve this level
 - ssh, telnet, nc, openssl, s_client, nmap
Helpful Reading Material
 - SSH/OpenSSH/Keys
CHALLENGE_CONTENT

Comment from me:
 - ssh can output the result of commandline directly to STDOUT
 - If permission of SSH private-key file is too open (for other to read, e.g. 644), the file will be ignored by SSH program
 