#!/bin/bash

REPO="git@github.com:IDeltaCocoI/nixos-dotfiles.git"
TARGET="~/afs/nixos-dotfiles"

[ -d "$TARGET" ] && rm -rf "$TARGET"

git clone "$REPO" "$TARGET"

