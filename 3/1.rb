class Field
    def initialize()
      @h={}
    end
    def g(x,y,d:0)
      @h[x.to_s]={} if  @h[x.to_s] == nil
      @h[x.to_s][y.to_s] or d
    end
    def s(x,y,v)
      @h[x.to_s]={} if  @h[x.to_s] == nil
      @h[x.to_s][y.to_s]=v
    end
end

parse=->s{ s.split(',').map{|s| [s[0], s[1..-1].to_i]} }

t=Field.new
a=parse[gets]
b=parse[gets]

r=[]

x=y=0
a.map{|d|
    dir=d[0]
    count=d[1]
    case dir
    when "U"
        count.times{t.s(x,y+=1,1)}
    when "R"
        count.times{t.s(x+=1,y,1)}
    when "D"
        count.times{t.s(x,y-=1,1)}
    when "L"
        count.times{t.s(x-=1,y,1)}
    end
}

x=y=0
b.map{|d|
    dir=d[0]
    count=d[1]
    case dir
    when "U"
        count.times{t.s(x,y+=1, t.g(x,y) == 1 ? r.push([x,y]) : 2)}
    when "R"
        count.times{t.s(x+=1,y, t.g(x,y) == 1 ? r.push([x,y]) : 2)}
    when "D"
        count.times{t.s(x,y-=1, t.g(x,y) == 1 ? r.push([x,y]) : 2)}
    when "L"
        count.times{t.s(x-=1,y, t.g(x,y) == 1 ? r.push([x,y]) : 2)}
    end
}

p t
p r

p r.map{|x| x[0].abs + x[1].abs}.sort[0] || "no cross"