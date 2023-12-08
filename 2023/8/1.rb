dirs=gets.chomp.chars
gets

maps = $<.map{|l|
    x=l.split " = "
    v=x[1].split ", "
    [x[0], {L: v[0].strip[1..], R: v[1].strip[0...-1]}]
}.to_h

loc = "AAA"
steps = 0

while loc != "ZZZ" do
    dir = dirs[steps % dirs.size]
    loc = maps[loc][dir.to_sym]
    steps += 1
end

p steps
