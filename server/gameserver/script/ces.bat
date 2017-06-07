@echo off
erlc -W +debug_info cc.erl
start /B escript.exe cc.ers
