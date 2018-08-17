main = function(){
    Sys.sleep(0.1)
}

# timeit
t = system.time(main())
cat( t[['elapsed']]*1000 )
