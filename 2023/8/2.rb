dirs=gets.chomp.chars
gets

maps = $<.map{|l|
    x=l.split " = "
    v=x[1].split ", "
    [x[0], {L: v[0].strip[1..], R: v[1].strip[0...-1]}]
}.to_h

locs = maps.keys.filter{|x|x[-1]=="A"}

steps = 0

ends = {}
cycles = {}

while cycles.keys.size != locs.size do
    dir = dirs[steps % dirs.size]
    locs = locs.map{|loc|
        loc = maps[loc][dir.to_sym]
        if loc[-1] == "Z" then
            if !ends.key?(loc) then
                ends[loc] = steps
            elsif !cycles.key?(loc) then
                cycles[loc] = steps - ends[loc]
            end
        end
        loc
    }
    steps += 1
end

p cycles.values.reduce(1, :lcm)
