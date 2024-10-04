# Env to build CUDA program

Using WSL, with the pkgs in [devenv.nix](./devenv.nix), projects seems to be okay to build, but I'm getting errors: `CUDA driver version is insufficient for CUDA runtime version`

I checked the [CUDA Application Compatibility Support Matrix](https://docs.nvidia.com/deploy/cuda-compatibility/#id3) and compare with the result of `nvidia-smi`, which seems to be fine.

Follow [this thread](https://stackoverflow.com/a/67165253/4924135), people are suggesting to run something like

```bash
strace -f -e trace=file ./build/CUDA_Playground
```

and this confirms that `libcuda.so*` is missing.

Originally I thought this has to come from other pkgs like `pkgs.linuxPackages.nvidia_x11`, but it's not helping.

I tried to not use devenv, just follow [nvidia guides](https://docs.nvidia.com/cuda/cuda-installation-guide-linux/index.html#wsl), and don't forget the [post install steps](https://docs.nvidia.com/cuda/cuda-installation-guide-linux/index.html#post-installation-actions) to add PATH and LD_LIBRARY_PATH, this actually works. But it's without nix basically.

Then I saw this [thread](https://github.com/NixOS/nixpkgs/issues/230214#issuecomment-1537226946), and I found that what is needed is the `env.LD_LIBRARY_PATH = "/usr/lib/wsl/lib";`, as it's where the `libcuda.so` is - which matches the errors from `strace`.
