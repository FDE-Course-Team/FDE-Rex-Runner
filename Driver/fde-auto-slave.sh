sharePath=/mnt/hgfs/share/

while true
do
    sleep 1s
    if [ -f "$sharePath/Driver/DC-Start.txt" ]; then
        echo DC-Start
        rm "$sharePath/Driver/DC-Start.txt"
        dc_shell -x "source compile.tcl ; exit"
        echo Driver > "$sharePath/Driver/DC-Done.txt"
    fi
done