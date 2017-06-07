cd dbserver/data
start erl -smp enable -pa ../ebin -boot start_sasl -name dbserver@tiancheng.com -setcookie erlide -s dbserver -emysql default_timeout 600000 +sub true

cd ../../loginserver/data
start erl -smp -pa ../ebin -boot start_sasl -name loginserver@tiancheng.com -setcookie erlide -s server +sub true