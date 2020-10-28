@echo off

echo I assume you have updated file "Driver_gate.v" and "Driver_gate.xml".

pause

copy /Y .\Driver_gate.v .\FDE\Driver\src\Driver_gate.v 
copy /Y .\Driver_gate.xml .\FDE\Driver\src\Driver_gate.xml

echo Source files have been copied.
echo Now I assume you have run FDE and generated .bit file.

pause

copy /Y .\FDE\Driver\Driver_fde_dc.bit .\Driver_fde_dc.bit