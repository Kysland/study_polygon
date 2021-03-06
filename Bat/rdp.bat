@echo off
schtasks /create /sc daily /st 10:00 /tn "rabota_ydalenka" /f  /tr %userprofile%\Desktop\Bat_trash\rdp.bat
REM сперва нужно создать файл rdp для автологина
cd %userprofile%\Documents\
start cmdkey /delete:termsrv/14.88.14.88:3389
start cmdkey /generic:termsrv/14.88.14.88:3389 /user:rabota_domen\buhgalter_Luda /pass:Luda_1488
start luda.rdp