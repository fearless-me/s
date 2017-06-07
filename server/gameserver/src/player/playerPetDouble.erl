%%%-------------------------------------------------------------------
%%% @author Administrator
%%% @copyright (C) 2016, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 03. 十一月 2016 11:58
%%%-------------------------------------------------------------------
-module(playerPetDouble).
-author("Administrator").

-include("playerPrivate.hrl").
-include("pet.hrl").

-define(MOUNT_OUT(F, A), ?DEBUG_OUT(F, A)).
-define(MOUNT_OUT(F), ?DEBUG_OUT(F)).

%% API
-export([
	inviteDoubleMount/1,
	inviteDoubleMountAck/2,
	doubleMountOff/0,
	isInDoubleMountState/0,
	isDoubleMountType/1,
	getPetMountID1/0,
	getGuestRoleID/0
]).
-export([
	onOtherinviteDoubleMount/2,
	inviteOtherDoubleMountAck/2,
	beInviteOtherDoubleMountGo/2,
	inviteOtherDoubleMountGoAck/2,
	ownerRecivedGuestSayByeBye/2,
	guestRecivedOwnerSayByeBye/2,
	guestReciveOwnerChangeMap/2
]).

-export([
	onPosChange/2,
	forceMoveTo/1,
	onChangeMap/0
]).

%%---------------------------------------------------
onPosChange(X, Y)->
	Code = playerState:getPlayerCode(),
	case getDoubleMount() of
		#recDoublePetMount{ ownerCode = OwnCode,  guestCode = TarRoleCode} when OwnCode =:= Code ->
			case getMapPlayerPid(TarRoleCode) of
				offline ->
					?WARN_OUT("doubleMout on poschange ,but other offline"),
					skip;
				TargetPid -> %%同步给乘客
					RepMountSpeed = getRepMountSpeedOwner(),
					?MOUNT_OUT(" =====================> sycn(~p,~p),speed+(~w)",[X,Y,RepMountSpeed]),
					psMgr:sendMsg2PS(TargetPid, doubleMountForceToPosition, {playerState:getMapPid(), X, Y,RepMountSpeed})
			end;
		_ ->
			skip
	end.

getRepMountSpeedOwner() ->
	case playerVip:dealRepPowerValue(?Reputation_MonutSpeed, 0) of
		undefined ->
			0.0;
		Ret ->
			erlang:float(Ret)
	end.

getRepMountSpeedGuest() ->
	playerPropSync:getProp(?SerProp_RepMountSpeed).

%%---------------------------------------------------
%% 乘客强制移动
forceMoveTo({MapPid, X, Y, OwnerRepMountSpeed})->
	case MapPid =:= playerState:getMapPid() of
		true ->
			RepMountSpeed = getRepMountSpeedGuest(),
			case RepMountSpeed /= OwnerRepMountSpeed of
				true ->
					playerPropSync:setFloat(?SerProp_RepMountSpeed, OwnerRepMountSpeed - RepMountSpeed),
					playerVipInter:setMountSpeedAdd(?PetOnMount);
				_ ->
					skip
			end,
			?MOUNT_OUT(" =====================> go (~p,~p),speed+(~w)(~w) ",[X,Y,OwnerRepMountSpeed - RepMountSpeed,getRepMountSpeedGuest()]),
			playerMap:onLaterTransferPosAck(playerState:getMapID(), X, Y);
		_ ->
			ok
	end;
forceMoveTo(_)->
	ok.

%%---------------------------------------------------
%% 玩家切换地图成功
onChangeMap()->
	case isInDoubleMountState() of
		true ->
			%Code = playerState:getPlayerCode(),
			RoleID = playerState:getRoleID(),
			?MOUNT_OUT("=================> on player[~ts] change Map ok ~p",[playerState:getName(), getDoubleMount()]),
			case getDoubleMount() of
				#recDoublePetMount{ownerRoleID = ID1,guestRoleID =  GuestRoleID} when ID1 =:= RoleID ->
					doOwnerChangeMap(GuestRoleID);
				#recDoublePetMount{guestRoleID = ID2, ownerCode = OwnerCode} when ID2 =:= RoleID ->
					doGuestChangeMap(OwnerCode);
				_ ->
					skip
			end;
		_ ->
			ok
	end,
	ok.

%% 主人切地图
doOwnerChangeMap(0)->
	ok;
