source("../src/timeit.R")

## benchmarks here

main = function(){ Sys.sleep(0.1) }

timeit("Sleep for 0.1s",main)
