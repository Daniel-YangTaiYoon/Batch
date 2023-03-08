@echo off

echo Start copy log from Demura PC to Main PC
:: Program Setting
set Lineno=505
set monocolor=1st
set machineno=10

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

:: Set Channel number and Main Folder
:channelset
set /A Channelno=1
set Mainfld=%YYYY%%MM%%DD% %Lineno%L %monocolor% #%Machineno% Log

:: Check Demura IP
echo Check Demura IP
ping 192.168.1.11 -n 1 > nul
if %errorlevel%==0 (goto :ipset1) else (goto :ipset2)

:: Set Demura IP
:ipset1
set Demuraip1=192.168.1.11
set Demuraip2=192.168.2.12
set Demuraip3=192.168.3.13
set Demuraip4=192.168.4.14
goto :checksummarypath1

:ipset2
set Demuraip1=192.168.0.50
set Demuraip2=192.168.0.51
set Demuraip3=192.168.0.52
set Demuraip4=192.168.0.53
goto :checksummarypath1

:: Check Summary Log Path
:checksummarypath1
if exist D:\Program\Inspector\ISPD_A_POCB\Log\SummaryCsv (goto :setsummarypath1) else (goto :checksummarypath2_1)
:checksummarypath2_1
if exist D:\Program\POCB_%Lineno%_%Machineno%_AIM (goto :setsummarypath2_1) else (goto :checksummarypath2_2)
:checksummarypath2_2
if exist D:\Program\POCB_%Lineno%_%Machineno% (goto :setsummarypath2_2) else (goto :checksummarypath3_1)
:checksummarypath3_1
if exist D:\Program\POCB_%monocolor%_%Lineno%_0%machineno%\Log (goto :setsummarypath3_1) else (goto :checksummarypath3_2)
:checksummarypath3_2
if exist D:\Program\POCB_%monocolor%_%Lineno%_%machineno%\Log (goto :setsummarypath3_2) else (goto :end)

:: Set Summary Log Path
:setsummarypath1
set summarypath=D:\Program\Inspector\ISPD_A_POCB\Log\SummaryCsv\%yyyy%%mm%
set summarypathno=1
goto :checkmlogpath1
:setsummarypath2_1
set summarypath=D:\Program\POCB_%Lineno%_%Machineno%_AIM\Log\Summary_LOG
set summarypathno=2_1
goto :checkmlogpath1
:setsummarypath2_2
set summarypath=D:\Program\POCB_%Lineno%_%Machineno%\Log\Summary_LOG
set summarypathno=2_2
goto :checkmlogpath1
:setsummarypath3_1
set summarypath=D:\Program\POCB_%monocolor%_%Lineno%_0%machineno%\Log\Summary_LOG
set summarypathno=3_1
goto :checkmlogpath1
:setsummarypath3_2
set summarypath=D:\Program\POCB_%monocolor%_%Lineno%_%machineno%\Log\Summary_LOG
set summarypathno=3_2
goto :checkmlogpath1

:: Check and Set MLog Path
:checkmlogpath1
if exist D:\Program\Inspector\ISPD_A_POCB\Log\MLog (goto :Setmlogpath1) else (goto :checkmlogpath2_1)
:checkmlogpath2_1
if exist D:\Program\POCB_%Lineno%_%Machineno%_AIM\Log\M_LOG (goto :Setmlogpath2_1) else (goto :checkmlogpath2_2)
:checkmlogpath2_2
if exist D:\Program\POCB_%Lineno%_%Machineno%\Log\M_LOG (goto :setmlogpath2_2) else (goto :checkmlogpath3_1)
:checkmlogpath3_1
if exist D:\Program\POCB_%monocolor%_%Lineno%_0%machineno%\Log\M_LOG (goto :setmlogpath3_1) else (goto :checkmlogpath3_2)
:checkmlogpath3_2
if exist D:\Program\POCB_%monocolor%_%Lineno%_%machineno%\Log\M_LOG (goto :setmlogpath3_2) else (goto :end)

:setmlogpath1
set mlogpath=D:\Program\Inspector\ISPD_A_POCB\Log\MLog\%yyyy%%mm%%dd%
set mlogpathno=1
goto :Checksummarypath_1
:setmlogpath2_1
set mlogpath=D:\Program\POCB_%Lineno%_%Machineno%_AIM\Log\M_LOG
set mlogpathno=2_1
goto :Checksummarypath_1
:setmlogpath2_2
set summarypath=D:\Program\POCB_%Lineno%_%Machineno%\Log\M_LOG
set summarypathno=2_2
goto :Checksummarypath_1
:setmlogpath3_1
set mlogpath=D:\Program\POCB_%monocolor%_%Lineno%_0%machineno%\Log\M_LOG
set mlogpathno=3_1
goto :Checksummarypath_1
:setmlogpath3_2
set mlogpath=D:\Program\POCB_%monocolor%_%Lineno%_%machineno%\Log\M_LOG
set mlogpathno=3_2
goto :Checksummarypath_1

