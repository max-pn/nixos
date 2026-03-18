{ pkgs, inputs, ... }:

{
  users.users.max-pn = {
    isNormalUser = true;
    home = "/home/max-pn";
    extraGroups = [ "wheel" ];
    shell = pkgs.bash;
    packages = with pkgs; [
      neofetch
      neovim
    ];
    hashedPassword = "$y$j9T$fkD6/cMHtPBxzmI/QKBgw1$PkGPQejL1j3ofb3ed32RAAXdYMdWenbMtia.V9QIqW4";
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOEDwXwuB/IpD13wcCAoCBd07ar2He6R+W587Ny2QUFj max-pn"
    ];
  };
}
