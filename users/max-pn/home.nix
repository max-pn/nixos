{
  config,
  lib,
  pkgs,
  ...
}:

{
  imports = [
    ../../modules/development
    ../../modules/hyprland
  ];

  home.stateVersion = "25.11";

  home.packages = with pkgs; [
    fastfetch
    firefox
    ghostty
    kdePackages.dolphin
    lazygit
    rofi
    yazi
  ];
}
