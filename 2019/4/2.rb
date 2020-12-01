p (273025...767253).select{|n|
	t=n.digits.reverse
	t.sort==t && t.combination(2).any?{ |a,b| a==b && (t.dup - [a]).size == t.size-2 }
}.size