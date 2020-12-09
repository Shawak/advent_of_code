a=$<.map &:to_i
preamble=25
puts a.zip(0..).drop(preamble).map{|e|
    index,number=e[1],e[0]
    t=a[index-preamble..index].combination(2).map{|x|x.sum}.sort
    { number: number, valid: t.include?(number) }
}.filter{|e| !e[:valid]}.first[:number]
