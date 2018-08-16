module ScientificComputingBenchmarks

    function main()
        file = joinpath(@__DIR__,"Benchmarks","Statistics","Evaluating_pdf","Evaluating_pdf.py")
        t = parse(Float64, read(`python $file`,String) )
        @info t

        file = joinpath(@__DIR__,"Benchmarks","Statistics","Evaluating_pdf","Evaluating_pdf.R")
        t = parse(Float64, read(`Rscript $file`,String) )
        @info t

        true
    end

end # module
