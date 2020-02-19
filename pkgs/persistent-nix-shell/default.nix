{ stdenv, pkgs, ... }:

pkgs.writeTextFile {
  name        = "persistent-nix-shell";
  executable  = true;
  destination = "/bin/persistent-nix-shell";

  text = builtins.readFile ./persistent-nix-shell.sh;
}
