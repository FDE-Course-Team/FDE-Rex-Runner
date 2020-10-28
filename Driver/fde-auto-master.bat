@echo off
@REM setlocal EnableDelayedExpansion

set sharePath=.\Design_Compiler
set SMIMSPath=D:\Program_Files\SMIMS\

copy /Y .\Driver.v %sharePath%\v_src\Driver.v

echo Driver > %sharePath%\DC-Start.txt

:loop

sleepx 1

if exist %sharePath%\DC-Done.txt (
    del %sharePath%\DC-Done.txt
    copy /Y %sharePath%\result\Driver_gate.v .\Driver_gate.v
    del %sharePath%\result\Driver_gate.v
) else (
    echo waiting...
    goto loop
)

copy /Y .\Driver_gate.v .\FDE\src\Driver_gate.v 

echo Please manually convert Driver_gate.v to Driver_gate.xml (in the same directory)

CALL %SMIMSPath%\tools\HDLAutoAssignFD\HDLAutoAssign.exe

copy /Y .\Driver_gate.xml .\FDE\src\Driver_gate.xml

echo File "Driver_gate.v" and "Driver_gate.xml" updated.


echo Source files have been copied.
echo Now please run FDE and generated .bit file.

pause

copy /Y .\FDE\FDE_fde_dc.bit .\Driver_fde_dc.bit

:end