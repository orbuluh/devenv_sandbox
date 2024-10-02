{ pkgs, lib, config, inputs, ... }:

{
  packages = [
    #------------------------------------
    #pkgs.gcc11 ## C++20, partial C++23
    pkgs.gcc13 ## most C++23
    #------------------------------------
    pkgs.cmake
    pkgs.cmake-format
    pkgs.ninja
    #------------------------------------
    pkgs.mpi
  ];
}
