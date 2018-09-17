# Scientific Computing Benchmarks

[![Build Status](https://travis-ci.org/jonathanBieler/ScientificComputingBenchmarks.jl.svg?branch=master)](https://travis-ci.org/jonathanBieler/ScientificComputingBenchmarks.jl)
[![codecov](https://codecov.io/gh/jonathanBieler/ScientificComputingBenchmarks.jl/branch/master/graph/badge.svg)](https://codecov.io/gh/jonathanBieler/ScientificComputingBenchmarks.jl)

Benchmark common scientific programming operations in Julia, R and Python.

All timings are show relative to Julia (with absolute value in millisecond shown
for Julia). Each benchmark is run ten times and the best timing is kept.

## Results

**DataFrames**
>
| Benchmark | Julia | R | Python |
| --- | --- | --- | --- |
|[Loading a 10k row dataframe](../master/src/Benchmarks/DataFrames/DataFrames/)|1.0 (8.75ms)|5.41|1.13|
|[join](../master/src/Benchmarks/DataFrames/DataFrames/)|1.0 (26.7ms)|25.03|0.73|
|[apply function on a column](../master/src/Benchmarks/DataFrames/DataFrames/)|1.0 (0.07ms)|5.86|30.15|
|[sort](../master/src/Benchmarks/DataFrames/DataFrames/)|1.0 (3.18ms)|0.3|0.63|
>
**Optimization**
>
| Benchmark | Julia | R | Python |
| --- | --- | --- | --- |
|[Optimize a function with Nelder-Mead](../master/src/Benchmarks/Optimization/Function_Minimization/)|1.0 (1.08ms)|1509.1|63.99|
>
**RosettaCode**
>
| Benchmark | Julia | R | Python |
| --- | --- | --- | --- |
|[Runge-Kutta method](../master/src/Benchmarks/RosettaCode/RosettaCode/)|1.0 (0.05ms)|61.09|40.76|
>
**Statistics**
>
| Benchmark | Julia | R | Python |
| --- | --- | --- | --- |
|[Evaluate pdf](../master/src/Benchmarks/Statistics/Evaluating_pdf/)|1.0 (0.16ms)|17.31|637.19|
|[Evaluate pdf (vectorized)](../master/src/Benchmarks/Statistics/Evaluating_pdf/)|1.0 (0.17ms)|9.12|6.57|
|[Generate random numbers](../master/src/Benchmarks/Statistics/Evaluating_pdf/)|1.0 (0.7ms)|1.38|5.11|
>
**Misc**
>
| Benchmark | Julia | R | Python |
| --- | --- | --- | --- |
|[Sleep for 10ms](../master/src/Benchmarks/Misc/Sleep/)|1.0 (11.09ms)|0.92|0.91|

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
