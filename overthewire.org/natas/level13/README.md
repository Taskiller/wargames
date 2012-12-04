Challenge page is <a href="http://www.overthewire.org/wargames/natas/natas13.shtml">HERE</a>.

<<CHALLENGE_CONTENT
Level 13

Username: natas13
URL:      http://natas13.natas.labs.overthewire.org

CHALLENGE_CONTENT

Password for this level (from last level)
	- username: natas13
	- password: IGCXqS4x472aoHZYaidvmeoWj2GmuRYz

Comment by me:
	- This is an upload form, similar to the previous version, but different in that, it uses 'if (! exif_imagetype($_FILES['uploadedfile']['tmp_name']))' to verify that the uploading file is an image.
	- Read up in PHP.net (http://php.net/manual/en/function.exif-imagetype.php), it says
	"exif_imagetype() reads the first bytes of an image and checks its signature."
	- So, to bypass it, change the first few bytes of the PHP file into a GIF (or something similar). I choosed '.GIF' because it is easy to put in the php file.
	- See 'http://en.wikipedia.org/wiki/Magic_number_(programming)' for the bytes:
	GIF	- 47 49 46 38 39 61
	JPEG - FF D8
	PNG - 89 50 4E 47 0D 0A 1A 0A
	- After created .php file with GIF header, change HTML on the page (or trap&modify POST data) of the hidden 'filename' value to end with '.php', then upload the file.
	- Finally, issue command like
	'http://natas13.natas.labs.overthewire.org/upload/v960x3n9yu.php?cmd=cat /etc/natas_webpass/natas14'


