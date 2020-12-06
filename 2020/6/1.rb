a=$<.read.chomp.split("\n\n").map{|e| e.split("\n").map{|e|e.split('') } }
p a.map{|e| e.flatten.uniq.size }.sum
