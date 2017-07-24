@echo off
if "%1" == "h" goto begin
mshta vbscript:createobject("wscript.shell").run("""%~nx0"" h",0)(window.close)&&exit
:begin
cd gameserver\script
start /B escript.exe version.ers
TortoiseProc.exe /command:commit /path:"../src/version/version.erl" /closeonend:0