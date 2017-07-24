%%%-------------------------------------------------------------------
%%% @author tiancheng
%%% @copyright (C) 2017, <雨墨>
%%% @doc
%%% \Luna\trunk\Gamedata\Config\mainMenu.xlsx
%%% @end
%%% Created : 30. 八月 2017 10:24
%%%-------------------------------------------------------------------
-author(tiancheng).

-ifndef(Mode_Open_HRL).
-define(Mode_Open_HRL, 1).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% cfg_mainMenu 相关定义 begin

%% 开关类型
-define(MainMenuType_BEGIN,		1).
-define(MainMenuType_Level,		1).	%% 等级限制
-define(MainMenuType_TaskIDA,	2).	%% 接受任务
-define(MainMenuType_TaskIDS,	3).	%% 完成任务
-define(MainMenuType_END,		3).

%% cfg_mainMenu 相关定义 end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

-define(ModeType_Start, 1).%%开始
-define(ModeType_Role, 1).%%角色信息
-define(ModeType_Package, 2).%%背包
-define(ModeType_Social, 3).%%社交
-define(ModeType_Task, 4).%%任务
-define(ModeType_PetBattle, 5).%%骑宠
-define(ModeType_Mail, 6).%%邮件
-define(ModeType_Skill, 7).%%技能
-define(ModeType_Warehouse, 8).%%仓库
-define(ModeType_Intensify, 9).%%强化
-define(ModeType_Team, 10).%%队伍
-define(ModeType_Trade, 11).%%交易行
-define(ModeType_Exchange, 12).%%兑换
-define(ModeType_Gem, 13).%%纹章
-define(ModeType_Pet, 14).%%宠物
-define(ModeType_Guild, 15).%%家族
-define(ModeType_Setting, 16).%%设置
-define(ModeType_Goddess, 18).%%女神
-define(ModeType_Help, 19).%%帮助
-define(ModeType_CopyMap, 20).%%副本
-define(ModeType_Notice, 21).%%公告
-define(ModeType_Everyday, 22).%%日常
-define(ModeType_Rank, 23).%%排行榜
-define(ModeType_Mall, 24).%%商城
-define(ModeType_Social2, 25).%%社交
-define(ModeType_Welfare, 26).%%福利
-define(ModeType_AutoHook, 27).%%自动挂机
-define(ModeType_TeamWeekday, 28).%%队伍周常（废弃）
-define(ModeType_Achievement, 29).%%成就
-define(ModeType_Recharge, 30).%%充值活动
-define(ModeType_PetEquip, 32).%%骑宠装备
-define(ModeType_MSShop, 33).%%神秘商店
-define(ModeType_WareSoul, 34).%%器灵
-define(ModeType_PowerUp, 35).%%战力提升
-define(ModeType_EquipExchange, 36).%%装备兑换（屏蔽）
-define(ModeType_PetExpedition, 37).%%骑宠远征（废弃）
-define(ModeType_UpStar, 38).%%升星
-define(ModeType_EquipRecast, 39).%%装备重铸
-define(ModeType_Divination, 40).%%占卜(废弃)
-define(ModeType_EverydayDeal, 41).%%每日必做
-define(ModeType_Wing, 42).%%星空之翼
-define(ModeType_Compound, 43).%%合成
-define(ModeType_PetSoul, 44).%%骑宠精灵(废弃)
-define(ModeType_Rune, 45).%%符文
-define(ModeType_LotteryForTower, 46).%%魔塔宝藏(废弃)
-define(ModeType_Marriage, 47).%%婚姻
-define(ModeType_Emperor, 48).%%一统天下(废弃)
-define(ModeType_Red, 49).%%红包
-define(ModeType_EquipCompound, 50).%%装备合成
-define(ModeType_ItemCompound, 51).%%道具合成
-define(ModeType_Fashion, 52).%%时装
-define(ModeType_Treasure, 53).%%扭蛋
-define(ModeType_Date, 54).%%旧约会地下城(废弃)
-define(ModeType_PetManorExploit, 55).%%骑宠领地开采
-define(ModeType_PetManorPlunder, 56).%%骑宠领地掠夺
-define(ModeType_Exchange3, 57).%%兑换第三页签（屏蔽，勿删）
-define(ModeType_SevenDay, 58).%%七日大奖
-define(ModeType_Gift, 59).%%赠礼
-define(ModeType_Home, 60).%%家园
-define(ModeType_Handbook, 61).%%图鉴
-define(ModeType_End, 61).%%开始

-endif.