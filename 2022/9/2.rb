map=Hash.new(0)
t=10.times.map{[0,0]}
$<.map{|l|
    d,c=l.split
    c.to_i.times{
        case d
        when "R"
            t[0][0]=t[0][0]+1
        when "L"
            t[0][0]=t[0][0]-1
        when "U"
            t[0][1]=t[0][1]-1
        when "D"
            t[0][1]=t[0][1]+1
        end

        (1..9).map{|i|
            diff=[t[i-1][0]-t[i][0],t[i-1][1]-t[i][1]]
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
            when [2,2]
                r=[1,1]
            when [2,-2]
                r=[1,-1]       
            when [-2,2]
                r=[-1,1]
            when [-2,-2]
                r=[-1,-1]
            end
            t[i]=[t[i][0]+r[0],t[i][1]+r[1]]
            map[t[i]]=map[t[i]]+1 if i==9
        }
    }
}

p map.keys.size
