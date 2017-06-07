%% @author zhengzhichun
%% @doc @todo Add description to playerLogAdd.


-module(playerLogAdd).
-include("playerPrivate.hrl").
%% ====================================================================
%% API functions
%% ====================================================================
-export([
		 addLogParticipatorInfo/1
]).

%%玩法参与者信息统计
-spec addLogParticipatorInfo(Type::?LogParticipator_Min .. ?LogParticipator_Max) ->ok.
addLogParticipatorInfo(Type) ->
	PlayerForce = playerPropSync:getProp(?PriProp_PlayerForce),
	PetForce = playerPropSync:getProp(?PriProp_PetForce),
	dbLog:sendSaveLogParticipatorInfo(#recLogParticipatorInfo{
															  roleName = playerState:getName(),
															  roleID = playerState:getRoleID(),
															  roleLevel = playerState:getLevel(),
															  currentRecharge = playerState:getRechargeAcc(),
															  forcePower = PlayerForce+PetForce,
															  type = Type,
															  time = time:getLogTimeSec()
															 }),
	ok.