{
  config,
  lib,
  pkgs,
  ...
}:

{
  home.stateVersion = "25.11";

  home.packages = [
    "fastfetch"
    "kitty"
    "neovim"
    "tmux"
    "yazi"
  ];
}
