source("../src/timeit.R")

main = function(){
    Sys.sleep(0.1)
}

# timeit
cat(timeit(main))