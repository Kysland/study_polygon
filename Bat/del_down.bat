@echo off
schtasks /create /sc mounthly /tn "del>31den_downloads" /f  /tr %userprofile%\Desktop\Bat_trash\del_down.bat
Forfiles /p %userprofile%\Downloads\ /s /m * /d -31 /c "cmd /c del /q"
