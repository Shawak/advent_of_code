map=Hash.new(0)
h=[0,0]
t=[0,0]
$<.map{|l|
    d,c=l.split
    c=c.to_i

    c.times{
        case d
        when "R"
            h[0]=h[0]+1
        when "L"
            h[0]=h[0]-1
        when "U"
            h[1]=h[1]-1
        when "D"
            h[1]=h[1]+1
        end

        diff=[h[0]-t[0],h[1]-t[1]]
        
        r=[0,0]
        case diff
        when [2,0]
            r=[1,0]
        when [-2,0]
            r=[-1,0]
        when [0,2]
            r=[0,1]
        when [0,-2]
            r=[0,-1]
        when [1,-2]
            r=[1,-1]
        when [1,2]
            r=[1,1]
        when [-1,-2]
            r=[-1,-1]
        when [-1,2]
            r=[-1,1]     
        when [2,1]
            r=[1,1]
        when [2,-1]
            r=[1,-1]       
        when [-2,1]
            r=[-1,1]
        when [-2,-1]
            r=[-1,-1]
        end
        
        t=[t[0]+r[0],t[1]+r[1]]
        map[t]=map[t]+1
    }
}

p map.keys.size
