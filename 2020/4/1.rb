pp=$<.read.chomp.split("\n\n")
  .map{|e|
    e.split(/[\s\n]/)
    .map{|x|
      t=x.split(':')
      {t[0].intern => t[1]}
    }
    .inject(&:merge)
  }

valid=->pp{
    return false if !pp.key?(:byr)
    return false if !pp.key?(:iyr)
    return false if !pp.key?(:eyr)
    return false if !pp.key?(:hgt)
    return false if !pp.key?(:hcl)
    return false if !pp.key?(:ecl)
    return false if !pp.key?(:pid)
    true
}

p pp.count{|e|valid[e]}
