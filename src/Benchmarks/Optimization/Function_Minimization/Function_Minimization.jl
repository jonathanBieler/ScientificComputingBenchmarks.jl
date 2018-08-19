include(joinpath(@__DIR__,"../../../timeit.jl"))

using Optim

function rosenbrock(x)
    D = length(x)
    sum( 100*(x[i]^2 - x[i+1])^2 + (x[i]-1)^2 for i=1:D-1 )
end

function main()
    optimize(rosenbrock,-5*ones(9),NelderMead(),Optim.Options(iterations=1500))
    true
end

@assert main()
timeit("Optimize a function with Nelder-Mead",main)
