%% @author Administrator
%% @doc 升到某一等级时，升级需要处理的一些事情.


-module(playerLevelUp).

-include("playerPrivate.hrl").

-define(MountFoodNum, 20).

%% ====================================================================
%% API functions
%% ====================================================================
-export([
	onFirstLoginEachLevel/1,
	onLevelUp/2
]).

%% 升到某一等级时，需要处理的一些事情
onFirstLoginEachLevel(Levels) ->
	%每升一级都要处理下   （登录有礼）登录时，升级时
	RoleID = playerState:getRoleID(),
	
	Fun = fun(Level) ->
		%% 升级需要处理的一些事情
		psMgr:sendMsg2PS(self(), checkLoginAward, { RoleID, playerState:getAwardTakens(), Level }),
		%%中途升级，看能参加BOSS战活动不
		playerWorldBossWar:onLoginRoleCanIn(),

		playerSignIn:onFirstLoginEachLevel(Level),
		% 好友系统修改后没有幸运币的概念，屏蔽幸运币相关代码
		%%playerLuckyCoin:onLevelUp(Level),
		playerHolidayTask:onFirstLoginEachLevel(Level),

		skip
	      end,
	lists:foreach(Fun, Levels),
	ok.


onLevelUp(OldLevel, NewLevel)->
	%%自动升级可升级的技能
	lists:foreach(
		fun(Lv) ->
			playerSideTask:onLevelUp(Lv),
			playerSkillLearn:addSkillPointLevelUp(Lv)
		end, lists:seq(OldLevel + 1, NewLevel)),
	playerSkillLearn:autoUpSkill(NewLevel),
	playerSkillLearn:onRoleLevelUpBaseComboSkill(NewLevel),
	saveUnlockNewRace(NewLevel),
	playerWing:needInitWingLevel(NewLevel),
	%% 玩家升级检测是否可以领取环任务引导任务
	playerLoopTask:acceptLink(),
	playerMarriageTask:acceptLink(),
	%%更新成就进度
	playerAchieve:achieveEvent(?Achieve_Level, [NewLevel - OldLevel]),
	ok.


%% ====================================================================
%% Internal functions
%% ====================================================================
saveUnlockNewRace(NewLevel)->
	Lv = getUnLockNewRaceLevel(),
	case NewLevel =:= Lv of
		      true ->
			      gsSendMsg:sendMsg2DBServer(unlockNewRace,playerState:getAccountID(),{playerState:getAccountID(), 1});
		      _ ->
			      skip
	end.

getUnLockNewRaceLevel()->
	case getCfg:getCfgByKey(cfg_globalsetup, unlocknewrace_level) of
		#globalsetupCfg{setpara = [V]} ->
			V;
		_ ->
			70
	end.