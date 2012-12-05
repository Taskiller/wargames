Challenge page is <a href="http://www.overthewire.org/wargames/semtex/semtex5.shtml">HERE</a>

<<CHALLENGE_CONTENT
Level 5

Random Networking
Make 10 connections to port 24027 from different IP's. On each connection you will receive a string of 10 ASCII characters. XOR this string with the Semtex5 password, character by character. Then send back the 10 characters followed by another string of exactly 10 characters which identifies you (can be anything within A-Z, a-z, 0-9). The first 10 characters that you send, are different on every connection, the last 10 have to be the same. If you do not send the correct string back within 5 seconds you are disconnected. Once connected with at least 10 different IP's You will receive the password on one connection, chosen randomly.

Note:
	- Your connections time out in 2 minutes and you cannot connect from an IP that is still connected.
May the sockets be with you.
Reading Material
	- Socks5 Request For Comment

CHALLENGE_CONTENT

Comment by me:
	- save list of socks server from : http://spys.ru/en/socks-proxy-list/ or http://sockslist.net/list/proxy-socks-5-list/ into 'socks.list'
	- run check_sock.rb to check if the socks server is available
		- command 'while read i; do (./check_sock.rb $i 2>/dev/null >>working_socks.list) & done < socks.list'
		- since it starts all scripts in background mode, to kill them runs 'killall ruby'
	- run programm using this command
		- while read i; do (./semtex5.rb $i 2>/dev/null) &  done < working_socks.list