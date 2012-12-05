#!/usr/bin/env ruby

KEY_LENGTH = 9

files = []
KEY_LENGTH.times{|i| files << "c#{i}" }

data=''
files.each do |file|
	open(file) do |f|
		data = f.read.gsub(/ /,'')
	end
	puts '********* SINGLE CHARACTER FREQUENCY ***********'
	s=data.scan(/./).sort.chunk{|ch| ch}.map{|c,arr| [c,arr.size]}.sort_by{|c,f| f}.reverse
	puts "File #{file}: Sorted >>> "+s.map{|a|a.first}.join
end
