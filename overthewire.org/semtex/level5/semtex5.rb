#!/usr/bin/env ruby

# written by Anidear

# require 'socksify' gem, install by 'sudo gem install socksify'
# require Tor running

require 'socket'
require 'open-uri'
require 'socksify'

$DEBUG = false;
LEVEL5_PASSWORD = 'HELICOTRMA'
WARGAME_SERVER = 'semtex.labs.overthewire.org'	# '127.0.0.1'
WARGAME_PORT = 24027
BasicSocket.do_not_reverse_lookup = true

# set proxy to TOR server(or other socks server)
if ARGV.size >0 
	ARGV[0] =~ /([^:]*):([0-9]*)/
	TCPSocket::socks_server = $1
	TCPSocket::socks_port = $2
end

# connect to server
TCPSocket.open WARGAME_SERVER, WARGAME_PORT do |sock|
	puts "Address: #{sock.peeraddr.inspect}"
	puts 'Receiving...'	if $DEBUG
	data = sock.readpartial(11) 	# read 1..10 characters, but spare +1 if has \r
	puts "Data=#{data.inspect}"		if $DEBUG
	puts "Data Size=#{data.size}"	if $DEBUG
	if data.nil? or data.size<10
		puts 'Error! Receiving data must equal to 10'	if $DEBUG
		sock.close
		exit 1
	end

	#input XOR level5's password , byte by byte
	out = data.unpack('C*').zip(LEVEL5_PASSWORD.unpack('C*')).map{|arr| arr[0]^arr[1] }
	
	#send it to server
	puts 'Sending...'	if $DEBUG
	out = out + 'AnidearSt5'.unpack('C*')
	p out.pack('C*')	if $DEBUG
	sock.puts(out.pack('C*'))
	password = sock.readpartial(100)	## Wait for data
	puts "PASSWORD>>>>"+password.gsub(/[ \n\r]/,'')
	#again_mue5li
end