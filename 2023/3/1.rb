class String
  def is_integer?
    self.to_i.to_s == self
  end
end

o="*+-$#=@&/%".split("")

is_special=->c{ o.include? c }

is_part=->m,oy,ox{
    ([0,oy - 1].max).upto([m.size-1, oy + 1].min).map{|y|
        ([0,ox - 1].max).upto([m[0].size-1, ox + 1].min).map{|x|
            #p "%d %d is %s" % [y,x,is_special[m[y][x]]]
            is_special[m[y][x]]
        }
    }.flatten.include? true
}

m=$<.map{|l|l.chomp.split('')}
#p m
y=0
r=[]
while y < m.size do
    x=0
    while x < m[0].size do
        if m[y][x].is_integer? then
            i=[]
            part=false
            while x < m[0].size && m[y][x].is_integer? do
                part = is_part[m,y,x] if not part
                i.push m[y][x]
                x=x+1
            end
            #p "%d %s" % [i.join(""),part]
            r.push({number: i.join("").to_i, part: part })
        end
        x=x+1
    end
    y=y+1
end

#p r
p r.filter{|x|x[:part]}.map{|x|x[:number]}.sum
