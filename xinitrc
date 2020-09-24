xset s off -dpms

picom &
feh --bg-fill ~/.wallpaper.png
dwmstatus &
lxpolkit &
exec dwm
