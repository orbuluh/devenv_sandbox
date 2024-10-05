# My [devenv](https://devenv.sh/) sandbox

A repo to collect devenv environments, mostly modified from [devenv examples](https://github.com/cachix/devenv/tree/main/examples).

Current workflow: individual project will be created in the branch.

Environment will be prepared in `main`, and I will rebase `main` back to individual branch accordingly.

## Prerequisite

- [Really nice nix intro](https://youtu.be/5D3nUU1OVx8?si=OZ2PhDdZtvFGXn0q)

<details>
  <summary>If you haven't install devenv, follow here</summary>

### Install nix

```bash
curl -L https://raw.githubusercontent.com/NixOS/experimental-nix-installer/main/nix-installer.sh | sh -s install
```

### Enable nix flake

```bash
touch ~/.config/nix/nix.conf
echo "extra-experimental-features = nix-command flakes" >> ~/.config/nix/nix.conf
```

### Install direnv

```bash
# install direnv
curl -sfL https://direnv.net/install.sh | bash
# Add the following line at the end of the ~/.bashrc file:
# eval "$(direnv hook bash)"
```

- vscode - install `mkhl.direnv` extension
- (By doing so, vscode ipython notebook can find the virtual env set up correctly)

### Install devenv

```bash
# install devenv
nix-env -iA devenv -f https://github.com/NixOS/nixpkgs/tarball/nixpkgs-unstable
```

### Upgrade devenv

not so sure, above install use nix-env, but maybe sometime later I use nix profile for something, and nix-env is no longer usable.
eventually I do below ...

```bash
nix profile list | grep devenv   -A 1 -B2
Index:              0
Store paths:        /nix/store/24yzpf9qjfn599dsq92sllxx3wdnpznr-devenv-1.1

nix profile remove 0 #  the Index from above
nix profile install nixpkgs#devenv -I nixpkgs=channel:unstable

nix profile list | grep devenv   -A 1 -B2
Index:              1
Flake attribute:    legacyPackages.x86_64-linux.devenv
Locked flake URL:   github:NixOS/nixpkgs/eeeb90a1dd3c9bea3afdbc76fd34d0fb2a727c7a
Store paths:        /nix/store/5fm2f0n3839sdh9qlyh8b6ykqlravr9i-devenv-1.3
```

### Devenv quick tips

- `devenv shell` activates your developer environment.
- `devenv test` builds your developer environment and makes sure that all checks pass. Useful to run in your continuous integration environment.
- `devenv search <NAME>` searches packages matching NAME in Nixpkgs input.
- `devenv update` updates and pins inputs from devenv.yaml into devenv.lock.
- `devenv gc` deletes unused environments to save disk space.
- `devenv up` starts processes.

</details>

## Tips Related to vscode with the environments

### C++ projects

For IntelliSense to work and find the path installed in the environment, you need to make workspace from *_env, as the default search path is `${workspaceFolder}/**`. (Or you should change `.vscode/c_cpp_properties.json`'s `includePath`). As devenv will install packages into `.devenv/profile`

### Python projects

Remember to launch the workspace from the *_env folder as well, then for ipython notebook, select the kernel under `.devenv/state/bin/python` (If you can recreate, better do so to make sure all libs are installed).
