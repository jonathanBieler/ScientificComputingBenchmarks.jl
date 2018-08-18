
function timeit(name,f)
    tmin = Inf
    for i=1:5
        t = 1000*@elapsed main()
        tmin = min(tmin,t)
    end
    println(string(name,"\t",tmin))
end
