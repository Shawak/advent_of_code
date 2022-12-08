class Array
    def take_until(&block)
        arr = []
        for i in (0...self.size) do
            v = at(i)
            r = yield v
            arr << v
            break if r
        end
        arr
    end
end

a=$<.map{|s|s.chomp.chars.map &:to_i}
r=(1...a.size-1).map{|y|
    (1...(a[0].size-1)).map{|x|
        view=[
            (x...a.size).drop(1).map{|n|a[y][n]}.take_until{|v|v>=a[y][x]}, #right
            x.downto(0).drop(1).map{|n|a[y][n]}.take_until{|v|v>=a[y][x]},  #left
            (y...a.size).drop(1).map{|n|a[n][x]}.take_until{|v|v>=a[y][x]}, #bottom?
            y.downto(0).drop(1).map{|n|a[n][x]}.take_until{|v|v>=a[y][x]}   #top?
        ]
        score=view.map{|a|a.size}.inject :*
        #p [x: x, y: y, val: a[y][x], view: view, score: score]
        [x: x, y: y, val: a[y][x], view: view, score: score]
    }
}
p r.flatten.sort_by{|e|e[:score]}.last[:score]
