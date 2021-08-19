{
  description = "Custom derivations of Adrian Kummerlaender";

  inputs = {
    nixpkgs.url = github:NixOS/nixpkgs/nixos-21.05;
  };

  outputs = { self, nixpkgs, ... }: let
    pkgs = import nixpkgs { system = "x86_64-linux"; };
  in {
    custom-neovim = import ./pkgs/custom-neovim { inherit pkgs; };

    katex-wrapper = import ./pkgs/katex-wrapper { inherit pkgs; };

    input-xslt  = import ./pkgs/xslt/input-xslt  { inherit pkgs; };
    build-xslt  = import ./pkgs/xslt/build-xslt  { inherit pkgs; };
    static-xslt = import ./pkgs/xslt/static-xslt { inherit pkgs; };
    make-xslt   = import ./pkgs/xslt/make-xslt   { inherit pkgs; };

    persistent-nix-shell = import ./pkgs/persistent-nix-shell { inherit pkgs; };

    customizable = {
      oomox-gtk-theme            = t : import ./pkgs/oomox-gtk-theme { inherit pkgs; theme = t; };
      oomox-archdroid-icon-theme = c : import ./pkgs/oomox-archdroid-icon-theme { inherit pkgs; color = c; };
    };
  };
}
