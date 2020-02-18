{ stdenv, pkgs, ... }:

pkgs.writeTextFile {
  name        = "persistent-nix-shell";
  executable  = true;
  destination = "/bin/persistent-nix-shell";

  text = ''
    #!/bin/sh -eu

    mkdir -p .gcroots

    nix-instantiate shell.nix --indirect --add-root $PWD/.gcroots/shell.drv > /dev/null
    nix-store -r $(nix-store --query --references $PWD/.gcroots/shell.drv) --indirect --add-root $PWD/.gcroots/shell.dep > /dev/null

    # Fix to prevent implicit interactiveBash dependency
    export NIX_BUILD_SHELL=/run/current-system/sw/bin/bash
    exec nix-shell $(readlink $PWD/.gcroots/shell.drv) "$@"
  '';
}
