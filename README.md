# Scientific Computing Benchmarks

[![Build Status](https://travis-ci.org/jonathanBieler/ScientificComputingBenchmarks.jl.svg?branch=master)](https://travis-ci.org/jonathanBieler/ScientificComputingBenchmarks.jl)
[![codecov](https://codecov.io/gh/jonathanBieler/ScientificComputingBenchmarks.jl/branch/master/graph/badge.svg)](https://codecov.io/gh/jonathanBieler/ScientificComputingBenchmarks.jl)

Benchmark common scientific programming operations in Julia, R and Python.

All timings are show relative to Julia (with absolute value in millisecond shown
for Julia). Each benchmark is run ten times and the best timing is kept.

## Results

**Misc**
>
| Benchmark | Julia | R | Python |
| --- | --- | --- | --- |
|[Sleep for 0.1s](../master/src/Benchmarks/Misc/Sleep/)|1.0 (101.19ms)|0.99|0.99|
>
**Optimization**
>
| Benchmark | Julia | R | Python |
| --- | --- | --- | --- |
|[Optimize a function with Nelder-Mead](../master/src/Benchmarks/Optimization/Function_Minimization/)|1.0 (1.07ms)|1395.11|62.57|
>
**Statistics**
>
| Benchmark | Julia | R | Python |
| --- | --- | --- | --- |
|[Evaluate pdf](../master/src/Benchmarks/Statistics/Evaluating_pdf/)|1.0 (0.19ms)|13.42|481.42|
|[Evaluate pdf (vectorized)](../master/src/Benchmarks/Statistics/Evaluating_pdf/)|1.0 (0.21ms)|7.41|4.92|
|[Generate random numbers](../master/src/Benchmarks/Statistics/Evaluating_pdf/)|1.0 (0.73ms)|1.44|5.01|
>

## Contribute

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
