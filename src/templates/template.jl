include("../timeit.jl")

function main()
    sleep(0.1)
    true
end

@assert main()
timeit("Sleep",main)
