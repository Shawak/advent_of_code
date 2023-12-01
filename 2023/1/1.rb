p $<.map{|x|
    a = x.chomp.chars.filter{|c|c =~ /[0-9]/}
    (a[0]+a[-1]).to_i
}.sum
