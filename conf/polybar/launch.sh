#!/bin/bash

# Terminate already running bar instances
killall -q polybar

# Launch bar1
echo "---" | tee -a /tmp/polybar1.log
polybar bar1 2>&1 | tee -a /tmp/polybar1.log & disown

# Launch bar2
echo "---" | tee -a /tmp/polybar2.log
polybar bar2 2>&1 | tee -a /tmp/polybar2.log & disown

echo "Bars launched..."
