p $<.read.gsub("\n",'').gsub(/don't\(\).*?(?:$|do\(\))/m,'').scan(/mul\((\d*,\d*)\)/).flatten.map{|x|x.split(",").map(&:to_i).inject(:*)}.sum
