include(joinpath(@__DIR__,"../../../timeit.jl"))

using CSV, DataFrames, Random

function main()
    df = CSV.read(joinpath(@__DIR__,"../../../../Data/dataframe.csv"))
    size(df,1)
end
@assert main() == 10_000
timeit("Loading a 10k row dataframe",main)

global const df = CSV.read(joinpath(@__DIR__,"../../../../Data/dataframe.csv"))
global const df2 = df[1:500,:]

main() = size(join(df2,df2,on=:d,makeunique=true))
@assert main() == (125018, 7)
timeit("join",main)

function main()
    df[:a] .= sin.(df[:a])
end
timeit("apply function on a column",main)

main() = sort!(df,[:b,:d])
timeit("sort",main)
