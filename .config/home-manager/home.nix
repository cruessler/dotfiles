# This file was initially created following:
# https://nix-community.github.io/home-manager/index.xhtml
#
# Use `nix-channel --update; and home-manager switch` to update packages.
{ config, pkgs, ... }:

# https://nix-community.github.io/home-manager/index.xhtml#_how_do_i_install_packages_from_nixpkgs_unstable
let
  pkgsUnstable = import <unstable> { };
in
{
  home.username = "christoph";
  home.homeDirectory = "/home/christoph";

  home.stateVersion = "25.11";

  home.packages = [
    pkgs.broot
    pkgsUnstable.bottom
    pkgs.delta
    pkgs.difftastic
    pkgs.eza
    pkgs.fd
    pkgs.fzf
    pkgs.hyperfine
    pkgsUnstable.neovim
    pkgs.poop
    pkgs.ripgrep
    pkgs.samply
    pkgs.starship
    pkgs.stylua
    pkgs.tokei
    pkgs.zoxide

    pkgs.cargo-deny
    pkgs.cargo-diet
    pkgsUnstable.cargo-fuzz
    pkgs.cargo-insta
    pkgsUnstable.cargo-mutants
    pkgs.cargo-nextest
    pkgs.cargo-sort
    pkgs.cargo-watch

    pkgs.khal
    pkgs.khard
    pkgs.vdirsyncer

    pkgs.zellij
  ];

  programs.home-manager.enable = true;
}
