source("../src/timeit.R")

## benchmarks here
library(data.table)

main = function(){
    df = read.csv("../Data/dataframe.csv")
    return(nrow(df))
}

stopifnot(main() == 10000)
timeit("Loading a 10k row dataframe",main)

df = fread("../Data/dataframe.csv")
df2 = df[1:500,]

main = function() { dim(merge(df2, df2, by="d",allow.cartesian=TRUE)) }
stopifnot(main() == c(125018,7))
timeit("join",main)

#main = function() { df[,'a'] = sin(df[,'a']) }
main = function() { df[,'a'] = df[, lapply(.SD, sin),.SDcols='a'] }#that's a bit faster
timeit("apply function on a column",main)

main = function() { df = df[order(b,d), ] }
timeit("sort",main)
