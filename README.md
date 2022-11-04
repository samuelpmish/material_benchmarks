# material_benchmarks

an experiment using `enoki` to vectorize material models

# build instructions

1. clone the repo with `--recursive`

```
git clone https://github.com/samuelpmish/material_benchmarks.git --recursive
```

2. configure CMake

```
cd material_benchmarks
cmake . -Bbuild -DCMAKE_BUILD_TYPE:STRING=Release
```

3. build the project

```
cmake --build build
```

4. run the performance comparison (output from a Skylake-X machine with AVX512 instructions)

```
$ cd build
$ ./perf_test 
generating input data ... done after 1.08317s
naive implementation: 0.25841s
vectorized implementation: 0.105212s
relative frobenius error: 5.35354e-16
```
