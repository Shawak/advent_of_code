stacks=9.times.map{|i|[]}
8.times.map{|li|
    l=gets.chars.each_slice(4).map{|a|a[1]}
    9.times.map{|i|stacks[i].unshift(l[i]) if l[i] !=" "}
}

gets
gets

$<.map{|l|
    c,f,t=l.scan(/\d+/).map &:to_i
    f-=1
    t-=1
    c.times.map{|i|
        stacks[t].push(stacks[f].pop()) if stacks[f].size!=0}
}

puts stacks.map{|a|a.last}.join
