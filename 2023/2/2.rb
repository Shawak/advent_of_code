x={"red"=>12,"green"=>13,"blue"=>14}
g=$<.map{|l|
    d=l.chomp.split(/:/)
    id=d[0].split(/ /)[-1].to_i
    rgb={"red"=>0,"green"=>0,"blue"=>0}
    d[-1].split(/;/).map{|s|
        a=s.split(/,/).map(&:strip).map{|s|s.split(/ /)}
        a.map{|e|
            rgb[e[1]] = e[0].to_i if rgb[e[1]] < e[0].to_i
        }
    }
    [id,rgb.values.inject(:*)]
}
p g.map{|x|x[1]}.sum
