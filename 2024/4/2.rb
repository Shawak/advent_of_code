a = $<.map{|x|x.chomp.chars}
needle = "MAS"
find=->y,x,inc{
  i = 0
  (0...needle.size).map{|i|
    incr = inc.map{|e|e*i}
    yy = y + incr[0]
    xx = x + incr[1]
    
    return false if yy >= a.size or yy < 0
    return false if xx >= a[yy].size or xx < 0
    return false if a[yy][xx] != needle[i]
  }

  return true  
}

p (0...a.size).map{|y|
 (0...a[0].size).map{|x|
  ret = (a[y][x] == 'A' and
   [
    find[y-1,x-1,[1,1]],
    find[y+1,x+1,[-1,-1]],
    find[y-1,x+1,[1,-1]],
    find[y+1,x-1,[-1,1]]
  ].count(true) == 2)
  #p "found at #{y},#{x}" if ret
  ret
 } 
}.flatten.count(true)
