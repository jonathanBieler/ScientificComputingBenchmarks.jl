source("../src/timeit.R")

main = function(){
    s = 0.0
    for (x in 0:200){
        s = s + dnorm(x,0,1)
        s = s + dbinom(x,100,0.1)
        s = s + dbeta(x/200,1,2)
        s = s + dgamma(x,1,1)
        s = s + dmultinom(c(x,200-x,0),size=200,c(1,1,1)/3)
    }
    return (s)
}


stopifnot(abs(main()-204.28144784974535) < 1e-12)
timeit("Evaluate pdf",main)

main = function(){
    s = 0.0
    x = 0:200

    s = s + sum(dnorm(x,0,1))
    s = s + sum(dbinom(x,100,0.1))
    s = s + sum(dbeta(x/200,1,2))
    s = s + sum(dgamma(x,1,1))
    #dmultinom is currently not vectorized
    for (x in 0:200){
        s = s + dmultinom(c(x,200-x,0),size=200,c(1,1,1)/3)
    }
    return (s)
}
timeit("Evaluate pdf (vectorized)",main)

main = function(){
    N = 1000
    s1 = rnorm(N,0,1)
    s2 = rbinom(N,100,0.1)
    s3 = rbeta(N,1,2)
    s4 = rgamma(N,1,1)
    s5 = rmultinom(N,size=200,c(1,1,1)/3)
    
    return(s1[N]+s2[N]+s3[N]+s4[N]+s5[N])
}
timeit("Generate random numbers",main)
