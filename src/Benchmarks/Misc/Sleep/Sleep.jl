include(joinpath(@__DIR__,"../../../timeit.jl"))

function main()
    sleep(1/100)
    true
end

@assert main()
timeit("Sleep for 10ms",main)
