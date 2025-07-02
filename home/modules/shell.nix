{ config, pkgs, lib, ... }:

{
  home.packages = lib.mkAfter [
    pkgs.eza
    pkgs.fzf
    pkgs.zoxide

    pkgs.micro

    pkgs.fastfetch
    pkgs.oh-my-posh

    pkgs.cloc
  ];

  home.file = {
    ".zshrc" = {
      source = ../config/shell/zshrc;
    };

    ".zsh-aliases.zsh" = {
      source = ../config/shell/zsh-aliases.zsh;
    };

    ".oh-my-posh.json" = {
      source = ../config/shell/oh-my-posh.json;
    };

    ".config/fastfetch.jsonc" = {
      source = ../config/shell/fastfetch.jsonc;
    };
  };
}
