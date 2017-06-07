rem 停止登录服务器
cd loginserver/script
erl -make
call stop.bat
cd ..
cd ..

rem 停止funcell服务器
cd funcell/script
erl -make
call stop.bat
cd ..
cd ..

rem 停止游戏服务器
cd gameserver/script
erl -make
call stop.bat
cd ..
cd ..

rem 停止公共服务器
cd commonserver/script
erl -make
call stop.bat
cd ..
cd ..

rem 停止数据库服务器
rem rem last to stop db server
cd dbserver/script
erl -make
call stop.bat
cd ..
cd ..

rem 启动数据库服务器
cd dbserver/script
call start.bat
cd ..
cd ..

rem 启动funcell服务器
cd funcell/script
call start.bat
cd ..
cd ..

rem sleep 30
ping 127.0.0.1 -n 30 -w 1000 > nul

rem 启动公共服务器
cd commonserver/script
call start.bat
cd ..
cd ..

::这两个没有时序要求

rem 启动登录服务器
cd loginserver/script
call start.bat
cd ..
cd ..

rem sleep 30
ping 127.0.0.1 -n 30 -w 1000 > nul

rem 启动游戏服务器
cd gameserver/script
call start.bat
cd ..
cd ..

