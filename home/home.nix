{ config, pkgs, ... }: 

let 
  dotfiles = "${config.home.homeDirectory}/nixos-dotfiles/home/modules";
  create_symlink = path: config.lib.file.mkOutOfStoreSymlink path;
  configs = { 
    # Folders
    i3 = "i3";
    rofi = "rofi";
    i3blocks = "i3blocks";
    polybar = "polybar";
    picom = "picom";
    fastfetch = "fastfetch";
  }; 
in 

  { 
  imports = [
    ./modules
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

  home.file.".config/home-manager/home.nix".source = create_symlink "${config.home.homeDirectory}/nixos-dotfiles/home/home.nix";

  xdg.configFile = builtins.mapAttrs (name: subpath: { 
    source = create_symlink "${dotfiles}/${subpath}"; 
    recursive = true;
  }) configs; 

  home.packages = with pkgs; [ 
    starship
    lua 
    gcc 
    rofi 
    python3 
    i3blocks-gaps
    playerctl
    polybarFull
    picom
    pre-commit
    dynamips
    ubridge
    inetutils
    jdt-language-server
    bash-language-server
    sqls
    nixd
    steam
    bash-completion

    jetbrains.webstorm
  ];
}

