{ pkgs, theme, ... }:

{
  lock = import ./i3lock.nix { inherit pkgs; inherit theme; };
  polybar = import ./polybar.nix { inherit pkgs; };
  rotation = import ./rotation.nix { inherit pkgs; };
}
