source("../src/timeit.R")

## benchmarks here

main = function(){
    df = read.csv("../Data/dataframe.csv")
    return(nrow(df))
}

stopifnot(main() == 10000)
timeit("Loading a 10k row dataframe",main)

df = read.csv("../Data/dataframe.csv")
df2 = df[1:500,]

main = function() { dim(merge(x = df2,y = df2, by = "d")) }
stopifnot(main() == c(125018,7))
timeit("join",main)

main = function() { df['a'] = sin(df['a']) }
timeit("apply function on a column",main)

main = function() { df = df[with(df, order(b,d)), ] }
timeit("sort",main)
