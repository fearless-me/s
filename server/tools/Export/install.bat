@echo off
echo "init python"
start /B /Wait python get-pip.py
pip.exe install xlsxwriter

pause
 