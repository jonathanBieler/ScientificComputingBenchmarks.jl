module ScientificComputingBenchmarks

    file = joinpath(@__DIR__, "src","Benchmarks","Statistics","Evaluating_pdf","Evaluating_pdf.py")
    tpy = parse(Float64, read(`python $file`,String) )
    @show ty

end # module
