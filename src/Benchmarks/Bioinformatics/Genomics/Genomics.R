source("../src/timeit.R")
library(Rsamtools)

main = function(){
    aln = scanBam('../Data/wgEncodeUwRepliSeqK562G1AlnRep1.bam', index='../Data/wgEncodeUwRepliSeqK562G1AlnRep1.bam.bai')
    aln = aln[[1]]

    q = as(aln$qual,"IntegerList")
    return(mean(mean(q)))
}

stopifnot( abs(main()-51.061717683307776) < 1e-6 )
timeit("Computing mean quality of reads", main)
