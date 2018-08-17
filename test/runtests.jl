using ScientificComputingBenchmarks
using Test
const S = ScientificComputingBenchmarks

function list_benchmarks()
    for c in S.categories()
        for b in S.benchmarks(c), l in S.languages()
            @info S.benchmark_file(l,c,b)
        end
    end
    true
end

@test list_benchmarks()
@test S.run_benchmarks()
