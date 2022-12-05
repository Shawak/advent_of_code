p $<.map{|e|a,b=e.chars.each_slice(e.size/2).map(&:to_a);x=(a&b).first.ord;x-=38;x-=58 if x>58;x}.sum
