source("../src/timeit.R")

main = function(){
    s1 = rnorm(1000,mean=0,sd=1)
    s2 = rbinom(1000,size=100,p=0.1)
    s3 = rgamma(1000,1)
    s1[1000]+s2[1000]+s3[1000]
}

# timeit
cat(timeit(main))
