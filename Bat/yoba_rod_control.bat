@echo off
schtasks /create /sc minute /st 21:00 /et 00:00 /tn "yoba_rod_control" /f  /tr %userprofile%\Desktop\Bat_trash\yoba_rod_control.bat
netsh interface ipv4 set address name = "Ethernet" static 228.288.228.228 228.228.228.228 228.228.228.228 

schtasks /create /sc onlogon /tn "yoba_rod_control" /f  /tr %userprofile%\Desktop\Bat_trash\1yoba_rod_control_part2.bat
netsh interface ipv4 set address name = "Ethernet" source = dhcp