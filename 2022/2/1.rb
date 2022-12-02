h={:AX=>4,:AY=>8,:AZ=>3,:BX=>1,:BY=>5,:BZ=>9,:CX=>7,:CY=>2,:CZ=>6}
p $<.map{|e|e.split}.map{|e|h[(e[0]+e[1]).to_sym]}.sum
