{ pkgs, ... }:

let
  custom-vim = pkgs.vim_configurable.customize {
    name        = "vim";
    vimrcConfig = (import ./custom.nix { pkgs = pkgs; });
  };
in pkgs.lib.overrideDerivation custom-vim ( o: {
    gui = "gtk3";
} )
