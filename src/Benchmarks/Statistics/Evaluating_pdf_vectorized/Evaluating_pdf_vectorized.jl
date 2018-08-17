using Distributions

linspace(a,b,l) = range(a,stop=b,length=l)

function main()
    s = 0.0
    x = 0:1000
    for a in linspace(1,2,100)
        s += sum( map(x->pdf(Gamma(a),x),x) )
    end
    return s
end

@assert abs(main()-79.19414904703733) < 1e-12
