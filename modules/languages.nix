{ config, lib, pkgs, ... }:
{
    nixpkgs.config.allowUnfree = true;
    environment.systemPackages = with pkgs; [
        # C 
        clang 
        clang-tools 
        gcc 
        glibc.dev 
        llvm 
        gnumake 
        cmake 
        pkg-config
        gdb 
        valgrind

        # Swift
        swift
    ];
}
