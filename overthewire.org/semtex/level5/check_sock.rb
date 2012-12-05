#!/usr/bin/env ruby 

# written by Anidear

# require 'socksify' gem, install by 'sudo gem install socksify'
# require Tor running

require 'socket'
require 'open-uri'
require 'socksify'

# set proxy to TOR server(or other socks server)
if ARGV.size>0 
	ARGV[0] =~ /([^:]*):([0-9]*)/
	TCPSocket::socks_server = $1
	TCPSocket::socks_port = $2
end

def check_ip
	open('http://ifconfig.me/ip') do |page|
		ip = page.read
		puts "#{ARGV[0]} ==> Current IP = #{ip}"
		return ip
	end
end

check_ip
