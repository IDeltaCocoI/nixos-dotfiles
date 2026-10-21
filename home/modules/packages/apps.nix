{ pkgs, ... }:
{
  home.packages = with pkgs; [
    discord
    vencord
    spotify
    protonvpn-gui
    parsec-bin
    steam
  ];
}
