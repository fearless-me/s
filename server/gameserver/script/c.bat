@echo off
erlc -W +debug_info cc.erl
start /B erl -smp enable -boot start_sasl -s cc go +sub true
