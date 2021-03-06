@echo off
schtasks /create /sc daily /st 18:00 /tn "rezerv_raboty" /f  /tr %userprofile%\Desktop\Bat_trash\rezervirovanie.bat
xcopy /e /y C:\Users\User\Desktop\Work Z:\REZERV\RABOTNIK_1\