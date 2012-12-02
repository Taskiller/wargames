Challenge url is <a href="http://www.overthewire.org/wargames/bandit/bandit12.shtml">HERE</a>

<<CHALLENGE_CONTENT
Level 12

Level Goal
The password for the next level is stored in the file data.txt, where all lowercase (a-z) and uppercase (A-Z) letters have been rotated by 13 positions
Commands you may need to solve this level
 - grep, sort, uniq, strings, base64, tr, tar, gzip, bzip2, xxd
Helpful Reading Material
 - Rot13 on Wikipedia
CHALLENGE_CONTENT

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

Comment from me:
 - command 'xxd -r' to reverse binary dump (in text file) back to a binary file
 - use 'file [filename]' command to see what type of compression the file uses
 - or 'file - ' if read data from standard input (STDIN)
 - command 'tar -xO ' outputs uncompress tar data to standard output (STDOUT)