doOwnerChangeMap(TarRoleID)->
	MapID = playerState:getMapID(),
	MapPid = playerState:getMapPid(),
	RoleID = playerState:getRoleID(),
	NetPid = playerState:getNetPid(),
	case docheckMapType(MapID) of
		true ->
			case core:queryPlayerPidByRoleID(TarRoleID) of
				offline ->
					resetDoubleMount();
				TargetPid ->
					psMgr:sendMsg2PS(TargetPid, ownerChangeMapSuccess, {NetPid, RoleID, MapID, MapPid, playerState:getPos()})
			end;
		_ ->
			doubleMountOff()
	end.

%% 客人切地图
doGuestChangeMap(0)->
	ok;
doGuestChangeMap(OwnerCode)->
	MapID = playerState:getMapID(),
	case docheckMapType(MapID) of
		true ->
			case getMapPlayerPid(OwnerCode) of
				offline ->
					doubleMountOff();
				_ ->
					ok
			end;
		_ ->
			doubleMountOff()
	end,
	ok.

%%---------------------------------------------------
guestReciveOwnerChangeMap(_FromPid, Data)->
	{_NetPid, _RoleID, MapID, MapPid, {X, Y}} = Data,
	SelfMapID = playerState:getMapID(),
	case docheckMapType(SelfMapID) of
		true ->
			playerScene:onRequestEnterActivityMap(MapID, MapPid, float(X), float(Y));
		_ ->
			doubleMountOff()
	end.

%% 邀请别人
inviteDoubleMount(TarRoleID)->
	RoleID = playerState:getRoleID(),
	RoleName = playerState:getName(),
	NetPid = playerState:getNetPid(),
	if
		TarRoleID =:=RoleID ->
			?MOUNT_OUT("doubleMout(invite self)"),
			skip;
		true ->
			case checkCanInvite(TarRoleID) of
				true ->
					PetID = playerPet:getPetMountID(),
					case core:queryPlayerPidByRoleID(TarRoleID) of
						offline ->
							?MOUNT_OUT("doubleMout -1"),
							playerMsg:sendErrorCodeMsg(?ErrorCode_PetDoubleMountTargetOffLine);
						TargetPid ->
							psMgr:sendMsg2PS(TargetPid, inviteOtherDoubleMount, {NetPid, RoleID, RoleName, PetID})
					end;
				{_, Code} ->
					?MOUNT_OUT("doubleMout code[~p]",[Code]),
					playerMsg:sendErrorCodeMsg(Code)
			end
	end.

%% 别人邀请我
onOtherinviteDoubleMount(_FromPid, Data)->
	{NetPid, RoleID, RoleName, PetID} = Data,
	case checkCanbeInvite(RoleID) of
		true ->
			Msg = #pk_GS2U_DoublePetMountInvite{petID = PetID, srcName = RoleName, srcRoleID = RoleID},
			playerMsg:sendNetMsg(Msg);
		{_, _, CodeOther} ->
			playerMsg:sendErrorCodeMsg(NetPid, CodeOther);
		{_, Code} ->
			playerMsg:sendErrorCodeMsg(NetPid, Code)
	end,
	ok.

%% 回应别人邀请
inviteDoubleMountAck(SrcRoleID, 0) -> %% 拒绝
	case core:queryNetPidByRoleID(SrcRoleID) of
		offline ->
			skip;
%%			?MOUNT_OUT("doubleMout ack ,but other offline"),
%%			playerMsg:sendErrorCodeMsg(-2);
		NetPid ->
			?MOUNT_OUT("doubleMout refuse"),
			playerMsg:sendErrorCodeMsg(NetPid, ?ErrorCode_PetDoubleMountTargetRefuse,[playerState:getName()])
	end,
	ok;
inviteDoubleMountAck(SrcRoleID, _)-> %% 同意
	RoleID = playerState:getRoleID(),
	NetPid = playerState:getNetPid(),
	if
		SrcRoleID =:=RoleID->
			?MOUNT_OUT("doubleMout ack self"),
			skip;
		true ->
			case checkCanbeInvite(SrcRoleID) of
				true ->
					case core:queryPlayerPidByRoleID(SrcRoleID) of
						offline ->
							?MOUNT_OUT("doubleMout ack, offline"),
							playerMsg:sendErrorCodeMsg(?ErrorCode_PetDoubleMountTargetOffLine);
						TargetPid ->
							?MOUNT_OUT("doubleMout ack agree"),
							psMgr:sendMsg2PS(TargetPid, inviteOtherDoubleMountAckAgree, {NetPid, RoleID, playerState:getPlayerCode()})
					end;
				{_, CodeMe, CodeOther} ->
					case core:queryNetPidByRoleID(SrcRoleID) of
						offline ->
							?MOUNT_OUT("doubleMout ack offline(~p)",[CodeOther]),
							skip;
						TarNetPid ->
							?MOUNT_OUT("doubleMout ack[~p]",[CodeOther]),
							playerMsg:sendErrorCodeMsg(CodeMe),
							playerMsg:sendErrorCodeMsg(TarNetPid, CodeOther)
					end;
				{_, Code} ->
					case core:queryNetPidByRoleID(SrcRoleID) of
						offline ->
							?MOUNT_OUT("doubleMout ack offline(~p)",[Code]),
							skip;
						TarNetPid ->
							?MOUNT_OUT("doubleMout ack[~p]",[Code]),
							playerMsg:sendErrorCodeMsg(Code),
							playerMsg:sendErrorCodeMsg(TarNetPid, Code)
					end
			end
	end.