:: Check Summary Path and Copy
:Checksummarypath_1
echo Copy Summary Log...
mkdir "D:\Program\RVS\Demura Log Collect\%Mainfld%\Summary_Log"
if %summarypathno%==1 (goto :Summarycopy_1) else (goto :Checksummarypath_2_1)
:Checksummarypath_2_1
if %summarypathno%==2_1 (goto :Summarycopy_2_1) else (goto :Checksummarypath_2_2)
:Checksummarypath_2_2
if %summarypathno%==2_2 (goto :Summarycopy_2_2) else (goto :Checksummarypath_3_1)
:Checksummarypath_3_1
if %summarypathno%==3_1 (goto :Summarycopy_3_1) else (goto :Checksummarypath_3_2)
:Checksummarypath_3_2
if %summarypathno%==3_2 (goto :Summarycopy_3_2) else (goto :end)

:Summarycopy_1
xcopy "%summarypath%\E_DJ_1G1O-P1_Summary_%yyyy%%mm%%dd%_*.*" "D:\Program\RVS\Demura Log Collect\%Mainfld%\Summary_Log" /C /Q /Y /I /S
xcopy "%summarypath%\POCB_Summary_LOG_*_%yyyy%%mm%%dd%.*" "D:\Program\RVS\Demura Log Collect\%Mainfld%\Summary_Log" /C /Q /Y /I /S
goto :Checkmlogpath_1
:Summarycopy_2_1
xcopy "%summarypath%\E_DJ_1G1O-P1_Summary_%yyyy%%mm%%dd%_*.*" "D:\Program\RVS\Demura Log Collect\%Mainfld%\Summary_Log" /C /Q /Y /I /S
xcopy "%summarypath%\POCB_Summary_LOG_*_%yyyy%%mm%%dd%.*" "D:\Program\RVS\Demura Log Collect\%Mainfld%\Summary_Log" /C /Q /Y /I /S
goto :Checkmlogpath_1
:Summarycopy_2_2
xcopy "%summarypath%\E_DJ_1G1O-P1_Summary_%yyyy%%mm%%dd%_*.*" "D:\Program\RVS\Demura Log Collect\%Mainfld%\Summary_Log" /C /Q /Y /I /S
xcopy "%summarypath%\POCB_Summary_LOG_*_%yyyy%%mm%%dd%.*" "D:\Program\RVS\Demura Log Collect\%Mainfld%\Summary_Log" /C /Q /Y /I /S
goto :Checkmlogpath_1
:Summarycopy_3_1
xcopy "%summarypath%\E_DJ_1G1O-P1_Summary_%yyyy%%mm%%dd%_*.*" "D:\Program\RVS\Demura Log Collect\%Mainfld%\Summary_Log" /C /Q /Y /I /S
xcopy "%summarypath%\POCB_Summary_LOG_*_%yyyy%%mm%%dd%.*" "D:\Program\RVS\Demura Log Collect\%Mainfld%\Summary_Log" /C /Q /Y /I /S
goto :Checkmlogpath_1
:Summarycopy_3_2
xcopy "%summarypath%\E_DJ_1G1O-P1_Summary_%yyyy%%mm%%dd%_*.*" "D:\Program\RVS\Demura Log Collect\%Mainfld%\Summary_Log" /C /Q /Y /I /S
xcopy "%summarypath%\POCB_Summary_LOG_*_%yyyy%%mm%%dd%.*" "D:\Program\RVS\Demura Log Collect\%Mainfld%\Summary_Log" /C /Q /Y /I /S
goto :Checkmlogpath_1

