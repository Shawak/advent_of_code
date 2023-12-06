a=[{time: gets.scan(/(\d+)+/).join.to_i, distance: gets.scan(/(\d+)+/).join.to_i}]

p a.map{|x|
    0.upto(x[:time]).map{|i|
        spinup = x[:time] - i
        (x[:time] - spinup) * spinup
    }.filter{|d|
        d > x[:distance]
    }.size
}.inject :*
