{ config, pkgs, ... }: 
  { 
  imports = [
    ./modules
    ./modules/packages
  ];

  home = {
    username = "corentin"; 
    homeDirectory = "/home/corentin"; 
    stateVersion = "25.05"; 
  };

  programs.git = {
    enable = true;
    userName  = "corentin.louis";
    userEmail = "corentin.louis@epita.fr";
    extraConfig = {
      core.editor = "nvim";
    };
  };
}

