using Distributions

linspace(a,b,l) = range(a,stop=b,length=l)

function main()
    s = 0.0
    for a in linspace(1,2,100)
        for x in 0:1000
            s += pdf(Gamma(a),x)
        end
    end
    return s
end
