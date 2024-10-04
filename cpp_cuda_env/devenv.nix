{ pkgs, lib, config, inputs, ... }:

{
  packages = [
    pkgs.cudaPackages.cuda_nvcc
    pkgs.cudaPackages.cudatoolkit
    pkgs.gcc11
    pkgs.cmake
    pkgs.cmake-format
  ];

  # Critical for WSL, check README.md
  env.LD_LIBRARY_PATH = "/usr/lib/wsl/lib";
}
