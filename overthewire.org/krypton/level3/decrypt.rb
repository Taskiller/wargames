#!/usr/bin/env ruby

#crypted = 'KSVVW BGSJD SVSIS VXBMN YQUUK BNWCU ANMJS'.gsub(' ','')
crypted = open('found3').read.gsub(' ','').gsub(/(.{60})/,"\\1\n")

#puts crypted.tr('JDSQCTUNFAVGEWZBMYKXILORPH','theaimsrkblngdcoupwfvyxjzq')

puts 'sirintra puengtham'.tr('theaimsrkblngdcoupwfvyxjzq','JDSQCTUNFAVGEWZBMYKXILORPH')

#puts 'Character Left>>'
#p [*'A'..'Z'] - 'JDSQCTUNFAVGEWZBMYKXILORP'.scan(/./)
