{
  programs.zsh = {
    enable = true;
    defaultKeymap = "emacs";
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    completionInit = ''
      setopt complete_in_word
      zstyle ':completion:*' special-dirs true
      setopt auto_param_slash
      unsetopt menu_complete
      setopt auto_menu
    '';

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
