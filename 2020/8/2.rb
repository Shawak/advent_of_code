set=$<.map{|e|
    args=e.split
    { op: args.shift, args: args, visited: 0 }
}

ops={}
ops[:nop]=->state,args{ }
ops[:acc]=->state,args{ state[:acc] += args[0].to_i }
ops[:jmp]=->state,args{ state[:pos] += args[0].to_i - 1 }

execute=->set{
    state={ pos: 0, acc: 0, valid: false }
    loop{
        pos=state[:pos]
        break if pos >= set.size
        ins=set[pos]
        return state if ins[:visited] > 0
        op=ins[:op]
        fn=ops[op.intern]
        args=ins[:args]
        fn[state,args]
        state[:pos]+=1
        ins[:visited]+=1
    }
    state[:valid] = true
    state
}

os=["nop", "jmp"]
programs = os.map{|o| (0...set.size).filter{|i| os.include?(set[i][:op]) }.map{|i| t=set.map(&:clone); t[i][:op]=o; t } }.flatten(1)
p programs.map{|p| execute[p]}.filter{|e| e[:valid]}.first[:acc]
