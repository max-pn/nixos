{
  description = "max-pn's NixOS config";

  inputs = {
    # Primary nixpkgs repository. This is the main source used in the
    # configurations. Changing this wil impact the entire config system.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-26.05";

    # Home Manager for managing .config
    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Nix darwin for MacOS system functionality configuration
    darwin = {
      url = "github:nix-darwin/nix-darwin/nix-darwin-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # WSL installer
    nixos-wsl = {
      url = "github:nix-community/NixOS-WSL";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # NeoVim config
    #
    # NOTE: this may not be the "nix-way" but I prefer using this over
    # alternatives like nixvim as they in my eyes lack the last bit I need this
    # to run smoothly
    nvim-config = {
      url = "github:max-pn/nvim-config";
      flake = false;
    };
  };

  outputs = inputs: import ./outputs inputs;
}
