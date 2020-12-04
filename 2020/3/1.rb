world=$<.map{|e|e.chomp.split('')}
h,w=world.size,world[0].size
tile=->y,x{world[y%h][x%w]}
p (0...h).zip((0..).step(3)).map{|y,x|{pos: [y,x], tile: tile[y,x]}}.count{|e|e[:tile]=='#'}