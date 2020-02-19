#!/bin/sh -eu

mkdir -p .gcroots

inherit_shell=''
update=''

while getopts 'su' flag; do
	case "${flag}" in
		s) inherit_shell='true' ;;
		u) update='true' ;;
	esac
done

if [[ ! -f "$PWD/.gcroots/shell.drv" || $update ]]; then
	nix-instantiate shell.nix --indirect --add-root $PWD/.gcroots/shell.drv > /dev/null
	nix-store -r $(nix-store --query --references $PWD/.gcroots/shell.drv) --indirect --add-root $PWD/.gcroots/shell.dep > /dev/null
fi

# Fix to prevent implicit interactiveBash dependency
export NIX_BUILD_SHELL=/run/current-system/sw/bin/bash

if [ $inherit_shell ]; then
	exec nix-shell $(readlink $PWD/.gcroots/shell.drv) --command $SHELL
else
	exec nix-shell $(readlink $PWD/.gcroots/shell.drv)
fi
