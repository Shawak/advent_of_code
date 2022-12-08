a=$<.map{|s|s.chomp.chars.map &:to_i}
r=(1...a.size-1).map{|y|
    (1...(a[0].size-1)).map{|x|
        visible=[
            (x...a.size).drop(1).map{|n|a[y][n]}.all?{|v|v<a[y][x]},
            x.downto(0).drop(1).map{|n|a[y][n]}.all?{|v|v<a[y][x]},
            (y...a.size).drop(1).map{|n|a[n][x]}.all?{|v|v<a[y][x]},
            y.downto(0).drop(1).map{|n|a[n][x]}.all?{|v|v<a[y][x]}
        ].any? true
        visible ? 1 : 0
    }
}
p r.flatten.sum+(a.size*4-4)
