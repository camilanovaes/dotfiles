#! /bin/sh

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch bar
polybar example 2>&1 | tee -a /tmp/polybar.log & disown

if [[ $(xrandr -q | grep 'HDMI-A-0 connected') ]]; then
	polybar top_external 2>&1 | tee -a /tmp/polybar.log & disown
fi
