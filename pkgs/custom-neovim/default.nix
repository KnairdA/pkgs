{ pkgs, ... }:

pkgs.neovim.override {
  vimAlias  = false;
  configure = import ../custom-vim/custom.nix { pkgs = pkgs; };
}
