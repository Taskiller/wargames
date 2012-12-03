Challenge url is <a href="http://www.overthewire.org/wargames/bandit/bandit18.shtml">HERE</a>

<<CHALLENGE_CONTENT
Level 18

Level Goal
There are 2 files in the homedirectory: passwords.old and passwords.new. The password for the next level is in passwords.new and is the only line that has been changed between passwords.old and passwords.new
Commands you may need to solve this level
 - cat, grep, ls
CHALLENGE_CONTENT

Challenge url is <a href="http://www.overthewire.org/wargames/bandit/bandit19.shtml">HERE</a>

<<CHALLENGE_CONTENT
Level 19

Level Goal
The password for the next level is stored in a file readme in the homedirectory. Unfortunately, someone has modified .bashrc to log you out when you log in with SSH.
Commands you may need to solve this level
 - ssh, ls, cat
CHALLENGE_CONTENT

Comment by me:
 - initialization script (.bashrc) is executed after command that specified in 'ssh' command line, so it is possible to execute commands without having a shell
 