s=gets
p (13..s.size).map{|i|s[i-13..i].split('').uniq.size==14 ? i : nil}.compact.first+1
