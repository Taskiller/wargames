#!/usr/bin/env ruby

cipher_password = 'PNUKLYLWRQKGKBE'

=begin
#from analyzing the file (plain1,cipher1)
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA		<<< PLAIN
EICTDGYIYZKTHNSIRFXYCPFUEOCKRN		<<< CIPHER << repeat every 30 chars
=end

# Calculate the translation pattern (diff)
def calculate_diff(plain,cipher)
	plain = plain.unpack('C*').map{|c| c-'A'.ord}
	cipher = cipher.unpack('C*').map{|c| c-'A'.ord}
	diff = cipher.zip(plain).map{|a| (a[0]-a[1]) % 26}
	return diff
end

def decrypt(cipher,diff)
	cipher = cipher.unpack('C*').map{|c| c-'A'.ord}
	cipher.each_with_index do |c,i|
		cipher[i] = (cipher[i] - diff[i % diff.size]) % 26
	end

	return cipher.map!{|c| c+'A'.ord}.pack('C*')
end

plain1 = 'A'*30
cipher1 = 'EICTDGYIYZKTHNSIRFXYCPFUEOCKRN'
plain2 = 'B'*30
cipher2 = 'FJDUEHZJZALUIOTJSGYZDQGVFPDLSO'
plain3 = 'C'*30
cipher3 = 'GKEVFIAKABMVJPUKTHZAERHWGQEMTP'
plain4 = 'Z'*30
cipher4 = 'DHBSCFXHXYJSGMRHQEWXBOETDNBJQM'

diff = calculate_diff(plain1,cipher1)
puts "Decrypt(cipher1) > "+decrypt(cipher1,diff)
puts "Decrypt(cipher2) > "+decrypt(cipher2,diff)
puts "Decrypt(cipher3) > "+decrypt(cipher3,diff)
puts "Decrypt(cipher4) > "+decrypt(cipher4,diff)

puts "Password for level7 = "+decrypt(cipher_password,diff)