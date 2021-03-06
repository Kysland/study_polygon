@echo off
schtasks /create /sc hourly /tn "Autosort_downloads" /f  /tr %userprofile%\Desktop\Bat_trash\Autosort_downloads.bat
cd %userprofile%\Downloads\
move %userprofile%\Downloads\*.mp4 D:\vids\
move %userprofile%\Downloads\*.webm D:\vids\
move %userprofile%\Downloads\*.mp3 D:\mus\
move %userprofile%\Downloads\*.ogg D:\mus\
move %userprofile%\Downloads\*.flac D:\mus\
move %userprofile%\Downloads\*.png D:\pics\
move %userprofile%\Downloads\*.jpg D:\pics\
move %userprofile%\Downloads\*.bmp D:\pics\
move %userprofile%\Downloads\*.gif D:\pics\
move %userprofile%\Downloads\*.pdf D:\pdf\
move %userprofile%\Downloads\*.torrent D:\Torrent\
move %userprofile%\Downloads\*.rar D:\archives\
move %userprofile%\Downloads\*.zip D:\archives\

move %userprofile%\Desktop\*.mp4 D:\vids\
move %userprofile%\Desktop\*.webm D:\vids\
move %userprofile%\Desktop\*.mp3 D:\mus\
move %userprofile%\Desktop\*.ogg D:\mus\
move %userprofile%\Desktop\*.flac D:\mus\
move %userprofile%\Desktop\*.png D:\pics\
move %userprofile%\Desktop\*.jpg D:\pics\
move %userprofile%\Desktop\*.bmp D:\pics\
move %userprofile%\Desktop\*.gif D:\pics\
move %userprofile%\Desktop\*.pdf D:\pdf\
move %userprofile%\Desktop\*.torrent D:\Torrent\
move %userprofile%\Desktop\*.rar D:\archives\
move %userprofile%\Desktop\*.zip D:\archives\