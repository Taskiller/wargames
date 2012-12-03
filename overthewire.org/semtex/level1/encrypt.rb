#!/usr/bin/env ruby

#input = 'AAAAAAAAAAAAA'
input = 'AXMDNNPKTEKUL'

#reverse engineered from /semtex/semtex1
CONSTANT = 'AXMDNNPKTEKUL'.unpack('C*').map{|c| c-'A'.ord()}
#p CONSTANT

puts "Input > #{input}"
s = [0]*input.size
input_array = input.unpack('C*')
input_array.map!{|c| c-'A'.ord()}
p input_array
puts 'Encrypting...'
s[0] = (input_array[12] + CONSTANT[0]) % 26 
s[1] = (input_array[7] + CONSTANT[1]) % 26
s[2] = (input_array[4] + CONSTANT[2]) % 26
s[3] = (input_array[9] + CONSTANT[3]) % 26
s[4] = (input_array[6] + CONSTANT[4]) % 26
s[5] = (input_array[11] + CONSTANT[5]) % 26
s[6] = (input_array[8] + CONSTANT[6]) % 26
s[7] = (input_array[1] + CONSTANT[7]) % 26
s[8] = (input_array[10] + CONSTANT[8]) % 26
s[9] = (input_array[3] + CONSTANT[9]) % 26
s[10] = (input_array[0] + CONSTANT[10]) % 26
s[11] = (input_array[5] + CONSTANT[11]) % 26
s[12] = (input_array[2] + CONSTANT[12]) % 26
p s
s.map!{|c| c+'A'.ord()}
puts "Output > #{s.pack('C*')}"
