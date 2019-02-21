include(joinpath(@__DIR__,"../../../timeit.jl"))

using BioAlignments, Statistics
import BioAlignments: BAM

function main()

    bamfile = joinpath(@__DIR__,"../../../../Data/wgEncodeUwRepliSeqK562G1AlnRep1.bam")

    reader = open(BAM.Reader, bamfile, index = bamfile * ".bai")
    record = BAM.Record()
    out,n = 0.0, 0

    while !eof(reader)
        read!(reader, record)
        out += mean(BAM.quality(record))
        n += 1
    end
    close(reader)
    out/n
end

@assert main() == 51.061717683307776
timeit("Computing mean quality of reads",main)
