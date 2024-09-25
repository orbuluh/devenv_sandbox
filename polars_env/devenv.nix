{ pkgs, ... }:
{
  # https://devenv.sh/basics/
  env.GREET = "polars playground";

  # https://devenv.sh/packages/
  packages = with pkgs; [
    git
    graphviz
  ];

  languages.python = {
    enable = true;
    venv.enable = true;
    venv.requirements = ./requirements.txt;
    manylinux.enable = false;
  };

  # optional PS1 recommended from
  # https://devenv.sh/automatic-shell-activation/#managing-the-direnv-directory
  starship = {
    enable = true;
  };

}
