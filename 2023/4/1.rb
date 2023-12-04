r=$<.map{|x|x.split(/:/).map{|s|s.split("|")}.flatten.map(&:strip)}
p r.map{|e|
w=e[1].split(" ").map{|s|s.strip.to_i} & e[2].split(" ").map{|s|s.strip.to_i}
w.size > 0 ? 2**(w.size-1) : 0
}.sum
