m = $<.read.split()

r = {}

printMap=->{
  (0...m.size).map{|y|
    p m[y]
  }
}

countPositions=->{
  (0...m.size).map{|y|
    (0...m.size).map{|x|
      m[y][x]
    }
  }.flatten.count("X")
}

getGuardPos=->{
  (0...m.size).map{|y|
    (0...m.size).map{|x|
      c = m[y][x]
      next if c == '.' or c == '#' or c == 'X'
      dir = nil
      return [y, x, dir]
    }
  }
}

getDir=->c{
  if c == '^' then
    return [-1, 0]
  elsif c == 'v' then
    return [1, 0]
  elsif c == '<' then 
    return [0, -1]
  elsif c == '>' then 
    return [0, 1]
  end
  p "error #{c}"
}

rotate=->c{
  if c == '^' then
    return ">"
  elsif c == 'v' then
    return "<"
  elsif c == '<' then 
    return "^"
  elsif c == '>' then 
    return "v"
  end
  p "error #{c}"
}

loop do
  guardPos = getGuardPos[]
  nextPos = nil
  loop do
    dir = getDir[m[guardPos[0]][guardPos[1]]]
    nextPos = [guardPos[0] + dir[0], guardPos[1] + dir[1]]
    p nextPos
    break if nextPos[0] < 0 or nextPos[0] == m.size or nextPos[1] < 0 or nextPos[1] == m.size
    break if m[nextPos[0]][nextPos[1]] != '#'
    m[guardPos[0]][guardPos[1]] = rotate[m[guardPos[0]][guardPos[1]]]
  end
  break if nextPos[0] < 0 or nextPos[0] == m.size or nextPos[1] < 0 or nextPos[1] == m.size
  #p "move"
  m[nextPos[0]][nextPos[1]] = m[guardPos[0]][guardPos[1]]
  m[guardPos[0]][guardPos[1]] = "X"
  #printMap[]
end

#p m
p countPositions[] + 1
