{ config, pkgs, ... }: 

let 
  dotfiles = "${config.home.homeDirectory}/nixos-dotfiles/config";
  create_symlink = path: config.lib.file.mkOutOfStoreSymlink path;
  configs = { 
    i3 = "i3";
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
    username = "corentin"; 
    homeDirectory = "/home/corentin"; 
    stateVersion = "25.05"; 
  };

  programs.bash = {
    enable = true;
    shellAliases = {
      nr = "sudo nixos-rebuild switch --flake ~/nixos-dotfiles#corentin";
    };
  };

  programs.git = {
    enable = true;
    userName  = "IDeltaCocoI";
    userEmail = "corentin.louis74@gmail.com";
  };

  home.file.".config/home-manager/home.nix".source = create_symlink "${config.home.homeDirectory}/nixos-dotfiles/home.nix";

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
    python3 
    i3blocks-gaps
    playerctl
    polybarFull
    picom
    pre-commit
  ];
}

