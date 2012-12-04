Challenge page is <a href="http://natas0.natas.labs.overthewire.org/">HERE</a>.

<<CHALLENGE_CONTENT
Natas

Natas teaches the basics of serverside web-security.

Each level of natas consists of its own website located at http://natasX.natas.labs.overthewire.org, where X is the level number. There is no SSH login. To access a level, enter the username for that level (e.g. natas0 for level 0) and its password.

Each level has access to the password of the next level. Your job is to somehow obtain that next password and level up. All passwords are also stored in /etc/natas_webpass/. E.g. the password for natas5 is stored in the file /etc/natas_webpass/natas5 and only readable by natas4 and natas5.

Start here:

Username: natas0
Password: natas0
URL: http://natas0.natas.labs.overthewire.org

CHALLENGE_CONTENT

Comment by me:
	- view source, and the password is there
	<!--The password for natas1 is 9hSaVoey44Puz0fbWlHtZh5jTooLVplC -->