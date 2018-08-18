include(joinpath(@__DIR__,"../../../timeit.jl"))
using Distributions

linspace(a,b,l) = range(a,stop=b,length=l)

function main()
    s = 0.0
    for a in linspace(1,2,100)
        for x in 0:100
            s += pdf(Gamma(a),x)
        end
    end
    return s
end

@assert abs(main()-79.19414904703733) < 1e-12
timeit("Evaluate pdf",main)

function main()
    s = 0.0
    x = 0:5000
    for a in linspace(1,2,100)
        s += sum( map(x->pdf(Gamma(a),x),x) )
    end
    return s
end

timeit("Evaluate pdf (vectorized)",main)

function main()
    s1 = rand(Normal(0,1),1000)
    s2 = rand(Binomial(100,0.1),1000)
    s3 = rand(Gamma(1),1000)
    s1[end]+s2[end]+s3[end]#make sure those are not optimized away
end

timeit("Generate random numbers",main)
