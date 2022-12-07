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
    fs[dir]={size: size, total_size: size}
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
p fs.values.filter{|e|e[:total_size]<=100000}.map{|e|e[:total_size]}.sum
