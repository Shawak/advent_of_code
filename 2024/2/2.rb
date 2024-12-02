a=$<.map{|x|x.split}.map{|x|x.map(&:to_i)}
a = a.map{|array| array.map.with_index { |_, index| array[0...index] + array[index+1..-1] }}
a = a.map{|x|x.map{|array|
  return true if array.size <= 1

  is_increasing = array.each_cons(2).all? { |a, b| b > a && (b-a).abs <= 3 and (b-a).abs >= 1 }
  is_decreasing = array.each_cons(2).all? { |a, b| b < a && (b-a).abs <= 3 and (b-a).abs >= 1 }

  is_increasing || is_decreasing
}}
a = a.map{|x|x.include?(true)}
p a.count(true)
