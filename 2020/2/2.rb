p $<.map{|e|
    a=e.split
    b=a[0].split('-').map &:to_i
    {
        pos1: b[0]-1,
        pos2: b[1]-1,
        char: a[1][0],
        pass: a[2]
    }
}
.count{|e|
    a,b,c=e[:pass][e[:pos1]],e[:pass][e[:pos2]],e[:char]
    [a,b].count(c)==1
}
