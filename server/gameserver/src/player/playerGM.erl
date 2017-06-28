%%%
%%%
%%%-------------------------------------------------------------------
%%% @author ZhongYuanWei
%%% @copyright (C) 2014, 好玩一二三科技
%%% @doc GM指令模块
%%%
%%% @end
%%% Created : 08. 五月 2014 20:03
%%%-------------------------------------------------------------------
-module(playerGM).
-author("ZhongYuanWei").

-include("playerPrivate.hrl").
-include("../world/mapPrivate.hrl").
-include("rob.hrl").

%% ====================================================================
%% API functions
%% ====================================================================
-export([
	execGM/1
]).

-export([
	now_microseconds/0,
	crack/0
]).

%%一级GM指令，只能是使用查询类的，不会修改服务器内容的GM指令
-define(GMCmdList1,
	[
		{"getbitvariant", fun getbitvariant/1, "getbitvariant VarType BitIndex", "获取变量"},
		{"getvariant", fun getvariant/1, "getvariant VarType Index", "获取变量"},
		{"queryactivity", fun queryactivity/1, "queryactivity ActivityID", "查询活动开关"},
		{"querycoin", fun querycoin/1, "querycoin CoinType", "查金币"},
		{"queryprop", fun queryprop/1, "queryprop PropIndex", "查询玩家身上的属性"},
		{"queryclock", fun queryclock/1, "queryclock Type SubType Value", "开启一个计时"},
		{"queryitem", fun queryitem/1, "queryitem BagType ItemID", "查物品"},
		{"querytrade", fun querytrade/1, "querytrade TradeType ItemType Num", "查询交易行订单"},
		{"querynewesttrade", fun querynewesttrade/1, "querynewesttrade TradeType ItemType Num", "查询最新交易行订单"},
		{"nexttrade", fun nexttrade/1, "nexttrade Page", "查询下一页"},
		{"printtrade", fun printtrade/1, "printtrade StartIndex EndIndex", "打印查询结果"},
		{"printrank", fun printrank/1, "printrank Type", "打印排行榜"},
		{"printranknum", fun printranknum/1, "printranknum Type", "打印排行榜个数"},
		{"queryselftrade", fun queryselftrade/1, "queryselftrade TradeType", "查询自己的订单"},
		{"querymail", fun querymail/1, "querymail MailID", "查询邮件"},
		{"queryallmail", fun queryallmail/1, "queryallmail", "查询所有邮件"},
		{"readmail", fun readmail/1, "readmail MailID", "阅读邮件"},
		{"querytips", fun querytips/1, "querytips ItemUID", "查询道具TIPS，本GM服务器内部使用"},
		{"queryroleid", fun queryroleid/1, "queryroleid PlayerName", "测试玩家关键数据的缓存进程"},
		{"queryrolename", fun queryrolename/1, "queryrolename RoleID", "查询玩家名"},
		{"getallskill", fun getallskill/1, "getallskill", "查看自己所学所有技能ID"},
		{"testuid", fun testuid/1, "testuid Type", "测试指定类型的UID"},
		{"qn", fun qn/1, "qn [Key]", "查询在线人数，也可以查询1玩家，2宠物，3怪物，4召唤怪物，5载体的数量"},
		{"qn2", fun qn2/1, "qn2 [Key]", "查询当前场景的在线人数"},
		{"openkqq", fun openkqq/1, "openkqq name", "打开空气墙"},
		{"querymonster", fun querymonster/1, "querymonster GroupID", "查询指定分级的怪物"},
		{"queryobj", fun queryobj/1, "queryobj RoleID", "查询指定角色ID的信息"},
		{"query", fun query/1, "query Value", "查询目标的属性值，0查看选中目标的属性，1查看自己的属性"},
		{"requesthdbattle", fun requesthdbattle/1, "requesthdbattle", "请求加入混沌战场"},
		{"queryguild1", fun queryguild1/1, "queryguild1", "查询军团列表"},
		{"queryguild2", fun queryguild2/1, "queryguild2", "在服务器以调试信息打印查询军团列表结果"},
		{"queryguild3", fun queryguild3/1, "queryguild3", "查询自己的军团信息"},
		{"mallshow", fun mallshow/1, "mallshow Seed", "商城显示请求"},
		{"sync9", fun sync9/1, "sync9", "重新同步玩家周围的对象"},
		{"ln", fun ln/1, "ln", "获取当前所在地图线信息"},
		{"ll", fun ll/1, "ll MapID", "获取指定地图线路信息"},
		{"hl", fun hl/1, "hl Line", "获取地图线路信息"},
		{"init_var", fun init_var/1, "init_bit_var", "初始化bit var"},
		{"tz", fun tz/1, "tz", "获取时区指令"},
		{"getactionpoint", fun getactionpoint/1, "getactionpoint", "获取体力值"},
		{"deductactionpoint", fun deductactionpoint/1, "deductactionpoint", "消耗体力值"},
		{"addactionpoint", fun addactionpoint/1, "addactionpoint", "增加体力值"},
		{"ar", fun accuReward/1, "accuReward", "领奖"},
		{"resetpb", fun resetpb/1, "resetpb", "重置双人坐骑状态"},
		{"petab", fun petab/1, "petass", "骑宠助战"},
		{"fashionsuit", fun fashionSuit/1, "fashionsuit", "激活时装套装"},
		{"resetskill", fun resetSkill/1, "resetskill", "重置技能"}
%% 		{"uplv_guild_tec_skill",				fun uplv_guild_tec_skill/1,					"uplv_guild_tec_skill","升级工会技能" },
%% 		{"use_guild_feast",					fun use_guild_feast/1,						"use_guild_feast","工会宴席" },
%% 		{"drink_guild_wine",				fun drink_guild_wine/1,					"drink_guild_bottle","喝酒" },
%%		{"call_guild_monster",				fun call_guild_monster/1,					"check_bit_var","校验bit var"	}
	]).


%%二级指令，是除了可以获得道具、装备、货币等等游戏资源以外GM指令
-define(GMCmdList2,
	[
		{"startclock", fun startclock/1, "startclock Type OffTime LengthTime", "开启指定类型的玩家计时器"},
		{"delclock", fun delclock/1, "delclock Type", "删除指定类型的玩家计时器"},
		{"splititem", fun splititem/1, "splititem GoodsUID Num", "道具拆分"},
		{"freshrank", fun freshrank/1, "freshrank Type", "freshrank"},
		{"freshrankall", fun freshrankall/1, "freshrankall", "立即刷新所有类型的排行榜"},
		{"sorttrade", fun sorttrade/1, "sorttrade SortIndex PageNum", "整理交易行"},
		{"buytrade", fun buytrade/1, "buytrade TradeType OrderID", "在交易行购买指定订单"},
		{"puttrade", fun puttrade/1, "puttrade TradeType ItemUID ItemID SellNum SellTime Silver Gold DestRoleName OpCode", "交易行上架"},
		{"downtrade", fun downtrade/1, "downtrade TradeType OrderID", "交易行下架"},
		{"refusetrade", fun refusetrade/1, "refusetrade OrderID", "交易行拒绝某订单"},
		{"delobj", fun delobj/1, "delobj Value", "删除指定Code的对象或者当前选中的对象"},
		{"addmonster", fun addmonster/1, "addmonster MonsterID Number", "添加指定数量个指定ID的怪物"},
		{"addcollect", fun addcollect/1, "addcollect CollectID Number", "添加采集物"},
		{"addnpc", fun addnpc/1, "addnpc NpcID", "添加NPC"},
		{"addcarrier", fun addcarrier/1, "addcarrier CarrierID MoveStatus", "添加载体"},
		{"addconvoy", fun addconvoy/1, "addconvoy MonsterID", "添加护送怪物"},
		{"createguild", fun createguild/1, "createguild GuildName Denoter", "创建公会"},
		{"clearguildcd", fun clearguildcd/1, "clearguildcd RoleID", "设置加入军团CD"},
		{"worldboss", fun worldboss/1, "worldboss", "机器人进BOSS战"},
		{"deleteguild", fun deleteguild/1, "deleteguild", "删除公会"},
		{"kickguildmember", fun kickguildmember/1, "kickguildmember RoleID", "从公会中踢出某人"},
		{"changememberlevel", fun changememberlevel/1, "changememberlevel Value1 Vaule2", "任命公会成员权限"},
		{"changeguildnotice", fun changeguildnotice/1, "changeguildnotice Value", "修改公会公告"},
		{"guilddonate", fun guilddonate/1, "guilddonate MoneyType MoneyNumber", "公会捐献"},
		{"warpto", fun warpto/1, "warpto Name", "将自己传送到指定角色名所在位置"},
		{"warp2", fun warp2/1, "warp2 RoleID", "将自己传送到指定角色ID所在位置"},
		{"setgroupid", fun setgroupid/1, "setgroupid Value1", "设置组ID"},
		{"checkblock", fun checkblock/1, "checkblock", "检查阻挡"},
		{"ss", fun ss/1, "ss Value", "进入指定地图"},
		{"goto", fun goto/1, "goto MapID_temp X Y", "进入指定地图指定坐标点"},
		{"resetcopymap", fun resetcopymap/1, "resetcopymap", "重置当前所在副本"},
		{"addguildbattlelist", fun addguildbattlelist/1, "addguildbattlelist guildID order", "直接添加军团id到军团联赛报名列表"},
		{"addguildres", fun addguildres/1, "addguildres guildID value", "给指定军团添加资源"},
		{"startac", fun startac/1, "startac ActivityType ActivityPhase", "开启某个活动阶段"},
		{"createhdbattle", fun createhdbattle/1, "createhdbattle", "创建一个混沌战场"},
		{"riftinfo", fun riftinfo/1, "riftinfo", "请求查看时空裂痕npc信息"},
		{"addexpresspet", fun addexpresspet/1, "addexpresspet", "增加限时宠物"},
		{"addbuff", fun addbuff/1, "addbuff", "增加buff"},
		{"delbuff", fun delbuff/1, "delbuff", "移除buff"},
		{"ladderquery", fun ladderquery/1, "ladderquery type target", "查询某个天梯对象数据"},
		{"ladderplayer", fun ladderplayer/1, "ladderplayer type", "随机取几个天梯里的对象"},
		{"ladderadd", fun ladderadd/1, "ladderadd", "把自己添加进天梯列表"},
		{"laddergiveup", fun laddergiveup/1, "laddergiveup", "放弃挑战天梯"},
		{"ladder", fun ladder/1, "ladder type target", "挑战对手"},
		{"laddermb", fun laddermb/1, "laddermb rank", "膜拜王者"},
		{"ladderaddexp", fun ladderaddexp/1, "ladderaddexp value", "增加功勋，可增加负值"},
		{"addhonor", fun addhonor/1, "addhonor value", "增加荣誉"},
		{"adddaily", fun adddaily/1, "adddaily type id value", "增加计数"},
		{"decdaily", fun decdaily/1, "decdaily type id value", "减少计数"},
		{"querydaily", fun querydaily/1, "querydaily type id", "查询每日计数"},
		{"zerodaily", fun zerodaily/1, "zerodaily type id", "清零每日计数"},
		{"adddaily2", fun adddaily2/1, "adddaily2 type value", "增加与选中目标相关的双用户计数"},
		{"decdaily2", fun decdaily2/1, "decdaily2 type value", "减少与选中目标相关的双用户计数"},
		{"querydaily2", fun querydaily2/1, "querydaily2 type", "查询与选中目标相关的双用户计数"},
		{"zerodaily2", fun zerodaily2/1, "zerodaily2 type", "清零与选中目标相关的双用户计数"},
		{"escortcd", fun escortcd/1, "escortcd EventID", "护送立即触发一个事件"},
		{"addphys", fun addphys/1, "add pet pve phys", "未知"},
		{"passdun", fun passdun/1, "pass dungeon", "未知"},
		{"escort", fun escort/1, "escort type", "运镖"},
		{"addac", fun addac/1, "add ac", "添加一个活动"},
		{"initworldboss", fun initWorldBoss/1, "initWorldBoss 1", "启动首领入侵"},
		{"addcollectact", fun addCollectAct/1, "addCollectAct MapID Num TotalNum", "增加采集物"},
		{"rewardupdate", fun rewardUpdate/1, "rewardUpdate Count", "获取更新资源奖励"},
		{"worldlevel", fun worldLevel/1, "worldLevel level", "改变世界等级"},
		{"gotoexpmap", fun goto_exp_map/1, "goto_exp_map", "进入经验地图"},
		{"onexpmap", fun on_exp_map/1, "on_exp_map", "模拟玩家在经验地图"},
		{"runlogicgroup", fun runLogicGroup/1, "runLogicGroup", "模拟玩家在经验地图"},
		{"gotomt", fun gotomt/1, "gotomt", "进入材料副本"},
		{"finishmt", fun finishmt/1, "finishmt", "进入材料副本"},
		{"upgw", fun upgw/1, "upgw", "神器升级"},
		{"recast", fun recast/1, "recast", "装备重铸"},
		{"skipskill", fun skipSkill/1, "skipskill", "跳过技能选择"}
	]).

