{ pkgs, ... }:

{
  home.packages = with pkgs; [
    gns3-server
    gns3-gui
    dynamips
    ubridge
    socat
    inetutils
  ];
}
