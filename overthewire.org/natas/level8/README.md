Challenge page is <a href="http://www.overthewire.org/wargames/natas/natas8.shtml">HERE</a>.

<<CHALLENGE_CONTENT
Level 8

Username: natas8
URL:      http://natas8.natas.labs.overthewire.org

CHALLENGE_CONTENT

Password for this level (from last level)
	- username: natas8
	- password: maabkdexUStb6JJXUqmBx7Re8M61cksn

Comment by me:
	- Again with submitting password
	- Try to reverse bin2hex(strrev(base64_encode($secret)))=='3d3d516343746d4d6d6c315669563362'
	- So, the reversion would be
	base64_decode(strrev(hex2bin('3d3d516343746d4d6d6c315669563362')));
	- use solve.php