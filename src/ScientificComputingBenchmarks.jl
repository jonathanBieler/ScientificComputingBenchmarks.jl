module ScientificComputingBenchmarks
    using BenchmarkTools

    abstract type Language end

    struct Julia <: Language end
    struct R <: Language end
    struct Python <: Language end

    languages() = [Julia,R,Python]

    extension(::Type{Julia}) = ".jl"
    extension(::Type{R}) = ".R"
    extension(::Type{Python}) = ".py"

    benchmark_cmd(::Type{R},file) = `Rscript $file`
    benchmark_cmd(::Type{Python},file) = `python $file`

    benchmark(::Type{T},file) where T <: Language = parse(Float64, read(benchmark_cmd(T,file),String) )

    function benchmark(::Type{Julia},file)
        include(file)
        t = 1000*@belapsed main()
    end

    readelements(dir) = filter(s->!startswith(s,"."),readdir(dir))

    root() = joinpath(@__DIR__,"Benchmarks")
    categories() = readelements(root())
    benchmarks(categorie) = readelements(joinpath(root(),categorie))

    benchmark_file(::Type{T},categorie,benchmark) where T <: Language =
        joinpath(root(),categorie,benchmark,string(benchmark,extension(T)))

    function run_benchmarks()

        for c in categories()
            for b in benchmarks(c), l in languages()
                file = benchmark_file(l,c,b)
                if !isfile(file) && @warn "$file not found"
                    t = Missing
                else
                    t = benchmark(l,file)
                    @info c,b,l,t
                end
            end
        end

        true
    end

end # module
