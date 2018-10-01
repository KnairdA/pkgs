# Nix package repository

Custom [Nix](https://nixos.org/nix/) derivations describing how to build [projects](https://tree.kummerlaender.eu/projects) of mine as well as various software used by my [NixOS](https://code.kummerlaender.eu/nixos_system) [system](https://code.kummerlaender.eu/nixos_home).

Individual derivations are available on [code.kummerlaender.eu](https://code.kummerlaender.eu/pkgs/).

## Usage

Installing e.g. my XSLT based [static site generator](https://tree.kummerlaender.eu/projects/xslt) is as simple as:

```sh
nix-env -f "https://pkgs.kummerlaender.eu/nixexprs.tar.gz" -iA make-xslt
```

Alternatively one may add _pkgs.kummerlaender.eu_ as a Nix channel:

```sh
nix-channel --add https://pkgs.kummerlaender.eu/nixexprs.tar.gz mypkgs
nix-channel --update
nix-env -iA mypkgs.InputXSLT
```

## Packages

Projects of my own:

* [xslt/input-xslt](http://tree.kummerlaender.eu/projects/xslt/input_xslt/)
* [xslt/static-xslt](http://tree.kummerlaender.eu/projects/xslt/static_xslt/)
* [xslt/build-xslt](http://tree.kummerlaender.eu/projects/xslt/build_xslt/)
* [xslt/make-xslt](https://code.kummerlaender.eu/pkgs/tree/pkgs/xslt/make-xslt/default.nix)

Configurations of my own:

* [custom-vim](https://code.kummerlaender.eu/pkgs/tree/pkgs/custom-vim)

Projects neither of my own nor of my configuration:

* [modem-manger-gui](https://linuxonly.ru/page/modem-manager-gui)
* [oomox-archdroid-icon-theme](https://github.com/themix-project/oomox)
* [oomox-gtk-theme](https://github.com/themix-project/oomox)
* [katex-wrapper](https://code.kummerlaender.eu/pkgs/tree/pkgs/katex-wrapper/default.nix)
