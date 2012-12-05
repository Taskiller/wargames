#!/usr/bin/env ruby

crypted = 'OMQEMDUEQMEK'
subst_letters = [*'a'..'z']
26.times do |i|
	puts subst_letters.first+'-->'+crypted.tr('A-Z',subst_letters.join)
	subst_letters.rotate!
end