:: Check M Log path and Copy
:Checkmlogpath_1
echo Finished
echo Copy M Log...
mkdir "D:\Program\RVS\Demura Log Collect\%Mainfld%\M_Log"
if %mlogpathno%==1 (goto :Mlogcopy_1) else (goto :Checkmlogpath_2_1)
:Checkmlogpath_2_1
if %mlogpathno%==2_1 (goto :Mlogcopy_2_1) else (goto :Checkmlogpath_2_2)
:Checkmlogpath_2_2
if %mlogpathno%==2_2 (goto :Mlogcopy_2_2) else (goto :Checkmlogpath_3_1)
:Checkmlogpath_3_1
if %mlogpathno%==3_1 (goto :Mlogcopy_3_1) else (goto :Checkmlogpath_3_2)
:Checkmlogpath_3_2
if %mlogpathno%==3_2 (goto :Mlogcopy_3_2) else (goto :end)

:Mlogcopy_1
xcopy "%mlogpath%\MLog_*.*" "D:\Program\RVS\Demura Log Collect\%Mainfld%\M_Log" /C /Q /Y /I /S
xcopy "%mlogpath%\POCB_M_LOG_*_*_%yyyy%%mm%%dd%.*" "D:\Program\RVS\Demura Log Collect\%Mainfld%\M_Log" /C /Q /Y /I /S
xcopy "%mlogpath%\MLog_*_%yyyy%%mm%%dd%_*.*" "D:\Program\RVS\Demura Log Collect\%Mainfld%\M_Log" /C /Q /Y /I /S
goto :ipsetting
:Mlogcopy_2_1
xcopy "%mlogpath%\MLog_*.*" "D:\Program\RVS\Demura Log Collect\%Mainfld%\M_Log" /C /Q /Y /I /S
xcopy "%mlogpath%\POCB_M_LOG_*_*_%yyyy%%mm%%dd%.*" "D:\Program\RVS\Demura Log Collect\%Mainfld%\M_Log" /C /Q /Y /I /S
xcopy "%mlogpath%\MLog_*_%yyyy%%mm%%dd%_*.*" "D:\Program\RVS\Demura Log Collect\%Mainfld%\M_Log" /C /Q /Y /I /S
goto :ipsetting
:Mlogcopy_2_2
xcopy "%mlogpath%\MLog_*.*" "D:\Program\RVS\Demura Log Collect\%Mainfld%\M_Log" /C /Q /Y /I /S
xcopy "%mlogpath%\POCB_M_LOG_*_*_%yyyy%%mm%%dd%.*" "D:\Program\RVS\Demura Log Collect\%Mainfld%\M_Log" /C /Q /Y /I /S
xcopy "%mlogpath%\MLog_*_%yyyy%%mm%%dd%_*.*" "D:\Program\RVS\Demura Log Collect\%Mainfld%\M_Log" /C /Q /Y /I /S
goto :ipsetting
:Mlogcopy_3_1
xcopy "%mlogpath%\MLog_*.*" "D:\Program\RVS\Demura Log Collect\%Mainfld%\M_Log" /C /Q /Y /I /S
xcopy "%mlogpath%\POCB_M_LOG_*_*_%yyyy%%mm%%dd%.*" "D:\Program\RVS\Demura Log Collect\%Mainfld%\M_Log" /C /Q /Y /I /S
xcopy "%mlogpath%\MLog_*_%yyyy%%mm%%dd%_*.*" "D:\Program\RVS\Demura Log Collect\%Mainfld%\M_Log" /C /Q /Y /I /S
goto :ipsetting
:Mlogcopy_3_2
xcopy "%mlogpath%\MLog_*.*" "D:\Program\RVS\Demura Log Collect\%Mainfld%\M_Log" /C /Q /Y /I /S
xcopy "%mlogpath%\POCB_M_LOG_*_*_%yyyy%%mm%%dd%.*" "D:\Program\RVS\Demura Log Collect\%Mainfld%\M_Log" /C /Q /Y /I /S
xcopy "%mlogpath%\MLog_*_%yyyy%%mm%%dd%_*.*" "D:\Program\RVS\Demura Log Collect\%Mainfld%\M_Log" /C /Q /Y /I /S
goto :ipsetting

:: Set IP
:ipsetting
echo Finished
set Demuraipset=Demuraip%Channelno%
call set "demuraip=%%%Demuraipset%%%"
goto :Mainscript

