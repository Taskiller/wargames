#!/usr/bin/env ruby

system('rm c[0-9]*')

KEY_LENGTH = 9

files = ['found1','found2','found3']

out = []
KEY_LENGTH.times do |i|
	out[i] = open("c#{i}",'a')
end

data = ''
files.each do |file|
	data = open(file).read.gsub(' ','')
	data.unpack('C*').each_with_index do |val,i|
		out[ i % KEY_LENGTH ].write val.chr
	end
end

out.each do |f|
	f.close
end