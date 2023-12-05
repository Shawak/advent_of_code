$/ = "END"  
input=$<.gets

seeds=input.scan(/seeds:\s(.*?)\n/).first.first.split.map &:to_i
maps=(input + "\n").scan(/^(?<name>[\w-]*?) map:\n(?<values>(.|\n)*?)\n\n/m).map{|x|
    [x[0], x[1].split("\n").map{|x|x.split(" ").map(&:to_i)}.map{|v| {to: v[0], from: v[1], range: v[2]}}]
}.map{|x|[x[0], x[1]]}.to_h
map_keys=maps.keys.reverse.to_a

transform=->val,arr{
    arr.size.times{|i|
        a = arr[i]
        return val - a[:to] + a[:from] if val >= a[:to] && val < a[:to] + a[:range]
    }
    val
}

seeds = seeds.each_slice(2).to_a.map{|x| {from: x[0], to: x[0]+x[1]} }

i=0
loop do
    x = i
    map_keys.map{|map|
        x = transform[x, maps[map]]
    }
    res = seeds.find{|seed| x.between?(seed[:from], seed[:to])}
    if res then
        p i
        break
    end
    i+=1
end
