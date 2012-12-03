Challenge url is <a href="http://www.overthewire.org/wargames/bandit/bandit20.shtml">HERE</a>

<<CHALLENGE_CONTENT
Level 20

Level Goal
To gain access to the next level, you should use the setuid binary in the homedirectory. Execute is without arguments to find out how to use it. The password for this level can be found in the usual place (/etc/bandit_pass), after you have used to setuid binary.
Helpful Reading Material
 - setuid on Wikipedia
CHALLENGE_CONTENT

Challenge url is <a href="http://www.overthewire.org/wargames/bandit/bandit21.shtml">HERE</a>

<<CHALLENGE_CONTENT
Level 21

Level Goal
There is a setuid binary in the homedirectory that does the following: it makes a connection to localhost on the port you specify as a commandline argument. It then reads a line of text from the connection and compares it to the password in the previous level (bandit20). If the password is correct, it will transmit the password for the next level (bandit21).

NOTE: To beat this level, you need to login twice: once to run the setuid command, and once to start a network daemon to which the setuid will connect.
NOTE 2: Try connecting to your own network daemon to see if it works as you think
Commands you may need to solve this level
 - ssh, nc, cat
CHALLENGE_CONTENT