rem ֹͣ��¼������
cd loginserver/script
erl -make
call stop.bat
cd ..
cd ..

rem ֹͣfuncell������
cd funcell/script
erl -make
call stop.bat
cd ..
cd ..

rem ֹͣ��Ϸ������
cd gameserver/script
erl -make
call stop.bat
cd ..
cd ..

rem ֹͣ����������
cd commonserver/script
erl -make
call stop.bat
cd ..
cd ..

rem ֹͣ���ݿ������
rem rem last to stop db server
cd dbserver/script
erl -make
call stop.bat
cd ..
cd ..

rem �������ݿ������
cd dbserver/script
call start.bat
cd ..
cd ..

rem ����funcell������
cd funcell/script
call start.bat
cd ..
cd ..

rem sleep 30
ping 127.0.0.1 -n 30 -w 1000 > nul

rem ��������������
cd commonserver/script
call start.bat
cd ..
cd ..

::������û��ʱ��Ҫ��

rem ������¼������
cd loginserver/script
call start.bat
cd ..
cd ..

rem sleep 30
ping 127.0.0.1 -n 30 -w 1000 > nul

rem ������Ϸ������
cd gameserver/script
call start.bat
cd ..
cd ..

