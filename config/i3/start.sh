#!/bin/sh

alacritty -e bash -c "
echo 'Suppression de ~/.config/i3...';
rm -rf ~/.config/i3;

echo 'Lancement de Home Manager...';
nix shell github:nix-community/home-manager --command home-manager switch --flake ~/nixos-dotfiles#corentin;

echo 'Reload de i3...';
i3-msg reload

echo 'Terminé !';
read -p 'Appuyez sur Entrée pour fermer le terminal...'
"

