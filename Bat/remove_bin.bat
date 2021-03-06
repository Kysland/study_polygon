@echo off
schtasks /create /sc daily /st 19:00 /tn "remove_bin" /f  /tr %userprofile%\Desktop\Bat_trash\remove_bin.bat
powershell.exe -command "& {Clear-RecycleBin -Force}"