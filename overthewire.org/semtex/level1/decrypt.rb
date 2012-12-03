#!/usr/bin/env ruby

encrypted = 'HRXDZNWEAWWCP'

#reverse engineered from /semtex/semtex1
CONSTANT = 'AXMDNNPKTEKUL'.unpack('C*').map{|c| c-'A'.ord()}

puts "Encrypted > #{encrypted}"
encrypted = encrypted.unpack('C*').map{|c| c-'A'.ord()}

puts 'Decrypting...'
out = [0]*encrypted.size

out[0] = (encrypted[10] - CONSTANT[10]) % 26
out[1] = (encrypted[7] - CONSTANT[7]) % 26
out[2] = (encrypted[12] - CONSTANT[12]) % 26
out[3] = (encrypted[9] - CONSTANT[9]) % 26
out[4] = (encrypted[2] - CONSTANT[2]) % 26
out[5] = (encrypted[11] - CONSTANT[11]) % 26
out[6] = (encrypted[4] - CONSTANT[4]) % 26
out[7] = (encrypted[1] - CONSTANT[1]) % 26
out[8] = (encrypted[6] - CONSTANT[6]) % 26
out[9] = (encrypted[3] - CONSTANT[3]) % 26
out[10] = (encrypted[8] - CONSTANT[8]) % 26
out[11] = (encrypted[5] - CONSTANT[5]) % 26
out[12] = (encrypted[0] - CONSTANT[0]) % 26 

p out
out.map!{|c| c+'A'.ord()}
puts "Output > #{out.pack('C*')}"