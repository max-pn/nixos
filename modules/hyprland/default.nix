{
  config,
  lib,
  pkgs,
  inputs,
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
  wayland.windowManager.hyprland = {
    enable = true;

    configType = "lua";

    # reuse system package
    package = null;
    portalPackage = null;

    extraConfig = lib.concatMapStringsSep "\n\n" builtins.readFile luaFiles;
  };
}
