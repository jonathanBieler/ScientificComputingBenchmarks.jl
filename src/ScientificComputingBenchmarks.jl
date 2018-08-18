module ScientificComputingBenchmarks

    abstract type Language end

    struct Julia <: Language end
    struct R <: Language end
    struct Python <: Language end

    languages() = [Julia,R,Python]

    extension(::Type{Julia}) = ".jl"
    extension(::Type{R}) = ".R"
    extension(::Type{Python}) = ".py"

    benchmark_cmd(::Type{Julia},file) = `julia $file`
    benchmark_cmd(::Type{R},file) = `Rscript $file`
    benchmark_cmd(::Type{Python},file) = `python $file`

    function benchmark(::Type{T},file) where T <: Language
        out = read(benchmark_cmd(T,file),String)
        out = split(out,"\n")
        f = (name,t) -> (string(name), parse(Float64,t))
        out = [f(split(o,"\t")...) for o in out[1:end-1]]
    end

    readelements(dir) = filter(s->!startswith(s,"."),readdir(dir))

    root() = joinpath(@__DIR__,"Benchmarks")
    categories() = readelements(root())
    benchmarks(categorie) = readelements(joinpath(root(),categorie))

    benchmark_file(::Type{T},categorie,benchmark) where T <: Language =
        joinpath(root(),categorie,benchmark,string(benchmark,extension(T)))

    function run_benchmark(l,c,b)
        file = benchmark_file(l,c,b)
        if !isfile(file) && @warn "$file not found"
            out = Missing
        else
            out = benchmark(l,file)
        end
        out
    end

    function add_benchmark(category::String,benchmark::String)
        path = joinpath(root(),category,benchmark)
        isdir(path) && error("Benchmark $path already exists")
        mkpath(path)
        for l in languages()
            src = joinpath(@__DIR__,"templates",string("template",extension(l)))
            dest = joinpath(path,string(benchmark,extension(l)))
            cp(src,dest)
        end
    end

    function parse_results(results)
        names = [r[1] for r in results[1]]
        times = [[r[b][2] for r in results] for b in 1:length(results[1])]
        names,times
    end

    format(b) = replace(b, "_" => " ")

    print_category(c) = println("**$c**\n>\n| Benchmark | Julia | R | Python |\n| --- | --- | --- | --- |")
    print_benchmark(b,tj,tr,tp) = println("|$b|$tj|$tr|$tp|")

    function run_benchmarks()
        println("<------ copy here")
        for c in categories()
            print_category(c)
            for b in benchmarks(c)

                results = [run_benchmark(l,c,b) for l in languages()]
                names,times = parse_results(results)

                for i=1:length(names)
                    t = times[i]/times[i][1]#relative time to Julia
                    print_benchmark(names[i],round.(t,digits=2)...)
                end
            end
            println(">")
        end
        println("<------ copy here")
        true
    end

end # module
