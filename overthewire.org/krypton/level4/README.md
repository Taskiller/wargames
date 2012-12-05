Challenge page is <a href="http://www.overthewire.org/wargames/krypton/krypton4.shtml">HERE</a>

<<CHALLENGE_CONTENT
Level 4

Level Info:
Krypton 4

Good job!

You more than likely used some form of FA and some common sense to solve that one.

So far we have worked with simple substitution ciphers. They have also been 'monoalphabetic', meaning using a fixed key, and giving a one to one mapping of plaintext (P) to ciphertext (C). Another type of substitution cipher is referred to as 'polyalphabetic', where one character of P may map to many, or all, possible ciphertext characters.

An example of a polyalphabetic cipher is called a Vigenè Cipher. It works like this:

If we use the key(K) 'GOLD', and P = PROCEED MEETING AS AGREED, then "add" P to K, we get C. When adding, if we exceed 25, then we roll to 0 (modulo 26).

P P R O C E E D M E E T I N G A S A G R E E D
K G O L D G O L D G O L D G O L D G O L D G O
becomes:

P 15 17 14 2 4 4 3 12 4 4 19 8 13 6 0 18 0 6 17 4 4 3
K 6 14 11 3 6 14 11 3 6 14 11 3 6 14 11 3 6 14 11 3 6 14
C 21 5 25 5 10 18 14 15 10 18 4 11 19 20 11 21 6 20 2 8 10 17
So, we get a ciphertext of:

VFZFK SOPKS ELTUL VGUCH KR

This level is a Vigenè Cipher. You have intercepted two longer, english language messages. You also have a key piece of information. You know the key length!

For this exercise, the key length is 6. The password to level five is in the usual place, encrypted with the 6 letter key.

Have fun!
CHALLENGE_CONTENT

<<HINT
Frequency analysis will still work, but you need to analyse it
by "keylength".  Analysis of cipher text at position 1, 6, 12, etc
should reveal the 1st letter of the key, in this case.  Treat this as
6 different mono-alphabetic ciphers...

Persistence and some good guesses are the key!
HINT

welldonethelevelfourpasswordisbrute
Comment by me:
	- if each character is encoded differently, split characters that use the same key and put them together, for easier to analyze. Ex. c0,c1,c2,c3,c4,c5. But these files are unreadable.
	- From frequency analyze with the program, assume top-2 common letters are 'e','t'
		key 0: 'JT'-->'et'
		key 1: 'VK'-->'et'
		key 2: 'IX'-->'et'
		key 3: 'OD'-->'et'
		key 4: 'IX'-->'et'
		key 5: 'CR'-->'et'
	- See that 2 & 4 is similar
	- Found 'L' in key2,4 seems to be 'h', so that 'tLe'-->'the' ==> 'L'-->'h'
	- Since the algorithm to substitute is just to "add", it is similar to Caesar Cipher. Then we can just use translate method, without need to identify every letter's transition.