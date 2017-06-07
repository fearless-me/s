-module(timerMgr).

%%
%% Include files
%%

-include_lib("stdlib/include/ms_transform.hrl").
-include("logger.hrl").

-export([
	registerTimer/4,
	unregisterTimer/1,
	tick/1
]).

-record(recTimer,
{
	time,
	m,f,a,
	lastTickTime
}).

%%注册一个计时器，在指定时间间隔去执行指定函数
registerTimer(Time,M,F,A) ->
	TL = getTimerList(),
	case lists:keyfind(Time,#recTimer.time,TL) of
		#recTimer{} ->
			?ERROR_OUT("duplicate register Timer for time:~p in pid:~p,stack:~p",[Time,self(),misc:getStackTrace()]),
			false;
		_ ->
			T = #recTimer{
				time = Time,
				m = M,
				f = F,
				a = A,
				lastTickTime = 0
			},
			setTimerList([T | TL]),
			true
	end.

%%注销一个计时器
unregisterTimer(Time) ->
	List = getTimerList(),
	case lists:keyfind(Time,#recTimer.time,List) of
		#recTimer{} ->
			L = lists:keydelete(Time,#recTimer.time,List),
			setTimerList(L),
			true;
		_ ->
			false
	end.

%%执行计时器
tick(NowTime) ->
	List = getTimerList(),
	Fun = fun(#recTimer{time = Time,lastTickTime = LT,m = M,f = F,a = A} = T,AccIn) ->
		case NowTime - LT >= Time of
			true ->
				erlang:apply(M, F, A),
				[T#recTimer{lastTickTime = NowTime} | AccIn];
			_ ->
				[T | AccIn]
		end
	end,
	setTimerList(lists:foldl(Fun,[],List)),
	ok.


getTimerList() ->
	case get(timer) of
		undefined ->
			[];
		List ->
			List
	end.

setTimerList(List) ->
	put(timer,List),
	ok.


%% -record( timerData, { addTime, timer_Value, timer_param } ).
%% 
%% %%
%% %% Exported Functions
%% %%
%% 
%% -compile(export_all).
%% -import(misc,[for/4]).
%% 
%% 
%% -define( TIMER_INTERVAL, 300 ).
%% -define( TIMER_MAX, 60000 ).
%% -define( TIMER_ARRAY_SIZE, 200 ).
%% 
%% initTimer( CallBackMode, CallBackHandle )->
%% 	%时间槽数组，存储timerData记录中的参数信息timer_param列表
%% 	TimerArray = array:new( ?TIMER_ARRAY_SIZE, {default, []} ),
%% 	put( "timerManager_TimerArray", TimerArray ),
%% 
%% 	%运行的时间数组
%% 	RunTimerArray = array:new( ?TIMER_ARRAY_SIZE, {default, []} ),
%% 	put( "timerManager_RunArray", RunTimerArray ),
%% 	%执行到的时间槽数组索引
%% 	put( "timerManager_RunIndex", 0 ),
%% 	%执行到某个时间片中间，还有没有一点时间没有到，保存在这里
%% 	put( "timerManager_NowRemainTime", 0 ),
%% 	%超出时间数组所能表示的最大时间，保存在这里
%% 	put( "timerManager_LongTimerList", [] ),
%% 	%上次执行时间
%% 	put( "timerManager_LastUpdateTime", os:timestamp() ),
%% 	%timer的回调模块
%% 	put( "timerManager_CallBackMode", CallBackMode ),
%% 	%timer的回调函数
%% 	put( "timerManager_CallBackHandle", CallBackHandle ),
%% 	
%% 	erlang:send_after( ?TIMER_INTERVAL, self(), {timerManager_Interval} ),
%% 	
%% 	ok.
%% 
%% send_after( TimeValue, _TimePid, TimeParam )->
%% 	TimerManager_RunIndex = get( "timerManager_RunIndex" ),
%% 	
%% 	case TimeValue =< ?TIMER_INTERVAL of
%% 		true->%%小于等于最小时间片，直接在timerManager_RunIndex位置上加
%% 			AddIndex = TimerManager_RunIndex;
%% 		false->
%% 			case TimeValue > ?TIMER_MAX of
%% 				true->%%大于最大时间片，直接扔到队列
%% 					AddIndex = -1;
%% 				false->
%% 					%%-1是为了如200，放在索引1里，规则是0--100->0 101--200->1 201--300->2
%% 					IntIndex = ( TimeValue - 1 ) div  ?TIMER_INTERVAL,
%% 					
%% 					Test_AddIndex = TimerManager_RunIndex + IntIndex,
%% 					case Test_AddIndex >= ?TIMER_ARRAY_SIZE of
%% 						true->%%新加入位置超出了数组大小
%% 							%%Test_AddIndex2跑到前面去了
%% 							Test_AddIndex2 = IntIndex - ( ?TIMER_ARRAY_SIZE - TimerManager_RunIndex ),
%% 							%%检测新加入位置是否超过了TimerManager_RunIndex，超过了，表示超上限了，扔队列
%% 							case Test_AddIndex2 > TimerManager_RunIndex of
%% 								true->
%% 									AddIndex = -1;
%% 								false->
%% 									AddIndex = Test_AddIndex2
%% 							end,
%% 							ok;
%% 						false->
%% 							AddIndex = Test_AddIndex
%% 					end
%% 			end
%% 	end,
%% 	case AddIndex =:= -1 of
%% 		true->
%% 			%时间太长了，放入长时间列表
%% 			TimerData = #timerData{ addTime=os:timestamp(), timer_Value=TimeValue, timer_param=TimeParam },
%% 			put( "timerManager_LongTimerList", [TimerData] ++ get("timerManager_LongTimerList") );
%% 		false->
%% 			%将timer的参数放入相应的时间槽
%% 			TimerManager_TimerArray = get( "timerManager_TimerArray" ),
%% 			OldList = array:get( AddIndex, TimerManager_TimerArray ),
%% 			TimerManager_TimerArray2 = array:set( AddIndex, [TimeParam] ++ OldList, TimerManager_TimerArray ),
%% 			put( "timerManager_TimerArray", TimerManager_TimerArray2 )
%% 	end,
%% 	
%% 	ok.
%% 	
%% on_timerManager_Interval( StateData )->	
%% 	try
%% 		erlang:send_after( ?TIMER_INTERVAL, self(), {timerManager_Interval} ),
%% 		Now = os:timestamp(),
%% 		LastUpdateTime = get( "timerManager_LastUpdateTime" ),
%% 		TimeDisp = (timer:now_diff( Now, LastUpdateTime ) div 1000) + get( "timerManager_NowRemainTime"),
%% 		
%% 		case TimeDisp < ?TIMER_INTERVAL of
%% 			true->%%小于一个时间片，直接退出
%% 				throw({return});
%% 			false->ok
%% 		end,
%% 		
%% 		put( "timerManager_LastUpdateTime", Now ),
%% 		
%% 		TimerManager_RunIndex = get( "timerManager_RunIndex" ),
%% 		
%% 		%%流失的时间，需要运行多少个时间片 >= 1
%% 		NeedRunCount = ( TimeDisp div ?TIMER_INTERVAL ),
%% 		
%% 		case TimeDisp > ?TIMER_MAX of
%% 			true->%%大于最大时间片，全部运行，清除
%% 				AddIndex = -1, IsOut = false;
%% 			false->
%% 				%%注意把余数加进去
%% 				ModTimeDisp = TimeDisp rem ?TIMER_INTERVAL,
%% 				put( "timerManager_NowRemainTime", ModTimeDisp ),
%% 				
%% 				%%需要设置新的timerManager_RunIndex位置
%% 				Test_AddIndex = TimerManager_RunIndex + NeedRunCount,
%% 				case Test_AddIndex >= ?TIMER_ARRAY_SIZE of
%% 					true->
%% 						IsOut = true,
%% 						
%% 						Test_AddIndex2 = NeedRunCount - ( ?TIMER_ARRAY_SIZE - TimerManager_RunIndex ),
%% 						%%检测新加入位置是否超过了TimerManager_RunIndex，超过了，表示超上限了，扔队列
%% 						case Test_AddIndex2 > TimerManager_RunIndex of
%% 							true->
%% 								AddIndex = -1;
%% 							false->
%% 								AddIndex = Test_AddIndex2
%% 						end;
%% 					false->
%% 						AddIndex = Test_AddIndex,
%% 						IsOut = false
%% 				end
%% 		end,
%% 
%% 		case AddIndex =:= -1 of
%% 			true->%%大于最大时间片，全部运行，清除
%% 				put( "timerManager_RunArray", get( "timerManager_TimerArray" ) ),
%% 				put( "timerManager_RunIndex", 0 ),
%% 				put( "timerManager_NowRemainTime", 0 ),
%% 				
%% 				put( "timerManager_TimerArray", array:new( ?TIMER_ARRAY_SIZE, {default, []} ) ),
%% 
%% 				CallBackMode = get( "timerManager_CallBackMode" ),
%% 				CallBackHandle = get( "timerManager_CallBackHandle" ),
%% 				RunArray = get( "timerManager_RunArray" ),
%% 
%% 				MyFunc = fun( Index )->
%% 								  List = array:get( Index, RunArray ),
%% 								  MyFunc3 = fun( Record )->
%% 													Return = CallBackMode:CallBackHandle( Record#timerData.timer_param, StateData ),
%% 													case Return of
%% 														{noreply, StateData2}->
%% 															put( "timerManager_StateData", StateData2 );
%% 														{stop, normal, _StateData2}->
%% 															throw( {return} );
%% 														_->ok
%% 													end
%% 											end,
%% 								  lists:foreach( MyFunc3, List )
%% 						  end,
%% 				for( 1, ?TIMER_ARRAY_SIZE-1, 1, MyFunc ),
%% 				
%% 				case TimerManager_RunIndex > 0 of
%% 					true->
%% 						for( 0, TimerManager_RunIndex-1,1, MyFunc );
%% 					false->
%% 						ok
%% 				end,
%% 
%% 				ok;
%% 			false->
%% 				put( "timerManager_RunIndex", AddIndex ),
%% 				put( "timerManager_RunCount", 0 ),
%% 
%% 				%%把需要运行的List推到timerManager_RunArray数组里，将timerManager_TimerArray相应位置置空
%% 				MyFunc = fun( Index )->
%% 								TimerManager_TimerArray = get( "timerManager_TimerArray" ),
%% 								OldList = array:get( Index, TimerManager_TimerArray ),
%% 								case OldList of
%% 									[]->ok;
%% 									_->
%% 										RunArray = get( "timerManager_RunArray" ),
%% 										RunAddIndex = get( "timerManager_RunCount" ),
%% 										put( "timerManager_RunCount", RunAddIndex + 1 ),
%% 										
%% 										put( "timerManager_RunArray", array:set( RunAddIndex, OldList, RunArray) ),
%% 										
%% 										TimerManager_TimerArray2 = array:set( Index, [], TimerManager_TimerArray ),
%% 										put( "timerManager_TimerArray", TimerManager_TimerArray2 )
%% 								end
%% 						 end,
%% 				
%% 				case IsOut of
%% 					true->
%% 						for( TimerManager_RunIndex, ?TIMER_ARRAY_SIZE-1, 1,MyFunc ),
%% 						
%% 						case AddIndex > 0 of
%% 							true->
%% 								for( 0, AddIndex-1, 1,MyFunc );
%% 							false->
%% 								ok
%% 						end;
%% 					false->
%% 						case AddIndex - 1 >= TimerManager_RunIndex of
%% 							true->
%% 								for( TimerManager_RunIndex, AddIndex-1,1, MyFunc );
%% 							false->
%% 								ok
%% 						end
%% 				end,
%% 
%% 				RunCount = get( "timerManager_RunCount" ),
%% 				CallBackMode = get( "timerManager_CallBackMode" ),
%% 				CallBackHandle = get( "timerManager_CallBackHandle" ),
%% 				
%% 				case RunCount > 0 of
%% 					true->
%% 						RunArray = get( "timerManager_RunArray" ),
%% 		
%% 						MyFunc2 = fun( Index )->
%% 										  List = array:get( Index, RunArray ),
%% 										  MyFunc3 = fun( TimerArgs )->
%% 															Return = CallBackMode:CallBackHandle( TimerArgs, StateData ),
%% 															case Return of
%% 																{noreply, StateData2}->put( "timerManager_StateData", StateData2 );
%% 																{stop, normal, _StateData2}->throw( {return} );
%% 																_->ok
%% 															end
%% 													end,
%% 										  lists:foreach( MyFunc3, List )
%% 								  end,
%% 						for( 0, RunCount-1,1, MyFunc2 );
%% 					false->ok
%% 				end,
%% 				ok
%% 		end,
%% 		
%% 		%%超过TIMER_MAX时间的
%% 		put( "timerManager_RunList", [] ),
%% 		
%% 		MyFunc4 = fun( Record )->
%% 						  TimeDisp3 = timer:now_diff( Now, Record#timerData.addTime ) div 1000,
%% 						  case TimeDisp3 >= Record#timerData.timer_Value of
%% 							  true->
%% 								  put( "timerManager_RunList", [Record] ++ get( "timerManager_RunList" ) ),
%% 								  [];
%% 							  false->
%% 								  Record
%% 						  end
%% 				  end,
%% 		NewList = lists:map( MyFunc4, get("timerManager_LongTimerList") ),
%% 		
%% 		MyFunc5 = fun( Record )->
%% 						  Record =/= []
%% 				  end,
%% 		NewList2 = lists:filter( MyFunc5, NewList ),
%% 		
%% 		put( "timerManager_LongTimerList", NewList2 ),
%% 		
%% 		MyFunc6 = fun( Record )->
%% 						Return2 = CallBackMode:CallBackHandle( Record#timerData.timer_param, StateData ),
%% 						case Return2 of
%% 							{noreply, StateData2}->
%% 								put( "timerManager_StateData", StateData2 );
%% 							{stop, normal, _StateData2}->
%% 								throw( {return} );
%% 							_->
%% 								ok
%% 						end
%% 				  end,
%% 		lists:foreach( MyFunc6, get("timerManager_RunList") ),
%% 		ok
%% 	catch
%% 		{return}->ok
%% 	end.
	
%% make_timerManager_TimerArray
%% 				MyFunc = fun( Index )->
%% 								TimerManager_TimerArray = get( "timerManager_TimerArray" ),
%% 								OldList = array:get( Index, TimerManager_TimerArray ),
%% 								case OldList of
%% 									[]->ok;
%% 									_->
%% 										RunArray = get( "timerManager_RunArray" ),
%% 										RunAddIndex = get( "timerManager_RunCount" ),
%% 										put( "timerManager_RunCount", RunAddIndex + 1 ),
%% 										
%% 										put( "timerManager_RunArray", array:set( RunAddIndex, OldList, RunArray) ),
%% 										
%% 										TimerManager_TimerArray2 = array:set( Index, [], TimerManager_TimerArray ),
%% 										put( "timerManager_TimerArray", TimerManager_TimerArray2 )
%% 								end
%% 						 end,
	
	
	
	
	
