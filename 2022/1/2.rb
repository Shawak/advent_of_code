p $<.read.split("\n\n").map{|e|e.split("\n").map{|e|e.to_i}.sum}.sort[-3..].sum
