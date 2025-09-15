{ config, pkgs, ... }:

{
  home.username = "corentin";
  home.homeDirectory = "/home/corentin";

  programs.git.enable = true;
  home.stateVersion = "25.05";

  programs.bash.enable = true;
  programs.bash.shellAliases = {
  };

  home.file.".config/i3".source = ./config/i3;
  home.file.".config/nvim".source = ./config/nvim;

  home.packages = with pkgs; [
    neovim
    ripgrep
    nil
    nixpkgs-fmt
    gcc
  ];
}
