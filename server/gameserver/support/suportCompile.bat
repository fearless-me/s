@echo off
L:
cd \server\gameserver
echo (a)build_log_define (b)quit (c) build_mapcfg (d)build_db_record
choice /C abcd
if errorlevel 4 goto nul3
if errorlevel 3 goto buildmapcfg
if errorlevel 2 goto end
if errorlevel 1 goto buildlogdefine

:buildlogdefine
escript support\build_log_define.ers
goto end

:buildmapcfg
escript support\build_mapcfg.ers
goto end

:nul3
escript support\build_db_record.ers
goto end

:end
pause