{ pkgs, ... }:

let
  plugins = pkgs.callPackage ./plugins.nix {};

in pkgs.neovim.override {
  vimAlias  = true;
  configure = {
    customRC = builtins.readFile ./asset/rc.vim;

    packages.myVimPackage = with pkgs.vimPlugins // plugins; {
      start = [
      # UI enhancements
        airline
        goyo

      # autocomplete
        LanguageClient-neovim
        deoplete-nvim

      # load project specific config
        vim-localvimrc

      # colors, syntax highlighting
        vim-color-akr
        vim-polyglot
        vim-addon-nix

      # file, buffer management
        ctrlp
        vim-counterpoint
        vim-signature

      # undo history tree
        vim-mundo

      # editing enhancements
        vim-unimpaired
        vim-wordmotion
        vim-autoformat
        vim-sandwich
        far

      # git integration
        vim-gitgutter
        gina

      ];
    };
  };
}
