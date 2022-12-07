fs={}
dir=nil
cd=->args,out{
    if dir == nil
        dir = args.first
    else
        if args.first == '..'
            dir = dir.split('/')[..-2].join '/'
        else
            dir = File.join(dir, args.first)
        end
    end
}

ls=->args,out{
    size=out.map{|s|s.split}.filter{|e|e[0] != 'dir'}.map{|e|e[0].to_i}.sum
    fs.keys.map{|k|
        fs[k][:total_size] += size if dir.include? k
    }
    fs[dir]={dir: dir, size: size, total_size: size}
}

$<.read.split('$').drop(1).map{|s|s.chomp.strip.split("\n")}.map{
    |l|i,*out=l
    cmd,*args=i.split
    case cmd
    when 'cd'
        cd[args,out]
    when 'ls'
        ls[args,out]
    end
}

#p fs
free=70000000-fs.values.map{|e|e[:total_size]}.sort.last
required=30000000-free
p free
p required
p fs.values.filter{|e|e[:total_size]>=required}.sort_by{|e|e[:total_size]}.first