:: Main Script
:Mainscript
echo Ch %Channelno% Log copy...
mkdir "D:\Program\RVS\Demura Log Collect\%Mainfld%\Ch %Channelno%"
xcopy "\\%demuraip%\Radiant Vision Systems Data\TrueTest\AppData\1.8\GeneralLogFile_%YYYY%-%MM%-%DD%_*.txt" "D:\Program\RVS\Demura Log Collect\%Mainfld%\Ch %channelno%" /C /Q /Y /I /S
xcopy "\\%demuraip%\Radiant Vision Systems Data\TrueTest\AppData\1.8\TrueTest_ErrorLog.txt" "D:\Program\RVS\Demura Log Collect\%Mainfld%\Ch %channelno%" /C /Q /Y /I /S
ren "D:\Program\RVS\Demura Log Collect\%Mainfld%\Ch %channelno%\TrueTest_ErrorLog.txt" "%YYYY%%MM%%DD% TrueTest_ErrorLog.txt"
xcopy "\\%demuraip%\Radiant Vision Systems Data\TrueTest\AppData\1.8\Dove2p0_PG.Dove2p0_PG.xml" "D:\Program\RVS\Demura Log Collect\%Mainfld%\Ch %channelno%" /C /Q /Y /I /S
ren "D:\Program\RVS\Demura Log Collect\%Mainfld%\Ch %channelno%\Dove2p0_PG.Dove2p0_PG.xml" "%YYYY%%MM%%DD% Dove2p0_PG.Dove2p0_PG.xml"
xcopy "\\%demuraip%\Radiant Vision Systems Data\TrueTest\AppData\1.8\Emu2p0_PG.Emu2p0_PG.xml" "D:\Program\RVS\Demura Log Collect\%Mainfld%\Ch %channelno%" /C /Q /Y /I /S
ren "D:\Program\RVS\Demura Log Collect\%Mainfld%\Ch %channelno%\Emu2p0_PG.Emu2p0_PG.xml" "%YYYY%%MM%%DD% Emu2p0_PG.Emu2p0_PG.xml"
xcopy "\\%demuraip%\Radiant Vision Systems Data\TrueTest\AppData\1.8\app.settings" "D:\Program\RVS\Demura Log Collect\%Mainfld%\Ch %channelno%" /C /Q /Y /I /S
ren "D:\Program\RVS\Demura Log Collect\%Mainfld%\Ch %channelno%\app.settings" "%YYYY%%MM%%DD% app.settings"
xcopy "\\%demuraip%\Radiant Vision Systems Data\TrueTest\AppData\%YYYY%%MM%%DD% Operation Log.txt" "D:\Program\RVS\Demura Log Collect\%Mainfld%\Ch %channelno%" /C /Q /Y /I /S

:: Make log.settings file to enable General log setting to true
Set "out=\\%demuraip%\Radiant Vision Systems Data\TrueTest\AppData\1.8"
(
  Echo;# To enable logging, set the enabled flag below to true; to disable, set enabled to false.
  Echo;enabled=true
  Echo;# To mask a log category, add that category string to a new line below.
  Echo;# When reading the comma-delimited log, the category string is the first string after the date/time entries.
) > "%out%\log.settings"

:: Delete General Log, Operation Log was generated before 60 days.

goto :Channelcheck


:: Channel Check if Ch is 4, End script
:Channelcheck
if %channelno%==4 (goto :end) else (goto :channelnoincrease)


:: Increase Channel +1 and go back to IP Setting script
:channelnoincrease
set /A Channelno+=1
goto :ipsetting

:: Generate log.settings file to enable General logging function
Set "out=E:\OneDrive - Radiant Vision Systems\Yang Tai Yoon\BATCH"
(
  Echo;# To enable logging, set the enabled flag below to true; to disable, set enabled to false.
  Echo;enabled=true
  Echo;# To mask a log category, add that category string to a new line below.
  Echo;# When reading the comma-delimited log, the category string is the first string after the date/time entries.
) > "%out%\log.settings"

:: Delete General Log and Operation Log was generated before 60 days
forfiles /P "\\%demuraip%\Radiant Vision Systems Data\TrueTest\AppData\1.8" /S /M GeneralLogFile_*.txt /D -60 /C "cmd /c del @PATH"
forfiles /P "\\%demuraip%\Radiant Vision Systems Data\TrueTest\AppData" /S /M *Operation Log.txt /D -60 /C "cmd /c del @PATH"

:: Script end
:end
exit



Set "out=C:\users\YourUserName\Desktop"
(
  Echo;# To enable logging, set the enabled flag below to true; to disable, set enabled to false.
  Echo;enabled=False
  Echo;# To mask a log category, add that category string to a new line below.
  Echo;# When reading the comma-delimited log, the category string is the first string after the date/time entries.
) > "%out%\YourFileName.txt"

# To enable logging, set the enabled flag below to true; to disable, set enabled to false.
enabled=False
# To mask a log category, add that category string to a new line below.
# When reading the comma-delimited log, the category string is the first string after the date/time entries.