{ config, pkgs, ... }:

let
  dotfiles = "${config.home.homeDirectory}/nixos-dotfiles/config";
  create_symlink = path: config.lib.file.mkOutOfStoreSymlink path;
  configs = {
    i3 = "i3";
    nvim = "nvim";
    alacritty = "alacritty";
    rofi = "rofi";
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
    };
  };

  xdg.configFile = builtins.mapAttrs (name: subpath: {
    source = create_symlink "${dotfiles}/${subpath}";
    recursive = true;
  }) configs;

  home.packages = with pkgs; [
    neovim
    ripgrep
    nil
    nixpkgs-fmt
    gcc
    rofi
  ];
}