%%三级GM指令，可以获得道具、装备、货币等等游戏资源的GM指令
-define(GMCmdList3,
	[
		{"setprop", fun setprop/1, "setprop PropIndex value", "设置玩家的公共属性"},
		{"ac", fun ac/1, "ac", "跨服战场活动开关控制"},
		{"acswitch", fun acswitch/1, "acswitch", "活动开关"},
		{"acarena", fun acarena/1, "acarena", "跨服竞技场"},
		{"rearenarank", fun rearenarank/1, "rearenarank", "跨服排行榜"},
		{"arenamatch", fun arenamatch/1, "arenamatch", "开始不限人数匹配"},
		{"acreward", fun acreward/1, "acreward", "跨服周排行发奖"},
		{"entercrosserver", fun entercrosserver/1, "entercrosserver", "进入跨服服务器"},
		{"clearcrosrank", fun clearcrosrank/1, "clearcrosrank", "清理跨服排行榜"},
		{"cjss", fun cjss/1, "cjss TargetRoleID", "管理员无条件传送到目标所在地图"},
		{"setbitvariant", fun setbitvariant/1, "setbitvariant VarType BitIndex BitValue", "设置变量位"},
		{"setvariant", fun setvariant/1, "setvariant VarType Index Value", "未知"},
		{"setactivity", fun setactivity/1, "setactivity ActivityID Value", "设置活动开关"},
		{"setprerecharge", fun setprerecharge/1, "setprerecharge Amount", "设置预充值功能"},
		{"addcoin", fun addcoin/1, "addcoin CoinType CoinNum", "加游戏币"},
		{"deccoin", fun deccoin/1, "deccoin CoinType CoinNum", "减游戏币"},
		{"addvip", fun addvip/1, "addvip Value", "添加爵位声望"},
		{"alltitle", fun alltitle/1, "alltitle", "获得所有称号"},
		{"additem", fun additem/1, "additem ItemID ItemNum [IsBind] [Quality]", "增加物品"},
		{"baseprop", fun baseprop/1, "baseprop Value", "查询玩家基础属性"},
		{"setbaseprop", fun setbaseprop/1, "setbaseprop Value", "设置玩家基础属性，当前有用"},
		{"setlevel", fun setlevel/1, "setlevel Level", "设置等级"},
		{"sethp", fun sethp/1, "sethp hp", "设置血量"},
		{"addtask", fun addtask/1, "addtask TaskID", "接受任务"},
		{"getalltask", fun getalltask/1, "getalltask", "查看已接受的任务ID"},
		{"submittask", fun submittask/1, "submittask TaskID", "提交任务"},
		{"submittask2", fun submittask2/1, "submittask TaskID", "提交任务"},
		{"submittaskall", fun submitTaskAll/1, "submittaskall TaskID", "提交所有任务"},
		{"wakeup", fun wakeup/1, "wakeup", "开启女神功能，旧有的觉醒技能挪到了器灵（原神器）系统"},
		{"newmail", fun newmail/1, "newmail ToRoleName Title Content MailNum", "邮件相关GM命令"},
		{"newsysmail", fun newsysmail/1, "newsysmail ToRoleName Title ItemUID1 ItemID1 ItemUID2 ItemID2 MoneyNumber", "发送一封系统邮件"},
		{"maildiamond", fun maildiamond/1, "maildiamond number", "邮件给全服的人发送非绑定钻石"},
		{"enterguildhome", fun enterguildhome/1, "enterguildhome targetGuildID", "进入目标军团驻地"},
		{"useguildride", fun useguildride/1, "useguildride ID type", "使用游乐场设施 ID：设施ID type：1使用；2取消使用；3升级"},
		%{"clearguildtask", fun clearguildtask/1, "clearguildtask", "清空放弃任务CD"},
		%{"printguildtask", fun printguildtask/1, "printguildtask", "打印自己的任务列表"},
		%{"updateguildtask", fun updateguildtask/1, "updateguildtask", "更新一个任务，仅采集与杀怪"},
		{"changeguildname", fun changeguildname/1, "changeguildname newname", "修改军团名"},
		{"guild_godbless", fun guild_godbless/1, "guild_godbless type", "家族系统-女神祈福"},
		{"guild_godbless_s", fun guild_godbless_s/1, "guild_godbless_s s", "家族系统-女神祈福 设置祈福进度"},
		{"guild_shopbuy", fun guild_shopbuy/1, "guild_shopbuy id", "家族系统-家族商店"},
		{"guild_exchange", fun guild_exchange/1, "guild_exchange id level", "家族系统-家族商店"},
		{"guild_clearrcd", fun guild_clearrcd/1, "guild_clearrcd", "家族系统-去掉自己所在公会的发布招募CD"},
		{"snowman_create", fun snowman_create/1, "snowman_create", "家族系统-堆雪人活动-在非活动时间可使用该命令创建活动地图，以这种方式创建的活动地图无法以心跳驱动"},
		{"snowman_next", fun snowman_next/1, "snowman_next", "家族系统-堆雪人活动-如果自己在GM创建的活动地图中，该命令可驱动地图切换到下一个阶段"},
		{"snowman_checksnowman", fun snowman_checksnowman/1, "snowman_checksnowman", "家族系统-堆雪人活动-模拟客户端-检测雪人状态"},
		{"snowman_donate", fun snowman_donate/1, "snowman_donate ResID SnowmanID", "家族系统-堆雪人活动-模拟客户端-捐赠材料 0表示全部类型，其它参考cfg_guildsnowman"},
		% 20170223 废弃客户端主动请求领奖，改为活动结算时主动发奖
		%{"snowman_reward",		fun snowman_reward/1,			"snowman_reward SnowmanID","家族系统-堆雪人活动-模拟客户端-领取指定雪人礼盒"},
		{"snowman_getres", fun snowman_getres/1, "snowman_getres ResID Count", "家族系统-堆雪人活动-直接获取指定ID的资源，无法超过携带上限"},

		{"activecode", fun activecode/1, "activecode Value", "领取激活码"},
		{"adddef", fun adddef/1, "adddef", "加防"},
		{"addspeed", fun addspeed/1, "addspeed", "加速度"},
		{"addprop", fun addprop/1, "addprop", "增加属性"},
		{"addattack", fun addattack/1, "addattack [Value]", "加攻"},
		{"tt", fun tt/1, "tt", "开所有功能，加所有物品（最强gm"},
		{"tt2", fun tt2/1, "tt2", "无敌"},
		{"addequip", fun addequip/1, "addequip level", "添加符合自身职业的装备到背包 指定等级"},
		{"addpet", fun addpet/1, "addpet", "提供类似于tt得到的骑宠"},
		{"robottt", fun robottt/1, "robottt", "机器人用的无敌"},
		{"addrob", fun addrob/1, "addrob", "添加一个机器人"},
		{"queryrob", fun queryrob/1, "queryrob", "查询机器人"},
		{"crack", fun crack/1, "crack", "开所有功能"},
		{"addteam", fun addteam/1, "addteam", "创建一个队伍"},
		{"setmlpm", fun setmlpm/1, "setmlpm number", "设置地图允许进入最大人数限制(仅测试用"},
		{"setmapday", fun setmapday/1, "setmapday number", "设置地图昼夜"},
		{"freshmsshop", fun freshmsshop/1, "freshmsshop", "手动刷新神秘商店"},
		{"malladdnewitem", fun malladdnewitem/1, "malladdnewitem ItemID Type1 Type2 Diamond BDiamond UseInterget GetInterget Sort", "商城添加新道具"},
		{"malldelitem", fun malldelitem/1, "malldelitem ItemID Type1 Type2", "商城删除道具"},
		{"mallsetlimitbuy", fun mallsetlimitbuy/1, "mallsetlimitbuy ItemID Type1 Type2 LimitBuy LimitType", "商城设置限购"},
		{"mallsetbuysend", fun mallsetbuysend/1, "mallsetbuysend ItemID Type1 Type2 SendID SendNum", "商城设置赠送"},
		{"mallsetbuytime", fun mallsetbuytime/1, "mallsetbuytime ItemID Type1 Type2 Diamond BDiamond UseInterget GetInterget Sort", "商城设置上下架时间"},
		{"mallsetrebate", fun mallsetrebate/1, "mallsetrebate ItemID Type1 Type2 Rebate", "修改折扣"},
		{"updateachieve", fun updateachieve/1, "updateachieve Type ID Num", "更新成就进度"},
		{"addachieve", fun addachieve/1, "addachieve Value1 Value2", "添加成就"},
		{"addbadge", fun addbadge/1, "addbadge MapID ItemID", "添加徽章"},
		{"addexp", fun addexp/1, "addexp exp", "增加经验"},
		{"addwingexp", fun addwingexp/1, "addwingexp exp", "增加翅膀经验"},
		{"recharge", fun recharge/1, "recharge orderid coin", "充值订单加争钻石"},
		{"settalentflag", fun settalentflag/1, "settalentflag flag", "未知"},
		{"setrename", fun setrename/1, "setrename flag", "设置角色可以改名"},
		{"resetprotectworld", fun resetprotectworld/1, "resetprotectworld ", "将当前玩家设置成守护世界目标，并重新开启守护世界活动"},
		{"setfightallhp", fun setfightallhp/1, "setfightallhp hp", "设置战天下血量"},
		{"setcoucost", fun setcoucost/1, "setcoucost cost", "设置神器技能是否消耗怒气"},
		{"wildboss", fun wildboss/1, "wildboss mapID", "重置某地图的野外BOSS"},
		{"freshrankandtick", fun freshrankandtick/1, "freshrankandtick", "刷新排行榜并且恢复排行榜的tick"},
		{"ladderclear", fun ladderclear/1, "ladderclear roleID", "清理卡住的玩家"},
		{"crp", fun crp/1, "crp roleID", "清理卡住不能登录的玩家"},
		{"monitorsj", fun monitorsj/1, "monitorsj type ip", "这是一个秘密"},
		{"cll", fun clearroleforeverlimit/1, "cll roleid flagid", "清除装备兑换与vip购买的永久标记"},
		{"opeitem", fun operateItemPush/1, "opeitem", "运营配置推送"},
		{"clearrolelist", fun clearRoleList/1, "clearRoleList", "清除角色列表缓存"},
		{"entercross", fun entercross/1, "entercross", "进入离开跨服"},
		{"clearpetraw", fun clearpetraw/1, "clearpetraw", "清除宠物转生"},
		{"liveness", fun liveness/1, "liveness", "完成活跃项目"},
		{"openslot", fun openslot/1, "openslot", "开启所有格子"},
		{"clearitem", fun clearitem/1, "clearitem", "清除所有道具"},
		{"clearmail", fun clearmail/1, "clearmail", "无条件删除所有邮件"},
		{"querytime", fun querytime/1, "querytime", "查询服务器时间和时区"},
		{"lovegirl", fun lovegirl/1, "lovegirl", "台湾需求的一些开启功能的GM命令"},
		{"usepetbook", fun usepetbook/1, "usepetbook", "宠物技能书"},
		{"onkeyrefine", fun onkeyrefine/1, "onkeyrefine", "一键精炼"},
		{"shiftto", fun shiftto/1, "shiftto x y", "本地图内瞬间移动 X坐标 Y坐标"},
		{"addfriendliness", fun addfriendliness/1, "addfriendliness v", "增加与选中目标的友好度（必须与目标是正式好友）"},
		{"getvigor", fun getvigor/1, "getvigor", "查询精力"},
		{"addvigor", fun addvigor/1, "addvigor", "添加精力"},

		%% 环任务GM指令 begin
		{"looptask_reset", fun looptask_reset/1, "looptask_reset isCancelLoopTask isResetLoopCount isResetDailyCount", "环任务：重置并查看任务状态
		返回值{当前单环任务ID（如果有多个只显示1个）, 当前轮已完成的单环任务数量, 当天已完成的环任务轮数}
		【&looptask_reset】 等价于 【&looptask_reset 0 0 0】 不取消当前已接受的单环任务，不重置已完成的单环任务数量，不重置当天已完成的环任务轮数
		【&looptask_reset 1 1 1】 取消当前，重置已完成的单环任务数量，重置当天已完成的环任务轮数 便于重新测试
		"},
		{"looptask_accept", fun looptask_accept/1, "looptask_accept type", "环任务：接受任务
		返回值{ok, 当前接受到的任务ID}或者{error, 错误码}
		【&looptask_accept】等价于【&looptask_accept 0】模拟客户端接受单环任务
		【&looptask_accept 1】无视角色等级等限制直接接受单环任务（低于最低等级时接受最低等级的单环任务，可能因为接受到重复的任务ID而导致失败，可能导致同时接受了多个单环任务）
		"},
		{"looptask_complete", fun looptask_complete/1, "looptask_complete type1 type2", "环任务：完成任务
		返回值{ok, 完成的任务数量}或者{error, 错误码}
		【&looptask_complete】等价于【&looptask_complete 0 0】模拟客户端执行单次完成
		【&looptask_complete 0 1】模拟客户端执行一键完成
		【&looptask_complete 1】等价于【&looptask_complete 1 0】不花费货币执行一键完成
		【&looptask_complete 1 X】不花费货币执行完成X个任务，X<=当天还能完成的环任务轮数*10+当前轮剩余完成的单环任务数，X异常时被视为0
		"},
		%% 环任务GM指令 end

		%% 符文系统GM指令 begin
		{"addrune", fun addrune/1, "addrune runeID", "增加符文"},
		{"rune_open", fun rune_open/1, "rune_open", "打开符文界面"},
		%% 符文系统GM指令 end

		%% 签到模块GM指令 begin
		{"signin_sign", fun signin_sign/1, "signin_sign 没有参数正常签到/参数表示签到第几天", "签到"},
		{"signin_reset", fun signin_reset/1, "signin_reset 0重置当日签到状态，1重置当月签到记录与领奖记录", "重置"},
		{"signin_reward", fun signin_reward/1, "signin_reward", "领奖"},
		{"signin_seven", fun signin_seven/1, "signin_seven", "七日签到"},

		{"sevendayaim", fun sevendayaim/1, "sevendayaim", "七日目标"},
		{"thirtydaylogingift", fun thirtydaylogingift/1, "thirtydaylogingift", "30日登录大礼包"},

		%% 签到模块GM指令 end

		%% 姻缘系统GM指令 begin
		{"marriage_build", fun marriage_build/1, "marriage_build itemID", "尝试与选中的人结婚"},
		{"marriage_break", fun marriage_break/1, "marriage_break", "组队时协议离婚，非组队时强制离婚"},
		{"marriage_addcloseness", fun marriage_addcloseness/1, "marriage_addcloseness", "增加亲密度"},
		{"marriage_skillup", fun marriage_skillup/1, "marriage_skillup", "升级技能"},
		{"marriage_ringup", fun marriage_ringup/1, "marriage_ringup", "升级或突破婚戒"},
		{"marriage_accept", fun marriage_accept/1, "marriage_accept", "接受任务"},
		{"marriage_submit", fun marriage_submit/1, "marriage_submit", "提交任务"},
		{"marriage_resettask", fun marriage_resettask/1, "marriage_resettask", "重置任务"},
		%% 姻缘系统GM指令 end
		{"cc", fun cc/1, "cc", "转职"},
		{"run_method", fun run_method/1, "run_method", "运行服务器指定模块的函数"},
		{"ladder1v1", fun ladder1v1/1, "ladder1v1", "执行竞技场测试"},
		%% 副本系统GM指令
		{"buyactioncount", fun buyactioncount/1, "buyActionCount CopyMapID", "购买副本次数"},
		{"cleanladder1v1", fun cleanladder1v1/1, "cleanladder1v1", "清空竞技场进入次数和购买次数"},
		{"cleancopycount", fun cleancopycount/1, "cleancopycount CopyMapID", "清空副本已经进入次数和购买次数"}
	]).

%%55级GM指令，程序内部GM指令，不外提供
-define(GMCmdList4,
	[
		{"enterrift", fun enterrift/1, "enterrift GroupID BMapID", "进入时空裂痕"},
		{"riftnpcmove", fun riftnpcmove/1, "riftnpcmove TX TY", "控制时空裂痕npc移动"},
		{"freshriftnpcpos", fun freshriftnpcpos/1, "freshriftnpcpos", "立即刷新时空裂痕npc的坐标"},
		{"getriftnpcpos", fun getriftnpcpos/1, "getriftnpcpos", "获取时空裂痕的坐标"},
		{"lockmail", fun lockmail/1, "lockmail MailID", "锁定邮件"},
		{"unlockmail", fun unlockmail/1, "unlockmail MailID", "解锁邮件"},
		{"deletemail", fun deletemail/1, "deletemail MailID", "删除邮件"},
		{"deleteallreadmail", fun deleteallreadmail/1, "deleteallreadmail", "删除所有已读邮件"},
		{"lottery", fun lottery/1, "lottery ismain", "占卜，抽奖"},
		{"freshdarkness", fun freshdarkness/1, "freshdarkness", "刷新黑暗之地特殊活动"},
		{"enterdarkness", fun enterdarkness/1, "enterdarkness number", "进入黑暗之地"},
		{"enterdarkness2", fun enterdarkness2/1, "enterdarkness2 mapID", "进入黑暗之地"},
		{"darknessselectcamp", fun darknessselectcamp/1, "darknessselectcamp camp", "黑暗之地选择阵营"},
		{"darkness", fun darkness/1, "darkness type", "黑暗之地常规操作"},
		{"sevenmission", fun sevenmission/1, "seven mission", "七日任务"},
		{"angelinvestment", fun angelinvestment/1, "angel investment", "天使投资"},
		{"dblog", fun dblog/1, "dblog value", "保存日志"},
		{"addpebble", fun addpebble/1, "addpebble number", "增加黑暗之地魔能水晶"},
		{"ge", fun gexpedition/1, "goto expedition map", "进入沙盘地图"},
		{"check_var", fun check_var/1, "check_bit_var", "校验bit var"},
		{"md_enter", fun md_enter/1, "md_enter", "md_enter"},
		{"md_giveup", fun md_giveup/1, "md_giveup", "md_giveup"},
		{"md_next", fun md_next/1, "md_next", "md_next"},
		{"sa_enter", fun sa_enter/1, "sa_enter", "sa_enter"},
		{"sp_skill", fun sp_skill/1, "sp_skill", "sp_skill"},

		%% 符文系统GM指令 begin
		{"rune_addexp", fun rune_addexp/1, "", ""}, %% 调试用
		%% 符文系统GM指令 end

		%% 约会地下城活动GM指令 begin
		{"date_enter", fun date_enter/1, "", ""}, %% 调试用
		{"date_link", fun date_link/1, "", ""}, %% 调试用
		{"date_link_end", fun date_link_end/1, "", ""}, %% 调试用
		{"date_link_reshuffe", fun date_link_reshuffe/1, "", ""}, %% 调试用
		{"date_link_buff", fun date_link_buff/1, "", ""}, %% 调试用
		%% 约会地下城活动GM指令 end

		%% 身份证系统GM指令 begin
		{"identity_edit", fun identity_edit/1, "", ""}, %% 调试用
		%% 身份证系统GM指令 end

		%% 新版好友系统GM指令 begin
		{"friend2_add", fun friend2_add/1, "", ""}, %% 调试用
		{"friend2_del", fun friend2_del/1, "", ""}, %% 调试用
		{"friend2_exop", fun friend2_exop/1, "", ""}, %% 调试用
		%% 新版好友系统GM指令 end

		%% 姻缘系统GM指令 begin
		{"marriage_resetsr", fun marriage_resetsr/1, "marriage_resetsr", "重置夫妻技能和婚戒的属性，便于测试"},
		%% 姻缘系统GM指令 end

		%% 新版骑宠领地 begin
		{"territory_query",			fun territory_query/1,			"territory_query type",								"查询 0查询领地信息；2查询掠夺记录；3查询防守记录"},
		{"territory_exploit",		fun territory_exploit/1,		"territory_exploit territoryID cfgTime cfgLevel",	"开采 自动选择骑宠进行开采"},
		{"territory_search",		fun territory_search/1,			"territory_search type",							"搜索 0非针对性搜索 1搜索选择对象的领地"},
		{"territory_plunder",		fun territory_plunder/1,		"territory_plunder",								"掠夺"},
		{"territory_exploit_add",	fun territory_exploit_add/1,	"territory_exploit_add",							"所有正在开采的领地奖励+1，便于搜索调试"},
		{"territory_exploit_t",		fun territory_exploit_t/1,		"territory_exploit_t",								"仅对于自身正在开采的领地1，调整下次结算时间为5分钟后执行，以便客户端调试"},
		{"territory_exploit_m",		fun territory_exploit_m/1,		"territory_exploit_m",								"刷怪战斗测试，用于测试出生BUFF、阵营、AI，不能测试属性及技能"},
		%% 新版骑宠领地 end

		{"array", fun array/1, "array type number", "按照指定的方式，指定的人数排列"},
		{"arrayrotw", fun arrayrotw/1, "arrayrotw rotw", "排列成指定的方向"},
		{"arrayperform", fun arrayperform/1, "arrayperform type id", "表演指定的表情或者动作"},

		%% 地图类GM指令 begin
		{"map_useskill", fun map_useskill/1, "map_useskill codeA codeB skillID", ""},  %% 调试用
		{"map_syncgrid", fun map_syncgrid/1, "map_syncgrid", "同步格子信息"}  %% 调试用
		%% 地图类GM指令 end
	]).

-spec execGM(String) -> boolean() when
	String :: string().
execGM([]) ->
	false;
execGM(String) ->
	% for example <t=0>,,&queryTrade</t>
	StartIndex = string:substr(String, 8),
	EndIndex = string:str(StartIndex, "<"),
	NewString = string:substr(StartIndex, 1, EndIndex - 1),
	case parseGM(NewString) of
		false ->
			false;
		true ->
			true;
		[CMDStr | Params] ->
			%% 是GM指令，判断权限
			CMD = string:to_lower(CMDStr),
			case execGMCmd(CMD, Params) of
				error_error_error_error ->
					%% 没有执行体，以系统的形式返回给自己
					playerChat:onSystemChatMsg(NewString);
				Result ->
					%% 记录执行操作GM命令日志
					?LOG_OUT("AccountID[~p], player[~p], use gm cmd[~p], param[~p]",
						[playerState:getAccountID(), playerState:getRoleID(), CMD, Params]),

					%% 插入数据库日志
					dbLog:sendSaveLogGMCmd(playerState:getRoleID(), String),

					%% 通知客户端执行结果
					Str =
						case erlang:is_list(Result) of
							true ->
								Ret = lists:flatten(Result),
								io_lib:format("~ts", [Ret]);
							false ->
								io_lib:format("~p", [Result])
						end,
					playerChat:onSystemChatMsg(Str)
			end,

			%% 后续聊天都不处理了
			true
	end.


%% ====================================================================
%% Internal functions
%% ====================================================================

%% 解析GM指令参数
-spec parseGM(String) -> boolean() | list() when
	String :: string().
parseGM(String) ->
	if
		length(String) < 2 ->
			%% 不是GM命令
			false;
		true ->
			GMFlag = string:substr(String, 1, 1),
			GMFirstLetter = string:substr(String, 2, 1),
			if
				GMFlag =:= "&" ->
					case GMFirstLetter >= "a" andalso GMFirstLetter =< "z" of
						true ->
							%% 去掉标识符
							NewString = string:substr(String, 2),

							%% splite
							string:tokens(NewString, " ");
						_ ->
							true
					end;
				true ->
					false
			end
	end.

%% ====================================================================
%% exec gm functions
%% ====================================================================

-spec getGMCmd(Cmd) -> function() when Cmd :: string().
getGMCmd(Cmd) ->
	GMLevel = playerState:getGmLevel(),
	?DEBUG_OUT("getGMCmd:roleID=~p, cmd=~ts, level=~p", [playerState:getRoleID(), Cmd, GMLevel]),
	List = case GMLevel of
			   1 ->
				   [?GMCmdList1];
			   2 ->
				   [?GMCmdList1, ?GMCmdList2];
			   3 ->
				   [?GMCmdList1, ?GMCmdList2, ?GMCmdList3];
			   55 ->
				   [?GMCmdList1, ?GMCmdList2, ?GMCmdList3, ?GMCmdList4];
			   _ ->
				   []
		   end,
	Fun = fun(L, AccIn) ->
		case lists:keyfind(Cmd, 1, L) of
			{Cmd, Function, _format, _Desc} ->
				{break, Function};
			_ ->
				AccIn
		end
		  end,
	misc:mapAccList(List, undefined, Fun).

-spec execGMCmd(Cmd, Params) -> string() | atom() when
	Cmd :: string(), Params :: list().
execGMCmd(Cmd, Params) ->
	Fun = getGMCmd(Cmd),
	case erlang:is_function(Fun) of
		true ->
			Fun(Params);
		_ ->
			?WARN_OUT("Player:~ts Use GM:~p,Fun:~w failed", [playerState:getName(), Cmd, Fun]),
			error_error_error_error
	end.

setprerecharge(Params) when erlang:length(Params) >= 1 ->
	[AmountStr | _Other1] = Params,
	Amount = erlang:list_to_integer(AmountStr),
	psMgr:sendMsg2PS(?PsNamePreRecharge, gmUpdate, {playerState:getAccountID(), Amount}),
	?LOG_OUT("setprerecharge[~w]", [Amount]),
	ok.

resetprotectworld(_Params) ->
	RoleID = playerState:getRoleID(),
	core:sendMsgToActivity(?ActivityType_KingBattleAll, gm_setfightallrole, {RoleID, 100000}),
%%	Fun =
%%		fun() ->
%%			timer:sleep(1000),
%%%%			psMgr:sendMsg2PS(activityOtp, setActivePhase, {5, 0}),
%%			startac( ["5", "0"]),
%%			timer:sleep(1000),
%%			FightForce = playerPropSync:getProp(?SerProp_PlayerHistoryForce),
%%			core:sendMsgToActivity(?ActivityType_KingBattleAll, gm_setfightallrole,{RoleID,100000} ),
%%			timer:sleep(1000),
%%%%			psMgr:sendMsg2PS(activityOtp, setActivePhase, {5, 1})
%%			startac( ["5", "1"]),
%%			timer:sleep(1000),
%%%%			psMgr:sendMsg2PS(activityOtp, setActivePhase, {5, 1})
%%			startac( ["5", "2"]),
%%			timer:sleep(1000),
%%%%			psMgr:sendMsg2PS(activityOtp, setActivePhase, {5, 1})
%%			startac( ["5", "3"]),
%%			timer:sleep(1000),
%%%%			psMgr:sendMsg2PS(activityOtp, setActivePhase, {5, 1})
%%			startac( ["5", "4"]),
%%			timer:sleep(1000),
%%%%			psMgr:sendMsg2PS(activityOtp, setActivePhase, {5, 1})
%%			startac( ["5", "5"])
%%
%%		end,
%%	erlang:spawn(Fun),
	ok.

%%设置战天下镜像血量
setfightallhp(Params) when erlang:length(Params) >= 1 ->
	[HpStr | _Other1] = Params,
	HpNum = string_to_integer(HpStr),
	case HpNum > 0 of
		true ->
			[Row | _] = edb:readAllRecord(rec_guard_mirror),
			NewRow = Row#rec_guard_mirror{
				hpNumber = HpNum
			},
			edb:writeRecord(update_rec_guard_mirror, NewRow),
			edb:clearTable(rec_guard_mirror),
			edb:writeRecord(rec_guard_mirror, NewRow),
			?LOG_OUT("setfightallhp[~p]", [HpNum]),
			ok;
		_ ->
			skip
	end,
	ok.

%%启动首领入侵
initWorldBoss(Params) when erlang:length(Params) >= 1 ->
%%	psMgr:sendMsg2PS(?PsNameWorldBOss, initFirst),

%%	core:sendMsgToActivity(?ActivityType_GiveIPad, initFirst, {}),
	playerWorldBossWar:noticeClient(1),
	?LOG_OUT("gm initWorldBoss"),
	ok.

lottery(Params) when erlang:length(Params) >= 1 ->
	[MainStr | _Other1] = Params,
	Main = erlang:list_to_integer(MainStr),
%%	10 -> 免费金币单抽  11 ->金币单抽 	110 -> 金币10连
%%	20 -> 免费钻石单抽  21 ->钻石单抽  210 -> 钻石10连
%%	888 -> rst cd
%%	999 -> rst count
	core:setGlobalBitVariant(?Setting_GlobalBitVarReadOnly_Lottery, true),
	if
		Main =:= 10 ->
			playerLottery:requestLottery(true, true, 1);
		Main =:= 11 ->
			playerLottery:requestLottery(true, false, 1);
		Main =:= 110 ->
			playerLottery:requestLottery(true, false, 10);
		Main =:= 20 ->
			playerLottery:requestLottery(false, true, 1);
		Main =:= 21 ->
			playerLottery:requestLottery(false, false, 1);
		Main =:= 210 ->
			playerLottery:requestLottery(false, false, 10);
		Main =:= 888 ->
			playerLottery:gmRstCD();
		Main =:= 999 ->
			playerLottery:gmRstDailyCount();

%%		Main =:= 0 orelse Main =:= 1 ->
%%			IsMain = misc:convertBoolFromInt(Main),
%%			playerLottery:requestLottery(IsMain);
%%		Main =:= 88888 ->
%%			playerDaily:zeroDailyCount(?DailyType_Lottery, 1),
%%			playerDaily:zeroDailyCount(?DailyType_Lottery, 2),
%%%%			playerLottery:resetDestinyStar(time:getSyncTime1970FromDBS()),
%%			"reset success";
%%		Main =:= 99999 ->
%%			%% 指定奖品ID
%%			case Other1 of
%%				[PondStr,OnlyIDStr|_Other2] ->
%%					Pond = erlang:list_to_integer(PondStr),
%%					OnlyID = erlang:list_to_integer(OnlyIDStr),
%%					put('GM_Appoint_Lottery_ItemOnlyID', {Pond, OnlyID}),
%%					"set success";
%%				_ ->
%%					erlang:erase('GM_Appoint_Lottery_ItemOnlyID'),
%%					"set failed"
%%			end;
		true ->
			playerLottery:openLotteryForm()
	end.

dblog(Params) when erlang:length(Params) >= 1 ->
	[Type | _Other1] = Params,
	TypeInt = string_to_integer(Type),
	case TypeInt of
		0 ->
			%% 禁止写DB日志
			core:setGlobalBitVariant(?Setting_GlobalBitVar_WriteLog, false),

			%% 发送消息给DB
			gsSendMsg:sendMsg2LogDBServer(99999, 1),
			ok;
		1 ->
			%% 开放写DB日志
			core:setGlobalBitVariant(?Setting_GlobalBitVar_WriteLog, true),

			%% 发送消息给DB
			gsSendMsg:sendMsg2LogDBServer(99999, 0),
			ok;
		_ ->
			"failed"
	end.

addpebble(Params) when erlang:length(Params) >= 1 ->
	[StrNumber | _Other1] = Params,
	Number = string_to_integer(StrNumber),
	Coin = playerState:getCoin(?CoinTypePebble),
	playerDarkness:addDarknessPebble({playerState:getRoleID(), Coin, Number, 0}),
	ok.

gexpedition(Params) when erlang:length(Params) >= 1 ->
	[StrNumber | _Other1] = Params,
	MapID = string_to_integer(StrNumber),
	playerScene:onRequestEnterMap(MapID),
	ok.

enterdarkness(Params) when erlang:length(Params) >= 1 ->
	[StrNumber | _Other1] = Params,
	Number = string_to_integer(StrNumber),
	playerDarkness:requestEnterDarkness(Number),
	ok.

enterdarkness2(Params) when erlang:length(Params) >= 1 ->
	[StrMapID | _Other1] = Params,
	MapID = string_to_integer(StrMapID),
	playerDarkness:requestEnterDarknessMap(MapID),
	ok.

darknessselectcamp(Params) when erlang:length(Params) >= 1 ->
	[StrCamp | _Other1] = Params,
	Camp = string_to_integer(StrCamp),
	playerDarkness:selectCamp(Camp),
	ok.

darkness(Params) when erlang:length(Params) >= 1 ->
	[StrType | _Other1] = Params,
	Type = string_to_integer(StrType),
	if
		Type =:= 1 ->
			playerDarkness:selfDarkness();
		Type =:= 2 ->
			playerDarkness:openSelectCamp();
		Type =:= 3 ->
			playerDarkness:darknessRank();
		true ->
			skip
	end,
	ok.

sevenmission(Params) when erlang:length(Params) >= 1 ->
	[StrType | _Other1] = Params,
	Type = string_to_integer(StrType),
	if
		Type =:= 0 ->
			playerSevenDays:querySevenMissionData();
		true ->
			playerSevenDays:sevenMissionCompletion(Type)
	end,
	ok.

angelinvestment(Params) when erlang:length(Params) >= 1 ->
	[StrType | _Other1] = Params,
	Type = string_to_integer(StrType),
	if
		Type =:= 0 ->
			playerSevenDays:queryInvestment();
		true ->
			[StrSubType | _] = _Other1,
			SubType = string_to_integer(StrSubType),
			if
				Type =:= 1 ->
					playerSevenDays:angelInvestmentBuy(SubType);
				true ->
					playerSevenDays:angelInvestmentGet(SubType)
			end
	end,
	ok.

freshdarkness(Params) when erlang:length(Params) >= 0 ->
	core:sendMsgToActivity(?ActivityType_Darkness, gm_freshdarkness, 0),
	ok.

%%设置变量位 gm命令 字母被转换为小写了 setBitVariant
setbitvariant(Params) when erlang:length(Params) >= 3 ->
	[VarType0 | Other1] = Params,
	[BitIndex0 | Other2] = Other1,
	[BitValue0 | _Other3] = Other2,
	VarType = string_to_integer(VarType0),
	BitIndex = string_to_integer(BitIndex0),
	BitValue = (string_to_integer(BitValue0) =/= 0),
	Ret = case VarType of
			  0 ->
				  core:setGlobalBitVariant(BitIndex, BitValue);
			  1 ->
				  core:setWorldBitVariant(BitIndex, BitValue);
			  _ ->
				  playerVariant:setPlayerBitVariant(BitIndex, BitValue)
		  end,
	?LOG_OUT("Player[~p][~ts] setBitVariant Index[~p] Value[~p] result:~p", [playerState:getRoleID(), playerState:getName(), BitIndex, BitValue, Ret]),
	ok.

setvariant(Params) when erlang:length(Params) >= 3 ->
	[VarType0 | Other1] = Params,
	[BitIndex0 | Other2] = Other1,
	[BitValue0 | _Other3] = Other2,
	VarType = string_to_integer(VarType0),
	Index = string_to_integer(BitIndex0),
	Value = string_to_integer(BitValue0),
	Ret = case VarType of
			  0 ->
				  core:setGlobalVariant(Index, Value);
			  1 ->
				  core:setWorldVariant(Index, Value);
			  3 ->
				  playerVariant:setPlayerVariant(Index, Value);
			  4 ->
				  RealValue = (Value == 1),
				  SetRet = playerVariant:setPlayerBitVariant(Index, RealValue),
				  ?WARN_OUT("setvariant setRet:~p,RealValue:~p", [SetRet, RealValue]);
			  _ ->
				  playerVariant:setPlayerVariant(Index, Value)
		  end,
	?LOG_OUT("Player[~p][~ts] setBitVariant Index[~p] Value[~p] Result:~p", [playerState:getRoleID(), playerState:getName(), Index, Value, Ret]),
	ok.

%%获取变量
getbitvariant(Params) when erlang:length(Params) >= 2 ->
	[VarType0 | Other1] = Params,
	[BitIndex0 | _Other2] = Other1,
	VarType = string_to_integer(VarType0),
	VarIndex = string_to_integer(BitIndex0),
	case VarType of
		0 ->
			variant:getGlobalBitVariant(VarIndex);
		1 ->
			variant:getWorldBitVariant(gsMainLogic:getServerID(), VarIndex);
		_ ->
			variant:getPlayerBitVariant(playerState:getRoleID(), VarIndex)
	end.

getvariant(Params) when erlang:length(Params) >= 2 ->
	[VarType0 | Other1] = Params,
	[BitIndex0 | _Other2] = Other1,
	VarType = string_to_integer(VarType0),
	VarIndex = string_to_integer(BitIndex0),
	case VarType of
		0 ->
			variant:getGlobalVariant(VarIndex);
		1 ->
			variant:getWorldVariant(gsMainLogic:getServerID(), VarIndex);
		_ ->
			variant:getPlayerVariant(playerState:getRoleID(), VarIndex)
	end.

%% 设置活动开关
setactivity(Params) when erlang:length(Params) >= 2 ->
	[ActivityID_S | Other1] = Params,
	[Value_S | _Other2] = Other1,
	ActivityID = string_to_integer(ActivityID_S),
	Value = string_to_integer(Value_S),
	Ret = activity:setActivitySwitch(ActivityID, Value > 0),
	?LOG_OUT("Player[~p][~ts] setactivity ActivityID[~p] Value[~p] Result:~p",
		[playerState:getRoleID(), playerState:getName(), ActivityID, Value, Ret]),
	Ret.

%% 查询活动开关
queryactivity(Params) when erlang:length(Params) >= 1 ->
	[ActivityID_S | _Other1] = Params,
	ActivityID = string_to_integer(ActivityID_S),
	Ret = activity:queryActivitySwitch(ActivityID),
	Ret.

addcoin(Params) when erlang:length(Params) >= 2 ->
	[SValue1 | Other1] = Params,
	[SValue2 | _Other2] = Other1,
	MoneyType = string_to_integer(SValue1),
	Money = string_to_integer(SValue2),
	addMoney(MoneyType, Money),
	ok.

%%购买副本进入次数
buyactioncount(Params) when erlang:length(Params) >= 1 ->
	[MapId|_Other] = Params,
	%%playerActivity:buyActionCount(string_to_integer(MapId)),
	%%首领入侵鼓舞
	playerActivity:inspire(string_to_integer(MapId)),
	ok.

%%清空进入副本次数和购买次数
cleancopycount(Params) when erlang:length(Params) >= 1 ->
	[MapID|_Other] = Params,
	CopyMapID = string_to_integer(MapID),
	#mapsettingCfg{type = ?MapTypeCopyMap, daily_entercount_group = V} = getCfg:getCfgPStack(cfg_mapsetting, CopyMapID),
	playerDaily:reduceDailyCounter(?DailyType_EnterCopyMap, CopyMapID, playerDaily:getDailyCounter(?DailyType_EnterCopyMap, CopyMapID)),
	playerDaily:reduceDailyCounter(?DailyType_BuyCopyMap_Number, CopyMapID, playerDaily:getDailyCounter(?DailyType_BuyCopyMap_Number, CopyMapID)),
	case V of
		0 ->
			ok;
		_ ->
			playerDaily:reduceDailyCounter(?DailyType_EnterCopyMapGroup, V, playerDaily:getDailyCounter(?DailyType_EnterCopyMapGroup, V)),
			playerDaily:reduceDailyCounter(?DailyType_BuyCopyMapGroup_Number, V, playerDaily:getDailyCounter(?DailyType_BuyCopyMapGroup_Number, V))
	end.

%%清空进入竞技场次数和购买次数
cleanladder1v1(Params) when erlang:length(Params) == 0 ->
	playerDaily:reduceDailyCounter(?DailyType_Ladder1v1, 2, playerDaily:getDailyCounter(?DailyType_Ladder1v1, 2)),
	playerDaily:reduceDailyCounter(?DailyType_Ladder1v1, 3, playerDaily:getDailyCounter(?DailyType_Ladder1v1, 3)),
	ok.

recharge(Params) ->
	[SValue1 | _Other1] = Params,
%%	[SValue2|_Other2] = _Other1,
%%	RoleID4Order = playerState:getRoleID(),
%%	FeOrderIDBinStr = erlang:list_to_binary(SValue1),
%%	GameMoney = erlang:list_to_float(SValue2),
%%	CurrencyMoney = GameMoney/10,
%%	ProviderOrderid = FeOrderIDBinStr,
%%	psMgr:sendMsg2PS(?PsNameRecharge, addNewFeOrder, {RoleID4Order, FeOrderIDBinStr, "CNY",GameMoney,CurrencyMoney,ProviderOrderid,<<"{\"bindDiamondNum\":30,\"bindItemAndNum\":\"13,2\"}">>}),
%%	AccountIDStr = erlang:integer_to_list( playerState:getAccountID() ),
%%	Level = playerState:getLevel(),
%%	talkdataOtp:send2me(toTalkData, {SValue1,AccountIDStr,CurrencyMoney,FeOrderIDBinStr,"CNY",Level}),
	{_, _, OrderID} = os:timestamp(),
	ParseData = #rec_http_msg_recharge_info{character_id = playerState:getRoleID(),
		orderid = erlang:integer_to_binary(OrderID),
		amount = erlang:list_to_integer(SValue1),
		purchasetoken = <<"GM_test">>,
		currency_amount = 20,
		item_id = <<"1">>,
		item_amount = 1,
		currency = "GM",
		excess_amount = 0,
		excess_money = 50,
		provider_orderid = OrderID - 1000,
		gift = <<"0">>,
		comments = "",
		category = ""},
	?PsNameRecharge ! {<<"new_recharge_msg_coming">>, ParseData, self()},
	ok.

%%-ifdef(RELEASE).
%% addMoney(MoneyType,Money) ->
%% 	List = [?CoinTypeDiamond,?CoinTypeBindDiamond,?CoinTypeScore],
%% 	case lists:member(MoneyType,List) of
%% 		true ->
%% 			%%RELEASE版本不能增加这些货币
%% 			?WARN_OUT("Player:~ts ID:~p GM AddMoney skip",[playerState:getName(),playerState:getRoleID()]),
%% 			skip;
%% 		_ ->
%% 			playerMoney:addCoin(MoneyType, Money, #recPLogTSMoney{reason=?CoinSourceOnlineGM,param=playerState:getRoleID(),target=?PLogTS_PlayerSelf,source=?PLogTS_GMSystem})
%% 	end,
%% 	ok.
%% -else.
addMoney(MoneyType, Money) ->
	playerMoney:addCoin(MoneyType, Money,
		#recPLogTSMoney{reason = ?CoinSourceOnlineGM, param = playerState:getRoleID(), target = ?PLogTS_PlayerSelf, source = ?PLogTS_GMSystem}),
	ok.
%%-endif.

deccoin(Params) when erlang:length(Params) >= 2 ->
	[SValue1 | Other1] = Params,
	[SValue2 | _Other2] = Other1,
	MoneyType = string_to_integer(SValue1),
	Money = string_to_integer(SValue2),
	playerMoney:decCoin(MoneyType, Money,
		#recPLogTSMoney{reason = ?CoinSourceOnlineGM, param = playerState:getRoleID(), target = ?PLogTS_GMSystem, source = ?PLogTS_PlayerSelf}),
	ok.

querycoin(Params) when erlang:length(Params) >= 1 ->
	[SValue1 | _Other1] = Params,
	MoneyType = string_to_integer(SValue1),
	Value = case MoneyType >= ?CoinTypeMin andalso MoneyType =< ?CoinTypeMax of
				true ->
					playerState:getCoin(MoneyType);
				_ ->
					-1
			end,
	io_lib:format("querycoin:Type=~p, Value=~p", [MoneyType, Value]).

%% 设置玩家的公共属性
setprop(Params) when erlang:length(Params) >= 2 ->
	[SValue1 | Other1] = Params,
	[SValue2 | _Other2] = Other1,
	PropIndex = string_to_integer(SValue1),
	case playerPropSync:getPropType(PropIndex) of
		?PropType_INT ->
			Value = string_to_integer(SValue2),
			playerPropSync:setInt(PropIndex, Value),
			io_lib:format("setprop int ~p:~p", [PropIndex, Value]);
		?PropType_INT64 ->
			Value = string_to_integer(SValue2),
			playerPropSync:setInt64(PropIndex, Value),
			io_lib:format("setprop int64 ~p:~p", [PropIndex, Value]);
		?PropType_FLOAT ->
			Value = erlang:list_to_float(SValue2),
			playerPropSync:setFloat(PropIndex, Value),
			io_lib:format("setprop float ~p:~p", [PropIndex, Value]);
		?PropType_STRING ->
			playerPropSync:setString(PropIndex, SValue2),
			io_lib:format("setprop string ~p:~ts", [PropIndex, SValue2]);
		ValueType ->
			io_lib:format("setprop undefined ~p,~p:~ts", [ValueType, PropIndex, SValue2])
	end.

%% 查询玩家身上的属性
queryprop(Params) when erlang:length(Params) >= 1 ->
	[SValue1 | _Other1] = Params,
	PropIndex = string_to_integer(SValue1),
	Value = playerPropSync:getProp(PropIndex),
	case playerPropSync:getPropType(PropIndex) of
		?PropType_STRING ->
			io_lib:format("queryprop: type = ~p, value = ~p", [?PropType_STRING, Value]);
		ValueType ->
			io_lib:format("queryprop: type = ~p, value = ~p", [ValueType, Value])
	end.

%% 开启一个计时
startclock(Params) when erlang:length(Params) >= 3 ->
	[SValue1 | Other1] = Params,
	[SValue2 | Other2] = Other1,
	[SValue3 | _Other3] = Other2,
	Type = string_to_integer(SValue1),
	OffTime = string_to_integer(SValue2),
	LengthTime = string_to_integer(SValue3),
	playerClock:startClock(Type, 1, OffTime, LengthTime),
	ok.
%% 删除一个计时
delclock(Params) when erlang:length(Params) >= 1 ->
	[SValue1 | _] = Params,
	Type = string_to_integer(SValue1),
	playerClock:delClock(Type, 1),
	ok.

%% 开启一个计时
queryclock(Params) when erlang:length(Params) >= 1 ->
	[SValue1 | Other1] = Params,
	[SValue2 | _Other2] = Other1,
	Type = string_to_integer(SValue1),
	SubType = string_to_integer(SValue2),
	V = playerClock:getClock(Type, SubType),
	io_lib:format("queryclock:~p,~p,~p", [Type, SubType, V]).

%% 添加爵位声望
addvip(Params) when erlang:length(Params) >= 1 ->
	[SValue1 | _Other1] = Params,
	Value = string_to_integer(SValue1),
	case Value > 0 of
		true ->
			playerVariant:setPlayerVariant(?Setting_PlayerVarReadOnly_AccCharge, Value * ?PayRate),
			NValue = playerVip:addReputation(Value),
			io_lib:format("addvip:~p, all:~p", [Value, NValue]);
		_ ->
			playerPropSync:setInt(?PriProp_Reputation, 0),
			"set vip:0"
	end.

%%获得所有称号
alltitle(_Params) ->
	AllTitleID = getCfg:get1KeyList(cfg_titlesystem),
	Fun = fun(ID) ->
		TitleCfg = getCfg:getCfgPStack(cfg_titlesystem, ID),
		case TitleCfg#titlesystemCfg.time > 0 of
			true ->
				psMgr:sendMsg2PS(?PsNamePlayerMgr, addTitle, [{playerState:getRoleID(), ID}]);
			_ ->
				playerTitle:addTitle(ID, ?TitleSourceGM)
		end
		  end,
	lists:foreach(Fun, AllTitleID),
	ok.

addrune(Params) when erlang:length(Params) >= 3 ->
	[RuneStr | Other1] = Params,
	[NumStr | Other2] = Other1,
	[BindStr | _Other3] = Other2,
	RuneID = string_to_integer(RuneStr),
	Num = string_to_integer(NumStr),
	IsBind = misc:convertBoolFromInt(string_to_integer(BindStr)),
	playerRune:dropRune(RuneID, Num, IsBind),
	ok.

additem(Params) when erlang:length(Params) >= 2 ->
	[SzItemID | Other1] = Params,
	[SzItemNum | Other2] = Other1,

	{_IsBind, Quality} = case Other2 of
							 [] ->
								 {false, 0};
							 [SzIsBind | Other3] ->
								 {IIsBind, _R} = string:to_integer(SzIsBind),
								 IsBind0 = IIsBind > 0,
								 case Other3 of
									 [] ->
										 {IsBind0, 0};
									 [SzQuality | _] ->
										 {Q, _} = string:to_integer(SzQuality),
										 {IsBind0, Q}
								 end
						 end,
	{ItemID, _Rest} = string:to_integer(SzItemID),
	{ItemNum, _} = string:to_integer(SzItemNum),
	PLog = #recPLogTSItem{
		old = 0,
		new = ItemNum,
		change = ItemNum,
		target = ?PLogTS_PlayerSelf,
		source = ?PLogTS_GMSystem,
		gold = 0,
		goldtype = 0,
		changReason = ?ItemSourceGM,
		reasonParam = playerState:getRoleID()
	},
	playerPackage:addGoods(ItemID, ItemNum, false, Quality, PLog),
	ok.

baseprop(Params) when erlang:length(Params) >= 1 ->
	[Type | _Other1] = Params,
	TypeInt = string_to_integer(Type),
	V1 = playerState:getBattlePropBase(TypeInt),
	V2 = playerState:getBattlePropTotal(TypeInt),
	io_lib:format("baseprop:type=[~p],initvalue=~p,nowvalue=~p", [TypeInt, V1, V2]).

setbaseprop(Params) when erlang:length(Params) >= 2 ->
	[Type | Other1] = Params,
	[Value | _Other2] = Other1,
	TypeInt = string_to_integer(Type),
	ValueInt = string_to_integer(Value),
	playerState:setBattlePropTotal(TypeInt, erlang:float(ValueInt)),
	ok.

queryitem(Params) when erlang:length(Params) >= 2 ->
	[SzBagType | Other1] = Params,
	[SzItemUID | _] = Other1,
	Item = playerPackage:getGoodsByUID(string_to_integer(SzItemUID), string_to_integer(SzBagType)),
	?DEBUG_OUT("queryItem:~p", [Item]),
	ok.

sethp(Params) when erlang:length(Params) >= 1 ->
	[HPs | _Other1] = Params,
	HP = string_to_integer(HPs),
	HHP = case HP > 0 of
			  true -> HP;
			  _ ->
				  playerState:getMaxHp()
		  end,
	playerBase:setHpDirect(HHP),
	io_lib:format("curhp:~p, maxhp:~p", [playerState:getCurHp(), playerState:getMaxHp()]).

setlevel(Params) when erlang:length(Params) >= 1 ->
	[SzLevel | _] = Params,
	?LOG_OUT("setlevel gm..."),
	{Level, _Rest} = string:to_integer(SzLevel),
	LevelList = getCfg:get1KeyList(cfg_indexFunction),
	Max = lists:max(LevelList),
	Level2 = erlang:min(Level, Max),
	case playerState:getLevel() < Level2 of
		true ->
			AddExp = playerBase:getAddExp(playerState:getLevel(), playerState:getCurExp(), Level2),
			SetLevel = playerBase:setLevel(Level2, true),
			playerMsg:sendMsgToNearPlayer(#pk_GS2U_PlayerLevelUp{
				code = playerState:getPlayerCode(),
				curExp = 0,
				maxExp = playerState:getMaxExp(),
				addExp = AddExp,
				level = SetLevel
			}, true),
			"setlevel success";
		_ ->
			"setlevel falied"
	end.

%% execGM("loadgoods",Params) when erlang:length(Params) >= 1 ->
%% 	[SzGoodsUID|_] = Params,
%%     {GoodsUID, _Rest} = string:to_integer(SzGoodsUID),
%% 	ok;

splititem(Params) when erlang:length(Params) >= 2 ->
	[SzGoodsUID | Other] = Params,
	[SzNum | _] = Other,
	{GoodsUID, _Rest} = string:to_integer(SzGoodsUID),
	{Num, _R} = string:to_integer(SzNum),
	Plog = #recPLogTSItem{
		old = 0,
		new = Num,
		change = Num,
		target = ?PLogTS_PlayerSelf,
		source = ?PLogTS_PlayerSelf,
		gold = 0,
		goldtype = 0,
		changReason = ?ItemSourceGM,
		reasonParam = 0
	},
	playerPackage:splitItem(GoodsUID, Num, true, Plog),
	ok.

%%接受任务
addtask(Params) when erlang:length(Params) >= 1 ->
	[SzTaskID | _] = Params,
	{TaskID, _Rest} = string:to_integer(SzTaskID),
	playerTask:acceptTask(TaskID, 0),
	ok.

getalltask(_) ->
	List =
		lists:foldl(
			fun(#rec_task{taskID = ID}, R) ->
				[ID | R]
			end,
			[],
			playerState:getAcceptedTask()
		),
	io_lib:format("listID:~w", [List]).

%%提交任务
submittask(Params) when erlang:length(Params) >= 1 ->
	[SzTaskID | _] = Params,
	{TaskID, _Rest} = string:to_integer(SzTaskID),
	case erlang:is_integer(TaskID) andalso TaskID > 0 of
		true ->
			playerTask:gmSubmitTask(TaskID);
		_ ->
			skip
	end,
	ok.

%%提交任务
submittask2(Params) when erlang:length(Params) >= 1 ->
	ok.

submitTaskAll(Params) when erlang:length(Params) >= 1 ->
	[SzTaskID | _] = Params,
	{MaxTaskID, _Rest} = string:to_integer(SzTaskID),
	lists:foreach(
		fun(TaskID) ->
			playerTask:gmAddCompleteTask(TaskID)
		end, lists:seq(1, MaxTaskID)),
	playerTask:acceptTask(MaxTaskID + 1, 0),
	ok.
%%开启觉醒功能
wakeup(_Params) ->
	playerGoddess:gmWakeUp(),
	ok.

%% 查询交易行订单
querytrade(Params) when erlang:length(Params) >= 3 ->
	[SValue1 | Other1] = Params,
	[SValue2 | Other2] = Other1,
	[SValue3 | _] = Other2,
	R = #pk_U2GS_QueryTrade{
		tradeClass = string_to_integer(SValue1),
		itemClass = string_to_integer(SValue2),
		itemTypeList = [],
		itemSubType = -1,
		itemList = [],
		itemLvlMin = -1,
		itemLvlMax = -1,
		itemProfession = -1,
		oneNumber = string_to_integer(SValue3)
	},
	playerTrade:queryTrade(R),
	ok.

%% 查询最新交易行订单
querynewesttrade(Params) when erlang:length(Params) >= 2 ->
	[SValue1 | Other1] = Params,
	[SValue2 | Other2] = Other1,
	[SValue3 | _] = Other2,
	R = #pk_U2GS_QueryNewestTrade{
		tradeClass = string_to_integer(SValue1),
		getNumber = string_to_integer(SValue2),
		oneNumber = string_to_integer(SValue3)
	},
	playerTrade:queryNewestTrade(R),
	ok.

