erl -make
erl -name reload@127.0.0.1 -setcookie erlide -s reload reload gameserver@127.0.0.1 $1
