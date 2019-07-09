function timeit(name,f)
    tmin = Inf
    mintrials = 10
    for i=1:mintrials
        t = 1000*@elapsed f()
        tmin = min(tmin,t)
    end
    println(string(name,"\t",tmin))
end
