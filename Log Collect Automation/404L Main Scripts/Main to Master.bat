@echo off

:: Program Setting
set Lineno=404
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
echo %yyyy%-%mm%-%dd% Log Collecting

:: Set Main PC IP List
set ip301L_1st_1=10.119.159.140
set ip301L_1st_2=10.119.161.150
set ip301L_1st_3=10.119.161.243
set ip301L_1st_4=10.119.162.38
set ip301L_2nd_5=10.119.162.47
set ip301L_1st_6=10.119.162.138
set ip301L_2nd_7=10.119.162.170
set ip301L_2nd_8=10.119.159.229
set ip301L_2nd_9=10.119.135.31
set ip301L_2nd_10=10.119.161.121
set ip301L_2nd_11=10.119.128.31
set ip401L_1st_1=10.121.41.195
set ip401L_1st_2=10.121.41.154
set ip401L_1st_3=10.121.41.155
set ip401L_1st_4=10.121.41.196
set ip401L_1st_5=10.121.41.157
set ip401L_1st_6=10.121.41.158
set ip401L_1st_7=10.121.41.197
set ip401L_1st_8=10.121.41.137
set ip401L_1st_9=10.121.41.161
set ip401L_1st_10=10.121.41.162
set ip401L_1st_11=10.121.41.163
set ip401L_1st_12=10.121.41.164
set ip402L_1st_1=10.121.42.161
set ip402L_1st_2=10.121.42.85
set ip402L_1st_3=10.121.42.163
set ip402L_1st_4=10.121.42.164
set ip402L_1st_5=10.121.42.203
set ip402L_1st_6=10.121.42.97
set ip402L_1st_7=10.121.42.201
set ip402L_1st_8=10.121.42.202
set ip402L_1st_9=10.121.42.165
set ip402L_1st_10=10.121.42.166
set ip402L_1st_11=10.121.42.167
set ip402L_1st_12=10.121.42.168
set ip402L_2nd_1=10.121.41.139
set ip402L_2nd_2=10.121.42.171
set ip402L_2nd_3=10.121.42.175
set ip402L_2nd_4=10.121.42.206
set ip402L_2nd_5=10.121.42.207
set ip402L_2nd_6=10.121.42.208
set ip402L_2nd_7=10.121.43.51
set ip402L_2nd_8=10.121.43.76
set ip402L_2nd_9=10.121.43.97
set ip402L_2nd_10=10.121.43.198
set ip402L_2nd_11=10.121.44.229
set ip402L_2nd_12=10.121.44.71
set ip403L_1st_1=10.121.42.71
set ip403L_1st_2=10.121.42.72
set ip403L_1st_3=10.121.42.73
set ip403L_1st_4=10.121.42.74
set ip403L_1st_5=10.121.42.75
set ip403L_1st_6=10.121.42.76
set ip403L_1st_7=10.121.42.77
set ip403L_1st_8=10.121.42.78
set ip403L_1st_9=10.121.42.79
set ip403L_1st_10=10.121.42.80
set ip403L_1st_11=10.121.42.81
set ip403L_1st_12=10.121.42.82
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
set ip501L_1st_1=10.121.51.198
set ip501L_1st_2=10.121.51.199
set ip501L_1st_3=10.121.51.209
set ip501L_1st_4=10.121.51.208
set ip501L_1st_5=10.121.51.200
set ip501L_1st_6=10.121.51.201
set ip501L_1st_7=10.121.51.207
set ip501L_1st_8=10.121.51.206
set ip501L_1st_9=10.121.51.202
set ip501L_1st_10=10.121.51.203
set ip501L_1st_11=10.121.51.205
set ip501L_1st_12=10.121.51.204
set ip502L_1st_1=10.121.51.212
set ip502L_1st_2=10.121.51.213
set ip502L_1st_3=10.121.51.214
set ip502L_1st_4=10.121.51.215
set ip502L_1st_5=10.121.51.216
set ip502L_1st_6=10.121.51.217
set ip502L_1st_7=10.121.51.218
set ip502L_1st_8=10.121.51.219
set ip502L_1st_9=10.121.51.220
set ip502L_1st_10=10.121.51.221
set ip502L_1st_11=10.121.51.222
set ip502L_1st_12=10.121.51.223
set ip503L_1st_1=10.121.52.178
set ip503L_1st_2=10.121.52.179
set ip503L_1st_3=10.121.52.180
set ip503L_1st_4=10.121.52.181
set ip503L_1st_5=10.121.52.182
set ip503L_1st_6=10.121.52.183
set ip503L_1st_7=10.121.52.184
set ip503L_1st_8=10.121.52.185
set ip503L_1st_9=10.121.52.186
set ip503L_1st_10=10.121.52.187
set ip503L_1st_11=10.121.52.188
set ip503L_1st_12=10.121.52.189
set ip504L_1st_1=10.121.52.208
set ip504L_1st_2=10.121.52.209
set ip504L_1st_3=10.121.52.140
set ip504L_1st_4=10.121.52.141
set ip504L_1st_5=10.121.52.210
set ip504L_1st_6=10.121.52.211
set ip504L_1st_7=10.121.52.142
set ip504L_1st_8=10.121.53.200
set ip504L_1st_9=10.121.52.152
set ip504L_1st_10=10.121.52.213
set ip504L_1st_11=10.121.52.143
set ip504L_1st_12=10.121.53.201
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
echo %lineno%L %monocolor% #%Machineno% Log collecting...
xcopy "\\%ip%\Program\RVS\Demura Log Collect\%Mainfld%" "D:\Program\RVS\%lineno%L Log\%Masterfld%\%Mainfld%" /C /Q /Y /I /S
if %machineno% gtr 13 (goto :monocolorchange)
set /A Machineno+=1
set Mainfld=%YYYY%%MM%%DD% %Lineno%L %monocolor% #%Machineno% Log
set Mainip=ip%Lineno%L_%monocolor%_%Machineno%
call set "ip=%%%Mainip%%%"
echo Finished
goto :checkping1

:: Script end
:end
exit