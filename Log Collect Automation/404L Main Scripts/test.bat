@echo on
forfiles /p "D:\Program\RVS\Demura Log Collect" /s /d -5 /m "*Log" /c "cmd /c IF @isdir == TRUE rd /s /q @path
pause