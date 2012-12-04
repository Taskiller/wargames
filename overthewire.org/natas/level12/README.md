Challenge page is <a href="http://www.overthewire.org/wargames/natas/natas12.shtml">HERE</a>.

<<CHALLENGE_CONTENT
Level 12

Username: natas12
URL:      http://natas12.natas.labs.overthewire.org

CHALLENGE_CONTENT

Password for this level (from last level)
	- username: natas12
	- password: sh7DrWKtb8xw9PIMkh8OQsgno6iZnJQu

Comment by me:
	- It is an upload form, without checking type of file. We can upload PHP script.
	- Only restriction is at '<input type="hidden" name="filename" value="<? print genRandomString(); ?>.jpg" />' which will restrict the created file as '.jpg'
	- Use browser/plugin to change the hidden-random-filename field before submit, then we can submit '.php'
	- submit a shell php, ex. AnidearNatas12.php
	- Issue command such as: http://natas12.natas.labs.overthewire.org/upload/b55e2iu23o.php?cmd=cat%20/etc/natas_webpass/natas13
