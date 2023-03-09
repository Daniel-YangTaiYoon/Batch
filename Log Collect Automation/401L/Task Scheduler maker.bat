@echo off

set lineno=401
set monocolor=1st
set /A machineno=1

:copy
echo ^<?xml version="1.0" encoding="UTF-16"?^> >"%lineno%L %monocolor% #%machineno% log collect scheduler.xml"
echo ^<Task version="1.2" xmlns="http://schemas.microsoft.com/windows/2004/02/mit/task"^> >>"%lineno%L %monocolor% #%machineno% log collect scheduler.xml"
echo 	^<RegistrationInfo^> >>"%lineno%L %monocolor% #%machineno% log collect scheduler.xml"
echo 		^<Date^>2023-03-08T20:42:39.6421403^</Date^> >>"%lineno%L %monocolor% #%machineno% log collect scheduler.xml"
echo 		^<Author^>RADIANT VISION SYSTEMS^</Author^> >>"%lineno%L %monocolor% #%machineno% log collect scheduler.xml"
echo 		^<URI^>Demura Log collect^</URI^> >>"%lineno%L %monocolor% #%machineno% log collect scheduler.xml"
echo 	^</RegistrationInfo^> >>"%lineno%L %monocolor% #%machineno% log collect scheduler.xml"
echo 	^<Triggers^> >>"%lineno%L %monocolor% #%machineno% log collect scheduler.xml"
echo 		^<CalendarTrigger^> >>"%lineno%L %monocolor% #%machineno% log collect scheduler.xml"
echo 			^<StartBoundary^>2023-03-08T02:30:00^</StartBoundary^> >>"%lineno%L %monocolor% #%machineno% log collect scheduler.xml"
echo 			^<Enabled^>true^</Enabled^> >>"%lineno%L %monocolor% #%machineno% log collect scheduler.xml"
echo 			^<ScheduleByDay^> >>"%lineno%L %monocolor% #%machineno% log collect scheduler.xml"
echo 				^<DaysInterval^>1^</DaysInterval^> >>"%lineno%L %monocolor% #%machineno% log collect scheduler.xml"
echo 			^</ScheduleByDay^> >>"%lineno%L %monocolor% #%machineno% log collect scheduler.xml"
echo 		^</CalendarTrigger^> >> "%lineno%L %monocolor% #%machineno% log collect scheduler.xml"
echo 	^</Triggers^> >> "%lineno%L %monocolor% #%machineno% log collect scheduler.xml"
echo 	^<Principals^> >> "%lineno%L %monocolor% #%machineno% log collect scheduler.xml"
echo 		^<Principal id="Author"^> >> "%lineno%L %monocolor% #%machineno% log collect scheduler.xml"
echo 			^<UserId^>S-1-5-21-725480862-3868392371-2725245176-1001^</UserId^> >> "%lineno%L %monocolor% #%machineno% log collect scheduler.xml"
echo 			^<LogonType^>InteractiveToken^</LogonType^> >> "%lineno%L %monocolor% #%machineno% log collect scheduler.xml"
echo 			^<RunLevel^>HighestAvailable^</RunLevel^> >> "%lineno%L %monocolor% #%machineno% log collect scheduler.xml"
echo 		^</Principal^> >> "%lineno%L %monocolor% #%machineno% log collect scheduler.xml"
echo 	^</Principals^> >> "%lineno%L %monocolor% #%machineno% log collect scheduler.xml"
echo 	^<Settings^> >> "%lineno%L %monocolor% #%machineno% log collect scheduler.xml"
echo 		^<MultipleInstancesPolicy^>IgnoreNew^</MultipleInstancesPolicy^> >> "%lineno%L %monocolor% #%machineno% log collect scheduler.xml"
echo 		^<DisallowStartIfOnBatteries^>false^</DisallowStartIfOnBatteries^> >> "%lineno%L %monocolor% #%machineno% log collect scheduler.xml"
echo 		^<StopIfGoingOnBatteries^>true^</StopIfGoingOnBatteries^> >> "%lineno%L %monocolor% #%machineno% log collect scheduler.xml"
echo 		^<AllowHardTerminate^>true^</AllowHardTerminate^> >> "%lineno%L %monocolor% #%machineno% log collect scheduler.xml"
echo 		^<StartWhenAvailable^>true^</StartWhenAvailable^> >> "%lineno%L %monocolor% #%machineno% log collect scheduler.xml"
echo 		^<RunOnlyIfNetworkAvailable^>false^</RunOnlyIfNetworkAvailable^> >> "%lineno%L %monocolor% #%machineno% log collect scheduler.xml"
echo 		^<IdleSettings^> >> "%lineno%L %monocolor% #%machineno% log collect scheduler.xml"
echo 			^<StopOnIdleEnd^>true^</StopOnIdleEnd^> >> "%lineno%L %monocolor% #%machineno% log collect scheduler.xml"
echo 			^<RestartOnIdle^>false^</RestartOnIdle^> >> "%lineno%L %monocolor% #%machineno% log collect scheduler.xml"
echo 		^</IdleSettings^> >> "%lineno%L %monocolor% #%machineno% log collect scheduler.xml"
echo 		^<AllowStartOnDemand^>true^</AllowStartOnDemand^> >> "%lineno%L %monocolor% #%machineno% log collect scheduler.xml"
echo 		^<Enabled^>true^</Enabled^> >> "%lineno%L %monocolor% #%machineno% log collect scheduler.xml"
echo 		^<Hidden^>false^</Hidden^> >> "%lineno%L %monocolor% #%machineno% log collect scheduler.xml"
echo 		^<RunOnlyIfIdle^>false^</RunOnlyIfIdle^> >> "%lineno%L %monocolor% #%machineno% log collect scheduler.xml"
echo 		^<WakeToRun^>false^</WakeToRun^> >> "%lineno%L %monocolor% #%machineno% log collect scheduler.xml"
echo 		^<ExecutionTimeLimit^>PT72H^</ExecutionTimeLimit^> >> "%lineno%L %monocolor% #%machineno% log collect scheduler.xml"
echo 		^<Priority^>7^</Priority^> >> "%lineno%L %monocolor% #%machineno% log collect scheduler.xml"
echo 	^</Settings^> >> "%lineno%L %monocolor% #%machineno% log collect scheduler.xml"
echo 	^<Actions Context="Author"^> >> "%lineno%L %monocolor% #%machineno% log collect scheduler.xml"
echo 		^<Exec^> >> "%lineno%L %monocolor% #%machineno% log collect scheduler.xml"
echo 			^<Command^>"D:\Program\RVS\Demura to Main %lineno%L %monocolor% #%machineno%.bat"^</Command^> >> "%lineno%L %monocolor% #%machineno% log collect scheduler.xml"
echo 		^</Exec^> >> "%lineno%L %monocolor% #%machineno% log collect scheduler.xml"
echo 	^</Actions^> >> "%lineno%L %monocolor% #%machineno% log collect scheduler.xml"
echo ^</Task^> >> "%lineno%L %monocolor% #%machineno% log collect scheduler.xml"

if %machineno%==12 (goto :monocolorchange) 
set /A machineno+=1
goto :copy

:monocolorchange
if %monocolor%==2nd (goto :end)
set monocolor=2nd
set /A machineno=1
goto :copy

:end
exit