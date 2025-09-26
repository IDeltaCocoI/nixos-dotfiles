#!/bin/sh

rm -rf ~/.config/i3
nix shell github:nix-community/home-manager --command home-manager switch --flake ~/nixos-dotfiles#corentin

