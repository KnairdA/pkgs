{ pkgs, ... }:

pkgs.writeShellScriptBin
  "persistent-nix-shell"
  (builtins.readFile ./persistent-nix-shell.sh)
