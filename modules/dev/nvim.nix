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
    ripgrep

    # lsp
    clang
    cmake
    vscode-json-languageserver # "jsonls"
    ltex-ls-plus
    lua-language-server
    marksman
    nixd
    # prisma-language-server # "prismals"
    pyright
    # tailwindcss-language-server
    texlab
    typescript-language-server

    # format & lint
    pylint
    nixfmt
  ];

  xdg.configFile."nvim".source = inputs.nvim-config;
}
