p $<.map(&:to_i).combination(3).map{|a,b,c|[a,b,c,a+b+c]}.select{|a|a[3]==2020}.map{|a,b,c|a*b*c}