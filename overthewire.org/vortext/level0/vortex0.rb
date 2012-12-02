#!/usr/bin/env ruby

# written by Anidear

require 'socket'

Socket.tcp 'vortex.labs.overthewire.org', 5842 do |sock|
	data = []
	puts 'Receiving...'
	(4*4).times do
		data << sock.getbyte
	end
	puts "Data=#{data.inspect}"
	puts "Data Size=#{data.size}"
	
	puts 'convert byte array to 32-bit little endian integer array'
	data = data.pack('C*').unpack('V*')	
	puts "Data=#{data.inspect}"
	puts "Data Size=#{data.size}"

	sum = data[0..3].inject(&:+)
	puts "Sum>#{sum.to_s}"

	puts 'Sending...'
	sock.send([sum].pack('V*'),0)	#send as bytes
	#sock.send(sum.to_s,0)	#send as ASCII
	
	puts 'Wait for receiving data...'
	puts sock.read

	#non-blocking version
	#begin # wait for response
	#  p sock.recv_nonblock(200) 
	#rescue IO::WaitReadable
	#  IO.select([sock])
	#  retry
	#end
end