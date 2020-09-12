
nitrogen --restore &

export PATH="${PATH}:$HOME/.scripts"

tint2 &

~/keyboard.sh

fbxkb &

urxvtd -q &

#~/conkystartup.sh
sleep 10 && /usr/bin/conky-session &

pnmixer &

compton -cC -i 0.85 -e 0.85 -m 0.9 -r 4 -l -4 -t -4 &
# $HOME/bin/start-compton.sh &

# Start screensaver
xscreensaver -no-splash &
