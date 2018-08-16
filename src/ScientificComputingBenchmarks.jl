module ScientificComputingBenchmarks

    function main()
        file = joinpath(@__DIR__, "src","Benchmarks","Statistics","Evaluating_pdf","Evaluating_pdf.py")
        tpy = parse(Float64, read(`python $file`,String) )
        if(ty)
    end

end # module
