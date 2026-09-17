{ config, pkgs, ... }:

let
  wallpapersPath = "${config.home.homeDirectory}/nixos-dotfiles/home/modules/theming/wallpapers";

  wallpaper = "hollow_knight.png";
  lockWallpaper = "rennala_arena.jpg";
in
{
  _module.args.theme = {
    font = {
      name = "0xProto Nerd Font";
      package = pkgs.nerd-fonts._0xproto;
      size = 12.0;
    };

    wallpaper = "${wallpapersPath}/${wallpaper}";
    lockWallpaper = "${wallpapersPath}/${lockWallpaper}";
  };
}
