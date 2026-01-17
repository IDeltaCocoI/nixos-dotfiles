{ config, pkgs, ... }: 

let 
dotfiles = "${config.home.homeDirectory}/nixos-dotfiles/config";
create_symlink = path: config.lib.file.mkOutOfStoreSymlink path;
configs = { 
    # Folders
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
        username = "corentin.louis"; 
        homeDirectory = "/home/corentin.louis"; 
        stateVersion = "25.05"; 
    };

    programs.bash = {
        enable = true;
        enableCompletion = true;
    };

    programs.starship = {
        enable = true;
    };

    home.file.".config/home-manager/epita.nix".source = create_symlink "${config.home.homeDirectory}/nixos-dotfiles/epita.nix";

    xdg.configFile = builtins.mapAttrs (name: subpath: {
            source = create_symlink "${dotfiles}/${subpath}";
            recursive = true;
            }) configs;

    nixpkgs.config.allowUnfree = true;
    home.packages = with pkgs; [
        alacritty
        starship
        btop
        brightnessctl
        neovim
        lua
        gcc 
        rofi 
        i3blocks-gaps
        pulseaudio
        playerctl
        polybarFull
        picom
        fastfetch
        pre-commit
        jdt-language-server
        bash-language-server
        sqls
        nixd
        spotify
        graphviz
        bison
        bash-completion

        #Font
        nerd-fonts.jetbrains-mono
    ];
}

