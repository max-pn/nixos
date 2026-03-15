{ pkgs, inputs, ... }:

{
  users.users.max-pn = {
    isNormalUser = true;
    home = "/home/max-pn";
    extraGroups = [ "wheel" ];
    shell = pkgs.zsh;
    hashedPassword = "$y$j9T$fkD6/cMHtPBxzmI/QKBgw1$PkGPQejL1j3ofb3ed32RAAXdYMdWenbMtia.V9QIqW4";
    openssh.authorizedKeys.keys = [
      # TODO: add authorized keys
    ];
  };
}
