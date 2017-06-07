cd dbserver/data
start erl -smp enable -pa ../ebin -boot start_sasl -name dbserver@tiancheng.com -setcookie erlide -s dbserver -emysql default_timeout 600000 +sub true

cd ../../loginserver/data
start erl -smp -pa ../ebin -boot start_sasl -name loginserver@tiancheng.com -setcookie erlide -s server +sub true

cd ../../gameserver/data
start erl -smp -pa ../ebin -boot start_sasl -name gameserver@192.168.18.51 -setcookie erlide -s gameServer -kernel inet_dist_listen_min 60000 inet_dist_listen_max 60080 +K true +P 500000 +t 10485760 +fnu +hms 8192 +hmbs 8192 +zdbbl 2097151 zerts_de_busy_limit 1048576 +e 50000 +sub true