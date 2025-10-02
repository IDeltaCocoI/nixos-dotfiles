{ config, pkgs, ... }: 

let 
  dotfiles = "${config.home.homeDirectory}/nixos-dotfiles/config";
  create_symlink = path: config.lib.file.mkOutOfStoreSymlink path;
  configs = { 
    nvim = "nvim";
    alacritty = "alacritty";
    rofi = "rofi";
    i3blocks = "i3blocks";
    polybar = "polybar";
    picom = "picom";
  }; 
in 

{ 
  home = {
    username = "corentin.louis"; 
    homeDirectory = "/home/corentin.louis"; 
    stateVersion = "25.05"; 
  };

  home.file.".config/home-manager/epita.nix".source = create_symlink "${config.home.homeDirectory}/nixos-dotfiles/epita.nix";

  xdg.configFile = builtins.mapAttrs (name: subpath: {
    source = create_symlink "${dotfiles}/${subpath}";
    recursive = true;
  }) configs;

  home.packages = with pkgs; [
    alacritty
    neovim
    lua
    gcc 
    rofi 
    i3blocks-gaps
    playerctl
    polybarFull
    picom
    neofetch
    pre-commit

    #Font
    nerd-fonts.jetbrains-mono
  ];
}

