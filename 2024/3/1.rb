p $<.read.scan(/mul\((\d*,\d*)\)/).flatten.map{|x|x.split(",").map(&:to_i).inject(:*)}.sum
