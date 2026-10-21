{ config, pkgs, ... }: 
  { 
  imports = [
    ./modules
    ./modules/packages/minimal.nix
  ];

  home = {
    username = "corentin"; 
    homeDirectory = "/home/corentin"; 
    stateVersion = "25.05"; 
  };
}

