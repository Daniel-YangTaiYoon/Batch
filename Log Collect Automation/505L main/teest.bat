@echo off
FORFILES /p "\\192.168.3.13\Program\RVS" /S /M "daniel" /D -30 /C "cmd /c IF @isdir == TRUE rd /S /Q @path"
pause