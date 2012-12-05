#!/usr/bin/env ruby

files = ['found1','found2']

out = []
6.times do |i|
	out[i] = open("c#{i}",'a')
end

data = ''
files.each do |file|
	data = open(file).read.gsub(' ','')
	data.unpack('C*').each_with_index do |val,i|
		out[ i % 6 ].write val.chr
	end
end

out.each do |f|
	f.close
end