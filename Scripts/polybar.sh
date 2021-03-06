
# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -x polybar >/dev/null; do sleep 1; done

MONITOR_LIST=$(xrandr --listmonitors | sed '1 d' | awk 'NF>1{print $NF}')

# Launch polybar


for mon in $MONITOR_LIST; do
    if [ $mon == 'VGA-0' ] 
    then        
        env MONITOR=$mon polybar example &
    else
        env MONITOR=$mon polybar example1 &
    fi
    echo "Launching on monitor $mon"
done