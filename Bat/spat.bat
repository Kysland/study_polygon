@echo off
schtasks /create /sc daily /st 02:00 /tn "time_to_sleep" /f  /tr %userprofile%\Desktop\Bat_trash\spat.bat
:loop
echo IDI BLYAT SPAT POLYNOCHNIK 
goto loop