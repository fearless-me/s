%%%-------------------------------------------------------------------
%%% @author mwh
%%% @copyright (C) 2017, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 26. 七月 2017 16:57
%%%-------------------------------------------------------------------
-module(playerPetReset).
-author("Administrator").

-include("playerPrivate.hrl").
-include("pet.hrl").

%% API
-export([
	resetPet/1
]).

-define(OPEN_LEVEL, 40).

%%%-------------------------------------------------------------------
resetPet(PetID) ->
	case canResetPet(PetID) of
		{true, Pet, Cost} ->
			doResetPet(Pet, Cost);
		{_, ErrorCode} ->
			playerMsg:sendErrorCodeMsg(ErrorCode);
		_ ->
			skip
	end.

canResetPet(PetID) ->
	Pets = playerState:getPets(),
	case playerState:getLevel() >= ?OPEN_LEVEL of
		true ->
			case checkPetIsExist(PetID, Pets) of
				#recPetInfo{} = Pet ->
					{CoinUseType, UseNumber} = getCost(),
					case playerMoney:canUseCoin(CoinUseType, UseNumber) of
						true ->
							{true, Pet,{CoinUseType, UseNumber}};
						_ ->
							{false, ?ErrorCode_TradeDiamond}
					end;
				_ ->
					{false, ?ErrorCode_PetNotExistError}
			end;
		_ ->
			skip
	end.

getCost()->
	case getCfg:getCfgByArgs(cfg_globalsetup, pet_recycle_cost) of
		#globalsetupCfg{setpara = [V]}->
			{?CoinUseTypeDiamond, V};
		_ ->
			{?CoinUseTypeDiamond, 999999999}
	end.