%% 查询下一页
nexttrade(Params) when erlang:length(Params) >= 1 ->
	[SValue1 | _] = Params,
	Value1 = string_to_integer(SValue1),
	%% 查询指定页
	playerTrade:nextResult(Value1, 0),
	ok.

%% 打印查询结果
printtrade(Params) when erlang:length(Params) >= 2 ->
	[SValue1 | Other1] = Params,
	[SValue2 | _] = Other1,
	%% 查询指定页
	playerTrade:printTradeArray(string_to_integer(SValue1), string_to_integer(SValue2)),
	ok.

%% 打印排行榜
printrank(Params) when erlang:length(Params) >= 1 ->
	[SValue1 | _Other1] = Params,
	Type = string_to_integer(SValue1),
	case Type >= ?PlayerRankType_Start andalso Type =< ?PlayerRankType_End of
		true ->
			List = myEts:lookUpEts(?TABLE_RankInfo, Type),
			?DEBUG_OUT("printrank:~p", [List]);
		_ ->
			skip
	end,
	ok.

%% 打印排行榜个数
printranknum(Params) when erlang:length(Params) >= 1 ->
	[SValue1 | _Other1] = Params,
	Type = string_to_integer(SValue1),
	case Type >= ?PlayerRankType_Start andalso Type =< ?PlayerRankType_End of
		true ->
			List = myEts:lookUpEts(?TABLE_RankInfo, Type),
			Str = io_lib:format("printranknum:~p", [erlang:length(List)]),
			?DEBUG_OUT("~ts", [Str]),
			Str;
		_ ->
			skip
	end.

%% 立即刷新某类型的排行榜
freshrank(Params) when erlang:length(Params) >= 1 ->
	[SValue1 | _Other1] = Params,
	Type = string_to_integer(SValue1),
	case Type >= ?PlayerRankType_Start andalso Type =< ?PlayerRankType_End of
		true ->
			psMgr:sendMsg2PS(?PsNameRank, immediatelyFreshRank, Type),
			"send freshrank success!";
		_ ->
			"send freshrank failed!"
	end.
freshrankandtick(Params) when erlang:length(Params) >= 1 ->
	?DEBUG_OUT("here"),
	[SValue1 | _Other1] = Params,
	Type = string_to_integer(SValue1),
	case Type =:= 1 of
		true ->
			psMgr:sendMsg2PS(?PsNameRank, freshrankandtick, {}),
			"send freshrankandtick success!";
		_ ->
			"send freshrankandtick failed!"
	end.

%% 立即刷新所有类型的排行榜
freshrankall(Params) when erlang:length(Params) >= 0 ->
	L = getCfg:get1KeyList(cfg_rank),
	Fun = fun(Type) ->
		case getCfg:getCfgByArgs(cfg_rank, Type) of
			#rankCfg{fresh_cycle = Time} when erlang:is_integer(Time) andalso Time > 0 ->
				%%不刷勇者试炼榜，在周一刷榜会发奖励
				case Type =:= ?PlayerRankType_WarriorTrial of
					true ->
						skip;
					_ ->
						psMgr:sendMsg2PS(?PsNameRank, immediatelyFreshRank, Type)
				end;
			_ -> skip
		end
		  end,
	lists:foreach(Fun, L),
	ok.

%%% 请求排行榜领奖
%rankreward(Params) when erlang:length(Params) >= 1 ->
%	[SValue1 | _Other1] = Params,
%	Type = string_to_integer(SValue1),
%	playerRank:requestRankAward(Type).

%% 排序
sorttrade(Params) when erlang:length(Params) >= 2 ->
	[SValue1 | Other1] = Params,
	[SValue2 | _] = Other1,
	R = #pk_U2GS_ResultSort{
		sortIndex = string_to_integer(SValue1),
		pageNumber = string_to_integer(SValue2)
	},
	playerTrade:sortTradeQueryResult(R),
	ok.

%% 购买订单
buytrade(Params) when erlang:length(Params) >= 2 ->
	[SValue1 | Other1] = Params,
	[SValue2 | _] = Other1,
	playerTrade:buyTrade(#pk_U2GS_TradeBuy{tradeClass = string_to_integer(SValue1), orderID = string_to_integer(SValue2)}),
	ok.

%% 上架订单
puttrade(Params) when erlang:length(Params) >= 8 ->
	[SValue1 | Other1] = Params,
	[SValue2 | Other2] = Other1,
	[SValue3 | Other3] = Other2,
	[SValue4 | Other4] = Other3,
	[SValue5 | Other5] = Other4,
	[SValue6 | Other6] = Other5,
	[SValue7 | Other7] = Other6,
	[SValue8 | _Other8] = Other7,
	R = #pk_U2GS_PutTrade{
		tradeClass = string_to_integer(SValue1),
		itemUID = string_to_integer(SValue2),
		itemID = string_to_integer(SValue3),
		sellNumber = 233,
		sellTime = string_to_integer(SValue4),
		silver = string_to_integer(SValue5),
		gold = string_to_integer(SValue6),
		destRoleName = SValue7,
		opCode = string_to_integer(SValue8)
	},
	playerTrade:putTrade(R),
	ok.

%% 下架订单
downtrade(Params) when erlang:length(Params) >= 2 ->
	[SValue1 | Other1] = Params,
	[SValue2 | _Other2] = Other1,
	R = #pk_U2GS_DownTrade{
		tradeClass = string_to_integer(SValue1),
		orderID = string_to_integer(SValue2)
	},
	playerTrade:downTrade(R),
	ok.

%% 拒绝订单
refusetrade(Params) when erlang:length(Params) >= 1 ->
	[SValue1 | _Other1] = Params,
	playerTrade:refuseBuy(#pk_U2GS_TradeRefuse{tradeClass = 3, orderID = string_to_integer(SValue1)}),
	ok.

%% 查询自己的订单
queryselftrade(Params) when erlang:length(Params) >= 1 ->
	[SValue1 | _Other1] = Params,
	R = #pk_U2GS_QuerySelfTrade{
		tradeClass = string_to_integer(SValue1)
	},
	playerTrade:querySelfTrade(R),
	ok.

%% 邮件相关GM命令
newmail(Params) when erlang:length(Params) >= 3 ->
	[SValue1 | Other1] = Params,
	[SValue2 | Other2] = Other1,
	[SValue3 | Other3] = Other2,
	[SValue4 | _Other4] = Other3, % 发多少封
	Number = string_to_integer(SValue4),
	Fun =
		fun(I) ->
			Title = io_lib:format("~ts-~p", [SValue2, I]),
			A = list_to_binary(Title),
			B = binary_to_list(A),
			playerMail:newMail(SValue1, B, SValue3, "")
		end,
	case Number >= 1 of
		true ->
			List = lists:seq(1, Number),
			lists:foreach(Fun, List),
			ok;
		_ ->
			error
	end.

%% 发送一封系统邮件
newsysmail(Params) when erlang:length(Params) >= 7 ->
	[SValue1 | Other1] = Params,
	[SValue2 | Other2] = Other1,
	[SValue3 | Other3] = Other2,
	[SValue4 | Other4] = Other3,
	[SValue5 | Other5] = Other4,
	[SValue6 | Other6] = Other5,
	[SValue7 | Other7] = Other6,
	[SValue8 | _Other8] = Other7,
	playerMail:gmSendSysMail2Other(SValue1, SValue2, "syscontent", "",
		string_to_integer(SValue3), string_to_integer(SValue4),
		string_to_integer(SValue5), string_to_integer(SValue6),
		string_to_integer(SValue7), string_to_integer(SValue8)),
	ok.

