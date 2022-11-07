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
NeoHookean model comparison test
  generating input data ... 
       naive implementation: 0.107443s per run
  vectorized implementation: 0.0450564s per run
relative frobenius error (stress): 4.17544e-16


J2 plasticity model comparison test
  generating input data ... 
       naive J2 implementation: 0.332499s per run
  vectorized J2 implementation: 0.131363s per run
relative frobenius error (F):      0
relative frobenius error (be_bar): 3.22516e-15
relative frobenius error (tau):    2.25052e-15
relative frobenius error (alpha):  9.12279e-19
```
