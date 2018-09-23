{ system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  callPackage = pkgs.lib.callPackageWith (pkgs // custom);
  custom = {
    custom-vim = callPackage ./pkgs/custom-vim { };

    modem-manager-gui = callPackage ./pkgs/modem-manager-gui { };

    oomox-gtk-theme            = callPackage ./pkgs/oomox-gtk-theme { };
    oomox-archdroid-icon-theme = callPackage ./pkgs/oomox-archdroid-icon-theme { };

    KaTeX = callPackage ./pkgs/KaTeX { };

    InputXSLT  = callPackage ./pkgs/xslt/InputXSLT { };
    StaticXSLT = callPackage ./pkgs/xslt/StaticXSLT { };
    BuildXSLT  = callPackage ./pkgs/xslt/BuildXSLT { };
    makeweb    = callPackage ./pkgs/xslt/makeweb { };
  };
in custom
