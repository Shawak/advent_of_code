p (273025...767253).select{|n|
	a=n.digits.reverse
	a.sort==a && a.combination(2).any?{ |a,b| a==b } && a
}.size