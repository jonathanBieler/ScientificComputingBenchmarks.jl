source("../src/timeit.R")

## benchmarks here

main = function(){ Sys.sleep(1/100) }

timeit("Sleep for 10ms",main)
