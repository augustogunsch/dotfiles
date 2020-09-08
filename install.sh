#!/bin/sh
mydir=$(dirname "$0")
mydir=$(realpath "$mydir")

if [ ! "$mydir" = "$HOME/dotfiles" ]; then
	mv "$mydir" "$HOME/dotfiles"
	mydir="$HOME/dotfiles"
fi

install() {
	ln "$mydir/$1" "$HOME/.$1" -f
}

installto() {
	ln "$mydir/$1" "$2" -f
}

install tmux.conf
install zshrc
