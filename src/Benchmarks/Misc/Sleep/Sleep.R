source("../src/timeit.R")

## benchmarks here

main = function(){ Sys.sleep(0.1) }

timeit("Sleep",main)
timeit("Sleep2",main)
