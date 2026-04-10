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
    firefox
    ghostty
    kdePackages.dolphin
    lazygit
    neovim
    rofi
    tmux
    yazi
  ];
}