doResetPet(#recPetInfo{pet_id = PetID, pet_status = Status} = Pet, Cost) ->
	true = decCost(PetID, Cost),
	playerPetProp:onPetAttrChange2Master(PetID, ?EquipOff, false),
	ok = returnPetStar(Pet),
	ok = returnPetRaw(Pet),
	ok = returnPetUp(Pet),
	
	NewPet = playerPet:makePetInfo(PetID),
	playerPet:savePetInfoToDB(NewPet#recPetInfo{pet_status = Status}),
	playerForce:calcOnePetForce(PetID, true),
	playerPetProp:onPetAttrChange2Master(PetID, ?EquipOn, true),
	playerMsg:sendNetMsg(#pk_GS2U_ResetPetAck{petID = PetID}),
	ok.

decCost(PetID, {CoinUseType, UseNumber})->
	playerMoney:useCoin(
		CoinUseType
		, UseNumber
		, #recPLogTSMoney{
			reason = ?CoinUsePetRecycle,
			param = PetID,
			target = ?PLogTS_PlayerSelf,
			source = ?PLogTS_PlayerSelf
		});
decCost(_,_)->
	error.

%%%-------------------------------------------------------------------
returnPetStar(#recPetInfo{pet_id = PetID, pet_star = Star}) ->
	GroupID =
		case getCfg:getCfgPStack(cfg_pet, PetID) of
			#petCfg{time = 0, enhCost = EnhCostGroupID} ->
				EnhCostGroupID;
			_ ->
				0
		end,
	Title = getMailTitle(),
	Content = getMailContent(PetID),
	CostList = makePetStarCostList([], GroupID, Star),
	lists:foreach(
		fun({ItemID, ItemNumber}) ->
			playerMail:sendGoodsMailTitleAndContent(
				ItemID,
				ItemNumber,
				false,
				0,
				Title,
				Content,
				?ItemSourcePetRecycle
			)
		end, CostList),
	ok.

makePetStarCostList(Acc, 0, _Star) ->
	Acc;
makePetStarCostList(Acc, _GroupID, 0) ->
	Acc;
makePetStarCostList(Acc, GroupID, Star) ->
	NewAcc =
		case getCfg:getCfgPStack(cfg_petreborn, GroupID, Star) of
			#petrebornCfg{item_star = L} ->
				lists:foldl(
					fun({ItemID, ItemNumber}, AccL) ->
						case lists:keyfind(ItemID, 1, AccL) of
							false ->
								[{ItemID, ItemNumber} | AccL];
							{ItemID, OldNumber} ->
								lists:keystore(ItemID, 1, AccL, {ItemID, OldNumber + ItemNumber})
						end
					end, Acc, L
				);
			_ ->
				Acc
		end,
	makePetStarCostList(NewAcc, GroupID, Star - 1).

%%%-------------------------------------------------------------------
returnPetRaw(#recPetInfo{pet_id = PetID, pet_raw = Raw}) ->
	EnCostList =
		case getCfg:getCfgPStack(cfg_pet, PetID) of
			#petCfg{time = 0, avatar = EnhCost} ->
				EnhCost;
			_ ->
				[]
		end,

	Title = getMailTitle(),
	Content = getMailContent(PetID),
	CostList = makePetRawCostList([], Raw, EnCostList),
	lists:foreach(
		fun({ItemID, ItemNumber}) ->
			playerMail:sendGoodsMailTitleAndContent(
				ItemID,
				ItemNumber,
				false,
				0,
				Title,
				Content,
				?ItemSourcePetRecycle
			)
		end, CostList),
	ok.

makePetRawCostList(Acc, 0, _EnCostList) ->
	Acc;
makePetRawCostList(Acc, _Raw, []) ->
	Acc;
makePetRawCostList(Acc, Raw, EnCostList) ->
	CostLen = length(EnCostList),
	NewAcc =
		case Raw =< CostLen of
			true ->
				{ItemID, ItemNum} =
				case lists:nth(Raw, EnCostList) of
					{ItemID1, _ID2, ItemNum1} ->
						{ItemID1, ItemNum1};
					{ItemID2, ItemNum2}->
						{ItemID2, ItemNum2};
					_ ->
						{0,0}
				end,
				if
					ItemID > 0 ->
						case lists:keyfind(ItemID, 1, Acc) of
							false ->
								[{ItemID, ItemNum} | Acc];
							{ItemID, OldNumber} ->
								lists:keystore(ItemID, 1, Acc, {ItemID, OldNumber + ItemNum})
						end;
					true ->
						Acc
				end;
			_ ->
				Acc
		end,
	makePetRawCostList(NewAcc, Raw - 1, EnCostList).
%%%-------------------------------------------------------------------
returnPetUp(#recPetInfo{pet_id = PetID, upCount = UpCount}) ->
	Title = getMailTitle(),
	Content = getMailContent(PetID),
	CostList = makePetAttrUpCostList(UpCount),
	lists:foreach(
		fun({ItemID, ItemNumber}) ->
			playerMail:sendGoodsMailTitleAndContent(
				ItemID,
				ItemNumber,
				false,
				0,
				Title,
				Content,
				?ItemSourcePetRecycle
			)
		end, CostList),
	ok.

makePetAttrUpCostList(0) ->
	[];
makePetAttrUpCostList(UpCount) ->
	[{CostId, CostNum}] = globalCfg:getPetAttaMaterial(),
	[{CostId, CostNum * UpCount}].


%%检查宠物是否存在
-spec checkPetIsExist(PetID :: uint(), Pets :: list()) -> false | #recPetInfo{}.
checkPetIsExist(PetID, Pets) ->
	case lists:keyfind(PetID, #recPetInfo.pet_id, Pets) of
		false ->
			false;
		Pet ->
			Pet
	end.

getMailTitle()->
	stringCfg:getString(pet_recycle_email_title).

getMailContent(PetID)->
	PetName =
		case getCfg:getCfgByArgs(cfg_pet, PetID) of
			#petCfg{petName = Name} ->
				Name;
			_ ->
				integer_to_list(PetID)
		end,

	stringCfg:getString(pet_recycle_email,[PetName, PetName]).