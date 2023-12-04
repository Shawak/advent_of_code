r=$<.map{|x|x.split(/:/).map{|s|s.split("|")}.flatten.map(&:strip)}
a=r.map{|e|e[1].split(" ").map{|s|s.strip.to_i} & e[2].split(" ").map{|s|s.strip.to_i}}
h={}
a.size.times{|i|h[i]=1}
a.size.times{|i|
    h[i].times{
        (i+1).upto([i+a[i].size,a.size-1].min).map{|x|
            h[x]+=1
        }
    }
}
p h.values.sum
