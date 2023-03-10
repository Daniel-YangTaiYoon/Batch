@echo off

set lineno=505
set monocolor=1st
set /A machineno=1


echo ^<?xml version="1.0" encoding="UTF-16"?^> >"%lineno%L Master log collect scheduler.xml"
echo ^<Task version="1.2" xmlns="http://schemas.microsoft.com/windows/2004/02/mit/task"^> >>"%lineno%L Master log collect scheduler.xml"
echo   ^<RegistrationInfo^> >>"%lineno%L Master log collect scheduler.xml"
echo     ^<Date^>2023-03-13T15:01:01.3997108^</Date^> >>"%lineno%L Master log collect scheduler.xml"
echo     ^<Author^>RADIANT VISION SYSTMES^</Author^> >>"%lineno%L Master log collect scheduler.xml"
echo     ^<URI^>Main to Master^</URI^> >>"%lineno%L Master log collect scheduler.xml"
echo   ^</RegistrationInfo^> >>"%lineno%L Master log collect scheduler.xml"
echo   ^<Triggers^> >>"%lineno%L Master log collect scheduler.xml"
echo     ^<CalendarTrigger^> >>"%lineno%L Master log collect scheduler.xml"
echo       ^<StartBoundary^>2023-03-14T03:00:00^</StartBoundary^> >>"%lineno%L Master log collect scheduler.xml"
echo       ^<Enabled^>true^</Enabled^> >>"%lineno%L Master log collect scheduler.xml"
echo       ^<ScheduleByDay^> >>"%lineno%L Master log collect scheduler.xml"
echo         ^<DaysInterval^>1^</DaysInterval^> >>"%lineno%L Master log collect scheduler.xml"
echo       ^</ScheduleByDay^> >>"%lineno%L Master log collect scheduler.xml"
echo     ^</CalendarTrigger^> >>"%lineno%L Master log collect scheduler.xml"
echo     ^<EventTrigger^> >>"%lineno%L Master log collect scheduler.xml"
echo       ^<Enabled^>true^</Enabled^> >>"%lineno%L Master log collect scheduler.xml"
echo       ^<Subscription^>^&lt;QueryList^&gt;^&lt;Query Id="0" Path="Microsoft-Windows-TaskScheduler/Operational"^&gt;^&lt;Select Path="Microsoft-Windows-TaskScheduler/Operational"^&gt;*[System[Provider[@Name='Microsoft-Windows-TaskScheduler'] and EventID=329]]^&lt;/Select^&gt;^&lt;/Query^&gt;^&lt;/QueryList^&gt;^</Subscription^> >>"%lineno%L Master log collect scheduler.xml"
echo     ^</EventTrigger^> >>"%lineno%L Master log collect scheduler.xml"
echo   ^</Triggers^> >>"%lineno%L Master log collect scheduler.xml"
echo   ^<Principals^> >>"%lineno%L Master log collect scheduler.xml"
echo     ^<Principal id="Author"^> >>"%lineno%L Master log collect scheduler.xml"
echo       ^<UserId^>S-1-5-21-725480862-3868392371-2725245176-1001^</UserId^> >>"%lineno%L Master log collect scheduler.xml"
echo       ^<LogonType^>InteractiveToken^</LogonType^> >>"%lineno%L Master log collect scheduler.xml"
echo       ^<RunLevel^>LeastPrivilege^</RunLevel^> >>"%lineno%L Master log collect scheduler.xml"
echo     ^</Principal^> >>"%lineno%L Master log collect scheduler.xml"
echo   ^</Principals^> >>"%lineno%L Master log collect scheduler.xml"
echo   ^<Settings^> >>"%lineno%L Master log collect scheduler.xml"
echo     ^<MultipleInstancesPolicy^>StopExisting^</MultipleInstancesPolicy^> >>"%lineno%L Master log collect scheduler.xml"
echo     ^<DisallowStartIfOnBatteries^>false^</DisallowStartIfOnBatteries^> >>"%lineno%L Master log collect scheduler.xml"
echo     ^<StopIfGoingOnBatteries^>true^</StopIfGoingOnBatteries^> >>"%lineno%L Master log collect scheduler.xml"
echo     ^<AllowHardTerminate^>true^</AllowHardTerminate^> >>"%lineno%L Master log collect scheduler.xml"
echo     ^<StartWhenAvailable^>true^</StartWhenAvailable^> >>"%lineno%L Master log collect scheduler.xml"
echo     ^<RunOnlyIfNetworkAvailable^>false^</RunOnlyIfNetworkAvailable^> >>"%lineno%L Master log collect scheduler.xml"
echo     ^<IdleSettings^> >>"%lineno%L Master log collect scheduler.xml"
echo       ^<StopOnIdleEnd^>true^</StopOnIdleEnd^> >>"%lineno%L Master log collect scheduler.xml"
echo       ^<RestartOnIdle^>false^</RestartOnIdle^> >>"%lineno%L Master log collect scheduler.xml"
echo     ^</IdleSettings^> >>"%lineno%L Master log collect scheduler.xml"
echo     ^<AllowStartOnDemand^>true^</AllowStartOnDemand^> >>"%lineno%L Master log collect scheduler.xml"
echo     ^<Enabled^>true^</Enabled^> >>"%lineno%L Master log collect scheduler.xml"
echo     ^<Hidden^>false^</Hidden^> >>"%lineno%L Master log collect scheduler.xml"
echo     ^<RunOnlyIfIdle^>false^</RunOnlyIfIdle^> >>"%lineno%L Master log collect scheduler.xml"
echo     ^<WakeToRun^>false^</WakeToRun^> >>"%lineno%L Master log collect scheduler.xml"
echo     ^<ExecutionTimeLimit^>PT7H^</ExecutionTimeLimit^> >>"%lineno%L Master log collect scheduler.xml"
echo     ^<Priority^>7^</Priority^> >>"%lineno%L Master log collect scheduler.xml"
echo   ^</Settings^> >>"%lineno%L Master log collect scheduler.xml"
echo   ^<Actions Context="Author"^> >>"%lineno%L Master log collect scheduler.xml"
echo     ^<Exec^> >>"%lineno%L Master log collect scheduler.xml"
echo       ^<Command^>"D:\Program\RVS\%lineno%L Main to Master.bat"^</Command^> >>"%lineno%L Master log collect scheduler.xml"
echo     ^</Exec^> >>"%lineno%L Master log collect scheduler.xml"
echo   ^</Actions^> >>"%lineno%L Master log collect scheduler.xml"
echo ^</Task^> >>"%lineno%L Master log collect scheduler.xml"
exit