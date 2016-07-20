#! /bin/sh
pactl load-module module-jack-sink channels=2
pactl load-module module-jack-source channels=2
pacmd set-default-sink jack_out
pacmd set-default-source jack_in

sudo schedtool -R -p 20 `pidof jackdbus`
jack_control eps realtime true
jack_control dps rate 48000
jack_control dps nperiods 2
jack_control period 64

a2jmidid -e &
