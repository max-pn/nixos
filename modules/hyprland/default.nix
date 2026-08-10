{
  config,
  lib,
  pkgs,
  ...
}:
let
  luaFiles = [
    ./config.lua
    ./animations.lua
    ./bindings.lua
    ./rules.lua
  ];
in
{
  home.packages = with pkgs; [
    hyprpaper
  ];

  xdg.configFile."hypr/hyprpaper.conf".text = ''
    wallpaper {
      monitor =
      path = ${config.home.homeDirectory}/Pictures/Wallpapers/porsche.jpg
      fit_mode = cover
    }
    splash = false
  '';

  wayland.windowManager.hyprland = {
    enable = true;

    configType = "lua";

    # reuse system package
    package = null;
    portalPackage = null;

    extraConfig = lib.concatMapStringsSep "\n\n" builtins.readFile luaFiles;
  };
}
