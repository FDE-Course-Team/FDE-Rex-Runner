@echo off

echo I assume you have updated file "test_gate.v" and "test_gate.xml".

pause

copy /Y .\test_gate.v .\test\src\test_gate.v 
copy /Y .\test_gate.xml .\test\src\test_gate.xml

echo Source files have been copied.
echo Now I assume you have run FDE and generated .bit file.

pause

copy /Y .\test\test_fde_dc.bit .\test_fde_dc.bit