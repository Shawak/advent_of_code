x={"red"=>12,"green"=>13,"blue"=>14}
g=$<.map{|l|
    d=l.chomp.split(/:/)
    id=d[0].split(/ /)[-1].to_i
    r=d[-1].split(/;/).map{|s|
        a=s.split(/,/).map(&:strip).map{|s|s.split(/ /)}
        a.map{|e|
            e[0].to_i <= x[e[1]]
        }.all? true
    }
    [id,r.all?(true)]
}
p g.filter{|x|x[1]}.map{|x|x[0]}.sum
