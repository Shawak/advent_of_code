p $<.map{|e|
    a=e.split
    b=a[0].split '-'
    {
        raw: e,
        min: b[0].to_i,
        max: b[1].to_i,
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
