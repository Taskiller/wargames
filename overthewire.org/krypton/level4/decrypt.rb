#!/usr/bin/env ruby

puts 'Key 0 = '+('j'.ord - 'e'.ord).to_s
puts 'Key 1 = '+('v'.ord - 'e'.ord).to_s
puts 'Key 2 = '+('i'.ord - 'e'.ord).to_s
puts 'Key 3 = '+('o'.ord - 'e'.ord).to_s
puts 'Key 4 = '+('i'.ord - 'e'.ord).to_s
puts 'Key 5 = '+('c'.ord - 'e'.ord + 26).to_s

cryped = 'HCIKV RJOX'.gsub(' ','')
#cryped = open('found1').read.gsub(' ','')

def decrypt_letter(pos,char)
	key = [5,17,4,10,4,24]
	
	c = char.ord - key[pos%6]
	if c < 'A'.ord
		c += 26
	end
	return c.chr
end

plain =''
cryped.scan(/./).each_with_index do |c,i|
	plain += decrypt_letter(i, c)
end

plain.gsub!(/(.{,60})/,"\\1\n")
puts plain