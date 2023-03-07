@echo off

:: Program Setting
set Lineno=406
set monocolor=1st

:: Set Date
::  day=-1 => Yesterday log(Default setting). day=0 => Today log.
set day=-1
echo >"%temp%\%~n0.vbs" s=DateAdd("d",%day%,now) : d=weekday(s)
echo>>"%temp%\%~n0.vbs" WScript.Echo year(s)^& right(100+month(s),2)^& right(100+day(s),2)
for /f %%a in ('cscript /nologo "%temp%\%~n0.vbs"') do set "result=%%a"
del "%temp%\%~n0.vbs"
set "YYYY=%result:~0,4%"
set "MM=%result:~4,2%"
set "DD=%result:~6,2%"
set "result=%yyyy%-%mm%-%dd%"

:: Set Main PC IP List
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
set ip406L_2nd_1=10.121.41.39
set ip406L_2nd_2=10.121.44.38
set ip406L_2nd_3=10.121.44.39
set ip406L_2nd_4=10.121.44.42
set ip406L_2nd_5=10.121.44.44
set ip406L_2nd_6=10.121.44.45
set ip406L_2nd_7=10.121.44.51
set ip406L_2nd_8=10.121.44.74
set ip406L_2nd_9=10.121.44.75
set ip406L_2nd_10=10.121.44.77
set ip406L_2nd_11=10.121.44.82
set ip406L_2nd_12=10.121.44.83
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

:: Set MasterPC log collecting folder name ex) 20230227 406L Log
set Masterfld=%YYYY%%MM%%DD% %Lineno%L Log

:Scriptset
:: Set Machine No
set /A Machineno=1
:: Set Main Folder and IP 20230302 505L Log > 20230302 505L 1st #1 Log
set Mainfld=%YYYY%%MM%%DD% %Lineno%L %monocolor% #%Machineno% Log
set Mainip=ip%Lineno%L_%monocolor%_%Machineno%
call set "ip=%%%Mainip%%%"
goto :checkping1

:: Ping check 1st
:checkping1
ping %ip% -n 1 > nul
if %errorlevel%==0 (goto :Mainscript) else (goto :Checkping2)

:: Ping check 2nd (+1 for machine no)
:checkping2
if %machineno% gtr 13 (goto :monocolorchange)
set /A Machineno+=1
set Mainfld=%YYYY%%MM%%DD% %Lineno%L %monocolor% #%Machineno% Log
set Mainip=ip%Lineno%L_%monocolor%_%Machineno%
call set "ip=%%%Mainip%%%"
ping %ip% -n 1 > nul
if %errorlevel%==0 (goto :Mainscript) else (goto :Checkping2)

:: If 1st, change to 2nd. If 2nd, end script.
:monocolorchange
if %monocolor%==2nd (goto :end)
set monocolor=2nd
goto :Scriptset

:: Main script for copy log
:Mainscript
xcopy "\\%ip%\Program\RVS\Demura Log Collect\%Mainfld%" "D:\Program\RVS\%lineno%L Log\%Masterfld%\%Mainfld%" /C /Q /Y /I /S
if %machineno% gtr 13 (goto :monocolorchange)
set /A Machineno+=1
set Mainfld=%YYYY%%MM%%DD% %Lineno%L %monocolor% #%Machineno% Log
set Mainip=ip%Lineno%L_%monocolor%_%Machineno%
call set "ip=%%%Mainip%%%"
goto :checkping1

:: Script end
:end
exit