using Distributions
using BenchmarkTools

linspace(a,b,l) = range(a,b,length=l)

function main()
    s = 0.0
    for a in linspace(1,2,100)
        for x in 0:1000
            s += pdf(Gamma(a),x)
        end
    end
    return s
end

# timeit
b = @belapsed main()*1000
