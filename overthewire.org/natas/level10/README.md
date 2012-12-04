Challenge page is <a href="">HERE</a>.

<<CHALLENGE_CONTENT
Level 10

Username: natas10
URL:      http://natas10.natas.labs.overthewire.org

CHALLENGE_CONTENT

Password for this level (from last level)
	- username: natas10
	- password: s09byvi8880wqhbnonMFMW8byCojm8eA

Comment by me:
	- It now filter ';','|','&' from level9
	- But we can still put something before the last parameter
	- We can put '-v _' to invert the grep to other lines that doesnot contain '_' (which the password clearly doesnot)
	- We can inject file name to grep as '/etc/natas_webpass/natas11'
	- We can comment the rest of string with '#'
	- So, results in putting 
	'-v _ /etc/natas_webpass/natas11 #'