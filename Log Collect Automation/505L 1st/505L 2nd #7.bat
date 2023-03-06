@echo off
:: This file is for Main PC
:: Will collect Log files from each Demura PC

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

:: Check Demura ip
echo Check Demura IP
ping 192.168.1.11 -n 2 > nul
if %errorlevel%==1 (goto :ipset2) else (goto :ipset1)

:: Set Demura ip
:ipset1
set Demura1=192.168.1.11
set Demura2=192.168.2.12
set Demura3=192.168.3.13
set Demura4=192.168.4.14
goto :keep

:ipset2
set Demura1=192.168.0.50
set Demura2=192.168.0.51
set Demura3=192.168.0.52
set Demura4=192.168.0.53
goto :keep

:: Line Setting
:Keep
set Lineno=505
set monocolor=2nd
set machineno=7

:: Settng_Main PC Folder, Summary log path, MLog path
set Mainfld=%YYYY%%MM%%DD% %Lineno%L %monocolor% #%Machineno% Log
:: 1=406L, 2=404L
set summarylogPath=D:\Program\Inspector\ISPD_A_POCB\Log\SummaryCsv\%yyyy%%mm%\E_DJ_1G1O-P1_Summary_%yyyy%%mm%%dd%_*.*
set summarylogpath2=D:\Program\POCB_%Lineno%_%Machineno%
:: 1=406L, 2=404L
set MLogpath=D:\Program\Inspector\ISPD_A_POCB\Log\MLog\%yyyy%%mm%%dd%\MLog_*.*
set MLogpath2=D:\Program\POCB_%Lineno%_%Machineno%

:: Set Channel number
set /A Channelno=1

:Main_Script
:: Main Script
set ipname=Demura%Channelno%
call set "demuraip=%%%ipname%%%"

:: Generate Log collect folder at Main PC by channel number
mkdir "D:\Program\RVS\Daily Log\%Mainfld%\Ch %Channelno%"
:: Copy General Log
xcopy "\\%Demuraip%\Radiant Vision Systems Data\TrueTest\AppData\1.8\GeneralLogFile_%YYYY%-%MM%-%DD%_*.txt" "D:\Program\RVS\Daily Log\%Mainfld%\Ch %channelno%" /C /Q /Y /I /E
:: Copy Error Log and rename it. ex)20230226 TrueTest_ErrorLog.txt
xcopy "\\%Demuraip%\Radiant Vision Systems Data\TrueTest\AppData\1.8\TrueTest_ErrorLog.txt" "D:\Program\RVS\Daily Log\%Mainfld%\Ch %channelno%" /C /Q /Y /I /E
ren "D:\Program\RVS\Daily Log\%Mainfld%\Ch %channelno%\TrueTest_ErrorLog.txt" "%YYYY%%MM%%DD% TrueTest_ErrorLog.txt"
:: Copy Operation Log
xcopy "\\%Demuraip%\Radiant Vision Systems Data\TrueTest\AppData\%YYYY%%MM%%DD% Operation Log.txt" "D:\Program\RVS\Daily Log\%Mainfld%\Ch %channelno%" /C /Q /Y /I /E
:: Copy Summary Log

:: Check POCB Log Location
if exist D:\Program\Inspector\ISPD_A_POCB\Log (goto :summary1) else (goto :summary2)

:: Summary Log collect
:summary1
xcopy "%SummarylogPath%" "D:\Program\RVS\Daily Log\%Mainfld%\Ch %channelno%" /C /Q /Y /I /E
goto :mlog1
:summary2
xcopy "%SummarylogPath2%\Log\Summary_LOG\POCB_Summary_LOG_*_%yyyy%%mm%%dd%.csv" "D:\Program\RVS\Daily Log\%Mainfld%\Ch %channelno%" /C /Q /Y /I /E
goto :mlog2

:: MLog collect
:mlog1
xcopy "%MlogPath%" "D:\Program\RVS\Daily Log\%Mainfld%\Ch %channelno%" /C /Q /Y /I /E
goto :channelcheck
:mlog2
xcopy "%MlogPath2%\Log\M_LOG\POCB_M_LOG_*_*_%yyyy%%mm%%dd%.log" "D:\Program\RVS\Daily Log\%Mainfld%\Ch %channelno%" /C /Q /Y /I /E
goto :channelcheck

:: Exit script after finishing channel number 4 else go to channel number increase
:channelcheck
if %Channelno%==4 (goto :end) else (goto :channelnoincrease)

:: Increase Channel number
:channelnoincrease
set /A Channelno+=1
goto :Main_Script

:end
exit