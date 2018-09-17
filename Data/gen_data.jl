using CSV, DataFrames, Random
N = 10_000
df = DataFrame(a=rand(N),b=rand(1:10,N),c=[randstring(8) for i=1:N],d=rand(Bool,N))
CSV.write(joinpath(@__DIR__,"dataframe.csv"),df)
