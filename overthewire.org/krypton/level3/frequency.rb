#!/usr/bin/env ruby

table = {}

files = ['found1','found2','found3']

data=''
files.each do |file|
	open(file) do |f|
		data = f.read.gsub(/ /,'')
	end
end

puts '********* SINGLE CHARACTER FREQUENCY ***********'
s=data.scan(/./).sort.chunk{|ch| ch}.map{|c,arr| [c,arr.size]}.sort_by{|c,f| f}.reverse.each do |c,f|
	puts "#{c} --> #{f}"
end
puts "Sorted > "+s.map{|a|a.first}.join

puts '********* BIGRAM FREQUENCY ***********'
data.scan(/../).sort.chunk{|ch| ch}.map{|c,arr| [c,arr.size]}.sort_by{|c,f| f}.reverse.each do |c,f|
	puts "#{c} --> #{f}"
end

puts '********* TRIGRAM FREQUENCY ***********'
data.scan(/.../).sort.chunk{|ch| ch}.map{|c,arr| [c,arr.size]}.sort_by{|c,f| f}.reverse.each do |c,f|
	puts "#{c} --> #{f}"
end