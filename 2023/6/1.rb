a=gets.scan(/(\d+)+/).zip(gets.scan(/(\d+)+/)).map{|x|{time: x[0].first.to_i, distance: x[1].first.to_i}}

p a.map{|x|
    0.upto(x[:time]).map{|i|
        spinup = x[:time] - i
        (x[:time] - spinup) * spinup
    }.filter{|d|
        d > x[:distance]
    }.size
}.inject :*
