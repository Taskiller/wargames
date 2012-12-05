#!/usr/bin/env ruby

KEY_LENGTH = 9

crypted = 'BELOS Z'.gsub(' ','')

$key = [
	('O'.ord - 'E'.ord),
	('I'.ord - 'E'.ord),
	('C'.ord - 'E'.ord),
	('P'.ord - 'E'.ord),
	('I'.ord - 'E'.ord),
	('R'.ord - 'E'.ord),
	('K'.ord - 'E'.ord),
	('X'.ord - 'E'.ord),
	('L'.ord - 'E'.ord)
]
$key.map{|i| i<'A'.ord ? i+26 : i}

p $key

#crypted = open('found1').read.gsub(' ','')

def decrypt_letter(pos,char)	
	c = char.ord - $key[pos % KEY_LENGTH]
	if c < 'A'.ord
		c += 26
	end
	return c.chr
end

plain =''
crypted.scan(/./).each_with_index do |c,i|
	plain += decrypt_letter(i, c)
end

plain.gsub!(/(.{,60})/,"\\1\n")
puts plain