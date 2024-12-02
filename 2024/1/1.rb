a=$<.map{|x|x.split.map{|x|x.to_i}}.transpose.map{|x|x.sort}
a = a[0].zip(a[1]).map{|a,b|(b-a).abs}
p a.sum
