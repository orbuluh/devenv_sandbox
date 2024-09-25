{ pkgs, lib, config, inputs, ... }:

{
  packages = [
    pkgs.boost
    pkgs.cudaPackages.cuda_nvcc
    pkgs.cudaPackages.cudatoolkit
    pkgs.gcc11
    pkgs.cmake
  ];
}
