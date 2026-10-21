{ pkgs, ... }:
{
  home.packages = with pkgs; [
    rofi
    picom
    polybarFull
    i3blocks-gaps
    playerctl
    pcmanfm
    feh
    networkmanagerapplet
    brightnessctl
    pulseaudio
  ];
}
