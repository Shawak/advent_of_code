a = $<.map{|x|x.chomp.chars}
needle = "XMAS"
find=->y,x,inc{
  i = 0
  (0...needle.size).map{|i|
    incr = inc.map{|e|e*i}
    yy = y + incr[0]
    xx = x + incr[1]
    
    return false if yy >= a.size or yy < 0
    return false if xx >= a[yy].size or xx < 0
    
    #p "#{i} actual: #{a[yy][xx]} search #{needle[i]}"
    return false if a[yy][xx] != needle[i]
  }
  
  #p "found at #{y} #{x} with inc #{inc[0]},#{inc[1]}"
  return true  
}

p (0..a.size).map{|y|
 (0..a[0].size).map{|x|
   [find[y,x,[0,1]],
    find[y,x,[1,0]],
    find[y,x,[1,1]],
    find[y,x,[-1,0]],
    find[y,x,[0,-1]],
    find[y,x,[-1,-1]],
    find[y,x,[1,-1]],
    find[y,x,[-1,1]]
    ].count(true)
 } 
}.flatten.sum
