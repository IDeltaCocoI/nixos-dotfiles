{ pkgs, ... }:
{
  home.packages = with pkgs; [
    kitty
    starship
    bash-completion
    btop
    fastfetch
    tree
    ripgrep
    fd
    xclip
    maim
    xclicker
    wget
  ];
}
