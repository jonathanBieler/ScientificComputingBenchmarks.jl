main = function(){
    s = 0.0
    for (a in seq(1,2,len=100)){
        for (x in 0:1000){
            s = s + dgamma(x,a)
        }
    }
    return (s)
}

# timeit
t = system.time(main())
cat( t[['elapsed']]*1000 )