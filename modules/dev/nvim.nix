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

    # config dependencies
    fzf

    # lsp
    nixd

    # format & lint
    pylint
    nixfmt
  ];

  xdg.configFile."nvim".source = inputs.nvim-config;
}
