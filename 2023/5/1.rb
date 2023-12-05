$/ = "END"  
input=$<.gets

seeds=input.scan(/seeds:\s(.*?)\n/).first.first.split.map &:to_i
maps=(input + "\n").scan(/^(?<name>[\w-]*?) map:\n(?<values>(.|\n)*?)\n\n/m).map{|x|
    [x[0], x[1].split("\n").map{|x|x.split(" ").map(&:to_i)}.map{|v| {to: v[0], from: v[1], range: v[2]}}]
}.map{|x|[x[0], x[1]]}.to_h

transform=->val,arr{
    arr.size.times{|i|
        a = arr[i]
        return val - a[:from] + a[:to] if val >= a[:from] && val < a[:from] + a[:range]
    }
    val
}

p seeds.map{|seed| 
    maps.keys.map{|map|
        seed = transform[seed, maps[map]]
    }
    seed
}.min
