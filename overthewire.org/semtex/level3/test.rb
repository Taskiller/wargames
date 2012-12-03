#!/usr/bin/env ruby

NUMBER_EFFECT = {
	1 => [ +5,   +2,   +1,   +7,   +5 ],
	2 => [+13,   -7,   -4,   +1,   +5 ],
	3 => [ +9,  +12,   +9,  +70,   -4 ],
	4 => [-11,   +9,   +0,   +5,  -13 ],
	5 => [ +4,  +17,  +12,   +9,  +24 ],
	6 => [+11,  -17,  +21,   +5,  +14 ],
	7 => [+15,  +31,  +22,  -12,   +3 ],
	8 => [+19,  -12,   +4,   +3,   -7 ]
}

def press(r,lock)
	add = NUMBER_EFFECT[r]
	lock[0] += add[0]
	lock[1] += add[1]
	lock[2] += add[2]
	lock[3] += add[3]
	lock[4] += add[4]
end

def unpress(r,lock)
	add = NUMBER_EFFECT[r]
	lock[0] -= add[0]
	lock[1] -= add[1]
	lock[2] -= add[2]
	lock[3] -= add[3]
	lock[4] -= add[4]
end 

def recursive(prefix,current_lock)
	puts "Prefix>#{prefix.join}"
	#for r in NUMBER_EFFECT.keys
	[*1..8].sample(8).each do |r| 
		press(r,current_lock)
		#p current_lock

		if (current_lock[0]==400 and
			current_lock[1]==400 and
			current_lock[2]==400 and
			current_lock[3]==400 and
			current_lock[4]==400)
				puts "CORRECT!!!!"
				p prefix + [r]
				p current_lock
				exit
		end

		#check if out of range, stop
		if current_lock.inject(false){|c,i| c or not i.between?(200,500)}==true
			#puts "Out of range"
			unpress(r,current_lock)
			next
		end

		if prefix.size<15
			recursive(prefix + [r], current_lock)
		end 

		unpress(r,current_lock)
	end 
end

puts "BEGIN"
prefix = []
current_lock = [300]*5
recursive(prefix,current_lock)