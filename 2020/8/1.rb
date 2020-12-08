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
        ins=set[pos]
        return state if ins[:visited] > 0
        op=ins[:op]
        fn=ops[op.intern]
        args=ins[:args]
        fn[state,args]
        state[:pos]+=1
        ins[:visited]+=1
    }
    state[:value] = true
    state
}

p execute[set][:acc]
