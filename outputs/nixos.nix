{ mkSystem }:
{ 
  vm-aarch64-vmw = mkSystem "vm-aarch64-vmw" {
    system = "aarch64-linux";
    user = "max-pn";
  };

  vm-aarch64-prl = mkSystem "vm-aarch64-prl" {
    system = "aarch64-linux";
    user = "max-pn";
  };

  vm-aarch64-utm = mkSystem "vm-aarch64-utm" {
    system = "aarch64-linux";
    user = "max-pn";
  };

  wsl = mkSystem "wsl" {
    system = "x86_64-linux";
    user = "max-pn";
    wsl = true;
  };
} 
  
 
  
  
  
  
 
  
  
  
  
 
  
  
  
  
  
 
