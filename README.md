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
|Sleep for 0.1s|1.0 (101.19ms)|0.99|0.99|
>
**Optimization**
>
| Benchmark | Julia | R | Python |
| --- | --- | --- | --- |
|Optimize a function with Nelder-Mead|1.0 (1.09ms)|1281.59|61.19|
>
**Statistics**
>
| Benchmark | Julia | R | Python |
| --- | --- | --- | --- |
|Evaluate pdf|1.0 (0.19ms)|13.19|481.09|
|Evaluate pdf (vectorized)|1.0 (0.21ms)|7.02|4.8|
|Generate random numbers|1.0 (0.73ms)|1.44|4.88|

## Contribute

Benchmarks are organized in categories. Each subfolder in a category contains
a file for each language and a file can contain several benchmarks that are
run together. You can simply add a benchmark by editing these files.

To add a new category or a new subfolder use:

```julia
using ScientificComputingBenchmarks
ScientificComputingBenchmarks.add_benchmark("Statistics","Generate_random_numbers")
```

This will create the folders and templates for each language.

Packages for R and Python are installed in the `.travis.yml` file, and dependencies
for Julia need to be added to this package.
