rules = $<.map{|e|
  md=e.match(/(.*?)s? contain (.*)\./i)[1..]
  bag=md[0]
  contains=md[1]
    .split(',')
    .map{|e|
      if e != "no other bags" then
        t=e.strip.match(/(\d+)\s(.*?)s?$/)[1..]
        { bag: t[1], count: t[0].to_i }
      end
    }
    .compact
  [ bag, { bag: bag, childs: contains } ]
}.to_h

f=->name{
  childs=rules[name][:childs]
  1 + childs.map{|e| f[e[:bag]] * e[:count] }.sum
}

puts f["shiny gold bag"] - 1
