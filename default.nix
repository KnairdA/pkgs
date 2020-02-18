{ system ? builtins.currentSystem, pkgs ? import <nixpkgs> { inherit system; }, ... }:

let
  callPackage = pkgs.lib.callPackageWith (pkgs // custom);

  custom = {
    custom-neovim = callPackage ./pkgs/custom-neovim { };

    oomox-gtk-theme            = t : callPackage ./pkgs/oomox-gtk-theme { theme = t; };
    oomox-archdroid-icon-theme = c : callPackage ./pkgs/oomox-archdroid-icon-theme { color = c; };

    katex-wrapper = callPackage ./pkgs/katex-wrapper { };

    input-xslt  = callPackage ./pkgs/xslt/input-xslt  { };
    build-xslt  = callPackage ./pkgs/xslt/build-xslt  { };
    static-xslt = callPackage ./pkgs/xslt/static-xslt { };
    make-xslt   = callPackage ./pkgs/xslt/make-xslt   { };

    persistent-nix-shell = callPackage ./pkgs/persistent-nix-shell { };
  };
in custom
