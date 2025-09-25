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
  }; 
in 

{ 
  home.username = "corentin"; 
  home.homeDirectory = "/home/corentin"; 
  
  programs.git.enable = true; 
  home.stateVersion = "25.05"; 
  
  programs.bash = { 
    enable = true; 
    shellAliases = { 
      nr = "sudo nixos-rebuild switch --flake ~/nixos-dotfiles#corentin"; 
      xterm = "alacritty";
    }; 
  };

  xdg.configFile = builtins.mapAttrs (name: subpath: { 
    source = create_symlink "${dotfiles}/${subpath}"; 
    recursive = true; 
  }) configs; 

  home.packages = with pkgs; [ 
    alacritty
    
    # Neovim pkgs
    neovim 
    ripgrep
    fd
    nodejs
    lua
    luarocks
    tree-sitter
    xclip
    clang-tools
    
    nil 
    nixpkgs-fmt 
    gcc 
    gnumake 
    rofi 
    python3 
    i3blocks-gaps
    alsa-utils 
    playerctl
    polybarFull 
  ];

  programs.neovim = {
    plugins = with pkgs.vimPlugins; [
      vim-nix
      vim-fugitive
    ];
  };
}

