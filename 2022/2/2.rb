h={:AX=>3,:AY=>4,:AZ=>8,:BX=>1,:BY=>5,:BZ=>9,:CX=>2,:CY=>6,:CZ=>7}
p $<.map{|e|e.split}.map{|e|h[(e[0]+e[1]).to_sym]}.sum
