Challenge url is <a href="http://www.overthewire.org/wargames/bandit/bandit22.shtml">HERE</a>

<<CHALLENGE_CONTENT
Level 22

Level Goal
A program is running automatically at regular intervals from cron, the time-based job scheduler. Look in /etc/cron.d/ for the configuration and see what command is being executed.
Commands you may need to solve this level
 - cron, crontab, crontab(5) (use "man 5 crontab" to access this)
CHALLENGE_CONTENT

Challenge url is <a href="http://www.overthewire.org/wargames/bandit/bandit23.shtml">HERE</a>

<<CHALLENGE_CONTENT
Level 23

Level Goal
A program is running automatically at regular intervals from cron, the time-based job scheduler. Look in /etc/cron.d/ for the configuration and see what command is being executed.

NOTE: Looking at shell scripts written by other people is a very useful skill. The script for this level is intentionally made easy to read. If you are having problems understanding what it does, try executing it to see the debug information it prints.
Commands you may need to solve this level
 - cron, crontab, crontab(5) (use "man 5 crontab" to access this)
CHALLENGE_CONTENT

Comment by me:
 - After reading '/etc/cron.d/cronjob_bandit23', it executes '/usr/bin/cronjob_bandit23.sh'
 - Further reading the file '/usr/bin/cronjob_bandit23.sh', it copies bandit23's password into '/tmp' with a file name as a hash of some word
 - The file 'cronjob_bandit23.sh' is set to execute as 'bandit23'. Therefore, '$(whoami)' will result in 'bandit23'
 - So, just generate the file name, and read it from /tmp directory