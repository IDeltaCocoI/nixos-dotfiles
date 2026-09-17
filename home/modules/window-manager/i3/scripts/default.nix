{ pkgs, ... }:

{
  lock = import ./i3lock.nix { inherit pkgs; };
  polybar = import ./polybar.nix { inherit pkgs; };
  rotation = import ./rotation.nix { inherit pkgs; };
}
