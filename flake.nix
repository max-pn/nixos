{
  description = "max-pn's NixOS config";

  inputs = {
    # Primary nixpkgs repository. This is the main source used in the
    # configurations. Changing this wil impact the entire config system.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";
  };

  outputs =
    { self, nixpkgs, ... }@inputs:
    let
      mkSystem = import ./lib/mksystem.nix {
        inherit nixpkgs inputs;
      };
    in
    {
      nixosConfigurations.vm-aarch64 = mkSystem "vm-aarch64" {
        system = "aarch64-linux";
        user = "max-pn";
      };

      nixosConfigurations.wsl = mkSystem "wsl" {
        system = "x86_64-linux";
        user = "max-pn";
        wsl = true;
      };

      nixosConfigurations.darwin = mkSystem "darwin" {
        system = "aarch64-darwin";
        user = "max-pn";
        darwin = true;
      };
    };
}
