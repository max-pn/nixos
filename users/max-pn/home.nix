{
  config,
  lib,
  pkgs,
  ...
}:

{
  home.stateVersion = "25.11";

  home.packages = with pkgs; [
    kdePackages.dolphin
    fastfetch
    kitty
    neovim
    tmux
    yazi
  ];
}
