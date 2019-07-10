# Scientific Computing Benchmarks

[![Build Status](https://travis-ci.org/jonathanBieler/ScientificComputingBenchmarks.jl.svg?branch=master)](https://travis-ci.org/jonathanBieler/ScientificComputingBenchmarks.jl)
[![codecov](https://codecov.io/gh/jonathanBieler/ScientificComputingBenchmarks.jl/branch/master/graph/badge.svg)](https://codecov.io/gh/jonathanBieler/ScientificComputingBenchmarks.jl)

Benchmark common scientific programming operations in Julia, R and Python.

All timings are show relative to Julia (with absolute value in millisecond shown
for Julia). Each benchmark is run ten times and the best timing is kept.

## Results
**Bioinformatics**
>
| Benchmark | Julia | R | Python |
| --- | --- | --- | --- |
|[Computing mean quality of reads](../master/src/Benchmarks/Bioinformatics/Genomics/)|1.0 (1618.41ms)|1.71|5.83|
>
**DataFrames**
>
| Benchmark | Julia | R | Python |
| --- | --- | --- | --- |
|[Loading a 10k row dataframe](../master/src/Benchmarks/DataFrames/DataFrames/)|1.0 (16.7ms)|1.89|0.59|
|[join](../master/src/Benchmarks/DataFrames/DataFrames/)|1.0 (9.71ms)|1.53|2.11|
|[apply function on a column](../master/src/Benchmarks/DataFrames/DataFrames/)|1.0 (0.06ms)|13.16|31.46|
|[sort](../master/src/Benchmarks/DataFrames/DataFrames/)|1.0 (2.54ms)|0.22|0.89|
>
**Optimization**
>
| Benchmark | Julia | R | Python |
| --- | --- | --- | --- |
|[Optimize a function with Nelder-Mead](../master/src/Benchmarks/Optimization/Function_Minimization/)|1.0 (1.0ms)|1423.36|61.46|
>
**RosettaCode**
>
| Benchmark | Julia | R | Python |
| --- | --- | --- | --- |
|[Runge-Kutta method](../master/src/Benchmarks/RosettaCode/RosettaCode/)|1.0 (0.06ms)|55.17|34.31|
>
**Statistics**
>
| Benchmark | Julia | R | Python |
| --- | --- | --- | --- |
|[Evaluate pdf](../master/src/Benchmarks/Statistics/Evaluating_pdf/)|1.0 (0.18ms)|13.33|457.52|
|[Evaluate pdf (vectorized)](../master/src/Benchmarks/Statistics/Evaluating_pdf/)|1.0 (0.2ms)|6.97|5.56|
|[Generate random numbers](../master/src/Benchmarks/Statistics/Evaluating_pdf/)|1.0 (0.87ms)|0.96|3.87|
>
**Misc**
>
| Benchmark | Julia | R | Python |
| --- | --- | --- | --- |
|[Sleep for 10ms](../master/src/Benchmarks/Misc/Sleep/)|1.0 (11.09ms)|0.91|0.91|
>

## Contribute

### Setup

- Clone the package on Julia >v0.7.
- Install [Python 3.6](https://conda.io/miniconda.html) and [R](https://www.r-project.org).
- Install dependencies for [Python](https://github.com/jonathanBieler/ScientificComputingBenchmarks.jl/blob/master/.travis.yml#L24)  and [R](https://github.com/jonathanBieler/ScientificComputingBenchmarks.jl/blob/master/.travis.yml#L31).
- Test the package to run the benchmarks.

Note that the commands `julia`, `python` and `R` need to refer to the correct versions.

### Adding benchmarks

[Benchmarks](https://github.com/jonathanBieler/ScientificComputingBenchmarks.jl/tree/master/src/Benchmarks) are organized in categories. Each subfolder in a category contains
a file for each language and a file can contain several benchmarks that are
run together. You can simply add a benchmark by editing these files.

To add a new category or a new subfolder use:

```julia
using ScientificComputingBenchmarks
ScientificComputingBenchmarks.add_benchmark("Category","Subfolder")
```

This will create the folders and templates for each language.

Packages for R and Python are installed in the `.travis.yml` file, and dependencies
for Julia need to be added to this package.