maildiamond(Params) when erlang:length(Params) >= 1 ->
	%% 给全服玩家发送非绑定钻石
	[SValue1 | _Other1] = Params,
	Number = string_to_integer(SValue1),
	case Number > 0 of
		true ->
			Title = stringCfg:getString(cnTextLuckyCoinUnname),
			F =
				fun(#rec_RoleName{roleName = Name}, _) ->
					playerMail:gmSendSysMail2Other(Name, Title, Title, "",
						0, 0,
						0, 0,
						?CoinTypeDiamond, Number),
					ok
				end,
			ets:foldl(F, 0, ets_rec_RoleName),

%%			execGMCmd("addcoin", ["3", SValue1]),	%% 非绑钻
			ok;
		_ ->
			skip
	end.

querymail(Params) when erlang:length(Params) >= 1 ->
	[SValue1 | _Other1] = Params,
	MailID = string_to_integer(SValue1),
	Ret = playerMail:queryMail(MailID),
	?DEBUG_OUT("queryMail:~p", [Ret]),
	ok.

queryallmail(Params) when erlang:length(Params) >= 0 ->
	Ret = playerMail:queryAllMail(),
	?DEBUG_OUT("queryAllMail:~p", [Ret]),
	ok.

readmail(Params) when erlang:length(Params) >= 1 ->
	[SValue1 | _Other1] = Params,
	MailID = string_to_integer(SValue1),
	playerMail:readMail(MailID),
	ok.

lockmail(Params) when erlang:length(Params) >= 1 ->
	[SValue1 | _Other1] = Params,
	MailID = string_to_integer(SValue1),
	playerMail:lockMail(MailID),
	ok.

unlockmail(Params) when erlang:length(Params) >= 1 ->
	[SValue1 | _Other1] = Params,
	MailID = string_to_integer(SValue1),
	playerMail:unlockMail(MailID),
	ok.

deletemail(Params) when erlang:length(Params) >= 1 ->
	[SValue1 | _Other1] = Params,
	MailID = string_to_integer(SValue1),
	playerMail:deleteMail(MailID),
	ok.

deleteallreadmail(_Params) ->
	playerMail:deleteAllReadMail(),
	ok.

querytips(Params) when erlang:length(Params) >= 1 ->
	[SValue1 | _Other1] = Params,
	ItemUID = string_to_integer(SValue1),
	?WARN_OUT("querytips:~p,~p", [playerState:getRoleID(), ItemUID]),
	Ret2 = playerItemTips:queryItemFromDBMemCache(ItemUID, true),
	Ret1 = playerMail:queryAttachItemInfo([ItemUID]),
	?WARN_OUT("querytips:~p,~p,~p", [playerState:getRoleID(), Ret1, Ret2]),
	io_lib:format("ret1=~p,ret2=~p", [Ret1, Ret2]).

%% 测试玩家关键数据的缓存进程
queryroleid(Params) when erlang:length(Params) >= 1 ->
	[SValue1 | _Other1] = Params,
	?LOG_OUT("queryroleid:~p,~ts", [playerState:getRoleID(), SValue1]),
	Ret = playerNameUID:getPlayerUIDByName(SValue1),
	io_lib:format("queryRoleID:~s,~p", [SValue1, Ret]).

queryrolename(Params) when erlang:length(Params) >= 1 ->
	[SValue1 | _Other1] = Params,
	RoleID = string_to_integer(SValue1),
	Ret = playerNameUID:getPlayerNameByUID(RoleID),
	io_lib:format("queryRoleID:~p,~s", [RoleID, Ret]).

getallskill(_Params) ->
	ListSkillID =
		case playerState:getSkill() of
			undefined ->
				[];
			List ->
				FunGetID =
					fun(#recSkill{skillID = ID}, R) ->
						[ID | R]
					end,
				lists:foldl(FunGetID, [], List)
		end,
	io_lib:format("allSkillID:~p", [ListSkillID]).

testuid(Params) when erlang:length(Params) >= 1 ->
	[SValue1 | _Other1] = Params,
	Type = string_to_integer(SValue1),
	UID = case Type of
			  1 ->
				  uidMgr:makeRoleUID();
			  2 ->
				  uidMgr:makeItemUID();
			  3 ->
				  uidMgr:makeTradeUID();
			  4 ->
				  uidMgr:makeMailUID();
			  _ ->
				  uidMgr:makeRoleUID()
		  end,
	?LOG_OUT("makenew UID [~p]", [UID]),
	ok.

%% %% 测试遍历效率 #testefficiency 121538205 10000000
%% execGM("testefficiency", Params) when erlang:length(Params) >= 2 ->
%% 	[SValue1|Other1] = Params,
%% 	[SValue2|_Other2] = Other1,
%% 	Code = string_to_integer(SValue1),
%% 	Times = string_to_integer(SValue2),
%% 	?DEBUG_OUT("testefficiency start:~p,~p", [Code, Times]),
%%
%% 	Fun1 = fun(_Index, Param) ->
%% 		%%Ets = playerState:getMapMonsterEts(),
%% 		_ETSMS1 = [{'$1', [{'=:=', {element, 2, '$1'}, {const, Param}}], ['$1']}],
%% 		%%MonsterList = myEts:selectEts(Ets, ETSMS),
%% 		Param
%% 	end,
%%
%% 	Fun2 = fun(_Index, Param) ->
%% 		%%Ets = playerState:getMapMonsterEts(),
%% 		_ETSMS2 = ets:fun2ms(fun(Monster) when Monster#recMapObject.code =:= Param ->
%% 			Monster
%% 		end),
%% 		%%MonsterList = myEts:selectEts(Ets, ETSMS),
%% 		Param
%% 	end,
%%
%% 	%% test1
%% 	Time1 = now_microseconds(),
%% 	misc:for(1, Times, 1, Code, Fun1),
%% 	Time2 = now_microseconds(),
%% 	?DEBUG_OUT("test1:~p,~p,~p", [Time1,Time2,Time2-Time1]),
%%
%% 	%% test2
%% 	Time3 = now_microseconds(),
%% 	misc:for(1, Times, 1, Code, Fun2),
%% 	Time4 = now_microseconds(),
%% 	?DEBUG_OUT("test2:~p,~p,~p", [Time3,Time4,Time4-Time3]),
%% 	ok;

%% 查询服务器在线人数
qn(Params) when erlang:length(Params) =:= 0 ->
	Size = ets:info(ets_rec_OnlinePlayer, size),
	io_lib:format("tc Online Player Count:~p", [Size]).

%% 查询当前场景的人数
qn2(Params) when erlang:length(Params) =:= 0 ->
	PlayerEts = playerState:getMapPlayerEts(),
	Size = ets:info(PlayerEts, size),
	io_lib:format("Scene Player Count:~p", [Size]).

%% 打开空气墙
openkqq(Params) ->
	Msg =
		case Params of
			[SValue1 | _Other1] ->
				#pk_GS2U_BlockStatusChange{changes = [#pk_BlockStatusChange{blockName = SValue1, blockStatus = ?BlockNpc_Open}]};
			_ ->
				#pk_GS2U_BlockStatusChange{
					changes = [
						#pk_BlockStatusChange{blockName = "d1", blockStatus = ?BlockNpc_Open},
						#pk_BlockStatusChange{blockName = "d2", blockStatus = ?BlockNpc_Open},
						#pk_BlockStatusChange{blockName = "d3", blockStatus = ?BlockNpc_Open},
						#pk_BlockStatusChange{blockName = "d4", blockStatus = ?BlockNpc_Open},
						#pk_BlockStatusChange{blockName = "d5", blockStatus = ?BlockNpc_Open},
						#pk_BlockStatusChange{blockName = "d6", blockStatus = ?BlockNpc_Open},
						#pk_BlockStatusChange{blockName = "d7", blockStatus = ?BlockNpc_Open},
						#pk_BlockStatusChange{blockName = "d8", blockStatus = ?BlockNpc_Open},
						#pk_BlockStatusChange{blockName = "d9", blockStatus = ?BlockNpc_Open},
						#pk_BlockStatusChange{blockName = "d10", blockStatus = ?BlockNpc_Open}
					]
				}
		end,
	playerMsg:sendNetMsg(Msg),
	ok.

%% 查询分组中的怪物个数
querymonster(Params) when erlang:length(Params) >= 1 ->
	[SValue1 | _Other1] = Params,
	GroupID = string_to_integer(SValue1),
	MonEts = playerState:getMapMonsterEts(),
	MatchSpec = ets:fun2ms(fun(Monster) when Monster#recMapObject.groupID =:= GroupID andalso Monster#recMapObject.type =:= ?ObjTypeMonster ->
		{Monster#recMapObject.code, Monster}
						   end),
	case myEts:selectEts(MonEts, MatchSpec) of
		[] ->
			"not found monster!";
		L ->
			?DEBUG_OUT("querymonster:~p", [L]),
			LL = [{Code1, ID1} || {Code1, #recMapObject{id = ID1}} <- L],
			io_lib:format("querymonster:~p,~p", [length(LL), LL])
	end.

%% 全服查询玩家对象
queryobj(Params) when erlang:length(Params) >= 1 ->
	[SValue1 | _Other1] = Params,
	RoleID = string_to_integer(SValue1),
	case RoleID > 0 of
		true ->
			playerRPView:gm_QueryObjByRoleID(RoleID);
		_ ->
			skip
	end.

%% 查询目标的属性值
query(Params) when erlang:length(Params) >= 1 ->
	[SValue1 | _Other1] = Params,
	Value = string_to_integer(SValue1),
	NValue = if
				 Value =:= 0 ->
					 %% 查看选中目标的属性
					 playerState:getSelectTargetCode();
				 Value =:= 1 ->
					 %% 查看自己的属性
					 playerState:getPlayerCode();
				 Value >= 999 ->
					 %% 查看指定目标的属性
					 Value;
				 true ->
					 0
			 end,
	?DEBUG_OUT("query:~p,~w", [NValue, self()]),
	if
		NValue =< 0 orelse NValue =:= undefined ->
			"notFound select";
		NValue > 0 ->
			case codeMgr:getObjectTypeByCode(NValue) of
				?ObjTypePlayer ->
					S1 =
						case playerMgrOtp:getOnlinePlayerInfoByCode(NValue) of
							#rec_OnlinePlayer{accountID = AID, roleID = RoleID} ->
								io_lib:format("accountID=~p, playerCode=~p, playerId=~p, playerName=~s", [
									AID,
									NValue,
									RoleID,
									playerNameUID:getPlayerNameByUID(RoleID)
								]);
							_ ->
								"not find player!!"
						end,
					S2 = case playerState:getMapPlayerEts() of
							 undefined ->
								 "notFound player ets";
							 MapPlayerEts ->
								 case myEts:lookUpEts(MapPlayerEts, NValue) of
									 [#recMapObject{hp = H, maxHp = MaxHP, mp = M, x = X, y = Y, mapId = MA, type = T, guild = GuildID, groupID = G, camp = Camp, mapPid = MapPid, buffList = BuffList}] ->
										 Fun = fun(#pk_BuffBaseInfo{buffID = BuffID}) ->
											 BuffID
											   end,
										 Buffs = lists:map(Fun, BuffList),
										 io_lib:format("hp=~p, maxHp=~p, mp=~p, x=~p, y=~p, mapId=~p, type=~p, guild=~p, groupID=~p camp=~p, mapPid=~p, buffs = ~ts, isCross=~p",
											 [H, MaxHP, M, erlang:trunc(X), erlang:trunc(Y), MA, T, GuildID, G, Camp, MapPid, misc:term_to_string(Buffs), core:isCross()]);
									 _ ->
										 "notFound player"
								 end
						 end,
					io_lib:format("Base=[~ts], Other=[~ts]", [S1, S2]);
				?ObjTypeMonster ->
					case playerState:getMapMonsterEts() of
						undefined ->
							"notFound monster ets";
						MapMonsterEts ->
							case myEts:lookUpEts(MapMonsterEts, NValue) of
								[#recMapObject{code = C, id = I, name = N, hp = H, mp = M, x = X, y = Y, mapPid = MPid, camp = Camp, mapId = MA, type = T, status = ST, actionStatus = AT, guild = G, level = LVL, buffList = Bufs}] ->

									psMgr:sendMsg2PS(MPid, getMonsterProp, C),
									?DEBUG_OUT("code=~p, id=~p, name=~s, hp=~p, mp=~p, x=~p, y=~p, camp=~p, mapId=~p, type=~p, status=~p, actionStatus=~p,guildID=~p,level=~p,buffs = ~ts",
										[C, I, N, H, M, erlang:trunc(X), erlang:trunc(Y), Camp, MA, T, ST, AT, G, LVL, misc:term_to_string(Bufs)]),
									io_lib:format("code=~p, id=~p, name=~s, hp=~p, mp=~p, x=~p, y=~p, camp=~p, mapId=~p, type=~p, status=~p, actionStatus=~p,guildID=~p,level=~p,buffs = ~ts",
										[C, I, N, H, M, erlang:trunc(X), erlang:trunc(Y), Camp, MA, T, ST, AT, G, LVL, misc:term_to_string(Bufs)]);
								_ ->
									"notFound monster"
							end
					end;
				?ObjTypePet ->
					case playerState:getMapPetEts() of
						undefined ->
							"notFound pet ets";
						MapPetEts ->
							case myEts:lookUpEts(MapPetEts, NValue) of
								[#recMapObject{code = C, id = I, name = N, hp = H, mp = M, x = X, y = Y, camp = Camp, mapId = MA, type = T, status = ST, actionStatus = AT, groupID = G, level = LVL, ownId = OwnID, buffList = Buffs}] ->
									?DEBUG_OUT("code=~p, id=~p, name=~s, hp=~p, mp=~p, x=~p, y=~p, camp=~p, mapId=~p, type=~p, status=~p, actionStatus=~p,groupID=~p,level=~p,OwnID=~p,buffs = ~ts",
										[C, I, N, H, M, erlang:trunc(X), erlang:trunc(Y), Camp, MA, T, ST, AT, G, LVL, OwnID, misc:term_to_string(Buffs)]),
									io_lib:format("code=~p, id=~p, name=~s, hp=~p, mp=~p, x=~p, y=~p, camp=~p, mapId=~p, type=~p, status=~p, actionStatus=~p,groupID=~p,level=~p,OwnID=~p,buffs = ~ts",
										[C, I, N, H, M, erlang:trunc(X), erlang:trunc(Y), Camp, MA, T, ST, AT, G, LVL, OwnID, misc:term_to_string(Buffs)]);
								_ ->
									"notFound pet"
							end
					end;
				?ObjTypeNPC ->
					case playerState:getMapNpcEts() of
						undefined ->
							"notFound npc ets";
						MapNpcEts ->
							case myEts:lookUpEts(MapNpcEts, NValue) of
								[#recMapObject{code = C, id = I, name = N, hp = H, mp = M, x = X, y = Y, mapId = MA, type = T, actionStatus = AT, status = ST, groupID = G}] ->
									io_lib:format("code=~p, id=~p, name=~s, hp=~p, mp=~p, x=~p, y=~p, mapId=~p, type=~p, actionStatus=~p, status=~p,groupID=~p",
										[C, I, N, H, M, erlang:trunc(X), erlang:trunc(Y), MA, T, AT, ST, G]);
								_ ->
									"notFound npc"
							end
					end;
				?ObjTypeCollect ->
					case playerState:getMapCollectEts() of
						undefined ->
							"notFound collect ets";
						CollectEts ->
							case myEts:lookUpEts(CollectEts, NValue) of
								[#recMapObject{code = C, id = I, name = N, hp = H, maxHp = MaxHP, x = X, y = Y, mapId = MA, groupID = G}] ->
									io_lib:format("code=~p, id=~p, name=~s, hp=~p, maxhp=~p, x=~p, y=~p, mapId=~p,groupID=~p",
										[C, I, N, H, MaxHP, erlang:trunc(X), erlang:trunc(Y), MA, G]);
								_ ->
									"notFound collect"
							end
					end;
				UnKnowType ->
					io_lib:format("Not other types:~p", [UnKnowType])
			end;
		true ->
			"notFound other"
	end.

%% 设置自己的属性值
setgroupid(Params) when erlang:length(Params) >= 1 ->
	[SValue1 | _Other1] = Params,
	Value1 = string_to_integer(SValue1),
	case Value1 < 0 of
		true ->
			%% 分配新的分组
			NewGroupID = playerScene:onEnterBitGroup(playerState:getMapID()),
			io_lib:format("setgroupid new:~p", [NewGroupID]);
		_ ->
			%% 设置老的分组
			GroupID = playerScene:onEnterGroup(Value1),
			io_lib:format("setgroupid old:~p,~p", [Value1, GroupID])
	end.

%% 检查当前位置是不是阻挡
checkblock(Params) ->
	{MapID, X, Y} =
		case erlang:length(Params) >= 3 of
			true ->
				[SValue1 | Other1] = Params,
				[SValue2 | Other2] = Other1,
				[SValue3 | _Other3] = Other2,
				{string_to_integer(SValue1), string_to_integer(SValue2), string_to_integer(SValue3)};
			_ ->
				MapID1 = playerState:getMapID(),
				{X1, Y1} = playerState:getPos(),
				{MapID1, X1, Y1}
		end,
	#recGameMapCfg{
		colCellNum = ColCellNum,
		rowCellNum = RowCellNum,
		cellSize = CellSize,
		block = BlockBinary} = core:getMapCfg(MapID),
	Ret = mapView:isBlock(erlang:float(X), erlang:float(Y), ColCellNum, RowCellNum, CellSize, BlockBinary),
	io_lib:format("mapID=~p,x=~p,y=~p,isblock=~p", [MapID, X, Y, Ret]).

cjss(Params) when erlang:length(Params) >= 1 ->
	%% 管理员无条件传送到目标所在地图
	[SValue1 | _Other1] = Params,
	TargetRoleID = string_to_integer(SValue1),
	case TargetRoleID > 0 of
		true ->
			%% 先判断目标是否与自己处于同一地图
			PlayerEts = playerState:getMapPlayerEts(),
			MatchSpec = ets:fun2ms(fun(Object) when Object#recMapObject.id =:= TargetRoleID ->
				Object
								   end),
			case myEts:selectEts(PlayerEts, MatchSpec) of
				[#recMapObject{x = X, y = Y, groupID = GroupID}] ->
					playerScene:onEnterGroup(GroupID),
					playerMap:onLaterTransferPosAck(playerState:getMapID(), X, Y),
					"success!";
				_ ->
					case core:queryOnLineRoleByRoleID(TargetRoleID) of
						#rec_OnlinePlayer{code = Code, pid = PID} ->
							psMgr:sendMsg2PS(PID, gm_getplayermapinfo, TargetRoleID),
							io_lib:format("success:roleid=~p,code=~p,name=~s",
								[TargetRoleID, Code, playerNameUID:getPlayerNameByUID(TargetRoleID)]);
						_ ->
							"not found"
					end
			end;
		_ ->
			"cjss error param"
	end.

ac(Params) when erlang:length(Params) >= 1 ->
	[S | _] = Params,
	S1 = string_to_integer(S),
	psMgr:sendMsg2PS(?PsNameCrosHd, setAc, {S1}),
	ok.

acarena(Params) when erlang:length(Params) >= 1 ->
	[S | _] = Params,
	S1 = string_to_integer(S),
	psMgr:sendMsg2PS(?PsNameCrosArena, setAc, {S1}),
	ok.

acswitch(Params) when erlang:length(Params) >= 1 ->
	[S | _] = Params,
	S1 = string_to_integer(S),
	playerPropSync:setInt(?PriProp_PlayerGmSwitch, S1),
	ok.

rearenarank(Params) when erlang:length(Params) >= 0 ->
	psMgr:sendMsg2PS(?PsNameCrosArena, refreshHighRank, {}),
	ok.

arenamatch(Params) when erlang:length(Params) >= 1 ->
	[S | _] = Params,
	case string_to_integer(S) of
		1 -> playerCrosTeam:setIsGMMatch(true);
		_ -> playerCrosTeam:setIsGMMatch(false)
	end,
	ok.

acreward(Params) when erlang:length(Params) >= 0 ->
	gsCrosOtp:dealWeekRewardToHd(),
	ok.

entercrosserver(Params) when erlang:length(Params) >= 0 ->
	psMgr:sendMsg2PS(?PsNameCrosHd, allocMapLine, {
		playerState:getRoleID(),
		playerState:getName(),
		self(),
		playerState:getNetPid(),
		playerState:getCareer(),
		gsMainLogic:getDBID4GS(),
		gsMainLogic:getAreaName(),
		playerPropSync:getProp(?PriProp_PetForce) + playerPropSync:getProp(?PriProp_PlayerForce),
		playerPropSync:getProp(?SerProp_PlayerHistoryForce),
		playerState:getLevel()
	}).

clearcrosrank(Params) when erlang:length(Params) >= 0 ->
	ets:delete_all_objects(rec_cros_rank),
	psMgr:sendMsg2PS(?PsNameCrosHd, clearRank, {}).

%% 进入地图
ss(Params) when erlang:length(Params) >= 1 ->
	[SValue1 | _Other1] = Params,
	Value = string_to_integer(SValue1),
	case getCfg:getCfgByArgs(cfg_mapsetting, Value) of
		#mapsettingCfg{type = ?MapTypeCopyMap} ->
			playerCopyMap:resetCopyMap(Value),
			%% 延时两秒钟进入副本
			erlang:send_after(5000, self(), {gm_delayEnterCopyMap, Value}),
			ok;
		#mapsettingCfg{type = ?MapTypeBitplane, belongto = BelongTo} ->
			case playerState:getMapID() =:= BelongTo of
				true ->
					playerCopyMap:enterCopyMap(Value);
				_ ->
					?LOG_OUT("gm order ss:failed:~p,~p,~p", [playerState:getMapID(), Value, BelongTo])
			end,
			ok;
		#mapsettingCfg{type = ?MapTypeActivity} ->
			playerScene:onRequestEnterActivityMap(Value, undefined),
			ok;
		_ ->
			case core:getMapWayPt(Value) of
				WayPtList when erlang:is_list(WayPtList) andalso WayPtList =/= [] ->
					[#recMapWayPt{name = Name} | _] = WayPtList,
					playerScene:onRequestEnterMap(Value, Name),
					ok;
				_ ->
					skip
			end,
			ok
	end,
	io_lib:format("enter map: ~p", [Value]).

goto(Params) when erlang:length(Params) >= 3 ->
	[SValue1 | Other1] = Params,
	[SValue2 | Other2] = Other1,
	[SValue3 | _Other3] = Other2,
	MapID_temp = string_to_integer(SValue1),
	MapID = case MapID_temp =< 0 of
				true ->
					playerState:getMapID();
				_ ->
					MapID_temp
			end,
	X = erlang:float(string_to_integer(SValue2)),
	Y = erlang:float(string_to_integer(SValue3)),
	playerMap:onLaterTransferPosAck(MapID, X, Y),
	io_lib:format("goto:~p, [~p,~p]", [MapID, X, Y]).

resetcopymap(_Params) ->
	CopyMapID = playerState:getMapID(),
	RoleID = playerState:getRoleID(),
	Ret =
		case playerScene:getMapType(CopyMapID) of
			?MapTypeCopyMap ->
				core:sendMsgToMapMgr(CopyMapID, resetCopyMap, {RoleID, playerState:getTeamID(), CopyMapID});
			_ ->
				false
		end,
	io_lib:format("resetcopymap:~p,~p", [CopyMapID, Ret]).

%% 直接添加军团id到军团联赛报名列表
addguildbattlelist(Params) when erlang:length(Params) >= 1 ->
	[SValue1 | _Other1] = Params,
	ID = string_to_integer(SValue1),
	psMgr:sendMsg2PS(?PsNameGuild, gm_addguildbattlelist, ID),
	ok.

%% 给军团添加物资
addguildres(_Params) when erlang:length(_Params) =:= 0 ->
	GuildID = playerState:getGuildID(),
	case ets:lookup(rec_guild, GuildID) of
		[#rec_guild{guildLevel = Lvl, resource = Res, liveness = Liv}] ->
			#guildCfg{max_res = MaxRes} = getCfg:getCfgPStack(cfg_guild, Lvl),
			playerGuild:addguildresource(GuildID, MaxRes - Res),
			#guildCfg{max_liv = MaxLiv} = getCfg:getCfgPStack(cfg_guild, Lvl),
			playerGuild:addguildliveness(GuildID, MaxLiv - Liv);
		_ ->
			skip
	end;
addguildres(Params) when erlang:length(Params) =:= 1 ->
	[SValue1 | _] = Params,
	Value = string_to_integer(SValue1),
	GuildID = playerState:getGuildID(),
	playerGuild:addguildresource(GuildID, Value),
	playerGuild:addguildliveness(GuildID, Value);
addguildres(Params) when erlang:length(Params) >= 2 ->
	[SValue1 | Other1] = Params,
	[SValue2 | _Other2] = Other1,
	GuildID = string_to_integer(SValue1),
	Value = string_to_integer(SValue2),
	playerGuild:addguildresource(GuildID, Value),
	playerGuild:addguildliveness(GuildID, Value).

%% 开启某个活动阶段
startac(Params) when erlang:length(Params) >= 2 ->
	[SValue1 | Other1] = Params,
	[SValue2 | _Other2] = Other1,
	ActivityType = string_to_integer(SValue1),
	ActivityPhase = string_to_integer(SValue2),

	R = #rec_activity{
		id = ActivityType,
		starttime = 0,
		phasetime = 0,
		phase = ActivityPhase
	},
	psMgr:sendMsg2PS(?PsNameActivity, gm_start_activity, self(), {ActivityType, ActivityPhase}),
	psMgr:sendMsg2PS(?PsNameActivityMgr, activityChangeMsg, [R]),
	"startactivity ok".

%% 创建一个混沌战场
createhdbattle(Params) when erlang:length(Params) >= 0 ->
	core:sendMsgToActivity(?ActivityType_HDBattle, gm_createhdbattle, {}),
	"createhdbattle ok".

%% 请求加入混沌战场
requesthdbattle(Params) when erlang:length(Params) >= 0 ->
	MapID = playerState:getMapIDGroup(),
	case playerScene:getMapType(MapID) of
		?MapTypeNormal ->
			core:sendMsgToActivity(?ActivityType_HDBattle,
				requestJoinHDBattle,
				{
					playerState:getRoleID(),
					playerState:getName(),
					playerState:getLevel(),
					self(),
					playerState:getNetPid(),
					playerPropSync:getProp(?PriProp_PetForce) + playerPropSync:getProp(?PriProp_PlayerForce)
				}),
			"requesthdbattle success";
		_ ->
			%% 不能从副本或者位面中进入混沌战场
			"requesthdbattle failed"
	end.

%% 请求查看时空裂痕npc信息
riftinfo(Params) when erlang:length(Params) >= 0 ->
	Code = playerState:getSelectTargetCode(),
	Ret = case Code > 0 of
			  true ->
				  playerCopyMapRift:requestRiftNpcInfo(Code);
			  _ ->
				  skip
		  end,
	io_lib:format("riftinfo:~p,~p", [Code, Ret]).

%% 请求进入时空裂痕
enterrift(Params) when erlang:length(Params) >= 2 ->
	[SValue1 | Other1] = Params,
	[SValue2 | _Other2] = Other1,
	GroupID = string_to_integer(SValue1),
	BMapID = string_to_integer(SValue2),
	gsMainLogic:setEnterRiftTime(playerState:getRoleID(), 0),
	Ret = playerCopyMapRift:requestEnterRift(GroupID, BMapID),
	io_lib:format("enterrift:~p,~p,~p", [GroupID, BMapID, Ret]).

%% 立即刷新时空裂痕npc的坐标
freshriftnpcpos(Params) when erlang:length(Params) >= 0 ->
	psMgr:sendMsg2PS(playerState:getMapPid(), gmTest_freshriftnpcpos, {}),
	ok.

%% 获取时空裂痕npc的坐标
getriftnpcpos(Params) when erlang:length(Params) >= 0 ->
	NpcEts = playerState:getMapNpcEts(),
	NpcList = ets:tab2list(NpcEts),
	MapID = playerState:getMapID(),
	case getCfg:getCfgPStack(cfg_rift, MapID) of
		#riftCfg{move_npc_list = MNList} ->
			Fun =
				fun(#recMapObject{id = ID} = Obj, AccList) ->
					case lists:member(ID, MNList) of
						true ->
							[{Obj#recMapObject.code, trunc(Obj#recMapObject.x), trunc(Obj#recMapObject.y)} | AccList];
						_ ->
							AccList
					end
				end,
			L = lists:foldl(Fun, [], NpcList),
			io_lib:format("~p", [L]);
		_ ->
			no_rift_npc
	end.

%% 控制时空裂痕npc移动
riftnpcmove(Params) when erlang:length(Params) >= 2 ->
	[SValue1 | Other1] = Params,
	[SValue2 | _Other2] = Other1,
	TX = erlang:float(string_to_integer(SValue1)),
	TY = erlang:float(string_to_integer(SValue2)),
	case playerState:getSelectTargetCode() of
		Code when Code > 0 ->
			MapID = playerState:getMapID(),
			case lists:member(MapID, getCfg:get1KeyList(cfg_rift)) of
				true ->
					NpcEts = playerState:getMapNpcEts(),
					case myEts:lookUpEts(NpcEts, Code) of
						[#recMapObject{id = ID}] ->
							case getCfg:getCfgPStack(cfg_rift, MapID) of
								#riftCfg{move_npc_list = MNList} ->
									case lists:member(ID, MNList) of
										true ->
											psMgr:sendMsg2PS(playerState:getMapPid(), gmTest_riftnpcmove, {Code, ID, TX, TY}),
											io_lib:format("true:~p,~p,~p,~p", [Code, ID, TX, TY]);
										_ ->
											"nonenpcid"
									end;
								_ ->
									"nonemapid"
							end;
						_ ->
							"nonetargetcode"
					end;
				_ ->
					"notmapid"
			end;
		_ ->
			"noneselect"
	end.

%% 添加buff
addbuff(Params) when erlang:length(Params) >= 1 ->
	[SValue1 | _Other1] = Params,
	BuffID = string_to_integer(SValue1),
	playerBuff:addBuff(BuffID, playerState:getLevel()),
	ok.

%% 移除buff
delbuff(Params) when erlang:length(Params) >= 1 ->
	[SValue1 | _Other1] = Params,
	BuffID = string_to_integer(SValue1),
	playerBuff:delBuff(BuffID),
	ok.

%% 查询某个对象的天梯数据
ladderquery(Params) when erlang:length(Params) >= 2 ->
	[SValue1 | Other1] = Params,
	[SValue2 | _Other2] = Other1,
	Type = string_to_integer(SValue1),
	Target = string_to_integer(SValue2),
	T = case Type of
			1 ->
				%% 按排名
				case ets:lookup(ets_rec_ladder_1v1, Target) of
					[#rec_ladder_1v1{} = R] -> R;
					_ -> false
				end;
			2 ->
				%% 按目标
				playerLadder1v1:queryRoleLadder(Target)
		end,
	case T of
		#rec_ladder_1v1{roleID = RoleID} ->
			io_lib:format("ladderquery:rank=~p, roleID=~p, name=~ts, exploit=~p, cur=~p, max=~p, all=~p, worship=~p, rankmin=~p",
				[
					T#rec_ladder_1v1.rankSort,
					RoleID,
					playerLadder1v1:queryTargetName(RoleID),
					T#rec_ladder_1v1.exploit,
					T#rec_ladder_1v1.cur_win,
					T#rec_ladder_1v1.max_win,
					T#rec_ladder_1v1.win_times,
					T#rec_ladder_1v1.worship_times,
					T#rec_ladder_1v1.rankMin
				]);
		_ -> false
	end.

%% 随机取几个天梯里面的对象 1 取玩家对象，2 取怪物对象
ladderplayer(Params) when erlang:length(Params) >= 1 ->
	[SValue1 | _Other1] = Params,
	Type = string_to_integer(SValue1),
	List = ets:tab2list(ets_rec_ladder_1v1),
	Fun =
		fun(#rec_ladder_1v1{roleID = RID}) ->
			case Type of
				1 -> uidMgr:checkUID(?UID_TYPE_Role, RID);
				2 -> not uidMgr:checkUID(?UID_TYPE_Role, RID)
			end
		end,
	L = lists:filter(Fun, List),
	Len = erlang:length(L),
	L2 =
		case Len > 5 of
			true ->
				P1 = lists:nth(misc:rand(1, Len - 0), L),
				P2 = lists:nth(misc:rand(1, Len - 1), L -- [P1]),
				P3 = lists:nth(misc:rand(1, Len - 2), L -- [P1, P2]),
				P4 = lists:nth(misc:rand(1, Len - 3), L -- [P1, P2, P3]),
				P5 = lists:nth(misc:rand(1, Len - 4), L -- [P1, P2, P3, P4]),
				[P1, P2, P3, P4, P5];
			false -> L
		end,
	FM =
		fun(#rec_ladder_1v1{rankSort = Rank, roleID = RID}, Acc) ->
			case Acc =:= "" of
				true ->
					io_lib:format("~p,~p,~ts", [Rank, RID, playerLadder1v1:queryTargetName(RID)]);
				_ ->
					io_lib:format("~ts--~p,~p,~ts", [Acc, Rank, RID, playerLadder1v1:queryTargetName(RID)])
			end
		end,
	lists:foldl(FM, "", L2).

%% 把自己添加进天梯列表
ladderadd(Params) when erlang:length(Params) >= 0 ->
	playerLadder1v1:gmAddSelfToLadderList().

%% 放弃挑战
laddergiveup(Params) when erlang:length(Params) >= 0 ->
	playerLadder1v1:giveUpChallenge(),
	ok.

%% 挑战对手
ladder(Params) when erlang:length(Params) >= 2 ->
	[SValue1 | Other1] = Params,
	[SValue2 | _Other2] = Other1,
	Type = string_to_integer(SValue1),
	Target = string_to_integer(SValue2),
	case Type of
		1 ->
			%% 按排名挑战
			playerLadder1v1:challengeTargetByRank(Target, "11");
		2 ->
			%% 按目标挑战
			playerLadder1v1:challengeTargetByRoleID(Target)
	end,
	ok.

%% 膜拜王者
laddermb(Params) when erlang:length(Params) >= 1 ->
	[SValue1 | _Other1] = Params,
	Rank = string_to_integer(SValue1),
	case ets:lookup(ets_rec_ladder_1v1, Rank) of
		[#rec_ladder_1v1{roleID = RID} = _TR] ->
			playerLadder1v1:worshipTarget(RID, playerNameUID:getPlayerNameByUID(RID));
		_ ->
			skip
	end.

%% 清理卡住的玩家
ladderclear(Params) when erlang:length(Params) >= 1 ->
	[SValue1 | _Other1] = Params,
	TargetRoleID = string_to_integer(SValue1),
	playerLadder1v1:clearLadderMatchState(TargetRoleID).

monitorsj(Params) when erlang:length(Params) >= 2 ->
	[SValue1 | Other1] = Params,
	[SValue2 | _Other2] = Other1,
	case string_to_integer(SValue1) of
		1 ->
			%% 增加源库IP，暂时不用
			gsSendMsg:sendMsg2DBServer(monitorsj_addmonitorsjip, 0, {?MonitorTC_Type_AddRandIP, SValue2}),
			psMgr:sendMsg2PS(?PsNameLS, monitorsj_addmonitorsjip, {?MonitorTC_Type_AddRandIP, SValue2}),
			ok;
		2 ->
			%% 增加监控库IP
			gsSendMsg:sendMsg2DBServer(monitorsj_addmonitorsjip, 0, {?MonitorTC_Type_AddMonitorIP, SValue2}),
			psMgr:sendMsg2PS(?PsNameLS, monitorsj_addmonitorsjip, {?MonitorTC_Type_AddMonitorIP, SValue2}),
			ok;
		10 ->
			%% 删除源库IP
%%			gsSendMsg:sendMsg2DBServer(monitorsj_addmonitorsjip, 0, {?MonitorTC_Type_DelRandIP, SValue2}),
%%			psMgr:sendMsg2PS(?PsNameLS, monitorsj_addmonitorsjip, {?MonitorTC_Type_DelRandIP, SValue2}),
			ok;
		20 ->
			%% 删除监控库IP
			gsSendMsg:sendMsg2DBServer(monitorsj_addmonitorsjip, 0, {?MonitorTC_Type_DelMonitorIP, SValue2}),
			psMgr:sendMsg2PS(?PsNameLS, monitorsj_addmonitorsjip, {?MonitorTC_Type_DelMonitorIP, SValue2}),
			ok;
		_ ->
			skip
	end.

%%清除僵尸玩家进程（先跑3分钟），还不行就kill进程
crp(Params) when erlang:length(Params) >= 1 ->
	[RoleIDTmp | _Right1] = Params,
	RoleID = erlang:list_to_integer(RoleIDTmp),
	MeID = playerState:getRoleID(),
	RegName = string:concat("playerOtp", erlang:integer_to_list(RoleID)),

	PlayerOtpName = erlang:list_to_atom(RegName),
	case erlang:whereis(PlayerOtpName) of
		_Pid1 when MeID =:= RoleID ->
			cant_kill_self;
		Pid1 when erlang:is_pid(Pid1) ->
			case erlang:is_process_alive(Pid1) of
				true ->
					Pid1 ! quit,
					timer:sleep(10000),
					case erlang:is_process_alive(Pid1) of
						true ->
							erlang:exit(Pid1, kill),
							?ERROR_OUT("gm kill playerpid[~p],gm_roleName:~ts", [RoleID, playerState:getName()]),
							ok;
						_ ->
							safequit
					end;
				_ ->
					dead_playerPid
			end;
		_ ->
			undefined_pid
	end.

%% 清除指定玩家的永久标记
clearroleforeverlimit(Params) when erlang:length(Params) >= 1 ->
	[RoleIDTmp | Right1] = Params,
	RoleID = erlang:list_to_integer(RoleIDTmp),
	[FlagTmp | _] = Right1,
	FlagList = misc:string_to_term(FlagTmp),
	SourceshopForeverLimitType = 0,
	A = edb:readRecord(rec_sourceshop_forever_limit, {RoleID, SourceshopForeverLimitType}),
	?LOG_OUT("IsFlagList:~p Has Old FlagList~p", [erlang:is_list(FlagList), A]),
	case A of
		[#rec_sourceshop_forever_limit{sourceshopIDList = LBinStr} | _] when erlang:is_list(FlagList) ->
			SaveIDS1 = misc:string_to_term(misc:binToString(LBinStr)),
			SaveIDS = SaveIDS1 -- FlagList,
			NewRec = #rec_sourceshop_forever_limit{
				roleID = {RoleID, SourceshopForeverLimitType},
				type = SourceshopForeverLimitType,
				sourceshopIDList = misc:term_to_string(SaveIDS)
			},
			?LOG_OUT("GM clean shopflag succ old:~p subtrahend:~p", [SaveIDS1, FlagList]),
			edb:writeRecord(update_rec_sourceshop_forever_limit, NewRec),
			edb:writeRecord(rec_sourceshop_forever_limit, NewRec),
			ok;
		_ ->
			?ERROR_OUT("GM clean shopflag fail,not can clean"),
			skip
	end.

%% 增加功勋，可增加负值
ladderaddexp(Params) when erlang:length(Params) >= 1 ->
	[SValue1 | _Other1] = Params,
	Value = string_to_integer(SValue1),
	PLog = #recPLogTSMoney
	{
		target = ?PLogTS_PlayerSelf,
		source = ?PLogTS_GMSystem,
		reason = ?CoinSourceOnlineGM,
		param = ?CoinTypeExploit
	},
	playerMoney:addCoin(?CoinTypeExploit, Value, PLog).

addhonor(Params) when erlang:length(Params) >= 1 ->
	[SValue1 | _Other1] = Params,
	Value = string_to_integer(SValue1),
	case Value > 0 of
		true ->
			psMgr:sendMsg2PS(self(), hdaddHonorValue, {playerState:getRoleID(), Value}),
			ok;
		_ ->
			skip
	end.

adddaily(Params) when erlang:length(Params) >= 3 ->
	[SValue1 | Other1] = Params,
	[SValue2 | Other2] = Other1,
	[SValue3 | _Other3] = Other2,
	Type = string_to_integer(SValue1),
	ID = string_to_integer(SValue2),
	Value = string_to_integer(SValue3),
	playerDaily:addDailyCounter(Type, ID, Value),
	ok.

decdaily(Params) when erlang:length(Params) >= 3 ->
	[SValue1 | Other1] = Params,
	[SValue2 | Other2] = Other1,
	[SValue3 | _Other3] = Other2,
	Type = string_to_integer(SValue1),
	ID = string_to_integer(SValue2),
	Value = string_to_integer(SValue3),
	playerDaily:reduceDailyCounter(Type, ID, Value),
	ok.

querydaily(Params) when erlang:length(Params) >= 2 ->
	[SValue1 | Other1] = Params,
	[SValue2 | _Other2] = Other1,
	Type = string_to_integer(SValue1),
	ID = string_to_integer(SValue2),
	Count = playerDaily:getDailyCounter(Type, ID),
	io_lib:format("count=~p", [Count]).

zerodaily(Params) when erlang:length(Params) >= 2 ->
	[SValue1 | Other1] = Params,
	[SValue2 | _Other2] = Other1,
	Type = string_to_integer(SValue1),
	ID = string_to_integer(SValue2),
	playerDaily:zeroDailyCount(Type, ID),
	ok.

adddaily2(Params) when erlang:length(Params) >= 2 ->
	TargetCode = playerState:getSelectTargetCode(),
	RoleID = playerState:getRoleID(),
	case codeMgr:getObjectTypeByCode(TargetCode) of
		?ObjTypePlayer ->
			case playerMgrOtp:getOnlinePlayerInfoByCode(TargetCode) of
				#rec_OnlinePlayer{roleID = TargetRoleID} when TargetRoleID =/= RoleID ->
					[SValue1 | Other1] = Params,
					[SValue2 | _] = Other1,
					Type = string_to_integer(SValue1),
					Value = string_to_integer(SValue2),
					Old = daily2State:queryDaily2(RoleID, TargetRoleID, Type),
					daily2Logic:saveDaily2({RoleID, TargetRoleID, Type, Old + Value});
				_ ->
					?ERROR_OUT("adddaily2 invalid Target! can not select yourself!")
			end;
		_ ->
			?ERROR_OUT("adddaily2 invalid Target! must select player!")
	end,
	ok.

decdaily2(Params) when erlang:length(Params) >= 2 ->
	TargetCode = playerState:getSelectTargetCode(),
	RoleID = playerState:getRoleID(),
	case codeMgr:getObjectTypeByCode(TargetCode) of
		?ObjTypePlayer ->
			case playerMgrOtp:getOnlinePlayerInfoByCode(TargetCode) of
				#rec_OnlinePlayer{roleID = TargetRoleID} when TargetRoleID =/= RoleID ->
					[SValue1 | Other1] = Params,
					[SValue2 | _] = Other1,
					Type = string_to_integer(SValue1),
					Value = string_to_integer(SValue2),
					Old = daily2State:queryDaily2(RoleID, TargetRoleID, Type),
					daily2Logic:saveDaily2({RoleID, TargetRoleID, Type, Old - Value});
				_ ->
					?ERROR_OUT("decdaily2 invalid Target! can not select yourself!")
			end;
		_ ->
			?ERROR_OUT("decdaily2 invalid Target! must select player!")
	end,
	ok.

querydaily2(Params) when erlang:length(Params) >= 1 ->
	TargetCode = playerState:getSelectTargetCode(),
	RoleID = playerState:getRoleID(),
	case codeMgr:getObjectTypeByCode(TargetCode) of
		?ObjTypePlayer ->
			case playerMgrOtp:getOnlinePlayerInfoByCode(TargetCode) of
				#rec_OnlinePlayer{roleID = TargetRoleID} when TargetRoleID =/= RoleID ->
					[SValue1 | _] = Params,
					Type = string_to_integer(SValue1),
					Value = daily2State:queryDaily2(RoleID, TargetRoleID, Type),
					io_lib:format("count=~p", [Value]);
				_ ->
					?ERROR_OUT("querydaily2 invalid Target! can not select yourself!")
			end;
		_ ->
			?ERROR_OUT("querydaily2 invalid Target! must select player!")
	end.

zerodaily2(Params) when erlang:length(Params) >= 1 ->
	TargetCode = playerState:getSelectTargetCode(),
	RoleID = playerState:getRoleID(),
	case codeMgr:getObjectTypeByCode(TargetCode) of
		?ObjTypePlayer ->
			case playerMgrOtp:getOnlinePlayerInfoByCode(TargetCode) of
				#rec_OnlinePlayer{roleID = TargetRoleID} when TargetRoleID =/= RoleID ->
					[SValue1 | _] = Params,
					Type = string_to_integer(SValue1),
					daily2Logic:saveDaily2({RoleID, TargetRoleID, Type, 0});
				_ ->
					?ERROR_OUT("zerodaily2 invalid Target! can not select yourself!")
			end;
		_ ->
			?ERROR_OUT("zerodaily2 invalid Target! must select player!")
	end,
	ok.

%% 删除一个对象
delobj(Params) when erlang:length(Params) >= 0 ->
	NValue = case Params of
				 [SValue1 | _Other1] ->
					 Value = string_to_integer(SValue1),
					 if
						 Value >= 99999 ->
							 Value;
						 true ->
							 playerState:getSelectTargetCode()
					 end;
				 _ ->
					 playerState:getSelectTargetCode()
			 end,
	?DEBUG_OUT("delobj:~p,~w", [NValue, self()]),
	MapPid = playerState:getMapPid(),
	case codeMgr:getObjectTypeByCode(NValue) of
		?ObjTypePlayer ->
			case ets:lookup(playerState:getMapPlayerEts(), NValue) of
				[#recMapObject{id = 0, pid = Pid}] ->
					psMgr:sendMsg2PS(Pid, gm_delobj_rob_player, playerState:getRoleID()),
					io_lib:format("delobj monster success:~p", [NValue]);
				_ ->
					io_lib:format("delobj player failed:~p", [NValue])
			end;
		?ObjTypeMonster ->
			psMgr:sendMsg2PS(MapPid, clearSpawn, [NValue]),
			io_lib:format("delobj monster success:~p", [NValue]);
		?ObjTypeCarrier ->
			psMgr:sendMsg2PS(MapPid, clearSpawn, [NValue]),
			io_lib:format("delobj carrier success:~p", [NValue]);
		?ObjTypeCollect ->
			psMgr:sendMsg2PS(MapPid, clearCollect, [NValue]),
			io_lib:format("delobj collect success:~p", [NValue]);
		?ObjTypeNPC ->
			psMgr:sendMsg2PS(MapPid, clearNpc, {[NValue], playerState:getGroupID()}),
			io_lib:format("delobj npc success:~p", [NValue]);
		UnKnowType ->
			io_lib:format("delobj failed:~p,~p", [NValue, UnKnowType])
	end.

%%创建一个怪物
addconvoy(Params) when erlang:length(Params) >= 1 ->
	[SValue1 | _Other1] = Params,
	Value = string_to_integer(SValue1),
	playerConvoy:init(Value, gmtest).

addmonster(Params) when erlang:length(Params) >= 2 ->
	[SValue1 | Other1] = Params,
	[SValue2 | Other2] = Other1,
	MapID = playerState:getMapID(),
	{X, Y} = case Other2 of
				 [SValue3 | _Other3] ->
					 IsHalfWayPt = string_to_integer(SValue3),
					 case IsHalfWayPt =:= 1 of
						 true ->
							 WayPtList = core:getMapWayPt(MapID),
							 N = misc:ceil(erlang:length(WayPtList) / 2),
							 #recMapWayPt{x = X0, y = Y0} = lists:nth(N, WayPtList),
							 {X0, Y0};
						 _ ->
							 playerState:getPos()
					 end;
				 _ ->
					 playerState:getPos()
			 end,

	MonsterID = string_to_integer(SValue1),
	Number = string_to_integer(SValue2),
	GroupID = playerState:getGroupID(),
	case Number >= 1 of
		true ->
			Fun = fun(_I) ->
				PlayerEts = playerState:getMapPlayerEts(),
				MonsterEts = playerState:getMapMonsterEts(),
				PetEts = playerState:getMapPetEts(),

				case getCfg:getCfgPStack(cfg_monster, MonsterID) of
					#monsterCfg{} ->
						Arg = #recSpawnMonster{id = MonsterID,
							mapPid = playerState:getMapPid(),
							mapID = MapID,
							x = X + 1,
							y = Y + 1,
							guildID = 0,
							camp = ?CampMonsterEnemies, %%怪物默认阵营
							groupID = GroupID,
							petEts = PetEts,
							playerEts = PlayerEts,
							monsterEts = MonsterEts
						},
						playerPet:spawnMonster(Arg);
					_ ->
						?ERROR_OUT("GM Add MonsterID:~p failed,not cfg", [MonsterID])
				end
				  end,
			%% 循环创建怪
			List = lists:seq(1, Number),
			lists:foreach(Fun, List),
			io_lib:format("addmonster success: [~p], Number: [~p]", [MonsterID, Number]);
		_ ->
			io_lib:format("addmonster failed: [~p]", [Params])
	end.

%%创建一个采集物
addcollect(Params) when erlang:length(Params) >= 2 ->
	[SValue1 | Other1] = Params,
	[SValue2 | _Other2] = Other1,
	CollectID = string_to_integer(SValue1),
	Number = string_to_integer(SValue2),
	GroupID = playerState:getGroupID(),
	{X, Y} = playerState:getPos(),
	MapPid = playerState:getMapPid(),
	psMgr:sendMsg2PS(MapPid, addCollectToMap, {GroupID, [{CollectID, Number, X, Y}]}),
	io_lib:format("addcollect success: [~p], Number: [~p]", [CollectID, Number]).

%%创建一个NPC
addnpc(Params) when erlang:length(Params) >= 1 ->
	[SValue1 | _Other1] = Params,
	NpcID = string_to_integer(SValue1),
	GroupID = playerState:getGroupID(),
	{X, Y} = playerState:getPos(),
	MapPid = playerState:getMapPid(),
	psMgr:sendMsg2PS(MapPid, addNpcToMap, {GroupID, [{NpcID, 1, X, Y}]}),
	io_lib:format("addnpc success: [~p], Number: [~p]", [NpcID, 1]).

%%创建一个载体
addcarrier(Params) when erlang:length(Params) >= 2 ->
	[SValue1 | Other1] = Params,
	[SValue2 | _Other2] = Other1,

	CarrierID = string_to_integer(SValue1),
	MoveStatus = string_to_integer(SValue2),

	Camp = playerState:getCamp(),
	PetEts = playerState:getMapPetEts(),
	PlayerEts = playerState:getMapPlayerEts(),
	MonsterEts = playerState:getMapMonsterEts(),
	BattleProp = playerCalcProp:getBattleProp(),
	TargetCode = playerState:getPlayerCode(),
	PkMode = playerState:getPkStatus(),
	TeamID = playerState:getTeamID(),
	GuildID = playerState:getGuildID(),
	ID = playerState:getAccountID(),
	{X, Y} = playerState:getPos(),
	CasterInfo = #recCasterInfo{
		casterId = ID,
		casterCode = TargetCode,
		casterPid = self(),
		casterType = ?AttackerTypePlayer,
		casterPkMode = PkMode
	},
	Arg = #recSpawnMonster{
		id = CarrierID,
		mapPid = playerState:getMapPid(),
		mapID = playerState:getMapID(),
		x = X,
		y = Y,
		camp = Camp,
		teamID = TeamID,
		guildID = GuildID,
		playerEts = PlayerEts,
		monsterEts = MonsterEts,
		petEts = PetEts,
		other = #recCallCarrier{
			moveAi = MoveStatus,
			lifeTime = 50000,
			releaseAi = 0,
			battleProp = BattleProp,
			targetCode = TargetCode,
			callCaster = CasterInfo
		}
	},
	playerPet:spawnCarrier(Arg),
	?LOG_OUT("createCarrier [~p]", [CarrierID]),
	ok.

%% 创建军团
createguild(Params) when erlang:length(Params) >= 2 ->
	[SValue1 | Other1] = Params,
	[SValue2 | _Other2] = Other1,
	playerGuild:createGuild(SValue1, erlang:list_to_integer(SValue2), []),
	ok.

%% 设置加入军团CD
clearguildcd(Params) when erlang:length(Params) =:= 1 ->
	[SValue1 | _] = Params,
	Type = string_to_integer(SValue1),
	RoleID = playerState:getRoleID(),
	case Type of
		1 -> playerGuild:recordExitGuildTime(RoleID, 0);
		2 -> playerGuild:recordExitGuildTime(RoleID, time:getSyncTime1970FromDBS())
	end,
	ok;
clearguildcd(Params) when erlang:length(Params) >= 2 ->
	[SValue1 | Other1] = Params,
	[SValue2 | _Other2] = Other1,
	TargetRoleID = string_to_integer(SValue1),
	Type = string_to_integer(SValue2),
	case Type of
		1 -> playerGuild:recordExitGuildTime(TargetRoleID, 0);
		2 -> playerGuild:recordExitGuildTime(TargetRoleID, time:getSyncTime1970FromDBS())
	end,
	ok.

%% 机器人进BOSS战
worldboss(_Params) ->
%%	playerWorldBossWar:enterParallelUniverseRequest(),
	ok.

%% 删除军团
deleteguild(Params) when erlang:length(Params) >= 0 ->
	playerGuild:deleteGuild(),
	ok.

%% 踢军团人
kickguildmember(Params) when erlang:length(Params) >= 1 ->
	[SValue1 | _Other1] = Params,
	RoleID = string_to_integer(SValue1),
	playerGuild:kickGuild(RoleID),
	ok.

%% 任命权限
changememberlevel(Params) when erlang:length(Params) >= 2 ->
	[SValue1 | Other1] = Params,
	[SValue2 | _Other2] = Other1,
	playerGuild:giveGuildPower(string_to_integer(SValue1), string_to_integer(SValue2)),
	ok.

%% 查询军团列表
queryguild1(Params) when erlang:length(Params) >= 0 ->
	playerGuild:guildList(1),
	ok.

%% 打印结果
queryguild2(Params) when erlang:length(Params) >= 0 ->
	L = playerState:getGuildList(),
	?DEBUG_OUT("guild list:~p", [L]),
	ok.

%% 查询自己的军团信息
queryguild3(Params) when erlang:length(Params) >= 0 ->
	Info = playerState:getSelfGuildInfo(),
	GuildID = playerState:getGuildID(),
	GuildName = playerState:getGuildName(),
	io_lib:format("print self guild msg:~s,~p,~p", [GuildName, GuildID, Info]).

%% 修改公告
changeguildnotice(Params) when erlang:length(Params) >= 1 ->
	[SValue1 | _Other1] = Params,
	playerGuild:changeGuildNotice(SValue1),
	ok.

%% 军团捐献
guilddonate(Params) when erlang:length(Params) >= 2 ->
	[SValue1 | Other1] = Params,
	[SValue2 | _Other2] = Other1,
	MoneyType = string_to_integer(SValue1),
	MoneyNumber = string_to_integer(SValue2),
	playerGuild:playerDonateMoney(#pk_U2GS_DonateMoney{moneyType = MoneyType, moneyNumber = MoneyNumber}),
	ok.

%% 进入目标军团驻地
enterguildhome([]) ->
	SelfGuildID = playerState:getGuildID(),
	playerGuildFairground:enter_try(SelfGuildID),
	ok;
enterguildhome(Params) when erlang:length(Params) >= 1 ->
	[SValue1 | _Other1] = Params,
	Value = string_to_integer(SValue1),
	playerGuildFairground:enter_try(Value),
	ok.

%% 使用游乐场设施
useguildride(Params) when erlang:length(Params) >= 2 ->
	[P1 | T1] = Params,
	[P2 | _] = T1,
	playerGuildFairground:onUseRide(erlang:list_to_integer(P1), erlang:list_to_integer(P2)).

%%% 清空放弃任务CD
%clearguildtask(Params) when erlang:length(Params) >= 0 ->
%	RoleID = playerState:getRoleID(),
%	Key1 = {RoleID, 1},
%	Key2 = {RoleID, 2},
%	case Params of
%		[] ->
%			playerDaily:zeroDailyCount(?DailyType_GuildHomeTask, 1),
%			playerDaily:zeroDailyCount(?DailyType_GuildHomeTask, 2),
%
%			case edb:dirtyReadRecord(rec_guild_task, Key1) of
%				[#rec_guild_task{} = Task] ->
%					edb:dirtySave(rec_guild_task, Key1, Task#rec_guild_task{curTimes = 0, maxTimes = 5}, new_rec_guild_task, update_rec_guild_task);
%				_ ->
%					skip
%			end,
%			case edb:dirtyReadRecord(rec_guild_task, Key2) of
%				[#rec_guild_task{} = Task2] ->
%					edb:dirtySave(rec_guild_task, Key2, Task2#rec_guild_task{curTimes = 0, maxTimes = 5}, new_rec_guild_task, update_rec_guild_task);
%				_ ->
%					skip
%			end,
%			ok;
%		_ ->
%			case edb:dirtyReadRecord(rec_guild_task, Key1) of
%				[#rec_guild_task{} = Task] ->
%					edb:dirtySave(rec_guild_task, Key1, Task#rec_guild_task{freshTime = 1}, new_rec_guild_task, update_rec_guild_task);
%				_ ->
%					skip
%			end,
%			case edb:dirtyReadRecord(rec_guild_task, Key2) of
%				[#rec_guild_task{} = Task2] ->
%					edb:dirtySave(rec_guild_task, Key2, Task2#rec_guild_task{freshTime = 1}, new_rec_guild_task, update_rec_guild_task);
%				_ ->
%					skip
%			end,
%			ok
%	end,
%	ok.

%printguildtask(_Params) ->
%	RoleID = playerState:getRoleID(),
%	Str1 =
%		case edb:dirtyReadRecord(rec_guild_task, {RoleID, 1}) of
%			[#rec_guild_task{taskID = ID1, taskType = T1, targetGuildID = TGID1, targetRoleID = TRID1, curTimes = C1, maxTimes = M1} = Task] ->
%				io_lib:format("task1:id=~p,type=~p,tgid=~p,trid=~p,ct=~p,mt=~p,n1=~p,n2=~p,n3=~p",
%					[ID1, T1, TGID1, TRID1, C1, M1, Task#rec_guild_task.number1, Task#rec_guild_task.number2, Task#rec_guild_task.number3]);
%			_ ->
%				"not found CT"
%		end,
%
%	Str2 =
%		case edb:dirtyReadRecord(rec_guild_task, {RoleID, 2}) of
%			[#rec_guild_task{taskID = ID2, taskType = T2, targetGuildID = TGID2, targetRoleID = TRID2, curTimes = C2, maxTimes = M2} = Task2] ->
%				io_lib:format("task2:id=~p,type=~p,tgid=~p,trid=~p,ct=~p,mt=~p,n1=~p,n2=~p,n3=~p",
%					[ID2, T2, TGID2, TRID2, C2, M2, Task2#rec_guild_task.number1, Task2#rec_guild_task.number2, Task2#rec_guild_task.number3]);
%			_ ->
%				"not found XL"
%		end,
%	io_lib:format("guildTask:~ts --- ~ts", [Str1, Str2]).

%updateguildtask(Params) when erlang:length(Params) >= 1 ->
%	[SValue1 | _Params1] = Params,
%	TaskType = string_to_integer(SValue1),
%	RoleID = playerState:getRoleID(),
%	Key = {RoleID, TaskType},
%	case edb:dirtyReadRecord(rec_guild_task, Key) of
%		[#rec_guild_task{number1 = Number1} = Task] ->
%			%% 判断任务是否完成
%			case playerGuildHome:getTaskState(Task) of
%				2 ->
%					NewTask = Task#rec_guild_task{number1 = Number1 + 1},
%
%					%% 保存
%					edb:dirtySave(rec_guild_task, Key, NewTask, new_rec_guild_task, update_rec_guild_task),
%
%					%% 刷新客户端
%					ClientTask = playerGuildHome:getGuildTaskClientStruct(NewTask),
%					playerMsg:sendNetMsg(#pk_GS2U_GuildTask{tasks = [ClientTask]}),
%
%					%% 打印一个任务列表
%					printguildtask([]);
%				_ ->
%					skip
%			end;
%		_ ->
%			notfoundtask
%	end,
%	ok.

%% 修改军团名
changeguildname(Params) when erlang:length(Params) >= 1 ->
	[GuildName | Other1] = Params,
	case Other1 of
		[] ->
			%% 直接修改，不扣道具
			playerGuild:changeGuildName2(GuildName);
		_ ->
			%% 要走扣道具流程
			playerGuild:changeGuildName(GuildName)
	end.

%% 家族系统-女神祈福
guild_godbless(Params) when erlang:length(Params) >= 1 ->
	[Type | _] = Params,
	TypeReal = erlang:list_to_integer(Type),
	playerGuild:godBless(TypeReal).

%% 家族系统-女神祈福 设置祈福进度
guild_godbless_s(Params) when erlang:length(Params) >= 1 ->
	case playerState:getGuildID() of
		0 ->
			skip;
		GuildID ->
			case ets:lookup(rec_guild, GuildID) of
				[#rec_guild{} = Guild] ->
					[Schedule | _] = Params,
					NewGuild = Guild#rec_guild{godBless = erlang:list_to_integer(Schedule)},
					ets:insert(rec_guild, NewGuild),
					guildLogic:saveToMySql(NewGuild);
				_ ->
					skip
			end
	end.

%% 家族系统-家族商店
guild_shopbuy([ID]) ->
	IDReal = erlang:list_to_integer(ID),
	playerGuild:shopBuy(IDReal, 1);
guild_shopbuy([ID, Count]) ->
	IDReal = erlang:list_to_integer(ID),
	CountReal = erlang:list_to_integer(Count),
	playerGuild:shopBuy(IDReal, CountReal).

%% 家族系统-兑换功能
guild_exchange(Params) when erlang:length(Params) >= 2 ->
	[ID | T0] = Params,
	[Level | _] = T0,
	IDReal = erlang:list_to_integer(ID),
	LevelReal = erlang:list_to_integer(Level),
	playerGuild:exchange(IDReal, LevelReal).

%% 家族系统-去掉自己所在公会的发布招募CD
guild_clearrcd(_Params) ->
	case playerState:getGuildID() of
		0 ->
			skip;
		GuildID ->
			ets:update_element(rec_guild, GuildID, {#rec_guild.recruit, 0})
	end.

%% 家族系统-堆雪人活动-在非活动时间可使用该命令创建活动地图，以这种方式创建的活动地图无法以心跳驱动
snowman_create(_) ->
	playerGuildSnowman:enterTry(true).

%% 家族系统-堆雪人活动-如果自己在GM创建的活动地图中，该命令可驱动地图切换到下一个阶段
snowman_next(_) ->
	playerGuildSnowman:gmNext().

%% 家族系统-堆雪人活动-模拟客户端-检测雪人状态
snowman_checksnowman(_) ->
	playerGuildSnowman:checkSnowman().

%% 家族系统-堆雪人活动-模拟客户端-捐赠材料 0表示全部类型，其它参考cfg_guildsnowman
snowman_donate(Params) when erlang:length(Params) >= 1 ->
	[ID | T] = Params,
	[SnowmanID | _] = T,
	playerGuildSnowman:donate({erlang:list_to_integer(ID), erlang:list_to_integer(SnowmanID)}).

%% 家族系统-堆雪人活动-模拟客户端-领取指定雪人礼盒
% 20170223 废弃客户端主动请求领奖，改为活动结算时主动发奖
%snowman_reward(Params) when erlang:length(Params) >= 1 ->
%	[ID|_] = Params,
%	playerGuildSnowman:reward(erlang:list_to_integer(ID)).

%% 家族系统-堆雪人活动-直接获取指定ID的资源，无法超过携带上限
snowman_getres(Params) when erlang:length(Params) >= 2 ->
	[ID | T] = Params,
	[Count | _] = T,
	playerGuildSnowman:gmGetRes({erlang:list_to_integer(ID), erlang:list_to_integer(Count)}).

%%领取激活码
activecode(Params) when erlang:length(Params) >= 1 ->
	[SValue1 | _Other1] = Params,
	playerActiveCode:getActiveCodeRequest(SValue1),
	?LOG_OUT("activecode [~p]", [SValue1]),
	ok.

%%加防
adddef(Params) ->
	N = case Params of
			[Num | _] ->
				string_to_integer(Num);
			_ ->
				100000
		end,
	?LOG_OUT("gm cmd adddef:~p", [N]),
	playerBuff:addProp(1, [{?Prop_PhysicalDefence, N, 0}, {?Prop_MagicDefence, N, 0}], true),
	ok.

addspeed(Params) ->
	?LOG_OUT("gm cmd addspeed"),
	V1 =
		case Params of
			[V0|_] ->
				string_to_number(V0);
			_ ->
				10
		end,
	playerBuff:addProp(1, [{?Prop_MoveSpeed, V1, 0}], true),
	ok.

%%加攻
addattack(Params) ->
	N = case Params of
			[Num | _] ->
				string_to_integer(Num);
			_ ->
				100000
		end,
	?LOG_OUT("gm cmd addattack ~p", [N]),
	playerBuff:addProp(1, [{?Prop_PhysicalAttack, N, 0}, {?Prop_MagicAttack, N, 0}], true),
	ok.

%%增加属性
addprop(Params) when erlang:length(Params) >= 2 ->
	[SValue1 | Params1] = Params,
	[SValue2 | _] = Params1,
	PropKey = string_to_integer(SValue1),
	ProValue = string_to_integer(SValue2),
	case PropKey =< ?PropMax of
		true ->
			playerBuff:addProp(1, [{PropKey, ProValue, 0}], true);
		_ ->
			%%"prop not find"
			skip
	end,
	ok.

addteam(_Params) ->
	playerTeam:teamOperate(?TeamOP_Create, 101,0).
%%	case playerTeam2:gm_createTeam() of
%%		true ->
%%			"success";
%%		_ ->
%%			"failed"
%%	end.

%%商城显示请求
mallshow(Params) when erlang:length(Params) >= 1 ->
	[SValue1 | _Other1] = Params,
	Seed = string_to_integer(SValue1),
	playerMall:requestMallInfo(Seed, ?MallSendType_PushBuy),
	ok.

%%重新同步玩家周围的对象
sync9(Params) when erlang:length(Params) >= 0 ->
	playerMap:sync9GridInfo(),
	ok.

crack(Params) when erlang:length(Params) >= 0 ->
	crack(),
	ok.

crack() ->
	crack2(),

	%%开启觉醒功能
	playerGoddess:gmWakeUp(),
	ok.

crack2() ->
	L = getCfg:get1KeyList(cfg_mainMenu),
	Fun = fun(ID) ->
		case getCfg:getCfgByArgs(cfg_mainMenu, ID) of
			#mainMenuCfg{type = 2, parameters = TaskID} ->
				%% 打开所有需要接任务才打开的功能
				playerTask:acceptTask(TaskID, 0);
			#mainMenuCfg{type = 3, parameters = TaskID} ->
				%% 打开所有需要完成任务才打开的功能
				case playerTask:acceptTask(TaskID, 0) of
					false ->
						skip;
					_ ->
						playerTask:gmSubmitTask(TaskID)
				end;
			_ ->
				skip
		end
		  end,
	lists:foreach(Fun, L),

	%% 开启聊天

	case getCfg:getCfgPStack(cfg_globalsetup, chat_task) of
		#globalsetupCfg{setpara = [ChatTaskID]} ->
			case playerTask:acceptTask(ChatTaskID, 0) of
				false ->
					skip;
				_ ->
					playerTask:gmSubmitTask(ChatTaskID)
			end;
		_ ->
			skip
	end,

	ok.

%% -ifdef(RELEASE).
%% tt(_Params) ->
%% 	ok.
%%
%% tt2(_Params) ->
%% 	ok.
%% -else.
%%显示功能按钮
%% 20170225 张建生需求更新tt功能
%% 	参考QA提供的“GM命令表tt不能获取的材料.txt”
%%	实际上tt需要添加上述文档需要的材料，文档名说不需要是版署不需要
tt(Params) when erlang:length(Params) >= 0 ->

	FunAddItem =
		fun(IDMin, IDMax, Interaction, Count) ->
			lists:foreach(
				fun(ID) ->
					execGMCmd("additem", [erlang:integer_to_list(ID), erlang:integer_to_list(Count)])
				end,
				lists:seq(IDMin, IDMax, Interaction)
			)
		end,
	FunAddEquip =
		fun(IDMin, IDMax, Interaction, Q) ->
			lists:foreach(
				fun(ID) ->
					execGMCmd("additem", [erlang:integer_to_list(ID), "1", "0", erlang:integer_to_list(Q)])
				end,
				lists:seq(IDMin, IDMax, Interaction)
			)
		end,

	%% 角色等级
	execGMCmd("setlevel", ["45"]),

	%% 翅膀
	FunAddItem(4303, 4305, 1, 999),	%% 星石、月亮石、太阳石

	%% 货币系统
	execGMCmd("addcoin", ["1", "999999999"]),	%% 非绑金
	execGMCmd("addcoin", ["2", "999999999"]),	%% 绑金
	execGMCmd("addcoin", ["3", "999999999"]),	%% 非绑钻
	execGMCmd("addcoin", ["6", "999999999"]),	%% 绑钻

	%% 器灵
	FunAddItem(2500, 2505, 1, 1),			%% 火器灵封印、冰器灵封印、雷器灵封印、风器灵封印、光器灵封印、暗器灵封印
	execGMCmd("additem", ["2600", "999"]),	%% 魔力晶体

	%% 骑宠
	FunAddItem(2160, 2162, 1, 999),			%% 龙之精华I、龙之精华II、龙之精华III
	execGMCmd("additem", ["11000", "999"]),	%% 初阶永夜之书
	execGMCmd("additem", ["11010", "999"]),	%% 初阶三生石
	execGMCmd("additem", ["201", "999"]),	%% 骑宠洗炼石
	FunAddItem(1811, 1813, 1, 1),			%% 骑宠小队1
	FunAddItem(1821, 1827, 1, 1),			%% 骑宠小队1
	FunAddItem(1831, 1838, 1, 1),			%% 骑宠小队1
	FunAddItem(1841, 1848, 1, 1),			%% 骑宠小队1
	FunAddItem(1851, 1859, 1, 1),			%% 骑宠小队1

	%% 时装
	execGMCmd("additem", ["20", "999"]),		%% 时装碎片

	%% 装备
	execGMCmd("additem", ["222", "999"]),		%% 精炼石I
	execGMCmd("additem", ["224", "999"]),		%% 精炼石II
	execGMCmd("additem", ["229", "999"]),		%% 精炼石III
	execGMCmd("additem", ["225", "999"]),		%% 冲星石
	execGMCmd("additem", ["226", "999"]),		%% 橙色冲星石
	execGMCmd("additem", ["227", "999"]),		%% 红色冲星石

	case ?Career2CareerMain(playerState:getCareer()) of
		1 ->
			execGMCmd("additem", ["31029", "1", "0", "3"]),	%% 战士装备50级红色
			execGMCmd("additem", ["32030", "1", "0", "3"]),	%% 战士装备50级红色
			execGMCmd("additem", ["33029", "1", "0", "3"]),	%% 战士装备50级红色
			execGMCmd("additem", ["34029", "1", "0", "3"]),	%% 战士装备50级红色
			FunAddEquip(35030, 38030, 1000, 3);				%% 战士装备50级红色
		2 ->
			execGMCmd("additem", ["31077", "1", "0", "3"]),	%% 法师装备50级红色
			FunAddEquip(32078, 38078, 1000, 3);				%% 法师装备50级红色
		3 ->
			execGMCmd("additem", ["31125", "1", "0", "3"]),	%% 刺客装备50级红色
			FunAddEquip(32126, 38126, 1000, 3);				%% 刺客装备50级红色
		_ ->
			skip
	end,

	%% 装备兑换
	execGMCmd("additem", ["7000", "999"]),		%% 勇气碎片
	execGMCmd("additem", ["7001", "999"]),		%% 专注碎片
	execGMCmd("additem", ["7002", "999"]),		%% 虔诚碎片
	execGMCmd("additem", ["7022", "999"]),		%% 冰霜晶石

	%% 硬币
	execGMCmd("additem", ["2002", "999"]),		%% 幻想硬币

	%% 纹章
	FunAddItem(21000, 21004, 1, 999),		%% 赤尖纹章1~5
	FunAddItem(21050, 21054, 1, 999),		%% 天蓝纹章1~5
	FunAddItem(21100, 21104, 1, 999),		%% 闭月纹章1~5
	ok.

%tt(Params) when erlang:length(Params) >= 0 ->
%%%     设置为最大等级
%	execGMCmd("setlevel", ["50"]),
%
%	%%打开所有功能
%	execGMCmd("crack", []),
%
%	%% 添加爵位声望值
%	playerVip:addReputation(498000),
%
%	%% 添加所有类型的货币
%	Fun_AddMoney = fun(Type) ->
%		execGMCmd("addcoin", [erlang:integer_to_list(Type), "1000000"]),
%		ok
%	               end,
%	lists:foreach(Fun_AddMoney, lists:seq(?CoinTypeMin, ?CoinTypeMax)),
%
%	%% 加恢复药水
%	execGMCmd("additem", ["101", "999", "0"]),
%	execGMCmd("additem", ["102", "999", "0"]),
%	execGMCmd("additem", ["103", "999", "0"]),
%
%	%% 添加一套合身的装备
%%% 	Level = playerState:getLevel(),
%	Career = playerState:getCareer(),
%	L2 = lists:reverse(getCfg:get1KeyList(cfg_equipment)),
%	Fun_AddEquip = fun(Type) ->
%		Fun_AddEquipSub = fun(SubType) ->
%			Fun_GetItem = fun(EquipID, AccIn) ->
%				case getCfg:getCfgByArgs(cfg_equipment, EquipID) of
%					#equipmentCfg{class = Career, type = Type, subType = SubType} ->
%						{break, EquipID};
%					_ ->
%						AccIn
%				end
%			              end,
%			ID = misc:mapAccList(L2, 0, Fun_GetItem),
%			case ID > 0 of
%				true ->
%					execGMCmd("additem", [erlang:integer_to_list(ID), "1", "0"]);
%				_ ->
%					skip
%			end
%		                  end,
%		lists:foreach(Fun_AddEquipSub, lists:seq(?EquipSubTypeNon, ?EquipSubTypeFrag))
%	               end,
%	lists:foreach(Fun_AddEquip, lists:seq(?EquipTypeWeapon, ?EquipTypeMax)),
%
%	%% 添加一部分宝石和骑宠道具
%	L3 = lists:seq(21000, 21005) ++ lists:seq(21050, 21055) ++ lists:seq(21100, 21105) ++ lists:seq(1801, 1824),
%	Fun_AddGemAndQC = fun(ItemID) ->
%		case getCfg:getCfgByArgs(cfg_item, ItemID) of
%			#itemCfg{itemType = ?ItemTypeGem} ->
%				execGMCmd("additem", [erlang:integer_to_list(ItemID), "888", "0"]);
%			#itemCfg{itemType = ?ItemTypeMount} ->
%				execGMCmd("additem", [erlang:integer_to_list(ItemID), "1", "0"]);
%			_ -> skip
%		end
%	                  end,
%	lists:foreach(Fun_AddGemAndQC, L3),
%
%	%% 添加一些特殊物品
%	execGMCmd("additem", ["222", "999", "0"]),    %% 装备精炼石
%	execGMCmd("additem", ["223", "999", "0"]),    %% 装备重铸石
%	execGMCmd("additem", ["2160", "999", "0"]),    %% 龙之精华1
%	execGMCmd("additem", ["2161", "999", "0"]),    %% 龙之精华2
%	execGMCmd("additem", ["2162", "999", "0"]),    %% 龙之精华3
%
%	%% 无敌
%	execGMCmd("tt2", []),
%
%	%% 获得所有称号
%	execGMCmd("alltitle", []),
%	ok.

tt2(Params) when erlang:length(Params) >= 0 ->
%%	execGMCmd("addattack", ["100000000"]),
%%	execGMCmd("adddef", ["100000000"]),
%%	execGMCmd("addspeed", ["20"]),
	playerBuff:addProp(1,
		[
			{?Prop_MaxHP, 99999999, 0},
			{?Prop_MoveSpeed, 20, 0},
			{?Prop_MagicAttack, 9999999, 0},
			{?Prop_PhysicalAttack, 9999999, 0},
			{?Prop_PhysicalDefence, 9999999, 0},
			{?Prop_MagicDefence, 9999999, 0}
		]
		, true),
	ok.

addequip(Params) when erlang:length(Params) >= 1 ->
	[LevelString | _] = Params,
	Level = erlang:list_to_integer(LevelString),
	CareerBase = ?Career2CareerBase(playerState:getCareer()),
	FunAdd =
		fun(Key) ->
			case getCfg:getCfgByKey(cfg_equipment, Key) of
				#equipmentCfg{equipLevel = Level, qualityType = Quality, class = Class} when Class =:= CareerBase orelse Class =:= 0 ->
					execGMCmd("additem", [erlang:integer_to_list(Key), "1", "0", erlang:integer_to_list(Quality)]);
				_ ->
					skip
			end
		end,
	lists:foreach(FunAdd, getCfg:get1KeyList(cfg_equipment)).

addpet(_) ->
	FunAddItem =
		fun(IDMin, IDMax, Interaction, Count) ->
			lists:foreach(
				fun(ID) ->
					execGMCmd("additem", [erlang:integer_to_list(ID), erlang:integer_to_list(Count)])
				end,
				lists:seq(IDMin, IDMax, Interaction)
			)
		end,
	%% 骑宠
	FunAddItem(1811, 1813, 1, 1),			%% 骑宠小队1
	FunAddItem(1821, 1827, 1, 1),			%% 骑宠小队1
	FunAddItem(1831, 1838, 1, 1),			%% 骑宠小队1
	FunAddItem(1841, 1848, 1, 1),			%% 骑宠小队1
	FunAddItem(1851, 1859, 1, 1),			%% 骑宠小队1
	ok.

addrob(Params) when erlang:length(Params) >= 0 ->
	RoleID = playerState:getRoleID(),
	Pid = playerRob:createRob(RoleID),
	MapID = playerState:getMapID(),
	MapPID = playerState:getMapPid(),
	{X, Y} = playerState:getPos(),

	Type = case Params of
			   [TypeStr|_] ->
				   T = string_to_integer(TypeStr),
				   case T of
					   ?RobType_CopyMap -> T;
					   ?RobType_NormalMapFollow -> T;
					   ?RobType_NormalMap -> T;
					   _ -> ?RobType_NormalMapFollow
				   end;
			   _ -> ?RobType_NormalMapFollow
		   end,

	Number =
		case Params of
			[_, NS|_] -> erlang:min(string_to_integer(NS), 8);
			_ -> 1
		end,
	F =
		fun(_) ->
			LoadRob = #rec_LoadRobData{
				robType = Type,
				robRoleID = RoleID,
				robEnterMap = #rec_RobEnterMap{
					mapID = MapID,
					mapPID = MapPID,
					x = X,
					y = Y
				},
				param = playerState:getPlayerCode()
			},
			playerRob:sendToMeLoadRobRoleData(Pid, LoadRob)
		end,
	lists:foreach(F, lists:seq(1, erlang:max(1, Number))),
	ok.

queryrob(Params) when erlang:length(Params) >= 0 ->
	F =
		fun(#recMapObject{code = Code, id = ID}, Acc) ->
			case ID of
				0 -> [Code | Acc];
				_ -> Acc
			end
		end,
	List = ets:foldl(F, [], playerState:getMapPlayerEts()),
	io_lib:format("find rob number:~p, list:~p", [erlang:length(List), List]).

robottt(Params) when erlang:length(Params) >= 0 ->
	execGMCmd("setlevel", ["50"]),
	execGMCmd("addattack", ["100000000"]),
	execGMCmd("adddef", ["100000000"]),
	execGMCmd("addspeed", ["20"]),
	ok.
%%-endif.

%% 设置地图允许进入最大人数限制(仅测试用)
setmlpm(Params) when erlang:length(Params) >= 1 ->
	[SValue1 | Other1] = Params,
	[SValue2 | _Other2] = Other1,
	MapID = string_to_integer(SValue1),
	Number = string_to_integer(SValue2),
	core:sendMsgToMapMgr(MapID, gm_setmlpm, {MapID, Number}),
	ok.

%% 设置地图昼夜,0取消强制，1白天，2黑夜
setmapday(Params) when erlang:length(Params) >= 1 ->
	[SValue1 | _Other1] = Params,
	MapID = playerState:getMapID(),
	Day = string_to_integer(SValue1),
	core:sendMsgToMapMgr(MapID, gm_setmapday, {MapID, Day}),
	ok.

%% 手动刷新神秘商店
freshmsshop(Params) when erlang:length(Params) >= 0 ->
	case Params of
		[] ->
			%% 不要钱刷新
			playerMSShop:freshMysteriousShopReal();
		_ ->
			%% 正常刷新流程
			playerMSShop:freshMSShop()
	end.

%%商城添加新道具
malladdnewitem(Params) when erlang:length(Params) >= 8 ->
	[SValue1 | Other1] = Params,
	[SValue2 | Other2] = Other1,
	[SValue3 | Other3] = Other2,
	[SValue4 | Other4] = Other3,
	[SValue5 | Other5] = Other4,
	[SValue6 | Other6] = Other5,
	[SValue7 | Other7] = Other6,
	[SValue8 | _Other8] = Other7,
	ItemID = string_to_integer(SValue1),
	Type1 = string_to_integer(SValue2),
	Type2 = string_to_integer(SValue3),
	Diamond = string_to_integer(SValue4),
	BDiamond = string_to_integer(SValue5),
	UseInterget = string_to_integer(SValue6),
	GetInterget = string_to_integer(SValue7),
	Sort = string_to_integer(SValue8),
	MallList = #recSaveMall{dbID = erlang:list_to_integer(erlang:integer_to_list(ItemID) ++
		erlang:integer_to_list(Type1) ++
		erlang:integer_to_list(Type2)),
		itemID = ItemID,
		sort = Sort,
		type = Type1,
		type1 = Type2,
		diamond = Diamond,
		bindDiamond = BDiamond,
		useIntegral = UseInterget,
		getIntegral = GetInterget},

%%	CSNode = gsMainLogic:getCSNodeName(),
	Ret = psMgr:call(?PsNameMall, malladdnewitem, {MallList}, ?Start_Link_TimeOut_ms),
	?DEBUG_OUT("execGM  malladdnewitem Ret:~p", [Ret]),
	ok.

%%商城删除道具
malldelitem(Params) when erlang:length(Params) >= 3 ->
	[SValue1 | Other1] = Params,
	[SValue2 | Other2] = Other1,
	[SValue3 | _Other3] = Other2,
	ItemID = string_to_integer(SValue1),
	Type1 = string_to_integer(SValue2),
	Type2 = string_to_integer(SValue3),
	Db_ID = erlang:list_to_integer(erlang:integer_to_list(ItemID) ++
		erlang:integer_to_list(Type1) ++
		erlang:integer_to_list(Type2)),
%%	CSNode = gsMainLogic:getCSNodeName(),
	Ret = psMgr:call(?PsNameMall, malldelitem, {Db_ID}, ?Start_Link_TimeOut_ms),
	?DEBUG_OUT("execGM  malldelitem Ret:~p", [Ret]),
	ok.
%%商城设置限购
mallsetlimitbuy(Params) when erlang:length(Params) >= 5 ->
	[SValue1 | Other1] = Params,
	[SValue2 | Other2] = Other1,
	[SValue3 | Other3] = Other2,
	[SValue4 | Other4] = Other3,
	[SValue5 | _Other5] = Other4,
	ItemID = string_to_integer(SValue1),
	Type1 = string_to_integer(SValue2),
	Type2 = string_to_integer(SValue3),
	LimitBuy = string_to_integer(SValue4),
	LimitType = string_to_integer(SValue5),
	BeginTime = time:getUTCNowSec() + 1,
	EndTime = BeginTime + 60,

	Db_ID = erlang:list_to_integer(erlang:integer_to_list(ItemID) ++
		erlang:integer_to_list(Type1) ++
		erlang:integer_to_list(Type2)),
%%	CSNode = gsMainLogic:getCSNodeName(),
	Ret = psMgr:call(?PsNameMall, mallsetlimitbuy, {Db_ID, LimitBuy, LimitType, BeginTime, EndTime}, ?Start_Link_TimeOut_ms),
	?DEBUG_OUT("execGM  mallsetlimitbuy Ret:~p", [Ret]),
	ok.
%%商城设置赠送
mallsetbuysend(Params) when erlang:length(Params) >= 5 ->
	[SValue1 | Other1] = Params,
	[SValue2 | Other2] = Other1,
	[SValue3 | Other3] = Other2,
	[SValue4 | Other4] = Other3,
	[SValue5 | _Other5] = Other4,
	ItemID = string_to_integer(SValue1),
	Type1 = string_to_integer(SValue2),
	Type2 = string_to_integer(SValue3),
	SendID = string_to_integer(SValue4),
	SendNum = string_to_integer(SValue5),

	BeginTime = time:getUTCNowSec(),
	EndTime = BeginTime + 60,
	Db_ID = erlang:list_to_integer(erlang:integer_to_list(ItemID) ++
		erlang:integer_to_list(Type1) ++
		erlang:integer_to_list(Type2)),
	SendBuy = #sendbuy{db_id = Db_ID,
		sendItem = SendID,
		sendNum = SendNum,
		sendBeginTime = BeginTime,
		sendAfterTime = EndTime},
%%	CSNode = gsMainLogic:getCSNodeName(),
	Ret = psMgr:call(?PsNameMall, mallsetbuysend, {SendBuy}, ?Start_Link_TimeOut_ms),
	?DEBUG_OUT("execGM  mallsetbuysend Ret:~p", [Ret]),
	ok.
%%商城设置上下架时间
mallsetbuytime(Params) when erlang:length(Params) >= 8 ->
	[SValue1 | Other1] = Params,
	[SValue2 | Other2] = Other1,
	[SValue3 | Other3] = Other2,
	[SValue4 | Other4] = Other3,
	[SValue5 | Other5] = Other4,
	[SValue6 | Other6] = Other5,
	[SValue7 | Other7] = Other6,
	[SValue8 | _Other8] = Other7,
	ItemID = string_to_integer(SValue1),
	Type1 = string_to_integer(SValue2),
	Type2 = string_to_integer(SValue3),
	Diamond = string_to_integer(SValue4),
	BDiamond = string_to_integer(SValue5),
	UseInterget = string_to_integer(SValue6),
	GetInterget = string_to_integer(SValue7),
	Sort = string_to_integer(SValue8),
	BeginTime = time:getUTCNowSec() + 1,
	EndTime = BeginTime + 60,
	Db_ID = erlang:list_to_integer(erlang:integer_to_list(ItemID) ++
		erlang:integer_to_list(Type1) ++
		erlang:integer_to_list(Type2)),
	MallList = #recSaveMall{dbID = Db_ID,
		itemID = ItemID,
		sort = Sort,
		type = Type1,
		type1 = Type2,
		diamond = Diamond,
		bindDiamond = BDiamond,
		useIntegral = UseInterget,
		getIntegral = GetInterget,
		beginTime = BeginTime,
		endTime = EndTime},
%%	CSNode = gsMainLogic:getCSNodeName(),
	Ret = psMgr:call(?PsNameMall, mallsetbuytime, {MallList}, ?Start_Link_TimeOut_ms),
	?DEBUG_OUT("execGM  mallsetbuytime Ret:~p", [Ret]),
	ok.
%%修改折扣
mallsetrebate(Params) when erlang:length(Params) >= 4 ->
	[SValue1 | Other1] = Params,
	[SValue2 | Other2] = Other1,
	[SValue3 | Other3] = Other2,
	[SValue4 | _Other4] = Other3,
	ItemID = string_to_integer(SValue1),
	Type1 = string_to_integer(SValue2),
	Type2 = string_to_integer(SValue3),
	Rebate = string_to_integer(SValue4),
	BeginTime = time:getUTCNowSec(),
	EndTime = BeginTime + 60,
	Db_ID = erlang:list_to_integer(erlang:integer_to_list(ItemID) ++
		erlang:integer_to_list(Type1) ++
		erlang:integer_to_list(Type2)),
%%	CSNode = gsMainLogic:getCSNodeName(),
	Ret = psMgr:call(?PsNameMall, mallsetrebate, {Db_ID, Rebate, BeginTime, EndTime}, ?Start_Link_TimeOut_ms),
	?DEBUG_OUT("execGM  Ret:~p", [Ret]),
	ok.

%%更新成就进度
updateachieve(Params) when erlang:length(Params) >= 1 ->
	[SValue1 | Other1] = Params,
	[SValue2 | Other2] = Other1,
	[SValue3 | _Other3] = Other2,
	Type = string_to_integer(SValue1),
	ID = string_to_integer(SValue2),
	Num = string_to_integer(SValue3),
	case ID of
		0 ->
			Arg = [Num];
		_ ->
			Arg = [ID, Num]
	end,
	playerAchieve:achieveEvent(Type, Arg),
	ok.
%%添加成就
addachieve(Params) when erlang:length(Params) >= 2 ->
	[SValue1 | Other1] = Params,
	[SValue2 | _Other2] = Other1,

	Value1 = string_to_integer(SValue1),
	Value2 = string_to_integer(SValue2),
	playerAchieve:addAchieveValue(Value1, Value2),
	ok.
%%添加徽章
addbadge(_Params) when erlang:length(_Params) >= 1 ->
	%%暂时屏蔽徽章
	%[SValue1 | Other1] = _Params,
	%[SValue2 | _Other2] = Other1,
	%MapID = string_to_integer(SValue1),
	%ItemID = string_to_integer(SValue2),
	%%playerBadge:gmBadgeEvent(MapID, ItemID),
	ok.
%%增加经验
addexp(Params) when erlang:length(Params) >= 1 ->
	[SValue1 | _Other1] = Params,
	Exp = string_to_integer(SValue1),
	playerBase:addExp(Exp, ?ExpSourceGM, 0),
	ok.

%%增加翅膀经验
addwingexp(Params) when erlang:length(Params) >= 1 ->
	[SValue1 | _Other1] = Params,
	Exp = string_to_integer(SValue1),
	playerWing:useWingItem(1, 0, Exp, Exp),
	ok.
%%增加经验
settalentflag(Params) when erlang:length(Params) >= 1 ->
	[SValue1 | _Other1] = Params,
	Flag = string_to_integer(SValue1),
	playerState:setTalentGMFlag(Flag),
	ok.
%%设置角色可以改名
setrename(Params) when erlang:length(Params) >= 1 ->
	[SValue1 | _Other1] = Params,
	Flag = string_to_integer(SValue1),
	RoleID = playerState:getRoleID(),
	playerSave:saveCanReName(RoleID, Flag),
	ok.
%%设置神器技能是否消耗怒气
setcoucost(Params) when erlang:length(Params) >= 1 ->
	[SValue1 | _Other1] = Params,
	Flag = string_to_integer(SValue1),
	playerState:setCourageCostFlag(Flag),
	ok.
%%根据角色名字传送到它所在的地图位置
warpto(Params) when erlang:length(Params) >= 1 ->
	[Name | _Other1] = Params,
	case playerMgrOtp:getOnlinePlayerInfoByName(Name) of
		#rec_OnlinePlayer{pid = PID, roleID = RoleID} ->
			case RoleID =:= playerState:getRoleID() of
				true ->
					skip;
				_ ->
					psMgr:sendMsg2PS(PID, requirePos, {?RequestTargetPlayerPos_GMWrapTo, RoleID})
			end;
		_ ->
			skip
	end,
	ok.
%%根据角色ID传送到它所在的地图位置
warp2(Params) when erlang:length(Params) >= 1 ->
	[SV | _Other1] = Params,
	RoleID = string_to_integer(SV),
	case playerMgrOtp:getOnlinePlayerInfoByID(RoleID) of
		#rec_OnlinePlayer{pid = PID, roleID = RoleID} ->
			case RoleID =:= playerState:getRoleID() of
				true ->
					skip;
				_ ->
					psMgr:sendMsg2PS(PID, requirePos, {?RequestTargetPlayerPos_GMWrapTo, RoleID})
			end;
		_ ->
			skip
	end,
	ok.

%%增加限时骑宠
addexpresspet(Params) when erlang:length(Params) >= 1 ->
	[SV | _] = Params,
	PetID = string_to_integer(SV),
	playerPet:addExpressPet(PetID),
	ok.

%%获取当前所在地图线
ln(Params) when erlang:length(Params) =:= 0 ->
	MapID = playerState:getMapID(),
	MapPid = playerState:getMapPid(),
	{ok, #recMapInfo{id = MapID, line = Line, totalPlayerNum = Num}} = callMgrMap(MapID, getLineInfo, {MapPid}),
	io_lib:format("current map id:~p, map line id:~p, map line player num:~p", [MapID, Line, Num]).

%% 获取地图线路信息
ll(Params) when erlang:length(Params) =:= 0 ->
	ll(Params, playerState:getMapID());
ll(Params) when erlang:length(Params) >= 1 ->
	[Value | _Other1] = Params,
	ll(Params, string_to_integer(Value)).
ll(_, MapID) ->
	case callMgrMap(MapID, getLineList, {MapID}) of
		{ok, []} ->
			"current map no line";
		{ok, List} ->
			Fun = fun(#recMapInfo{totalPlayerNum = Num, line = Line}) ->
				io_lib:format("line id:~p, line player num:~p", [Line, Num])
				  end,
			lists:map(Fun, List)
	end.

hl(Params) when erlang:length(Params) >= 1 ->
	[Value | _Other1] = Params,
	hl(playerState:getMapID(), playerState:getMapPid(), string_to_integer(Value)).
hl(MapID, MapPid, Line) ->
	case canEnterMapLine(MapID, MapPid, Line) of
		true ->
			{X, Y} = playerState:getPos(),
			playerScene:sendGMEnterMapLine(MapID, X, Y, Line);
		Str ->
			Str
	end.

wildboss(Params) when erlang:length(Params) >= 1 ->
	[SValue1 | Other1] = Params,
	[SValue2 | _Other2] = Other1,
	TargetMapID = string_to_integer(SValue1),
	TargetBossID = string_to_integer(SValue2),
	AddTime =
		case Other1 of
			[SValue2 | _Other2] -> string_to_integer(SValue2);
			_ -> 10
		end,
	NowTime = time:getSyncTime1970FromDBS(),
	FreshTime = NowTime + AddTime,
	case TargetMapID of
		0 ->
			%% 重置所有的野外BOSS
			Fun =
				fun(#recWildBossInfo{mapID = MapID, bossPid = BossPID, bossCode = BossCode, bossID = BossID} = Data, Acc) ->
					%% 发给地图销毁这个BOSS
					case erlang:is_pid(BossPID) andalso erlang:is_process_alive(BossPID) andalso BossCode > 0 of
						true ->
							?LOG_OUT("wildboss:~p, clear spawn:~p", [playerState:getRoleID(), Data]),
							psMgr:sendMsg2PS(BossPID, clearSpawn, [BossCode]);
						_ ->
							skip
					end,

					%% 设置BOSS死亡，以及下一次刷新时间
					myEts:updateEts(?TABLE_WildBoss, BossID,
						[
							{#recWildBossInfo.mapID, MapID},
							{#recWildBossInfo.bossPid, undefined},
							{#recWildBossInfo.bossCode, 0},
							{#recWildBossInfo.targetCode, 0},
							{#recWildBossInfo.isNotice, false},
							{#recWildBossInfo.isFresh, false},
							{#recWildBossInfo.nextRefreshTime, FreshTime}
						]),
					Msg = #pk_GS2U_NoticeWildBossDead{info = #pk_WildBossInfo{mapID = MapID,bossID = BossID, refreshTime = FreshTime}},
					psMgr:sendMsg2PS(?PsNamePlayerMgr, pidMsg2AllOLPlayer, {broadcast, Msg}),
					Acc
				end,
			ets:foldl(Fun, 0, ?TABLE_WildBoss),
			"reset all success";
		_ ->
			%% 重置指定地图的野外BOSS
			case myEts:lookUpEts(?TABLE_WildBoss, TargetBossID) of
				[#recWildBossInfo{bossPid = BossPID, bossCode = BossCode} = Data] ->
					%% 发给地图销毁这个BOSS
					case erlang:is_pid(BossPID) andalso erlang:is_process_alive(BossPID) andalso BossCode > 0 of
						true ->
							?LOG_OUT("wildboss:~p, targetmapid:~p, clear spawn:~p", [playerState:getRoleID(), TargetMapID, Data]),
							psMgr:sendMsg2PS(BossPID, clearSpawn, [BossCode]);
						_ ->
							skip
					end,

					%% 设置BOSS死亡，以及下一次刷新时间
					myEts:updateEts(?TABLE_WildBoss, TargetBossID,
						[
							{#recWildBossInfo.mapID, TargetMapID},
							{#recWildBossInfo.bossPid, undefined},
							{#recWildBossInfo.bossCode, 0},
							{#recWildBossInfo.targetCode, 0},
							{#recWildBossInfo.isNotice, false},
							{#recWildBossInfo.isFresh, false},
							{#recWildBossInfo.nextRefreshTime, NowTime + 10}
						]),
					Msg = #pk_GS2U_NoticeWildBossDead{info = #pk_WildBossInfo{mapID = TargetMapID,bossID =TargetBossID,  refreshTime = FreshTime}},
					psMgr:sendMsg2PS(?PsNamePlayerMgr, pidMsg2AllOLPlayer, {broadcast, Msg}),
					io_lib:format("reset ~p success", [TargetMapID]);
				_ ->
					"TargetBossID error"
			end
	end.

escort(Params) when erlang:length(Params) >= 1 ->
	[SValue1 | _Other1] = Params,
	Type = string_to_integer(SValue1),
	case Type of
		1 -> playerEscort:requestEscortSolo();
		2 -> playerEscort:requestEscortTeam();
		3 -> playerEscort:requestEscortRob(1)
	end,
	ok.

escortcd(Params) when erlang:length(Params) >= 1 ->
	[SValue1 | _Other1] = Params,
	EventID = string_to_integer(SValue1),
	case getCfg:getCfgPStack(cfg_escort_event, EventID) of
		#escort_eventCfg{} ->
			core:sendMsgToActivity(?ActivityType_EscortGoods, gm_escortcd, {playerState:getRoleID(), EventID}),
			ok;
		_ ->
			"error eventID"
	end.

clearpetraw(Params) when erlang:length(Params) >= 2 ->
	[PetID | Other0] = Params,
	[Raw | _Other1] = Other0,
	ID = string_to_integer(PetID),
	R = string_to_integer(Raw),
	playerPet:gmDelPetTurnRaw(ID, R),
	ok.

liveness(Params) when erlang:length(Params) >= 1 ->
	[LivenessIDStr | _Other] = Params,
	LivenessID = string_to_integer(LivenessIDStr),
	case LivenessID > 10 of
		true ->
			playerliveness:addTotalLivenessValue(LivenessID);
		_ ->
			case getCfg:getCfgPStack(cfg_dailyActive, LivenessID) of
				#dailyActiveCfg{limit = Limit} ->
					playerliveness:onFinishLiveness(LivenessID, 1);
				_ ->
					"error liveness ID"
			end
	end.

openslot(Params) when erlang:length(Params) >= 0 ->
	playerPackage:gm_openAllSlot(),
	ok.

querytime(_Params) ->
	Sec = time:getSyncTime1970FromDBS(),
	Str = time:convertSec2DateTimeStr(Sec),
	io_lib:format("SyncTime:~ts~nConfZone:~p~nLocalTime:~ts", [Str, time:getLocalTimeAdjustHour(), time2:getLocalDateTimeStr()]).

clearmail(_Params) ->
	playerMail:gm_deleteAllMail(),
	ok.

clearitem(Params) when erlang:length(Params) >= 1 ->
	[TypeStr | _Other] = Params,
	Type = string_to_integer(TypeStr),
	case Type >= ?Item_Location_Start andalso Type =< ?Item_Location_Max of
		true ->
			gmdeleteItem(Type);
		_ ->
			playerRune:gmdeleteRune(),
			"gmdeleteRune"
	end.

gmdeleteItem(BagType) ->
	Plog = #recPLogTSItem{
		old = 0,
		new = 0,
		change = 0,
		target = ?PLogTS_System,
		source = ?PLogTS_PlayerSelf,
		gold = 0,
		goldtype = 0,
		changReason = ?ItemDeleteReasonPlayer,
		reasonParam = 444
	},
	List = playerState:getPackage(BagType),
	F =
		fun
			(#rec_item{itemUID = UID}) ->
				case BagType of
					?Item_Location_Recycle ->
						playerPackage:gm_deleteExpiredTimeGoodsFromRecycle(UID);
					?Item_Location_GemEmbedBag ->
						%% 先卸，再删
						playerPackage:gemEmbedOff([UID]),
						playerPackage:deleteGoodsByUID(?Item_Location_Gem_Bag, UID, Plog);
					_ ->
						playerPackage:deleteGoodsByUID(BagType, UID, Plog)
				end;
			(#recSaveEquip{itemUID = UID2} = Equip) ->
				case BagType of
					?Item_Location_Recycle ->
						playerPackage:gm_deleteExpiredTimeGoodsFromRecycle(UID2);
					?Item_Location_BodyEquipBag ->
						%% 先脱，再删
						playerPackage:gm_equipoff(Equip),
						playerPackage:deleteGoodsByUID(?Item_Location_Equip_Bag, UID2, Plog);
					_ ->
						playerPackage:deleteGoodsByUID(BagType, UID2, Plog)
				end
		end,
	lists:foreach(F, List),
	io_lib:format("gmdeleteItem:~p", [BagType]).

lovegirl(Params) when erlang:length(Params) >= 0 ->
	execGMCmd("setlevel", ["50"]),
	crack2(),
	execGMCmd("openslot", []),
	ok.

addac(Params) when erlang:length(Params) >= 0 ->
%% 	Ac = #rec_operate_activity{
%% 		id = 0,
%% 		type = 1,
%% 		name = "123",
%% 		phase = 0,
%% 		starttime = time:getSyncTime1970FromDBS() + 60,
%% 		endtime = time:getSyncTime1970FromDBS() + 3600,
%% 		minlevel = 10,
%% 		maxlevel = 40,
%% 		arg1 = [#recAcKilledMonster{
%% 					ruleID = 1, 
%% 					type = 1, 
%% 					itemID = 222, 
%% 					monsterID = 0, 
%% 					mapIDs = [], 
%% 					diffLv = 0, 
%% 					odds = 10000, 
%% 					playerLimit = 5, 
%% 					serverLimit = 10
%% 					}
%% 				]
%% 	},

	Ac = #rec_operate_activity{
		id = 1,
		type = 1,
		name = "123",
		phase = 0,
		starttime = time:getSyncTime1970FromDBS() + 60,
		endtime = time:getSyncTime1970FromDBS() + 3600,
		minlevel = 10,
		maxlevel = 40,
		arg1 = [#recAcKilledMonster{
			ruleID = 1,
			type = 1,
			itemID = 222,
			monsterID = 0,
			mapIDs = [],
			diffLv = 0,
			odds = 10000,
			playerLimit = 5,
			serverLimit = 10
		},
			#recAcKilledMonster{
				ruleID = 2,
				type = 1,
				itemID = 221,
				monsterID = 0,
				mapIDs = [],
				diffLv = 0,
				odds = 10000,
				playerLimit = 5,
				serverLimit = 10
			}
		]
	},
	psMgr:sendMsg2PS(operateActivityPID, updateActivity, {0, 0, Ac}).

addCollectAct(Params) when erlang:length(Params) >= 3 ->
	[MapID | Remain1] = Params,
	[Num | Remain2] = Remain1,
	[TotalNum | _Remain3] = Remain2,
	Act = #rec_operate_activity{
		id = 0,                                    %%活动ID int(10) unsigned
		type = ?OperateActType_CollectItem,        %%活动类型 tinyint(4) unsigned
		name = <<"test">>,                        %%活动名称 varchar(256)
		desc = <<"test collect">>,                %%活动描述 text
		phase = 0,                                %%活动是否关闭，0未开启，1运行状态，2关闭状态 tinyint(4)
		starttime = 1438153200,                    %%活动开启时间 bigint(20),"2015-07-29 15:00:00"
		endtime = 1535526000,                    %%活动结束时间 bigint(20),"2018-08-29 15:00:00"
		minlevel = 0,                            %%活动参与最小等级 tinyint(4) unsigned
		maxlevel = 100,                            %%活动参与最大等级 tinyint(4) unsigned
		arg1 = [#recAcCollectItemCfg{
			mapID = erlang:list_to_integer(MapID),        %%地图ID
			freshNum = erlang:list_to_integer(Num),        %%单次刷新数量
			totalFreshNum = erlang:list_to_integer(TotalNum),                    %%总刷新数量
			collectID = 812,                            %%采集ID
			turnFreshInterval = 600000,
			alreadyFreshNum = 0                         %%已经刷新的数量
		}],                        %%活动参数 text
		arg2 = "",                %%活动参数 text
		arg3 = "",                %%活动参数 text
		arg4 = "",                %%活动参数 text
		arg5 = ""                %%活动参数 text
	},
	psMgr:sendMsg2PS(?PsNameOperateActivity, updateActivity, {1, self(), Act}).


addphys(Params) when erlang:length(Params) >= 1 ->
	[SValue1 | _Other1] = Params,
	Phys = string_to_integer(SValue1),
	playerPetPvE:gmAddPhys(Phys).

passdun(Params) when erlang:length(Params) >= 1 ->
	[SValue1 | _Other1] = Params,
	DunID = string_to_integer(SValue1),
	playerPetPvE:gmPassDun(DunID).

rewardUpdate(Params) when erlang:length(Params) >= 1 ->
	[SValue1 | _Other1] = Params,
	Count = string_to_integer(SValue1),
	playerUpdateReward:getUpdateReward(Count).

worldLevel(Params) when erlang:length(Params) >= 1 ->
	[SValue1 | _Other1] = Params,
	Level = string_to_integer(SValue1),
	#globalsetupCfg{setpara = [MinLevel]} = getCfg:getCfgByArgs(cfg_globalsetup, worldlevel_base),
	RLevel = case Level > MinLevel of
				 true ->
					 Level;
				 _ ->
					 MinLevel
			 end,
	memDBCache:saveSundries(?Sundries_ID_WorldLevel, 1, RLevel),
	playerWorldLevel:sendWorldLevel().

operateItemPush(Params) ->
	[ItemID | Remain1] = Params,
	[Num | Remain2] = Remain1,
	[Price | Remain3] = Remain2,
	[Rebate | _Remain4] = Remain3,
	Result = [#rec_limit_sales{
		sku = 1,
		itemID = string_to_integer(ItemID),
		num = string_to_integer(Num),
		price = string_to_integer(Price),
		rebate = string_to_integer(Rebate),
		startTime = time:getUTCNowSec(),
		endTime = time:getUTCNowSec() + 86360,
		coinType = 3,
		limitSales = 1
	}],
	AccountID = playerState:getAccountID(),
	%% 通知数据库删除
	gsSendMsg:sendMsg2DBServer(gmaddLimitPushSale, AccountID, {1222, Result}),
	ok.

clearRoleList(_Params) ->
	AccountID = playerState:getAccountID(),
	ets:delete(ets_recRoleList, AccountID),
	ok.

entercross(Params) when erlang:length(Params) >= 1 ->
	[TypeStr | _] = Params,
	Type = string_to_integer(TypeStr),
	case Type of
		1 ->
			playerCrossLogic:loginCross(undefined);
		_ ->
			playerCrossLogic:backGS()
	end.

array(Params) when erlang:length(Params) >= 3 ->
	[S1,S2, S3|_] = Params,
	I3 = string_to_integer(S3),
	TargetCode =
		case I3 > 0 of
			true -> I3;
			_ -> playerState:getSelectTargetCode()
		end,
	Refer =
		case codeMgr:getObjectTypeByCode(TargetCode) of
			?ObjTypePlayer -> TargetCode;
			_ -> 0
		end,
	playerServerTest:array(string_to_integer(S1), string_to_integer(S2), Refer).

arrayrotw(Params) when erlang:length(Params) >= 1 ->
	[S1|_] = Params,
	playerServerTest:arrayRot(string_to_integer(S1)).

arrayperform(Params) when erlang:length(Params) >= 2 ->
	[S1,S2|_] = Params,
	playerServerTest:arrayPerform(string_to_integer(S1), string_to_integer(S2)).

usepetbook(Params) ->
	[PetID | Remain1] = Params,
	[SkillID | Remain2] = Remain1,
	[ID | _] = Remain2,
	playerPet:petFixCast(
		erlang:list_to_integer(PetID),
		erlang:list_to_integer(SkillID),
		erlang:list_to_integer(ID)),
	ok.

onkeyrefine(Params) ->
	case Params of
		[] ->
			playerEquip:equipRefineOneKey();
		[Pos | _]->
			playerEquip:equipRefine(erlang:list_to_integer(Pos), true)
	end,
	ok.

tz(_Params) ->
	Hour = time:getLocalTimeAdjustHour(),
	case Hour > 0 of
		true ->
			io_lib:format("time zone +~p~n", [Hour]);
		_ ->
			io_lib:format("time zone ~p~n", [Hour])
	end.

looptask_reset(Params) ->
	FunParse =
		fun(_, {ParamAcc, ListResult}) ->
			case ParamAcc of
				[] ->
					{[], [false | ListResult]};
				[H | T] ->
					Result =
						case erlang:list_to_integer(H) of
							0 ->
								false;
							_ ->
								true
						end,
					{T, [Result | ListResult]}
			end
		end,
	{_, [IsCancelTask, IsResetLoopCount, IsResetDailyCount]} =
		lists:foldl(FunParse, {Params, []}, [1, 2, 3]),
	playerLoopTask:onReset(gm, {IsCancelTask, IsResetLoopCount, IsResetDailyCount}).

looptask_accept(Params) ->
	IsGMMod =
		case Params of
			[] ->
				false;
			[H | _] ->
				case erlang:list_to_integer(H) of
					0 ->
						false;
					_ ->
						true
				end
		end,
	case IsGMMod of
		true ->
			playerLoopTask:accept_gm();
		_ ->
			playerLoopTask:accept()
	end.

looptask_complete(Params) ->
	FunParse =
		fun(_, {ParamAcc, ListResult}) ->
			case ParamAcc of
				[] ->
					{[], [false | ListResult]};
				[H | T] ->
					Result =
						case erlang:list_to_integer(H) of
							0 ->
								false;
							V ->
								V
						end,
					{T, [Result | ListResult]}
			end
		end,
	{_, [IsGMMod, Count]} =
		lists:foldl(FunParse, {Params, []}, [1, 2]),
	case IsGMMod of
		false ->
			case Count of
				false ->
					playerLoopTask:oneKeyCompleteOne();
				_ ->
					playerLoopTask:oneKeyCompleteAll()
			end;
		_ ->
			playerLoopTask:oneKeyComplete_gm(Count)
	end.

rune_open(Params) ->
	Code =
		case Params of
			[] ->
				0;
			[StrCode | _] ->
				erlang:list_to_integer(StrCode);
			_ ->
				0
		end,
	playerMsg:sendNetMsg(#pk_GS2U_RuneOpenBorad{code = Code}).

signin_sign([]) ->
	playerDailySignIn:sign(),
	ok;
signin_sign(Params) ->
	[P1 | _] = Params,
	P1_ = erlang:list_to_integer(P1),
	playerDailySignIn:signGM(P1_),
	ok.

signin_reset(Params) ->
	[P1 | _] = Params,
	case erlang:list_to_integer(P1) of
		0 ->
			playerDailySignIn:reset();
		1 ->
			playerDailySignIn:reset(1)
	end.

signin_reward(Params) ->
	[P1 | _] = Params,
	ID = erlang:list_to_integer(P1),
	playerDailySignIn:accuReward(ID),
	ok.

signin_seven(Params) ->
	[P1 | _] = Params,
	DayCount = erlang:list_to_integer(P1),
	playerSignIn:playerSevenDaySignIn(DayCount),
	ok.

sevendayaim(Params) ->
	[P1 | _] = Params,
	ID = erlang:list_to_integer(P1),
	playerSevenDayAim:reward(ID),
	ok.

thirtydaylogingift(Params) ->
	[P1 | _] = Params,
	ID = erlang:list_to_integer(P1),
	%playerThirtyDayLoginGift:reward(ID),
	ok.

% 查询 0查询领地信息；2查询掠夺记录；3查询防守记录
territory_query(Params) when erlang:length(Params) >= 1 ->
	[V1 | _T1] = Params,
	case erlang:list_to_integer(V1) of
		0 ->
			playerPetTerritory:queryTerritory();
		1 ->
			playerPetTerritory:queryHistory(true);
		2 ->
			playerPetTerritory:queryHistory(false)
	end,
	ok.

% 开采 自动选择骑宠进行开采
% territoryID cfgTime cfgLevel
territory_exploit(Params) when erlang:length(Params) >= 3 ->
	[V1 | T1] = Params,
	[V2 | T2] = T1,
	[V3 | _T3] = T2,
	TerritoryID = erlang:list_to_integer(V1),
	CfgTime = erlang:list_to_integer(V2),
	CfgLevel = erlang:list_to_integer(V3),
	%% 自动搜索可用的骑宠
	ListPetIDFromPlayer = [PetID || #recPetInfo{pet_id = PetID} <- playerState:getPets()],
	ListPetIDFromTerritory = acPetTerritoryState:queryPet(playerState:getRoleID()),
	FunFilter =
		fun(PetID, _) ->
			case lists:keyfind(PetID, #rec_player_territory_pet.petID, ListPetIDFromTerritory) of
				#rec_player_territory_pet{territoryID = 0} ->
					{true, PetID};
				#rec_player_territory_pet{} ->
					{false, 0};
				_ ->
					{true, PetID}
			end
		end,
	case misc:foldlEx(FunFilter, {false, 0}, ListPetIDFromPlayer) of
		{true, PetID} ->
			playerPetTerritory:exploit(TerritoryID, [PetID], CfgTime, CfgLevel);
		_ ->
			skip
	end,
	ok.

% 搜索 0非针对性搜索 1搜索选择对象的领地
territory_search(Params) when erlang:length(Params) >= 1 ->
	[V1 | _T1] = Params,
	case erlang:list_to_integer(V1) of
		0 ->
			playerPetTerritory:search(0);
		1 ->
			TargetCode = playerState:getSelectTargetCode(),
			RoleID = playerState:getRoleID(),
			case codeMgr:getObjectTypeByCode(TargetCode) of
				?ObjTypePlayer ->
					case playerMgrOtp:getOnlinePlayerInfoByCode(TargetCode) of
						#rec_OnlinePlayer{roleID = TargetRoleID} when TargetRoleID =/= RoleID ->
							playerPetTerritory:search(TargetRoleID);
						_ ->
							?ERROR_OUT("territory_search invalid Target! can not select yourself!")
					end;
				_ ->
					?ERROR_OUT("territory_search invalid Target! must select player!")
			end;
		_ ->
			playerPetTerritory:search(1170953497449857027)
	end,
	ok.

% 掠夺
territory_plunder(_) ->
	%% 找到最近搜索到的领地
	RoleID = playerState:getRoleID(),
	case acPetTerritoryState:querySearchHistory(RoleID) of
		[] ->
			none;
		ListSH ->
			[{{TargetRoleID, TerritoryID}, _} | _] = lists:sort(fun({_, T1}, {_, T2}) -> T1 > T2 end, ListSH),
			%% 自动搜索可用的骑宠
			ListPetIDFromPlayer = [PetID || #recPetInfo{pet_id = PetID} <- playerState:getPets()],
			ListPetIDFromTerritory = acPetTerritoryState:queryPet(playerState:getRoleID()),
			FunFilter =
				fun(PetID, _) ->
					case lists:keyfind(PetID, #rec_player_territory_pet.petID, ListPetIDFromTerritory) of
						#rec_player_territory_pet{territoryID = 0} ->
							{true, PetID};
						#rec_player_territory_pet{} ->
							{false, 0};
						_ ->
							{true, PetID}
					end
				end,
			case misc:foldlEx(FunFilter, {false, 0}, ListPetIDFromPlayer) of
				{true, PetID} ->
					playerPetTerritory:plunder(TargetRoleID, TerritoryID, [PetID]);
				_ ->
					skip
			end
	end.

% 所有正在开采的领地奖励+1，便于搜索调试
territory_exploit_add(_) ->
	core:sendMsgToActivity(?ActivityType_PetTerritory, petTerritory_exploit_add, playerState:getRoleID()).

% 仅对于自身正在开采的领地1，调整下次结算时间为5分钟后执行，以便客户端调试
territory_exploit_t(Params) when erlang:length(Params) >= 1 ->
	[V1 | _T1] = Params,
	core:sendMsgToActivity(?ActivityType_PetTerritory, petTerritory_exploit_test, {playerState:getRoleID(), erlang:list_to_integer(V1)}).

% 刷怪战斗测试，用于测试出生BUFF、阵营、AI，不能测试属性及技能
territory_exploit_m(_Params) ->
	MapID = playerState:getMapID(),
	MonsterID = 21034,
	GroupID = playerState:getGroupID(),
	PlayerEts = playerState:getMapPlayerEts(),
	MonsterEts = playerState:getMapMonsterEts(),
	PetEts = playerState:getMapPetEts(),
	MapPid = playerState:getMapPid(),
	{X, Y} = playerState:getPos(),
	Arg1 =
		#recSpawnMonster{
			id = MonsterID,
			mapPid = MapPid,
			mapID = MapID,
			x = X + 1,
			y = Y + 1,
			camp = ?CampMonsterEnemies,
			groupID = GroupID,
			petEts = PetEts,
			playerEts = PlayerEts,
			monsterEts = MonsterEts
		},
	Arg2 =
		#recSpawnMonster{
			id = MonsterID,
			mapPid = MapPid,
			mapID = MapID,
			x = X + 1,
			y = Y + 1,
			camp = ?CampMonsterFriendly,
			groupID = GroupID,
			petEts = PetEts,
			playerEts = PlayerEts,
			monsterEts = MonsterEts
		},
	playerPet:spawnMonster(Arg1),
	playerPet:spawnMonster(Arg1),
	playerPet:spawnMonster(Arg2),
	playerPet:spawnMonster(Arg2),
	ok.

% 查询精力
getvigor(_) ->
	playerPetTerritory:getVigor().

% 增加精力
addvigor(Params) when Params >= 1 ->
	[V | _] = Params,
	#globalsetupCfg{setpara = [ValueMax]} =
		getCfg:getCfgPStack(cfg_globalsetup, petTerritory_vigorMax),
	ValueOld = playerPetTerritory:getVigor(),
	ValueNew =
		case erlang:list_to_integer(V) + ValueOld of
			ValueNew_ when ValueNew_ > ValueMax ->
				ValueMax;
			ValueNew_ ->
				ValueNew_
		end,
	playerPropSync:setAny(?SerProp_PetTerritoryVigor, [time:getSyncTimeFromDBS(), ValueNew]).


marriage_build(Params) ->
	TargetCode = playerState:getSelectTargetCode(),
	RoleID = playerState:getRoleID(),
	case codeMgr:getObjectTypeByCode(TargetCode) of
		?ObjTypePlayer ->
			case playerMgrOtp:getOnlinePlayerInfoByCode(TargetCode) of
				#rec_OnlinePlayer{roleID = TargetRoleID} when TargetRoleID =/= RoleID ->
					[ItemIDString | T1] = Params,
					case T1 of
						[] ->
							playerMarriage:wantBuild(TargetRoleID, erlang:list_to_integer(ItemIDString), []);
						_ ->
							playerMarriage:build({TargetRoleID, true})
					end;
				_ ->
					?ERROR_OUT("marriage_build invalid Target! can not select yourself!")
			end;
		_ ->
			?ERROR_OUT("marriage_build invalid Target! must select player!")
	end,
	ok.

marriage_break(_Params) ->
	RoleID = playerState:getRoleID(),
	case marriageState:queryRelation(RoleID) of
		#rec_marriage{targetRoleID = TargetRoleID} when TargetRoleID > 0 ->
%%			TeamMemberList = playerTeam2:getTeamAllMemberInfoList(?PlayerTeamTypeNormal),
%%			case lists:keyfind(TargetRoleID, #recTeamMemberInfo.roleID, TeamMemberList) of
%%				#recTeamMemberInfo{} ->
			case teamInterface:isInSameTeam(RoleID, TargetRoleID) of
				true ->
					playerMarriage:break(true);
				_ ->
					playerMarriage:break(false)
			end;
		_ ->
			playerMarriage:break(false)
	end,
	ok.

marriage_addcloseness(Params) ->
	RoleID = playerState:getRoleID(),
	case marriageState:queryRelation(RoleID) of
		#rec_marriage{targetRoleID = TargetRoleID} when TargetRoleID > 0 ->
			[ValueString | T1] = Params,
			[ReasonString | _] = T1,
			Value = erlang:list_to_integer(ValueString),
			Reason = erlang:list_to_integer(ReasonString),
			playerMarriage:closenessAdd({RoleID, TargetRoleID, Value, Reason});
		_ ->
			skip
	end.

marriage_skillup(Params) ->
	[CostString | T1] = Params,
	[SlotIDString | _] = T1,
	Cost = erlang:list_to_integer(CostString),
	SlotID = erlang:list_to_integer(SlotIDString),
	playerMarriage:skillUp(Cost, SlotID).

marriage_ringup(Params) ->
	[CostString | _] = Params,
	Cost = erlang:list_to_integer(CostString),
	playerMarriage:ringUp(Cost).

marriage_resetsr(_Params) ->
	RoleID = playerState:getRoleID(),
	case marriageState:queryRelation(RoleID) of
		#rec_marriage{targetRoleID = TargetRoleID} = Rec when TargetRoleID > 0 ->
			RecNew =
				Rec#rec_marriage{
					ringExp = 0,
					ringTop = 1
				},
			marriageState:replaceRelation(RecNew),
			Slots = marriageState:querySlots(RoleID),
			FunMakeSlotsNew =
				fun({SlotID, _}, R) ->
					Slot =
						#rec_marriage_skill{
							roleID = RoleID,
							slotID = SlotID,
							slotExp = 0
						},
					marriageState:replaceSlot(Slot),
					[Slot | R]
				end,
			SlotsNew = lists:foldl(FunMakeSlotsNew, [], Slots),
			gsSendMsg:sendMsg2DBServer(marriage_dbsave, 0, [RecNew | SlotsNew]);
		_ ->
			skip %% 未婚时忽略
	end.

marriage_accept(_Params) ->
	playerMarriageTask:acceptTask().

marriage_submit(_Params) ->
	playerMarriageTask:submitTask().

marriage_resettask([]) ->
	playerMarriageTask:resetTask(false);
marriage_resettask([H | _]) ->
	playerMarriageTask:resetTask(erlang:list_to_integer(H) > 0).

md_enter(_Params) ->
	playerMoneyDungeon:onEnterMap(520).

md_giveup(_Params) ->
	playerMoneyDungeon:giveup().

md_next(_Params) ->
	playerMoneyDungeon:next().

sa_enter(_Params) ->
	playerSpiritArea:onEnterMap(?SpiritAreaMapID).

sp_skill(_) ->
	#globalsetupCfg{setpara = ListCareerAndSkillID} =
		getCfg:getCfgPStack(cfg_globalsetup, specEvent_1_skillID),
	case lists:keyfind(playerState:getCareer(), 1, ListCareerAndSkillID) of
		{_, SkillID} ->
			playerSkill:addSysSkill(SkillID, 1),
			{X, Y} = playerState:getPos(),
			playerSkill:onUseSkill(SkillID, [playerState:getPlayerCode()], 0, X, Y);
		_ ->
			skip
	end.

identity_edit(Params) ->
	{P1, P2, P3} =
		case Params of
			[] ->
				error;
			[P1_ | T1] ->
				case T1 of
					[] ->
						error;
					[P2_ | T2] ->
						case T2 of
							[] ->
								{erlang:list_to_integer(P1_), erlang:list_to_integer(P2_), {}};
							[P3_ | _] ->
								{erlang:list_to_integer(P1_), erlang:list_to_integer(P2_), erlang:list_to_integer(P3_)};
							_ ->
								error
						end;
					_ ->
						error
				end;
			_ ->
				error
		end,
	case P1 of
		?IDIT_AGE ->
			playerIdentity:editIdentity(P1, P2);
		?IDIT_BIRTH ->
			playerIdentity:editIdentity(P1, {P2, P3});
		?IDIT_ZODIAC ->
			playerIdentity:editIdentity(P1, P2);
		?IDIT_BLOOD ->
			playerIdentity:editIdentity(P1, P2);
		?IDIT_HOMETOWN ->
			playerIdentity:editIdentity(P1, {P2, P3});
		?IDIT_LOCATION ->
			playerIdentity:editIdentity(P1, {P2, P3});
		?IDIT_TAGS ->
			playerIdentity:editIdentity(P1, P2);
		_ ->
			error
	end.

friend2_add(Params) ->
	[P1 | _] = Params,
	TargetCode = playerState:getSelectTargetCode(),
	#rec_OnlinePlayer{roleID = ID} = playerMgrOtp:getOnlinePlayerInfoByCode(TargetCode),
	case erlang:list_to_integer(P1) of
		0 ->
			playerFriend2:add(ID);
		1 ->
			playerFriend2:addTemp(ID);
		2 ->
			playerFriend2:ban(ID);
		_ ->
			error
	end.

friend2_del(Params) ->
	[P1 | _] = Params,
	TargetCode = playerState:getSelectTargetCode(),
	#rec_OnlinePlayer{roleID = ID} = playerMgrOtp:getOnlinePlayerInfoByCode(TargetCode),
	case erlang:list_to_integer(P1) of
		0 ->
			playerFriend2:del(ID);
		1 ->
			playerFriend2:delTemp(ID);
		2 ->
			playerFriend2:unban(ID);
		_ ->
			error
	end.

friend2_exop(Params) ->
	[P1 | _] = Params,
	TargetCode = playerState:getSelectTargetCode(),
	#rec_OnlinePlayer{roleID = ID} = playerMgrOtp:getOnlinePlayerInfoByCode(TargetCode),
	playerFriend2:formalOP(ID, erlang:list_to_integer(P1)).

rune_addexp(Params) ->
	[P1 | T] = Params,
	[P2 | _] = T,
	playerRune:meltForGM(erlang:list_to_integer(P1), erlang:list_to_integer(P2)).

date_enter(Params) ->
	[P1 | T] = Params,  %% 玩法ID
	[P2 | _] = T,       %% 是否是GM模式（创建进入地图时免除绝大部分条件检测）
	P2_ =
		case erlang:list_to_integer(P2) of
			0 ->
				false;
			_ ->
				true
		end,
	playerDate:enterTry(erlang:list_to_integer(P1), P2_).

date_link(Params) ->
	[P1 | T1] = Params, %% 选中还是放开
	P1_ =
		case erlang:list_to_integer(P1) of
			0 ->
				false;
			_ ->
				true
		end,
	[P2 | _] = T1,      %% 0正常模式，1GM模式表示玩家A选中，2GM模式表示玩家B选中
	playerDate:link(P1_, erlang:list_to_integer(P2)).

date_link_end(Params) ->
	[P1 | _] = Params, %% 结算还是立即销毁
	P1_ =
		case erlang:list_to_integer(P1) of
			0 ->
				false;
			_ ->
				true
		end,
	playerDate:link_giveup(P1_).

date_link_reshuffe(Params) ->
	[P1 | _] = Params, %% 是否是GM模式，GM不受次数和冷却限制
	P1_ =
		case erlang:list_to_integer(P1) of
			0 ->
				false;
			_ ->
				true
		end,
	playerDate:link_reshuffle(P1_).

date_link_buff(Params) ->
	[P1 | _] = Params, %% BUFFTYPE
	playerDate:link_buff(erlang:list_to_integer(P1)).

shiftto(Params) ->
	[PX | T1] = Params, %% 目标X坐标
	[PY | _] = T1,     %% 目标Y坐标
	PX_ = erlang:list_to_integer(PX) * 1.0,
	PY_ = erlang:list_to_integer(PY) * 1.0,
	{SX, SY} = playerState:getPos(),
	case SX =/= PX_ orelse SY =/= PY_ of
		true ->
			MapID = playerState:getMapID(),
			playerMap:onLaterTransferPosAck(MapID, PX_, PY_);
		_ ->
			skip
	end.

addfriendliness(Params) ->
	[VS | _] = Params, %% 增加的友好度
	V = erlang:list_to_integer(VS),
	TargetCode = playerState:getSelectTargetCode(),
	RoleID = playerState:getRoleID(),
	case codeMgr:getObjectTypeByCode(TargetCode) of
		?ObjTypePlayer ->
			case playerMgrOtp:getOnlinePlayerInfoByCode(TargetCode) of
				#rec_OnlinePlayer{roleID = TargetRoleID} when TargetRoleID =/= RoleID ->
					Friend2Data = friend2State:queryFriend2Data(RoleID),
					case friend2State:queryRelation(Friend2Data, TargetRoleID) of
						#rec_friend2_relation{relation = ?RELATION_FORMAL} ->
							playerFriend2:closenessAdd(?ClosenessAddType_GM, RoleID, TargetRoleID, V);
						_ ->
							?ERROR_OUT("addfriendliness invalid Target! must select your formal friend!")
					end;
				_ ->
					?ERROR_OUT("addfriendliness invalid Target! can not select yourself!")
			end;
		_ ->
			?ERROR_OUT("addfriendliness invalid Target! must select player!")
	end.

map_syncgrid(_) ->
	{SX, SY} = playerState:getPos(),
	playerMap:syncChangePos(0.0, 0.0, SX, SY, true).

%% 让地图上的对象使用技能
map_useskill(Params) ->
	[Code | T1] = Params, %% 使用技能的主体Code
	[TargetCode | T2] = T1, %% 技能目标的Code
	[SkillID | _] = T2, %% 技能ID
	Code_ = erlang:list_to_integer(Code),
	TargetCode_ = erlang:list_to_integer(TargetCode),
	SkillID_ = erlang:list_to_integer(SkillID),
	%% 获取当前地图Pid
	Pid = playerState:getMapPid(),
	psMgr:sendMsg2PS(Pid, monsterUseSkill, {Code_, SkillID_, TargetCode_}).

%% ====================================================================
%% private functions
%% ====================================================================

-spec callMgrMap(MapID :: uint(), MsgID :: atom(), Msg :: term()) -> term().
callMgrMap(MapID, MsgID, Msg) ->
	case getCfg:getCfgPStack(cfg_mapsetting, MapID) of
		#mapsettingCfg{type = ?MapTypeNormal} ->
			%%发送到普通地图管理器
			psMgr:call(?PSNameNormalMapMgr, MsgID, Msg);
		_ ->
			%%发送到副本管理器
			psMgr:call(?PSNameCopyMapMgr, MsgID, Msg)
	end.

-spec canEnterMapLine(MapID :: uint(), MapPid :: pid(), Line :: uint()) -> string() | true.
canEnterMapLine(MapID, MapPid, Line) ->
	case getCfg:getCfgPStack(cfg_mapsetting, MapID) of
		#mapsettingCfg{type = ?MapTypeNormal} ->
			case callMgrMap(MapID, getLineList, {MapID}) of
				{ok, List} ->
					case lists:keyfind(Line, #recMapInfo.line, List) of
						false ->
							io_lib:format("current map no line: ~p", [Line]);
						_ ->
							{ok, #recMapInfo{line = CLine}} = callMgrMap(MapID, getLineInfo, {MapPid}),
							case CLine =:= Line of
								true ->
									io_lib:format("current line is:~p, can't switch line", [Line]);
								_ ->
									case playerState:getCurHp() > 0 orelse playerState:getActionStatus() =:= ?CreatureActionStatusDead of
										true ->
											true;
										_ ->
											"player dead, can't switch line"
									end
							end
					end;
				_ ->
					"error"
			end;
		_ ->
			"not normal map, can't switch line"
	end.


-spec string_to_integer(S) -> int() when
	S :: string().
string_to_integer(S) ->
	erlang:list_to_integer(S).


string_to_number(S)->
	case catch erlang:list_to_float(S) of
		{'EXIT', _}->
			erlang:list_to_integer(S);
		V ->
			V
	end.

now_microseconds() ->
	{MegaSecs, Secs, MicroSecs} = os:timestamp(),
	1000000000000 * MegaSecs + Secs * 1000000 + MicroSecs.

init_var(_) ->
	testVariant:init_var().
check_var(_) ->
	testVariant:check_var().
%% %%升级工会技能
%% uplv_guild_tec_skill([TecSkillLv])->
%% 			L=[1,2,3,4,5,6,7,8,9,10,11,12],
%% 	 	[playerGuildTechnology:up_lv_guild_tec_skill(E)||E<-L],
%% 	ok.
%% %%召唤工会神兽
%% call_guild_monster(_)->
%%  		playerGuildTechnology:call_guild_monster(),
%% 	ok.
%% %%使用工会宴席
%% use_guild_feast(_)->
%%  		playerGuildTechnology:use_guild_feast(),
%% 	ok.
%% %%参与工会喝酒
%% drink_guild_wine(_)->
%%  		playerGuildTechnology:drink_wine(),
%% 	ok.

goto_exp_map(_) ->
	RoleBaseArgu = logicArguLib:getRoleBaseInfoArgu(),
	MapIdArgu = logicArguLib:getCurrentMapId(),
	R = logicLib:runLogicGroup(?LOGIC_GROUP_ID_ENTER_EXP_MAP, [RoleBaseArgu, MapIdArgu]),
	?DEBUG_OUT("==oldmapPos==~w~n", [playerState:getOldMapPos()]),
	?DEBUG_OUT("R=====~p~n", [R]),
	ok.

on_exp_map(_) ->
	RoleBaseArgu = logicArguLib:getRoleBaseInfoArgu(),
	MapIdArgu = logicArguLib:getCurrentMapId(),
	R = logicLib:runLogicGroup(?LOGIC_ID_ON_EXP_MAP, [RoleBaseArgu, MapIdArgu]),
	?DEBUG_OUT("R=====~p~n", [R]),
	ok.

runLogicGroup(A) ->
	[LogicGroupIDStr | _] = A,
	LogicGroupID = erlang:list_to_integer(LogicGroupIDStr),
	RoleBaseArgu = logicArguLib:getRoleBaseInfoArgu(),
	MapIdArgu = logicArguLib:getCurrentMapId(),
	DailyCounterArgu = logicArguLib:getDailyCountArgu(?DailyType_EXP_MAP_EFFECT_TIME, 0, 60000),
	R = logicLib:runLogicGroup(LogicGroupID, [RoleBaseArgu, MapIdArgu, DailyCounterArgu]),
	?DEBUG_OUT("runLogic=====R=~p~n", [R]),
	ok.

run_method([Module, Method | _]) ->
	AtomModule = erlang:list_to_atom(Module),
	AtomMethod = erlang:list_to_atom(Method),
	AtomModule:AtomMethod().

ladder1v1(_) ->
%% 	playerLadder1v1:rankSortRiseAward(2991,2989),
%% 	playerLadder1v1:rankSortRiseAward(2991,999),
	playerLadder1v1:rankSortRiseAward(2001, 1712).
%%	playerLadder1v1:rankSortRiseAward(2500,2300).


getactionpoint(_) ->
	playerActionPoint:getActionPoint().
deductactionpoint(A) ->
	[DeductValue | _] = A,
	playerActionPoint:deductActionPoint(erlang:list_to_integer(DeductValue)).

addactionpoint(A) ->
	[AddValue | _] = A,
	playerActionPoint:addActionPoint(erlang:list_to_integer(AddValue)).

accuReward(A) ->
	[IDStr | _] = A,
	ID = erlang:list_to_integer(IDStr),
	playerDailySignIn:accuReward(ID).

resetpb(_) ->
	playerPetDouble:doubleMountOff().

petab(A) ->
	[ID | T1] = A,
	[Status | _] = T1,
	playerPet:petAssistBattle(
		1,
		list_to_integer(ID),
		list_to_integer(Status)
	).

gotomt(A) ->
	[IDStr | _] = A,
	CopyMapID = erlang:list_to_integer(IDStr),
	case playerCopyMap:canEnterCopyMap(CopyMapID) of
		true ->
			playerMaterialCopy:onEnterMap(CopyMapID);
		ErrorCode ->
			playerMsg:sendErrorCodeMsg(ErrorCode)
	end.

finishmt(_) ->
	playerMaterialCopy:gmfinish().

fashionSuit(A) ->
	[ID | T1] = A,
	[Op | _] = T1,
	playerFashion:activeFashionSuit(list_to_integer(ID),
		misc:convertBoolFromInt( list_to_integer(Op) )).

resetSkill(_) ->
	playerSkillLearn:resetSkill().

cc(A) ->
	[NewCareer | _] = A,
	playerCareerChange:change(list_to_integer(NewCareer)).


upgw(A) ->
	[IDStr | _] = A,
	WeaponID = erlang:list_to_integer(IDStr),
	playerGodWeapon:levelupWeapon(WeaponID).

recast(A) ->
	[EquipPos, RecastType , OpType | _] = A,
	playerEquip:equipRecast(list_to_integer(EquipPos), list_to_integer(RecastType), list_to_integer(OpType), []).

skipSkill(A)->
	[Flag | _] = A,
	playerState:setSkipSkillCheck(misc:convertBoolFromInt(list_to_integer(Flag))).




