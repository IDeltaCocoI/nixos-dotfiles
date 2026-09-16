{ config, pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    defaultKeymap = "viins";
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      nr = "sudo nixos-rebuild switch --flake ~/nixos-dotfiles#corentin";
      icat = "kitty +kitten icat";
    };

    initContent = ''
      export PGDATA="$HOME/postgres_data"
      export PGHOST="/tmp"
      export PGPORT="5432"
    '';
  };
}
