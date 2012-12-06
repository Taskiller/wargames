#!/usr/bin/env ruby

require 'socket'
server = TCPServer.new 24027
puts "Server starts..."
loop do
	Thread.start(server.accept) do |client|
		puts "A client is connected."
		client.puts "AAAAAAAAAA"
		data = client.read(20)
		puts "Receiving input #{data}"
		puts "Sending Password"
		client.puts "PASSWORD"
		puts "Close socket"
		client.close
	end
end