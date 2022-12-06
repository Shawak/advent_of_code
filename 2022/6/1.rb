s=gets
p (3..s.size).map{|i|s[i-3..i].split('').uniq.size==4 ? i : nil}.compact.first+1
