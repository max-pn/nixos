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
    corefonts
    fastfetch
    ghostty
    google-chrome
    lazygit
    nautilus
    rofi
    yazi
  ];
}