%% 收到客人的回应
inviteOtherDoubleMountAck(FromPid, Data)->
	SelfCode = playerState:getPlayerCode(),
	SelfRoleID = playerState:getRoleID(),
	PetCode = playerPet:getPetBattleCode(),
	PetID = playerPet:getPetMountID(),
	{TarNetPid, TarRoleID, TarCode} = Data,
	case checkCanInvite(TarRoleID) of
		true ->
			?MOUNT_OUT("doubleMout recive invite ack"),
			Rec = #recDoublePetMount{petID = PetID, petCode = PetCode, ownerCode = SelfCode,
				ownerRoleID = SelfRoleID, guestCode = TarCode, guestRoleID = TarRoleID},
			setDoubleMount(Rec),

			psMgr:sendMsg2PS(FromPid, inviteOtherDoubleMountGo, {PetID, PetCode, SelfCode,SelfRoleID});
		{_, Code} ->
			?MOUNT_OUT("doubleMout recive invite ack code[~p]",[Code]),
			playerMsg:sendErrorCodeMsg(TarNetPid, Code)
	end,
	ok.

%getPetMountSpeedRecord()->
%	OldAddSpeed = playerPropSync:getProp(?SerProp_RepMountSpeed),
%	MoveSpeed = playerState:getMoveSpeed().

%% 客人检测可以通过，驾驾驾驾驾驾驾驾驾驾
beInviteOtherDoubleMountGo(FromPid, Data)->
	SelfCode = playerState:getPlayerCode(),
	SelfRoleID = playerState:getRoleID(),
	{PetID, PetCode,OwnerCode,OwnerRoleID} = Data,
	case playerPet:petOnMountOther(PetCode,OwnerCode, PetID) andalso isInDoubleMountState() =:= false of
		true ->
			?MOUNT_OUT("doubleMout go go go go"),
			Rec = #recDoublePetMount{petID = PetID, petCode = PetCode, ownerCode = OwnerCode,
				ownerRoleID = OwnerRoleID, guestCode = SelfCode, guestRoleID = SelfRoleID},
			setDoubleMount(Rec),
			psMgr:sendMsg2PS(FromPid, inviteOtherDoubleMountGoAck, {true, SelfCode, SelfRoleID});
		_ ->
			?MOUNT_OUT("doubleMout go failed"),
			psMgr:sendMsg2PS(FromPid, inviteOtherDoubleMountGoAck, {false, SelfCode, SelfRoleID})
	end,
	ok.

%% 主人收到客人是否成功，驾驾驾驾驾驾驾驾驾驾
inviteOtherDoubleMountGoAck(_FromPid, Data)->
	SelfCode = playerState:getPlayerCode(),
	%SelfRoleID = playerState:getRoleID(),
	PetID = playerPet:getPetMountID(),
	PetCode = playerPet:getPetBattleCode(),
	MountState = isInDoubleMountState(),
	{Ret, TarCode, _TarRoleID} = Data,
	case Ret of
		true ->
			?MOUNT_OUT("doubleMout recive go ack"),
%%			Rec = #recDoublePetMount{petID = PetID, petCode = PetCode, ownerCode = SelfCode,
%%				ownerRoleID = SelfRoleID, guestCode = TarCode, guestRoleID = TarRoleID},
			playerPet:sendPetOnMountResult(PetCode, PetID, SelfCode, TarCode);
		_ when MountState =:= false ->
			resetDoubleMount(),
			?MOUNT_OUT("doubleMout recive go ack , mountstate false");
		_ ->
			resetDoubleMount(),
			?MOUNT_OUT("doubleMout recive go [~p]",[Ret]),
			skip
	end,
	ok.

