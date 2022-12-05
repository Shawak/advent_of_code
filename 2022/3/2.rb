p $<.each_slice(3).map{|e|(e.inject([*'a'..'z',*'A'..'Z']){|a,n|a&n.split('')}.first.ord-38)%58}.sum
