cls
@echo off
cd tools/xref_runner
start /B /wait erl -s  xref_runner check
pause
