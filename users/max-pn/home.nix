{
  config,
  lib,
  pkgs,
  ...
}:

{
  home.stateVersion = "25.11";

  home.packages = with pkgs; [
    fastfetch
    kitty
    neovim
    tmux
    yazi
  ];
}
