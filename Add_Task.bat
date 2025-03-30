@echo off

net session

if %errorLevel% neq 0 (

    powershell -Command "Start-Process '%~dpnx0' -Verb RunAs"

    exit
)

mkdir "C:\ProgramData\FlushDNS"

xcopy "%~dp0flushdns.bat" "C:\ProgramData\FlushDNS\" /Y

schtasks /create /tn "Flush DNS on Start" /tr "C:\ProgramData\FlushDNS\flushdns.bat" /sc onstart /ru SYSTEM /RL HIGHEST /f


notepad.exe "%~dp0Done.txt"

exit