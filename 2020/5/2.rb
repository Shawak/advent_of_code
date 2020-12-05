f=->s{
  row=s[0...-3].split('').zip( 6.downto(0).map{|x|2**x} ).map{|char,mul| ['B','R'].include?(char) ? mul : 0 }.sum
  seat=s[-3..].split('').zip( 2.downto(0).map{|x|2**x} ).map{|char,mul| ['B','R'].include?(char) ? mul : 0 }.sum
  { row: row, seat: seat, id: row*8+seat }
}

seats=$<.map{|line| f[line.chomp] }.sort_by{|e| e[:id]}
ids=seats.map{|e|e[:id]}
p ((ids.first..ids.last).to_a-ids).first
