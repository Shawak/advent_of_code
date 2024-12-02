p $<.map{|x|x.split}.map{|x|x.map(&:to_i)}.map{|array|
  return true if array.size <= 1

  is_increasing = array.each_cons(2).all? { |a, b| b > a && (b-a).abs <= 3 and (b-a).abs >= 1 }
  is_decreasing = array.each_cons(2).all? { |a, b| b < a && (b-a).abs <= 3 and (b-a).abs >= 1 }

  is_increasing || is_decreasing
}.count(true)
