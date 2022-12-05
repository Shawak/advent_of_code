p $<.map{|l|(a,b),(c,d)=l.chomp.split(',').map{|s|s.split("-").map(&:to_i)};e=*(a..b);f=*(c..d);[e,f].sort_by(&:size).reduce(&:-).size}.count(0)
