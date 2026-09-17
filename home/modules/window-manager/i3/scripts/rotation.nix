{ pkgs, ... }:

pkgs.writeShellScriptBin "rotation" ''
  #!/usr/bin/env bash

  SCREEN="eDP-1"

  CURRENT=$(${pkgs.xorg.xrandr}/bin/xrandr --query | ${pkgs.gnugrep}/bin/grep "^$SCREEN" | ${pkgs.gawk}/bin/awk '{print $5}')

  if [ "$CURRENT" = "inverted" ]; then
      ${pkgs.xorg.xrandr}/bin/xrandr --output "$SCREEN" --rotate normal
  else
      ${pkgs.xorg.xrandr}/bin/xrandr --output "$SCREEN" --rotate inverted
  fi
''
