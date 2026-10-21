{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # Outils globaux
    pre-commit
    nixd
    sqls
    bash-language-server

    # C / C++
    gcc
    glibc.dev
    gnumake
    cmake
    pkg-config
    gdb
    valgrind
    clang
    clang-tools
    llvm

    # Python
    python3
    python3Packages.python-lsp-server

    # Java
    zulu
    maven
    jetbrains.idea-ultimate
    jdt-language-server

    # Web / JS
    nodejs
    jetbrains.webstorm

    # Lua
    lua
    lua-language-server

    # Swift
    swift
    sourcekit-lsp

    # OCaml
    ocaml
    ocamlformat
    ocamlPackages.ocaml-lsp
  ];
}
