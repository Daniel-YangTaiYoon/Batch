@echo off

set lineno=404
set monocolor=1st
set /A machineno=1

:copy
xcopy "Demura to Main.bat" "Demura to Main %lineno%L %monocolor% #%machineno%.bat" /I /Y
if %machineno%==12 (goto :changemonocolor)
set /A machineno+=1
goto :copy

:changemonocolor
if %monocolor%==2nd (goto :end)
set monocolor=2nd
set /A machineno=1
goto :copy

:end
pause
