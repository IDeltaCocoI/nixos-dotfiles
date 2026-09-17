{ pkgs, ... }:

pkgs.writeShellScriptBin "polybar" ''
  #!/usr/bin/env bash

  ${pkgs.coreutils}/bin/sleep 1
  ${pkgs.polybar}/bin/polybar ghost &
  
  if ${pkgs.xorg.xrandr}/bin/xrandr | ${pkgs.gnugrep}/bin/grep -q "eDP-1 connected"; then
      ${pkgs.polybar}/bin/polybar i3_bar_laptop
  else
      ${pkgs.polybar}/bin/polybar i3_bar
  fi
''
