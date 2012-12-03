Challenge page is <a href="http://www.overthewire.org/wargames/semtex/semtex3.shtml">HERE</a>

<<CHALLENGE_CONTENT
Level 3

Number-Lock Action
You are almost on Semtex 4, there is just one big door before you. It is locked with a number lock.
Analyze and use the locks in /semtex/semtex3 to adjust all the numbers in the correct way.
They will open your way to the next level.
Tip :
 - If you are not good at math, you should consider brute force. Rewrite the program and try all possible combinations of the locks. It wont take more than a few seconds ;)

CHALLENGE_CONTENT

Comment by me:
	- starting numbers are 300
	- open password file at '/etc/semtex_pass/semtex4' 
	- here is how the pressing a number affects each lock
================================================================================
|            L1             L2             L3             L4             L5    |
|           300            300            300            300            300    |
================================================================================
1:           +5             +2             +1             +7             +5    |
2:          +13             -7             -4             +1             +5    |
3:           +9            +12             +9            +70             -4    |
4:          -11             +9             +0             +5            -13    |
5:           +4            +17            +12             +9            +24    |
6:          +11            -17            +21             +5            +14    |
7:          +15            +31            +22            -12             +3    |
8:          +19            -12             +4             +3             -7    |
================================================================================
1: + + + + +	x a ; a>=0
2: + - - + +	x b ; b>=0
3: + + + + -	x c ; c>=0
4: - + + + -	x d ; d>=0
5: + + + + +	x e ; e>=0
6: + - + + +	x f ; f>=0
7: + + + - +	x g ; g>=0
8: + - + + -	x h ; h>=0


5a +13b +9c -11d +4e  +11f +15g +19h = 100
2a -7b +12c  +9d +17e -17f +31g -12h = 100
1a -4b  +9c  --- +12e +21f +22g  +4h = 100
7a +1b +70c  +5d +9e   +5f -12g  +3h = 100
5a +5b  -4c -13d +24e +14f  +3g  -7h = 100
........................

CORRECT!!!!
[4, 3, 5, 1, 2, 7, 1, 5, 5, 2, 7, 6, 2]
[400, 400, 400, 400, 400]
