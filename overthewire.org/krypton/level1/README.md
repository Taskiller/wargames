Challenge page is <a href="http://www.overthewire.org/wargames/krypton/krypton1.shtml">HERE</a>

<<CHALLENGE_CONTENT
Level 1

Level Info:
The password for level 2 is in the file 'krypton2'. It is 'encrypted' using a simple rotation. It is also in non-standard ciphertext format. When using alpha characters for cipher text it is normal to group the letters into 5 letter clusters, regardless of word boundaries. This helps obfuscate any patterns. This file has kept the plain text word boundaries and carried them to the cipher text. Enjoy!

CHALLENGE_CONTENT

Comment by me:
	- it's simple rotation
	- looking at the word, there is a 3-character word. Assuming it's THE, so G-->T
	- then use ruby translate other characters according to the scheme.
		'YRIRY GJB CNFFJBEQ EBGGRA'.tr('G-ZA-F','T-ZA-S')
	