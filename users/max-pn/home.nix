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
    ../../modules/productivity
  ];

  home.stateVersion = "25.11";

  home.packages = with pkgs; [
    corefonts
    fastfetch
    ghostty
    kdePackages.dolphin
    lazygit
    rofi
    yazi
  ];
}
