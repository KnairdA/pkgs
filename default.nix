{ system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };

  callPackage = pkgs.lib.callPackageWith (pkgs // custom);

  custom = {
    custom-vim    = callPackage ./pkgs/custom-vim    { };
    custom-neovim = callPackage ./pkgs/custom-neovim { };

    modem-manager-gui = callPackage ./pkgs/modem-manager-gui { };

    oomox-gtk-theme            = t : callPackage ./pkgs/oomox-gtk-theme { theme = t; };
    oomox-archdroid-icon-theme = c : callPackage ./pkgs/oomox-archdroid-icon-theme { color = c; };

    katex-wrapper = callPackage ./pkgs/katex-wrapper { };

    input-xslt  = callPackage ./pkgs/xslt/input-xslt  { };
    build-xslt  = callPackage ./pkgs/xslt/build-xslt  { };
    static-xslt = callPackage ./pkgs/xslt/static-xslt { };
    make-xslt   = callPackage ./pkgs/xslt/make-xslt   { };
  };
in custom
