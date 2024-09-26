{ pkgs, lib, config, inputs, ... }:

{
  packages = [
    #------------------------------------
    #pkgs.gcc11 ## C++20, partial C++23
    pkgs.gcc13 ## most C++23
    #------------------------------------
    #pkgs.clang_12 ## C++20
    pkgs.clang_18 ## most C++23
    #------------------------------------
    pkgs.cmake
    pkgs.ninja
    #------------------------------------
    pkgs.boost
    pkgs.gtest
  ];
}
