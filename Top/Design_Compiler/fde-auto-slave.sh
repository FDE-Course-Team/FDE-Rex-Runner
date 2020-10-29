sharePath=.

while true
do
    sleep 1s
    if [ -f "$sharePath/DC-Start.txt" ]; then
        echo DC-Start
        rm "$sharePath/DC-Start.txt"
        dc_shell -x "source compile.tcl > compile.log ; exit"
        echo Driver > "$sharePath/DC-Done.txt"
    fi
done