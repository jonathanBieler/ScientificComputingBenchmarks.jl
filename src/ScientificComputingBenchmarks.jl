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

    function gettime(l,c,b)
        file = benchmark_file(l,c,b)
        if !isfile(file) && @warn "$file not found"
            t = Missing
        else
            t = benchmark(l,file)
        end
        t
    end

    print_category(c) = println("** $c **\n\n| Benchmark | Julia | R | Python |\n| --- | --- | --- | --- |")
    print_benchmark(b,tj,tr,tp) = println("|$b|$tj|$tr|$tp|")

    add_benchmark(c,b) = nothing #copy templates

    function run_benchmarks()
        println("<------ copy here")
        for c in categories()
            print_category(c)
            for b in benchmarks(c)
                times = [gettime(l,c,b) for l in languages()]
                times = times/times[1]#relative time to Julia
                print_benchmark(b,round.(times,digits=2)...)
            end
        end
        println("<------ copy here")
        true
    end

end # module
