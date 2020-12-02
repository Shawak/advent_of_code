p $<.map{|e|
    a=e.split
    b=a[0].split('-').map &:to_i
    {
        raw: e,
        min: b[0],
        max: b[1],
        char: a[1][0],
        pass: a[2]
    }
}
.map{|e|
    count = e[:pass].count(e[:char])
    e[:valid] = count.between?(e[:min], e[:max])
    e
}
.count{|e|
    e[:valid]
}
