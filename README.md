# My [devenv](https://devenv.sh/) sandbox

A repo to collect devenv environments, mostly modified from [devenv examples](https://github.com/cachix/devenv/tree/main/examples).

Current plan: individual project will be created in the branch. For example, [xgboost playground](https://github.com/orbuluh/devenv_sandbox/tree/xgboost_playground) is in the branch.

Enviornment will be prepared in `main`, and rebase `main` back to individual project accordingly.


## Prerequist

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

### Devenv quick tips

- `devenv shell` activates your developer environment.
- `devenv test` builds your developer environment and makes sure that all checks pass. Useful to run in your continuous integration environment.
- `devenv search <NAME>` searches packages matching NAME in Nixpkgs input.
- `devenv update` updates and pins inputs from devenv.yaml into devenv.lock.
- `devenv gc` deletes unused environments to save disk space.
- `devenv up` starts processes.

</details>