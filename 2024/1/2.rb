a=$<.map{|x|x.split.map{|x|x.to_i}}.transpose.map{|x|x.sort}
a=a[0].map{|x| x*a[1].count(x) }
p a.sum
