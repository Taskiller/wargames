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

Challenge url is <a href="http://www.overthewire.org/wargames/bandit/bandit22.shtml">HERE</a>

<<CHALLENGE_CONTENT
Level 22

Level Goal
A program is running automatically at regular intervals from cron, the time-based job scheduler. Look in /etc/cron.d/ for the configuration and see what command is being executed.
Commands you may need to solve this level
 - cron, crontab, crontab(5) (use "man 5 crontab" to access this)
CHALLENGE_CONTENT

Comment from me:
 - in cron, it says * * * * * bandit22 /usr/bin/cronjob_bandit22.sh &> /dev/null
 - in the shell script file, it reads password from /etc/bandit_pass/bandit22 with bandit22's permission and write to a file in /tmp, which we can read
 -