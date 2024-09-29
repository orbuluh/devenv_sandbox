# Env to build GPU lightgbm

## Getting the LightGBM

git clone --recursive https://github.com/microsoft/LightGBM

cuda seems to need g++

```bash
cmake -B build -S . -DUSE_OPENMP=OFF -DUSE_CUDA=ON
cmake --build build -j4
```

use clang (can't work with cuda though), you can add

```bash
-DCMAKE_CXX_COMPILER=clang++ -DCMAKE_C_COMPILER=clang
```
