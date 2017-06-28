%%%-------------------------------------------------------------------
%%% @author zhengzhichun
%%% @copyright (C) 2015, <COMPANY>
%%% @doc
%%% 王者战天下otp
%%% @end
%%% Created : 13. 一月 2015 19:22
%%%-------------------------------------------------------------------
-author("zhengzhichun").

-ifndef(AcKingBattleAllPrivatePrivate_hrl).
-define(AcKingBattleAllPrivatePrivate_hrl, 1).

-include("gsInc.hrl").
-include("activityDef.hrl").

%%王者战天下，镜像默认携带的buff配置id
-define(AC_KING_BATTLE_MIRROR_DEFAULT_BUFF_CFG_ID,3).
%%王者战天下，防御者玩家默认携带的buff配置id
-define(AC_KING_BATTLE_ROLE_DEFAULT_BUFF_CFG_ID,2).
%%王者战天下，进攻者玩家默认携带的buff配置id
-define(AC_KING_BATTLE_ROLE_ATTACKER_BUFF_CFG_ID,1).
%%王者战天下，进攻方数据
%%isInActiveSence=是否在活动场景内
%%mirrorDamage=对镜像造成的伤害
%%进攻方数据
-record(king_battle_attacker,{roleID,buffCfgID,fightForce, isInActiveSence=true,mirrorDamage=0,isKillMirror=false}).
%%镜像外观
-record(king_battle_mirror_appearance,{roleID,equipIDList, equipLevelList,fashionIDList,wingLevel=0}).
-endif. %% AcHDBattlegroundPrivate_hrl
%%购买buff配置中的下一个buff结束ID
-define(NEXT_CFG_BUFF_END_ID,-1).

%%守护世界错误码：当前角色已购了最高层的buff
-define(AC_KING_BATTLE_ERROR_CODE_BUFF_IS_MAX,1).
%%守护世界错误码：当前角色未参加活动
-define(AC_KING_BATTLE_ERROR_CODE_NOT_JOIN,2).