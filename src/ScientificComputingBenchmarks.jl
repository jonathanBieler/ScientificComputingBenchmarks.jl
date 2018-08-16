module ScientificComputingBenchmarks

    function main()
        file = joinpath(@__DIR__,"Benchmarks","Statistics","Evaluating_pdf","Evaluating_pdf.py")
        tpy = parse(Float64, read(`python $file`,String) )
        @info tpy
        true
    end

end # module
