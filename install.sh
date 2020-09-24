#!/bin/sh
mydir=$(dirname "$0")
mydir=$(realpath "$mydir")

if [ ! "$mydir" = "$HOME/dotfiles" ]; then
	mv "$mydir" "$HOME/dotfiles"
	mydir="$HOME/dotfiles"
fi

install() {
	ln "$mydir/$1" "$HOME/.$1" -sf
}

installto() {
	mkdir -p "$HOME/$2"
	ln "$mydir/$1" "$HOME/$2/$1" -sf
}

install tmux.conf
install zshrc
install xinitrc
install wallpaper.png
installto picom.conf .config/picom
