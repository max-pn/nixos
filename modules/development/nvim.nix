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

    # plugin dependencies
    fzf
    ripgrep
    imagemagick

    # lsp
    clang
    cmake
    vscode-json-languageserver # "jsonls"
    jdt-language-server
    ltex-ls-plus
    lua-language-server
    marksman
    nixd
    prisma-language-server # "prismals"
    pyright
    tailwindcss-language-server
    texlab
    typescript-language-server

    # formatters
    nixfmt
    prettier
    prettierd
    pylint
    ruff
    stylua

    # linters
    biome
    checkstyle
    eslint_d
    pylint

    # support
    inkscape
    skimpdf
    zathura
  ];

  xdg.configFile."nvim".source = inputs.nvim-config;
}
