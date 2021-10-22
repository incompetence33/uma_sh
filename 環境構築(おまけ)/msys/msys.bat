@echo off
setlocal EnableDelayedExpansion
set "WD=%__CD__%"
if NOT EXIST "%WD%msys-2.0.dll" set "WD=%~dp0usr\bin\"
set "LOGINSHELL=bash"
set /a msys2_shiftCounter=0
set MSYS=winsymlinks:nativestrict
start "ucrt64" "usr/bin/%LOGINSHELL%" --login "-l"
