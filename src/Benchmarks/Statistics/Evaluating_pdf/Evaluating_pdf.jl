include(joinpath(@__DIR__,"../../../timeit.jl"))
using Distributions

linspace(a,b,l) = range(a,stop=b,length=l)

function main()
    s = 0.0
    for x in 0:200
        s += pdf(Normal(0,1),x)
        s += pdf(Binomial(100,0.1),x)
        s += pdf(Gamma(1,1),x)
        s += pdf(Beta(1,2),x/200)
        s += pdf(Multinomial(200,ones(3)/3),[x,200-x,0])
    end
    return s
end

@assert abs(main()-204.28144784974535) < 1e-12
timeit("Evaluate pdf",main)

function main()
    s = 0.0
    x = 0:200

    f = x->pdf(Normal(0,1),x)
    s += sum(f.(x))

    f = x->pdf(Binomial(100,0.1),x)
    s += sum(f.(x))

    f = x->pdf(Gamma(1,1),x)
    s += sum(f.(x))

    f = x->pdf(Beta(1,2),x/200)
    s += sum(f.(x))

    f = x->pdf(Multinomial(200,ones(3)/3),[x,200-x,0])
    s += sum(f.(x))

    return s
end

@assert abs(main()-204.28144784974535) < 1e-12
timeit("Evaluate pdf (vectorized)",main)

function main()
    s1 = rand(Normal(0,1),1000)
    s2 = rand(Binomial(100,0.1),1000)
    s3 = rand(Gamma(1,2),1000)
    s4 = rand(Beta(1,2),1000)
    s5 = rand(Multinomial(200,ones(3)/3),1000)
    s1[end]+s2[end]+s3[end]+s4[end]+s5[end]#make sure those are not optimized away
end

timeit("Generate random numbers",main)
