source("../src/timeit.R")

main = function(){
    s = 0.0
    for (a in seq(1,2,len=100)){
        for (x in 0:100){
            s = s + dgamma(x,a)
        }
    }
    return (s)
}

stopifnot(abs(main()-79.19414904703733) < 1e-12)
timeit("Evaluate pdf",main)

main = function(){
    s = 0.0
    x = 0:5000
    for (a in seq(1,2,len=100)){
        s = s + sum(dgamma(x,a))
    }
    return (s)
}
timeit("Evaluate pdf (vectorized)",main)

main = function(){
    s1 = rnorm(1000,mean=0,sd=1)
    s2 = rbinom(1000,size=100,p=0.1)
    s3 = rgamma(1000,1)
    s1[1000]+s2[1000]+s3[1000]
}
timeit("Generate random numbers",main)
