using Distributions

function main()
    s1 = rand(Normal(0,1),1000)
    s2 = rand(Binomial(100,0.1),1000)
    s3 = rand(Gamma(1),1000)
    s1[end]+s2[end]+s3[end]#make sure those are not optimized away
end
