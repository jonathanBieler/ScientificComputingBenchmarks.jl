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

# timeit
cat(timeit(main))
