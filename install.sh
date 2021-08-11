#!/bin/sh
cd "$(dirname "$0")"
PWD="$(pwd)"

#dotfiles from
#~/.config
for f in config/*; do
	mkdir -p "$HOME/.$f"
	for d in $f/*; do
		ln -sf "$PWD/$d" "$HOME/.$d"
	done
done

#dotfiles from
#~
for f in home/*; do
	ln -sf "$PWD/$f" "$HOME/.$(basename $f)"
done

#scripts
#~/.local/bin
mkdir -p "$HOME/.local/bin"
for f in local/bin/*; do
	ln -sf "$PWD/$f" "$HOME/.$f"
done
