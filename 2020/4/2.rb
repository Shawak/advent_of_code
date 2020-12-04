pp=$<.read.chomp.split("\n\n")
  .map{|e|
    e.split(/[\s,\n]/)
    .map{|x|
      t=x.split(':')
      {t[0].intern => t[1]}
    }
    .inject(&:merge)
  }

valid=->pp{
    return false if !pp.key?(:byr) || pp[:byr].to_i < 1920 || pp[:byr].to_i > 2002
    return false if !pp.key?(:iyr) || pp[:iyr].to_i < 2010 || pp[:iyr].to_i > 2020
    return false if !pp.key?(:eyr) || pp[:eyr].to_i < 2020 || pp[:eyr].to_i > 2030 || pp[:eyr].size != 4
    return false if !pp.key?(:hgt)
    hgt,hgt_type = pp[:hgt][0...-2].to_i,pp[:hgt][-2..]
    return false if !hgt_type.match(/[cm|in]/) || (hgt_type == 'cm' && (hgt < 150 || hgt > 193)) || (hgt_type == 'in' && (hgt < 59 || hgt > 76))
    return false if !pp.key?(:hcl) || !pp[:hcl].match(/#[0-9a-f]{6}/)
    return false if !pp.key?(:ecl) || !['amb', 'blu', 'brn', 'gry', 'grn', 'hzl', 'oth'].include?(pp[:ecl])
    return false if !pp.key?(:pid) || !pp[:pid].match(/0*[1-9]*/) || pp[:pid].size != 9
    true
}

puts pp.count{|e|valid[e]}
