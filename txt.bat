@echo off
    SETLOCAL=ENABLEDELAYEDEXPANSION

    rename text.file text.tmp
    for /f %%a in (text.tmp) do (
        set foo=%%a
        if !foo!==ex3 set foo=ex5
        echo !foo! >> text.file) 
del text.tmp
