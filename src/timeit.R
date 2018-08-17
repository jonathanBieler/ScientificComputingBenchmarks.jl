timeit = function(f){
    mintrials = 5
    tmin = Inf
    for (i in 1:mintrials){
        t = system.time(main())[['elapsed']]
        tmin = min(t,tmin)
    }
    cat( tmin*1000 )
}
