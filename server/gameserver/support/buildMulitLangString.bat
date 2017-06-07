@echo off
erlc i18n.erl
erl -noshell -s i18n build -s init stop
del cfg_*.beam
del i18n.beam
pause