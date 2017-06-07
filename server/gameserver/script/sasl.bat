erl -make
cd ../data
start /wait /B erl -smp enable -pa ../ebin ../script -boot start_sasl -config elog -s saslrb start

cd ../script