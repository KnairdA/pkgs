{ system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };

  callPackage = pkgs.lib.callPackageWith (pkgs // custom);

  custom = {
    custom-vim = callPackage ./pkgs/custom-vim { };

    modem-manager-gui = callPackage ./pkgs/modem-manager-gui { };

    oomox-gtk-theme            = callPackage ./pkgs/oomox-gtk-theme { };
    oomox-archdroid-icon-theme = callPackage ./pkgs/oomox-archdroid-icon-theme { };

    katex-wrapper = callPackage ./pkgs/katex-wrapper { };

    input-xslt  = callPackage ./pkgs/xslt/input-xslt  { };
    build-xslt  = callPackage ./pkgs/xslt/build-xslt  { };
    static-xslt = callPackage ./pkgs/xslt/static-xslt { };
    make-xslt   = callPackage ./pkgs/xslt/make-xslt   { };
  };
in custom
