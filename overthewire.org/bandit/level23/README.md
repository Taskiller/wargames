Challenge url is <a href="http://www.overthewire.org/wargames/bandit/bandit23.shtml">HERE</a>

<<CHALLENGE_CONTENT
Level 23

Level Goal
A program is running automatically at regular intervals from cron, the time-based job scheduler. Look in /etc/cron.d/ for the configuration and see what command is being executed.

NOTE: Looking at shell scripts written by other people is a very useful skill. The script for this level is intentionally made easy to read. If you are having problems understanding what it does, try executing it to see the debug information it prints.
Commands you may need to solve this level
 - cron, crontab, crontab(5) (use "man 5 crontab" to access this)
CHALLENGE_CONTENT

Challenge url is <a href="http://www.overthewire.org/wargames/bandit/bandit24.shtml">HERE</a>

<<CHALLENGE_CONTENT
Level 24

Level Goal
A program is running automatically at regular intervals from cron, the time-based job scheduler. Look in /etc/cron.d/ for the configuration and see what command is being executed.

NOTE: This level requires you to create your own first shell-script. This is a very big step and you should be proud of yourself when you beat this level!
NOTE 2: Keep in mind that your shell script is removed once executed, so you may want to keep a copy around...
Commands you may need to solve this level
 - cron, crontab, crontab(5) (use "man 5 crontab" to access this)
CHALLENGE_CONTENT

Comment by me:
 - After following execution process, from '/etc/cron.d/cronjob_bandit24', to '/usr/bin/cronjob_bandit24.sh', I found that the script will execute whatever files in '/var/spool/bandit24' then delete them, in every minute.
 - To watch for the creation of the file, use command 'watch -n 1 "ls -l /tmp/anidear_bandit24"'
 - There is a problem, with user 'bandit23' permission, I cannot delete the file '/tmp/anidear_bandit24' which is created by 'bandit24' permission