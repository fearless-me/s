@echo off
erlc i18n.erl
erl -noshell -s i18n extract -s init stop
del cfg_*.*