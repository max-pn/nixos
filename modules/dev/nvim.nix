{
  config,
  lib,
  pkgs,
  inputs,
  ...
}:
{
  xdg.configFile."nvim".source = inputs.nvim-config;
}
