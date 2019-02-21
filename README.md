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
|[Computing mean quality of reads](../master/src/Benchmarks/Bioinformatics/Genomics/)|1.0 (1569.7ms)|1.67|6.44|
>
**DataFrames**
>
| Benchmark | Julia | R | Python |
| --- | --- | --- | --- |
|[Loading a 10k row dataframe](../master/src/Benchmarks/DataFrames/DataFrames/)|1.0 (15.55ms)|3.0|0.75|
|[join](../master/src/Benchmarks/DataFrames/DataFrames/)|1.0 (11.6ms)|65.58|2.14|
|[apply function on a column](../master/src/Benchmarks/DataFrames/DataFrames/)|1.0 (0.06ms)|6.12|29.95|
|[sort](../master/src/Benchmarks/DataFrames/DataFrames/)|1.0 (2.19ms)|0.46|1.07|
>
**Optimization**
>
| Benchmark | Julia | R | Python |
| --- | --- | --- | --- |
|[Optimize a function with Nelder-Mead](../master/src/Benchmarks/Optimization/Function_Minimization/)|1.0 (1.09ms)|1342.45|59.56|
>
**RosettaCode**
>
| Benchmark | Julia | R | Python |
| --- | --- | --- | --- |
|[Runge-Kutta method](../master/src/Benchmarks/RosettaCode/RosettaCode/)|1.0 (0.06ms)|52.84|34.18|
>
**Statistics**
>
| Benchmark | Julia | R | Python |
| --- | --- | --- | --- |
|[Evaluate pdf](../master/src/Benchmarks/Statistics/Evaluating_pdf/)|1.0 (0.19ms)|13.13|478.38|
|[Evaluate pdf (vectorized)](../master/src/Benchmarks/Statistics/Evaluating_pdf/)|1.0 (0.21ms)|7.22|4.86|
|[Generate random numbers](../master/src/Benchmarks/Statistics/Evaluating_pdf/)|1.0 (0.74ms)|1.42|4.87|
>
**Misc**
>
| Benchmark | Julia | R | Python |
| --- | --- | --- | --- |
|[Sleep for 10ms](../master/src/Benchmarks/Misc/Sleep/)|1.0 (11.11ms)|0.92|0.91|
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