%% 下双人坐骑
doubleMountOff()->
	RoleID = playerState:getRoleID(),
	case getDoubleMount() of
		#recDoublePetMount{ ownerRoleID = Own, guestRoleID = GuestID } when Own =:= RoleID->
			?MOUNT_OUT("doubleMout Owner MountOff"),
			sayByeBye(GuestID,ownerSayByeByeToGuest),
			resetDoubleMount(),
			false;
		#recDoublePetMount{  ownerRoleID = Own, guestRoleID = GuestID,petCode = Code } when GuestID =:= RoleID->
			?MOUNT_OUT("doubleMout Guest MountOff"),
			resetDoubleMount(),
			playerPet:petOffMountOther(Code),
			sayByeBye(Own,guestSayByeByeToOwner),
			true;
		_ ->
			resetDoubleMount(),
			?MOUNT_OUT("doubleMout None MountOff"),
			false
	end.

%%
sayByeBye(TarRoleID, MsgID)->
	SelfCode = playerState:getPlayerCode(),
	SelfRoleID = playerState:getRoleID(),
	case core:queryPlayerPidByRoleID(TarRoleID) of
		offline ->
			skip;
		TargetPid ->
			psMgr:sendMsg2PS(TargetPid, MsgID, {SelfCode, SelfRoleID})
	end.

%% 主人收到88
ownerRecivedGuestSayByeBye(_FromPid, Data)->
	{TarCode, TarRoleID} = Data,
	?MOUNT_OUT("doubleMout owner recive guest say 88(~w)(~w)",[Data,getDoubleMount()]),
	case getDoubleMount() of
		#recDoublePetMount{guestRoleID = ID} when TarRoleID =:= ID ->
			resetDoubleMount();
		#recDoublePetMount{guestCode = Code} when TarCode =:= Code ->
			resetDoubleMount();
		_ ->
			skip
	end,
	?MOUNT_OUT("doubleMout owner recive guest say 88 done(~w)",[getDoubleMount()]),
	ok.

%% 客人收到88
guestRecivedOwnerSayByeBye(_FromPid, Data)->
	{TarCode, TarRoleID} = Data,
	?MOUNT_OUT("doubleMout guest recive owner say 88"),
	case getDoubleMount() of
		#recDoublePetMount{ownerRoleID = ID, petCode = PetCode} when TarRoleID =:= ID ->
			resetDoubleMount(),
			playerPet:petOffMountOther(PetCode);
		#recDoublePetMount{ownerCode = Code, petCode = PetCode} when TarCode =:= Code ->
			resetDoubleMount(),
			playerPet:petOffMountOther(PetCode);
		_ ->
			skip
	end,
	ok.


%% 检查被邀请者
checkCanbeInvite(SrcRoleID)->
	case isInDoubleMountState() of
		true ->
			{false, ?ErrorCode_PetDoubleMountInDouble, ?ErrorCode_PetDoubleMountTargetInDouble};
		_ ->
			case getOnlineRoleCode(SrcRoleID) of
				0 ->
					{false, ?ErrorCode_PetDoubleMountTargetOffLine};
				Code ->
					docheckInviteTarget(Code)
			end
	end.

%% 检查邀请者
checkCanInvite(TarRoleID)->
	PetID = playerPet:getPetMountID(),
	case getCfg:getCfgByArgs(cfg_pet, PetID) of
		#petCfg{ doubleType = V } when V =:= 1 ->
			docheckMountPetState(TarRoleID);
		#petCfg{ } ->
			{false, ?ErrorCode_PetDoubleMountYouNotMount};
		_ ->
			{false, ?ErrorCode_PetDoubleMountYouNotMount}
	end.

%% 检查邀请者坐骑
docheckMountPetState(TarRoleID)->
	case isDoubleMountFull() of
		true ->
			{false, ?ErrorCode_PetDoubleMountFull};
		_ ->
			case getOnlineRoleCode(TarRoleID) of
				0 ->
					{false, ?ErrorCode_PetDoubleMountTargetOffLine};
				Code ->
					docheckInviteTarget(Code)
			end
	end.

%% 检查角色地图信息
docheckInviteTarget(Code) ->
	case playerState:getMapPlayerEts() of
		undefined ->
			{false, ?ErrorCode_PetDoubleMountTargetOffLine};
		PlayerEts ->
			case myEts:lookUpEts(PlayerEts, Code) of
				[#recMapObject{} = Rec] ->
					docheckInvitTargeMap(Rec);
				_ ->
					{false, ?ErrorCode_PetDoubleMountTargetOffLine}
			end
	end.

%% 检查角色地图信息和我所在地图
docheckInvitTargeMap(#recMapObject{
	x = DstX, y = DstY, mapId = DstMapID, mapPid = DstMapPid
})->
	MapID = playerState:getMapID(),
	MapPid = playerState:getMapPid(),
	State = playerState:getActionStatus(),
	{SrcX, SrcY} = playerState:getPos(),
	if
		MapID /= DstMapID orelse MapID =< 0 ->
			{false, ?ErrorCode_PetDoubleMountTargetOffLine};
		MapPid /= DstMapPid orelse MapPid =:= undefined ->
			{false, ?ErrorCode_PetDoubleMountTargetOffLine};
		State =:= ?CreatureActionStatusDead ->
			{false, ?ErrorCode_PetDoubleMountInDead};
		true ->
			case docheckMapType(MapID) of
				true ->
					docheckDistance(SrcX, SrcY,DstX, DstY);
				Ret ->
					Ret
			end
	end.

