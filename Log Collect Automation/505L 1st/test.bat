@echo off
set lineno=505
set monocolor=1st
set machineno=12
set ipip=ip%Lineno%L_%monocolor%_%Machineno%
call set "ip=%%%ipip%%%"
echo %ipip%
pause