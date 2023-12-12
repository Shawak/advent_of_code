map=$<.map{|l|l.chomp.chars}.transpose
#p map

h={
    "S"=> ->from,pos{
        [ [1,0], [-1,0], [0,-1], [0,1] ].map{|x|
            loc = pos.zip(x).map(&:sum)
            chr = map[loc[0]][loc[1]]
            {chr: chr, loc: loc, from: x, to: h[chr][x,pos]}
        }
        .select{|x|
            x[:loc].zip(x[:to]).map(&:sum) == pos
        }.first[:from]
    },
    "|"=> ->from,pos{ [0,from[1]*-1] },
    "L"=> ->from,pos{ from[0] == 1 ? [0,-1] : [1,0] },
    "-"=> ->from,pos{ [from[0]*-1,0] },
    "J"=> ->from,pos{ from[0] == -1 ? [0,-1] : [-1,0] },
    "7"=> ->from,pos{ from[0] == -1 ? [0,1] : [-1,0] },
    "F"=> ->from,pos{ from[0] == 1 ? [0,1] : [1,0] },
    "."=> ->from,pos{ [0,0] }
}

steps = 0

loc = [*(0...map.size)].product([*0...map.size]).filter{|x,y|map[x][y]=="S"}.first
from = loc
chr = "S"

loop do
    #p chr
    diff = from.zip(loc).map{|a,b|a-b}
    #p "diff: %s" % [diff]
    to = h[chr][diff,loc]
    #p "to: %s" % [to]
    from = loc
    loc = loc.zip(to).map(&:sum)
    #p loc
    chr = map[loc[0]][loc[1]]
    steps += 1
    break if chr == "S"
end

p steps / 2