%% 检查地图类型
docheckMapType(MapID)->
	case playerScene:getMapType(MapID) of
		?MapTypeNormal ->
			true;
		_  when MapID=:=?NEED_FOR_SPEED_MAP_ID ->
			true;
		_ ->
			{false, ?ErrorCode_PetDoubleMountMapTypeErr}
	end.

%% 检查距离
docheckDistance(undefined,_,_,_)->
	{false, ?ErrorCode_PetDoubleMountFarFrom};
docheckDistance(_,undefined,_,_)->
	{false, ?ErrorCode_PetDoubleMountFarFrom};
docheckDistance(_,_,undefined,_)->
	{false, ?ErrorCode_PetDoubleMountFarFrom};
docheckDistance(_,_,_,undefined)->
	{false, ?ErrorCode_PetDoubleMountFarFrom};
docheckDistance(X, Y, DstX,DstY)->
	RadiosSquare = 100,
	case misc:calcDistSquare(X, Y, DstX, DstY) =< RadiosSquare of
		true ->
			true;
		_ ->
			{false, ?ErrorCode_PetDoubleMountFarFrom}
	end.

%% 取得在线玩家的code
getOnlineRoleCode(TarRoleID)->
	case playerMgrOtp:getOnlinePlayerInfoByID(TarRoleID) of
		#rec_OnlinePlayer{code = Code}->
			Code;
		_ ->
			0
	end.

%% 是否在双人坐骑状态
isInDoubleMountState()->
	case getDoubleMount() of
		#recDoublePetMount{ petCode = Code } when Code > 0 ->
			true;
		_ ->
			false
	end.

%% 检车玩家双人坐骑类型
isDoubleMountType(Type)->
	SelfCode = playerState:getPlayerCode(),
	case getDoubleMount() of
		#recDoublePetMount{ petCode = Code,ownerCode = Own, guestCode = GuestCode } when Code > 0 ->
			if
				SelfCode =:= Own ->
					Type =:= ?DoublePetOwner;
				SelfCode =:= GuestCode ->
					Type =:= ?DoublePetGuest;
				true ->
					false
			end ;
		_ ->
			false
	end.

%% 双人坐骑是否满员
isDoubleMountFull()->
	case getDoubleMount() of
		#recDoublePetMount{ ownerCode = Own, guestCode = GuestCode} when Own > 0 andalso GuestCode > 0 ->
			true;
		_ ->
			false
	end.

%% 同步坐骑时取得，骑乘信息
getPetMountID1()->
	SelfCode = playerState:getPlayerCode(),
	MountID = playerPet:getPetMountID(),
	case getDoubleMount() of
		#recDoublePetMount{ petCode = Code,ownerCode = Own, guestCode = GuestCode } when Code > 0 ->
			if
				SelfCode =:= Own ->
					{MountID, GuestCode};
				SelfCode =:= GuestCode ->
					{0, Own};
				true ->
					{MountID, 0}
			end ;
		_ ->
			{MountID, 0}
	end.


%%setter
setDoubleMount(#recDoublePetMount{} = Rec)->
	put('DoublePetMount', Rec).

getDoubleMount()->
	case get('DoublePetMount') of
		#recDoublePetMount{} = Rec ->
			Rec;
		_ ->
			#recDoublePetMount{}
	end.

resetDoubleMount()->
	setDoubleMount(#recDoublePetMount{}).

%%取得玩家所在地图内的某个code的Pid
getMapPlayerPid(Code)->
	case playerState:getMapPlayerEts() of
		undefined ->
			offline;
		PlayerEts ->
			case myEts:lookUpEts(PlayerEts, Code) of
				[#recMapObject{ pid = Pid}] ->
					Pid;
				_ ->
					offline
			end
	end.
%%获得同乘者角色id
getGuestRoleID()->
	case getDoubleMount() of
		#recDoublePetMount{ petCode = Code,guestRoleID = GuestRoleID } when Code > 0 ->
			{ok,GuestRoleID};
		_ ->
			{error,none}
	end.