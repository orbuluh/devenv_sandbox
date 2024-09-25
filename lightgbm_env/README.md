# Env to build lightgbm


cuda seems to need g++

```bash
cmake  -B build -S . -DUSE_OPENMP=OFF -DUSE_CUDA=ON
```

use clang (can't work with cuda though), you can add

```bash
-DCMAKE_CXX_COMPILER=clang++ -DCMAKE_C_COMPILER=clang
```