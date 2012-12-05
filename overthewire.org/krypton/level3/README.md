Challenge page is <a href="http://www.overthewire.org/wargames/krypton/krypton3.shtml">HERE</a>

<<CHALLENGE_CONTENT
Level 3

Level Info:
Krypton 3

Well done. You've moved past an easy substitution cipher.

The main weakness of a simple substitution cipher is repeated use of a simple key. In the previous exercise you were able to introduce arbitrary plaintext to expose the key. In this example, the cipher mechanism is not available to you, the attacker.

However, you have been lucky. You have intercepted more than one message. The password to the next level is found in the file 'krypton4'. You have also found 3 other files. (found1, found2, found3)

You know the following important details:

- The message plaintexts are in English (*** very important) - They were produced from the same key (*** even better!)

Enjoy.
CHALLENGE_CONTENT

Comment by me:
	- There are files found1, found2, found3 that contain crypted text
	- According to 
		- http://en.wikipedia.org/wiki/Letter_frequency 
		- http://en.wikipedia.org/wiki/Frequency_analysis
	- From the program 'frequency.rb'
		- most common letter is 'S' --> in English is 'e'
		- most common bigram is 'JD'--> in English is 'th'
		- most common trigram is 'JDS' --> in English is 'the'
		- second common letter is 'Q' --> in English, it's 't', but third common is 'a'. Since J-->t, assume 'Q'-->'a'
	- Found 'atthattCTe', could be 'at that time' ==> 'C'-->'i', 'T'-->'m'
	- Found 'Utate', could be 'slate'==> 'U'-->'s'
	- Found 'heNe', could be 'here' ==> 'N'-->'r'
	- Found 'remarF', could be 'remark' ==> 'F'-->'k'
	- Found 'remarkaAVe', could be 'remarkable'==> 'A'-->'b', 'V'-->'l'
	- Found 'thiGEs', could be 'things'==>'G'-->'n', 'E'-->'g'
	- Found 'anW', could be 'and' ==>'W'-->'d'
	- Found 'ZBnsideratiBn', could be 'consideration' ==> 'Z'-->'c','B'-->'o'
	- Found 'hereMYon', could be 'here up on' ==> 'M'-->'u', 'Y'-->'p'
	- Found 'inKhich', could be 'in which' ==> 'K'-->'w'
	- found 'beautiXul', could be 'beautiful' ==> 'X'-->'f'
	- found 'point of Iiew', could be 'point of view' ==> 'I'-->'v'
	- found 'verL' and 'hardlL', could be 'very','hardly' ==> 'L'-->'y'
	- found 'eOceedingly', could be 'exceedingly' ==> 'O'-->'x'
	- found 'Rupiter', could be 'jupiter' ==> 'R'-->'j'
	- found 'priPe', could be 'prize' ==> 'P'-->'z'
	- the last character left is 'H'-->'q'

