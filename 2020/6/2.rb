a=$<.read.chomp.split("\n\n").map{|e| e.split("\n").map{|e|e.split('') } }
p a.map{|e| e.reduce{|a,b| a & b } }.flatten.size
