d=["one","two","three","four","five","six","seven","eight","nine"]
p $<.map{|x|
    x=x.chomp
    d.size.times{|i|
        id=x.index(d[i])
        x[id+2] = (i+1).to_s if id != nil
    }
    a = x.chomp.chars.filter{|c|c =~ /[0-9]/}
    (a[0]+a[-1]).to_i
}.sum
