source("../src/timeit.R")

## benchmarks here

main = function(){ Sys.sleep(0.1) }

timeit("Sleep 0.1",main)

main = function(){ Sys.sleep(0.2) }

timeit("Sleep 0.1",main)
