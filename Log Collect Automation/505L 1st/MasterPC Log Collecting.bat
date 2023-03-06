@echo off
@echo on
:: This file is for Master PC
:: Will collect Log files from each Main PC

:: Set Date
set day=-1
echo >"%temp%\%~n0.vbs" s=DateAdd("d",%day%,now) : d=weekday(s)
echo>>"%temp%\%~n0.vbs" WScript.Echo year(s)^& right(100+month(s),2)^& right(100+day(s),2)
for /f %%a in ('cscript /nologo "%temp%\%~n0.vbs"') do set "result=%%a"
del "%temp%\%~n0.vbs"
set "YYYY=%result:~0,4%"
set "MM=%result:~4,2%"
set "DD=%result:~6,2%"
set "result=%yyyy%-%mm%-%dd%"

:: Line Setting
set Lineno=505
set monocolor=1st

:: Set Main PC IP
set ip406L_1st_1=10.121.43.144
set ip406L_1st_2=10.121.43.145
set ip406L_1st_3=10.121.43.148
set ip406L_1st_4=10.121.43.157
set ip406L_1st_5=10.121.43.158
set ip406L_1st_6=10.121.43.164
set ip406L_1st_7=10.121.43.166
set ip406L_1st_8=10.121.43.168
set ip406L_1st_9=10.121.43.169
set ip406L_1st_10=10.121.43.170
set ip406L_1st_11=10.121.43.171
set ip406L_1st_12=10.121.43.192
set ip404L_1st_1=10.121.43.77
set ip404L_1st_2=10.121.43.78
set ip404L_1st_3=10.121.43.79
set ip404L_1st_4=10.121.43.80
set ip404L_1st_5=10.121.43.81
set ip404L_1st_6=10.121.43.82
set ip404L_2nd_7=10.121.43.83
set ip404L_2nd_8=10.121.43.84
set ip404L_2nd_9=10.121.43.85
set ip404L_2nd_10=10.121.43.86
set ip404L_2nd_11=10.121.43.87
set ip404L_2nd_12=10.121.43.88
set ip505L_1st_1=10.121.56.120
set ip505L_1st_2=10.121.56.118
set ip505L_1st_3=10.121.56.119
set ip505L_1st_4=10.121.56.117
set ip505L_1st_5=10.121.56.116
set ip505L_1st_6=10.121.56.114
set ip505L_1st_7=10.121.56.115
set ip505L_1st_8=10.121.56.113
set ip505L_1st_9=10.121.56.112
set ip505L_1st_10=10.121.56.110
set ip505L_1st_11=10.121.56.111
set ip505L_1st_12=10.121.56.109
set ip505L_2nd_1=10.121.56.125
set ip505L_2nd_2=10.121.56.132
set ip505L_2nd_3=10.121.56.131
set ip505L_2nd_4=10.121.56.126
set ip505L_2nd_5=10.121.55.211
set ip505L_2nd_6=10.121.56.129
set ip505L_2nd_7=10.121.56.124
set ip505L_2nd_8=10.121.54.144
set ip505L_2nd_9=10.121.56.128
set ip505L_2nd_10=10.121.56.127
set ip505L_2nd_11=10.121.56.122
set ip505L_2nd_12=10.121.56.121



:: Set MasterPC log collecting folder name ex) 20230227 406L 1st Log
set Masterfld=%YYYY%%MM%%DD% %Lineno%L %monocolor% Log


:: Set Machine No
set /A Machineno=1

:: Main Script
:Main_Script
:: Set Main Folder and IP
set Mainfld=%YYYY%%MM%%DD% %Lineno%L %monocolor% #%Machineno% Log
set ipip=ip%Lineno%L_%monocolor%_%Machineno%
call set "ip=%%%ipip%%%"
if %machineno%==13 (goto :monocolorcheck) else (goto :pingcheck)

:monocolorcheck
if %monocolor%==1st (goto :Main_Script2) else (goto :end)

:Main_Script2
if %Machineno%==13 (set /A machineno=1) else (goto :Main_Script2_1)

:Main_Script2_1
set monocolor=2nd
set Mainfld=%YYYY%%MM%%DD% %Lineno%L %monocolor% #%Machineno% Log
set ipip=ip%Lineno%L_%monocolor%_%Machineno%
call set "ip=%%%ipip%%%"
if %ipip%==ipL__ (goto :monocolorcheck) else (goto :pingcheck)

:: Main PC IP check
:pingcheck
ping %ip% -n 1 > nul
if %errorlevel%==1 (goto :Machinenocheck) else (goto :mainkeep)

:mainkeep
xcopy "\\%ip%\Program\RVS\Daily Log\%Mainfld%" "D:\Program\RVS\%lineno%L Log Collecting\%Masterfld%\%Mainfld%" /C /Q /Y /I /E

:Machinenocheck
if %Machineno%==13 (goto :end) else (goto :machinenoincrease)

:: Increase Machineno until 12
:machinenoincrease
set /A Machineno+=1
goto :Main_Script

:end
exit