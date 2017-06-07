echo off

cd ..

mkdir temp

cd temp

erlc -I ../src/test/xml_to_erlang.erl

echo 开始生成【monsterAITree】

werl +P 1024000 -smp disable -sname gameserver -s xml_to_erlang -pa ../ebin start



