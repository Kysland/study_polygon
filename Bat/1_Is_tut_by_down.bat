@echo off
schtasks /create /sc hourly /tn "Is tut_by down" /f  /tr %userprofile%\Desktop\Bat_trash\1_Is_tut_by_down.bat
echo test pinga tut_by >> C:\tut_by_logs.txt
ping tut.by >> C:\tut_by_logs.txt
cd C:\
tut_by_logs.txt