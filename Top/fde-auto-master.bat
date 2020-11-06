@echo off
@REM setlocal EnableDelayedExpansion

set sharePath=.\Design_Compiler
set SMIMSPath=D:\Program_Files\SMIMS\

if exist %sharePath%\DC-Done.txt (
    del /f %sharePath%\DC-Done.txt
)

for /f "skip=1" %%s in (modules.txt) do (
    copy /Y ..\%%s\%%s.v .\%%s.v
)

for /f %%s in (modules.txt) do (
    copy /Y .\%%s.v %sharePath%\v_src\%%s.v
)

echo FDE_Rex_Runner > %sharePath%\DC-Start.txt

echo waiting for Design Compiler...

:loop

.\sleepx.exe 1

if exist %sharePath%\DC-Done.txt (
    echo Design Compiler responed.
    del /f %sharePath%\DC-Done.txt
    copy /Y %sharePath%\result\FDE_Rex_Runner_gate.v .\FDE_Rex_Runner_gate.v
    del /f %sharePath%\result\FDE_Rex_Runner_gate.v
) else (
    goto loop
)

copy /Y .\FDE_Rex_Runner_gate.v .\FDE\src\FDE_Rex_Runner_gate.v 

echo Please manually convert FDE_Rex_Runner_gate.v to FDE_Rex_Runner_gate.xml (in the same directory)

CALL %SMIMSPath%\tools\HDLAutoAssignFD\HDLAutoAssign.exe

copy /Y .\FDE_Rex_Runner_gate.xml .\FDE\src\FDE_Rex_Runner_gate.xml

echo File "FDE_Rex_Runner_gate.v" and "FDE_Rex_Runner_gate.xml" updated.


echo Source files have been copied.
echo Now please run FDE and generated .bit file.
echo Remind to change place/route constraint file in FDE compile configure, if you copied this whole project.

:loop2

.\sleepx.exe 1

if exist .\FDE\FDE_fde_dc.bit (
    echo FDE has done its work.
    copy /Y .\FDE\FDE_fde_dc.bit .\FDE_Rex_Runner_fde_dc.bit
    del .\FDE\FDE_fde_dc.bit
) else (
    goto loop2
)

echo Successful.

:end