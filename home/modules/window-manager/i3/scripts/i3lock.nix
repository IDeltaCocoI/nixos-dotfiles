{ pkgs, theme, ... }:

pkgs.writeShellScriptBin "lock" ''
  #!/usr/bin/env bash

  while true; do
      ${pkgs.i3lock}/bin/i3lock -i ${theme.lockWallpaper}
      
      SECONDS=0
      while [ $SECONDS -lt 3000 ]; do
          if ! ${pkgs.procps}/bin/pgrep i3lock > /dev/null; then
              exit 0
          fi
          
          sleep 1
      done
      
      ${pkgs.procps}/bin/pkill i3lock
  done
''
