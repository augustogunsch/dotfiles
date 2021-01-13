xset s off -dpms

unclutter &
picom &
dunst &
feh --bg-fill ~/.wallpaper.png
lxpolkit &
dwm_bar &
exec dwm
xdg-mime default mupdf.desktop application/pdf
xdg-mime default feh.desktop image/png
xdg-mime default feh.desktop image/jpg
