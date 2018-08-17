source("../src/timeit.R")

main = function(){
    s = 0.0
    x = 0:1000
    for (a in seq(1,2,len=100)){
        s = s + sum(dgamma(x,a))
    }
    return (s)
}

stopifnot(abs(main()-79.19414904703733) < 1e-12)

# timeit
cat(timeit(main))
