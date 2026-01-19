{ config, pkgs, ... }: 

let 
dotfiles = "${config.home.homeDirectory}/nixos-dotfiles/config";
create_symlink = path: config.lib.file.mkOutOfStoreSymlink path;
configs = { 
    # Folders
    i3 = "i3";
    nvim = "nvim";
    alacritty = "alacritty";
    rofi = "rofi";
    i3blocks = "i3blocks";
    polybar = "polybar";
    picom = "picom";
    fastfetch = "fastfetch";

    # Files
    "starship.toml" = "starship.toml";
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
        enableCompletion = true;
        shellAliases = {
            nr = "sudo nixos-rebuild switch --flake ~/nixos-dotfiles#corentin";
        };
        bashrcExtra = ''
            export PGDATA="$HOME/postgres_data"
            export PGHOST="/tmp"
        '';
    };

    programs.git = {
        enable = true;
        userName  = "IDeltaCocoI";
        userEmail = "corentin.louis74@gmail.com";
        extraConfig = {
            core.editor = "nvim";
        };
    };

    programs.starship = {
        enable = true;
    };

    home.file.".config/home-manager/home.nix".source = create_symlink "${config.home.homeDirectory}/nixos-dotfiles/home.nix";

    xdg.configFile = builtins.mapAttrs (name: subpath: { 
            source = create_symlink "${dotfiles}/${subpath}"; 
            recursive = true;
            }) configs; 

    home.packages = with pkgs; [ 
        alacritty
        starship
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
        dynamips
        ubridge
        inetutils
        jdt-language-server
        bash-language-server
        sqls
        nixd
        steam
        bash-completion
    ];
}

