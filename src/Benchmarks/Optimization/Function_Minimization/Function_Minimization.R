source("../src/timeit.R")

## benchmarks here
suppressMessages(library(neldermead))#avoid messing up our nice prints

#sum( 100*(x[i]^2 - x[i+1])^2 + (x[i]-1)^2 for i=1:D-1 )
rosenbrock = function(x){
    D = length(x)
    return(sum( 100*(x[2:D]-x[1:D-1]^2)^2 + (1-x[1:D-1])^2 ))
}

main = function(){
    opt = optimset(TolX=1.e-16, MaxIter=1500, MaxFunEvals=5000,Display="off")
    sol = fminsearch(rosenbrock, rep(-5, 9),opt)
}

timeit("Optimize a function with Nelder-Mead",main)
