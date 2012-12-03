#!/usr/bin/env ruby

# written by Anidear

require 'socket'

PORT_X86 = 24000
PORT_X64 = 24001
PORT_PPC = 24002

OUT_FILE = 'semtex0.bin'

data = []
Socket.tcp 'semtex.labs.overthewire.org', PORT_X64 do |sock|
	puts 'Receiving...'
	data = sock.read
	#puts "Data=#{data.inspect}"
	puts "Data Size=#{data.size}"
end
	
puts 'convert byte string to array'
data = data.unpack('C*')
puts 'skipping all second bytes'
temp = []
(0...data.size).step(2){|i| temp << data[i]}
data = temp
#puts "Data=#{data.inspect}"
puts "Data Size=#{data.size}"

puts "write to file #{OUT_FILE}"
File.open(OUT_FILE,'w') do |f|
	f.write(data.pack('C*'))
end

puts "run #{OUT_FILE} ..."
system("chmod u+x #{OUT_FILE}")
system("./#{OUT_FILE}")