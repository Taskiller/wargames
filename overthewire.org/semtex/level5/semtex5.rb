#!/usr/bin/env ruby

# written by Anidear

# require 'socksify' gem, install by 'sudo gem install socksify'
# require Tor running

require 'socket'
require 'open-uri'
require 'socksify'

LEVEL5_PASSWORD = 'HELICOTRMA'

# set proxy to TOR server(or other socks server)
if ARGV.size >0 
	ARGV[0] =~ /([^:]*):([0-9]*)/
	TCPSocket::socks_server = $1
	TCPSocket::socks_port = $2
end

def check_ip
	open('http://ifconfig.me/ip') do |page|
		ip = page.read.chomp
		puts "Current IP = #{ip}"
		return ip
	end
end

ip = check_ip

Socket.tcp 'semtex.labs.overthewire.org', 24027 do |sock|
	puts 'Receiving...'
	data = sock.recv(10)
	#data = sock.read 	# read 10 characters
	puts "Data=#{data.inspect}"
	puts "Data Size=#{data.size}"
	if data.size<10
		puts 'Error! Receiving data must equal to 10'
		sock.close
		exit 1
	elsif data.size>10
		puts "PASSWORD MUST BE IN HERE #{data}"
		sock.close
		exit 0
	end

	#input XOR level5's password , byte by byte
	out = data.unpack('C*').zip(LEVEL5_PASSWORD.unpack('C*')).map{|arr| arr[0]^arr[1] }
	#p data.unpack('C*')
	#p LEVEL5_PASSWORD.unpack('C*')
	#p out
	
	#send it to server
	puts 'Sending...'
	out = out + 'ANIDEARST5'.unpack('C*')
	p out.pack('C*')
	sock.send(out.pack('C*'),0)
	sock.close_write
	#sendmsg_nonblock(out.pack('C*'),0,nil)
	puts "OUTPUT>>>>"+sock.read
	sock.close
	exit

	#add unique id
	#puts 'Sending unique id...'
	#sock.send('AnidearST5',0)

	#wait to see if any data is sent back, until connection is closed
=begin
	until sock.closed?
		begin
			data = sock.recv_nonblock(100)
			puts "OUTPUT from #{ip} >>> #{data}" if data.size>0
			break if data.size>0
		rescue IO::WaitReadable
			IO.select([sock])
			retry
		end
	end
=end
end