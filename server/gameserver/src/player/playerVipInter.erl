%%%-------------------------------------------------------------------
%%% @author tiancheng
%%% @copyright (C) 2015, <COMPANY>
%%% @doc
%%% 爵位系统特权对外接口
%%% @end
%%% Created : 20. 一月 2015 16:28
%%%-------------------------------------------------------------------
-module(playerVipInter).
-author("tiancheng").

-include("playerPrivate.hrl").
-include("mount.hrl").

%% API
-export([
	getTransferTime/1,
	getBuyItemMoney/2,
	getDecomposeItem/1,
	getCopyMapGold/1,
	getCopyMapExp/1,
	addDropLuckly/0,
	getCopyMapAddTimes/1,
	getKillMonsterExp/1,
	getAddHonor/1,
	setMountSpeedAdd/1,
	getVipChatCDTime/0,
	getExtraLadderNumber/0
]).

%% 获取额外可购买的竞技场次数
getExtraLadderNumber() ->
	case playerVip:dealRepPowerValue(?Reputation_BuyLadderNum, 0) of
		undefined ->
			0;
		Ret ->
			Ret
	end.

%% 获取新的传送cd时间
-spec getTransferTime(Time::uint()) -> uint().
getTransferTime(Time) ->
	case playerVip:dealRepPowerValue(?Reputation_Transfer, Time) of
		undefined ->
			Time;
		Ret ->
			Ret
	end.

%% 获取新的购买价钱
-spec getBuyItemMoney(UseCoinType::coinUseType(), NeedWealth::uint()) -> uint().
getBuyItemMoney(UseCoinType, NeedWealth) ->
	case UseCoinType =:= ?CoinUseTypeGold andalso NeedWealth > 1 of
		true ->
			case playerVip:dealRepPowerValue(?Reputation_Shop, NeedWealth) of
				undefined ->
					NeedWealth;
				Ret ->
					Ret
			end;
		_ ->
			NeedWealth
	end.

%% 分解获得精华加成
-spec getDecomposeItem(Value::uint()) -> uint().
getDecomposeItem(Value) ->
	case playerVip:dealRepPowerValue(?Reputation_Decompose, Value) of
		undefined ->
			Value;
		Ret ->
			Ret
	end.

%% 副本通关金币奖励增加
-spec getCopyMapGold(Value::uint()) -> uint().
getCopyMapGold(Value) ->
	case playerVip:dealRepPowerValue(?Reputation_CopyMapDouCoin, Value) of
		undefined ->
			Value;
		Ret ->
			Ret
	end.

%% 副本通关经验奖励增加
-spec getCopyMapExp(Value::uint()) -> uint().
getCopyMapExp(Value) ->
	case playerVip:dealRepPowerValue(?Reputation_CopyMapDouExp, Value) of
		undefined ->
			Value;
		Ret ->
			Ret
	end.

%% 获取杀怪掉落的幸运加成
-spec addDropLuckly() -> ok.
addDropLuckly() ->
%%	case playerVip:dealRepPowerValue(?Reputation_DropLuckly, 0) of
%%		undefined ->
%%			skip;
%%		Ret ->
%%			%% 增加幸运值
%%			case Ret > 0 of
%%				true ->
%%					playerCalcProp:changeProp_AddMulti( [{?Prop_lucky, Ret}], [], ?EquipOn, true);
%%				_ ->
%%					skip
%%			end
%%	end,
	ok.

%% 获得副本每日增加的次数
-spec getCopyMapAddTimes(MapID::uint()) -> uint().
getCopyMapAddTimes(MapID) ->
	%% Reputation_Money 与 Reputation_Activity 执行事件一样
	V = case playerVip:dealRepPowerValue(?Reputation_Money, MapID) of
			undefined ->
				0;
			Ret ->
				Ret
		end,
	case V =< 0 of
		true ->
			case playerVip:dealRepPowerValue(?Reputation_Activity, MapID) of
				undefined ->
					0;
				Ret2 ->
					Ret2
			end;
		_ ->
			V
	end.

%% 获取打怪获得经验的提升结果总值
-spec getKillMonsterExp(Exp::uint()) -> uint().
getKillMonsterExp(Exp) ->
	case erlang:is_integer(Exp) andalso Exp > 0 of
		true ->
			case playerVip:dealRepPowerValue(?Reputation_KillMonster, Exp) of
				undefined ->
					Exp;
				Ret ->
					Ret
			end;
		_ ->
			Exp
	end.

%% 获取爵位对增加荣誉的加成
-spec getAddHonor(HonorValue::uint()) -> uint().
getAddHonor(HonorValue) ->
	case erlang:is_integer(HonorValue) andalso HonorValue > 0 of
		true ->
			case playerVip:dealRepPowerValue(?Reputation_BattleWar, HonorValue) of
				undefined ->
					HonorValue;
				Ret ->
					Ret
			end;
		_ ->
			HonorValue
	end.

%% 设置坐骑速度加成值
-spec setMountSpeedAdd(Operate::uint()) -> ok.
setMountSpeedAdd(Operate) ->
	OldAddSpeed = playerPropSync:getProp(?SerProp_RepMountSpeed),
	NewAddSpeed = case playerVip:dealRepPowerValue(?Reputation_MonutSpeed, 0) of
					  undefined ->
						  0.0;
					  Ret ->
						  erlang:float(Ret)
				  end,

	case Operate of
		?PetOnMount ->
			%% 上
			case NewAddSpeed > 0 of
				true ->
					playerCalcProp:changeProp_AddMulti([{?Prop_MoveSpeed, NewAddSpeed}], [], ?EquipOn, true),
					%% 记录本次加成速度
					playerPropSync:setFloat(?SerProp_RepMountSpeed, NewAddSpeed);
				_ ->
					skip
			end;
		?PetOffMount ->
			%% 下
			case OldAddSpeed > 0 of
				true ->
					%% 上次有加成，则减去
					playerCalcProp:changeProp_AddMulti( [{?Prop_MoveSpeed, -OldAddSpeed}], [], ?EquipOn, true),
					%% 清0加成的速度
					playerPropSync:setFloat(?SerProp_RepMountSpeed, 0.0);
				_ ->
					skip
			end
	end,
	ok.

-spec getVipChatCDTime() -> uint().
getVipChatCDTime() ->
    case playerVip:dealRepPowerValue(?Reputation_ChatCDTime, 0) of
        undefined ->
            undefined;
        Ret ->
            Ret
    end.