inputs@{ self, nixpkgs, ... }:
let
  mkSystem = import ../lib/mksystem.nix {
    inherit nixpkgs inputs;
  };
in
{
  nixosConfigurations = import ./nixos.nix { inherit mkSystem; };
  darwinConfigurations = import ./darwin.nix { inherit mkSystem; };
}
