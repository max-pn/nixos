{
  config,
  lib,
  pkgs,
  inputs,
  ...
}:
{
  home.packages = with pkgs; [
    neovim
  ];

  xdg.configFile."nvim".source = inputs.nvim-config;
}
