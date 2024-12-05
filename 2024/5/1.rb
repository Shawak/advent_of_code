5input = $<.read.split "\n\n"
checks = input[0].lines.map{|e|e.split("|").map{|e|e.chomp.to_i}}
h = checks.group_by{|e|e[0]}.map{|x| [x[0], x[1].map{|b|b[1]}]}.to_h

updates = input[1].lines.map{|e|e.split(",").map{|x|x.chomp.to_i}}
valid = updates.map{|e|
  (1..e.size).map{|i|
    current = e[i]
    before = e[0...i]
    forbidden = h[current] || []
    intersect = before.intersection(forbidden)
    forbidden == nil || intersect.size == 0
  }.all?(true) ? e[e.size / 2] : 0; 
  
}

p valid.sum
