include(joinpath(@__DIR__,"../../../timeit.jl"))

function main()
    sleep(0.1)
    true
end

@assert main()
timeit("Sleep",main)

@assert main()
timeit("Sleep 2",main)
