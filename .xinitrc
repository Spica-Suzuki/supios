# Statusbar loop
while true; do
   xsetroot -name "$(date +"%F %R" )"
   sleep 1m    # Update time every minute
done &
numlockx &
~/.fehbg &
#volumeicon &
exec dwmng
#exec dwm

#DESKTOP_SESSION=plasma
#exec startplasma-x11


#exec awesome
#exec i3
#exec startdde



#while true; do
#	tint2
#done &
#exec mutter
