seeds=input.scan(/seeds:\s(.*?)\n/).first.first.split.map &:to_i
maps=(input + "\n").scan(/^(?<name>[\w-]*?) map:\n(?<values>(.|\n)*?)\n\n/m).map{|x|
    [x[0], x[1].split("\n").map{|x|x.split(" ").map(&:to_i)}.map{|v| {to: v[0], from: v[1], range: v[2]}}]
}.map{|x|[x[0], x[1]]}.to_h

transform=->val,arr{
    arr.size.times{|i|
        a = arr[i]
        return val - a[:to] + a[:from] if val >= a[:to] && val < a[:to] + a[:range]
    }
    val
}

seeds = seeds.each_slice(2).to_a.map{|x| {from: x[0], to: x[0]+x[1]} }

max = maps["humidity-to-location"]
    .map{|loc|loc[:to]+loc[:range]}
    .max

loc_to_seeds = [*0..max]
    .map{|x|
        orig=x
        maps.keys.reverse.map{|map|
            x = transform[x, maps[map]]
        }
        {loc: orig, seed: x}
    }
    .sort_by{|x|x[:loc]}

p loc_to_seeds.find{|x| seeds.find{|seed| x[:seed].between?(seed[:from], seed[:to])} }[:loc]
