#!/bin/sh

cp -r ~/nixos-dotfiles/config/i3 ~/.config

nix shell github:nix-community/home-manager --command home-manager switch --flake ~/nixos-dotfiles#epita;
i3-msg reload
