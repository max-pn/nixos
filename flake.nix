{
  description = "max-pn's NixOS config";

  inputs = {
    # Primary nixpkgs repository. This is the main source used in the
    # configurations. Changing this wil impact the entire config system.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";

    # Nix darwin for MacOS system functionality configuration
    darwin = {
      url = "github:nix-darwin/nix-darwin/nix-darwin-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # WSL installer
    nixos-wsl = {
      url = "github:nix-community/NixOS-WSL";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      darwin,
      ...
    }@inputs:
    let
      mkSystem = import ./lib/mksystem.nix {
        inherit nixpkgs inputs;
      };
    in
    {
      nixosConfigurations.vm-aarch64-prl = mkSystem "vm-aarch64-prl" {
        system = "aarch64-linux";
        user = "max-pn";
      };

      nixosConfigurations.vm-aarch64-utm = mkSystem "vm-aarch64-utm" {
        system = "aarch64-linux";
        user = "max-pn";
      };

      nixosConfigurations.wsl = mkSystem "wsl" {
        system = "x86_64-linux";
        user = "max-pn";
        wsl = true;
      };

      darwinConfigurations.darwin = mkSystem "darwin" {
        system = "aarch64-darwin";
        user = "max-pn";
        darwin = true;
      };
    };
}
