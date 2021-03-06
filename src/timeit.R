options(digits.secs = 12)

timeit = function(name,f){
    mintrials = 10
    tmin = Inf
    for (i in 1:mintrials){
        start.time = as.numeric(as.numeric(Sys.time())*1000, digits=15)
        main()
        end.time = as.numeric(as.numeric(Sys.time())*1000, digits=15)
        t = end.time - start.time
        tmin = min(t,tmin)
    }
    cat( paste(name,"\t",tmin,"\n",sep="") )
}
