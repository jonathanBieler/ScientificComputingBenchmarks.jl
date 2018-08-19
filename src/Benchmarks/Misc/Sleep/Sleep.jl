include(joinpath(@__DIR__,"../../../timeit.jl"))

function main()
    sleep(0.1)
    true
end

@assert main()
timeit("Sleep for 0.1s",main)
