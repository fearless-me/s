%% coding: latin-1
%%: 实现
-module(cfg_guild_ride_chs).
-compile(export_all).
-include("cfg_guild_ride.hrl").
-include("logger.hrl").

getRow(1,1)->
    #guild_rideCfg {
    id = 1,
    level = 1,
    npcId = 30010,
    open = 1,
    costType = 106,
    costValue = 0,
    playerMax = 6,
    maintain = 200,
    upgrade = 1000,
    upgradePower = 3,
    timeMin = 60,
    timeMax = 120,
    buffID = 61501,
    des = "转啊~转啊~我的骄傲放纵！",
    rewardDes = "旋转超过[00ff00]1分钟[-]可获得旋转BUFF和家族贡献值！每日获取上限480点。",
    weapon_hiden = 1,
    playspeed = 0.1,
    animation_1 = 1,
    name = "旋转木马",
    background = "guild_trojan",
    camera = [{-3.87,3.49,-12.45},{6.5,20.33,0.45}],
    guild_contribution = [4,480]
    };
getRow(1,2)->
    #guild_rideCfg {
    id = 1,
    level = 2,
    npcId = 30010,
    open = 1,
    costType = 106,
    costValue = 0,
    playerMax = 6,
    maintain = 200,
    upgrade = 2000,
    upgradePower = 3,
    timeMin = 60,
    timeMax = 120,
    buffID = 61502,
    des = "转啊~转啊~我的骄傲放纵！",
    rewardDes = "旋转超过[00ff00]1分钟[-]可获得旋转BUFF和家族贡献值！每日获取上限480点。",
    weapon_hiden = 1,
    playspeed = 0.1,
    animation_1 = 1,
    name = "旋转木马",
    background = "guild_trojan",
    camera = [{-3.87,3.49,-12.45},{6.5,20.33,0.45}],
    guild_contribution = [4,480]
    };
getRow(1,3)->
    #guild_rideCfg {
    id = 1,
    level = 3,
    npcId = 30010,
    open = 1,
    costType = 106,
    costValue = 0,
    playerMax = 6,
    maintain = 200,
    upgrade = 3000,
    upgradePower = 3,
    timeMin = 60,
    timeMax = 120,
    buffID = 61503,
    des = "转啊~转啊~我的骄傲放纵！",
    rewardDes = "旋转超过[00ff00]1分钟[-]可获得旋转BUFF和家族贡献值！每日获取上限480点。",
    weapon_hiden = 1,
    playspeed = 0.1,
    animation_1 = 1,
    name = "旋转木马",
    background = "guild_trojan",
    camera = [{-3.87,3.49,-12.45},{6.5,20.33,0.45}],
    guild_contribution = [4,480]
    };
getRow(1,4)->
    #guild_rideCfg {
    id = 1,
    level = 4,
    npcId = 30010,
    open = 1,
    costType = 106,
    costValue = 0,
    playerMax = 6,
    maintain = 200,
    upgrade = 4000,
    upgradePower = 3,
    timeMin = 60,
    timeMax = 120,
    buffID = 61504,
    des = "转啊~转啊~我的骄傲放纵！",
    rewardDes = "旋转超过[00ff00]1分钟[-]可获得旋转BUFF和家族贡献值！每日获取上限480点。",
    weapon_hiden = 1,
    playspeed = 0.1,
    animation_1 = 1,
    name = "旋转木马",
    background = "guild_trojan",
    camera = [{-3.87,3.49,-12.45},{6.5,20.33,0.45}],
    guild_contribution = [4,480]
    };
getRow(1,5)->
    #guild_rideCfg {
    id = 1,
    level = 5,
    npcId = 30010,
    open = 1,
    costType = 106,
    costValue = 0,
    playerMax = 6,
    maintain = 200,
    upgrade = 5000,
    upgradePower = 3,
    timeMin = 60,
    timeMax = 120,
    buffID = 61505,
    des = "转啊~转啊~我的骄傲放纵！",
    rewardDes = "旋转超过[00ff00]1分钟[-]可获得旋转BUFF和家族贡献值！每日获取上限480点。",
    weapon_hiden = 1,
    playspeed = 0.1,
    animation_1 = 1,
    name = "旋转木马",
    background = "guild_trojan",
    camera = [{-3.87,3.49,-12.45},{6.5,20.33,0.45}],
    guild_contribution = [4,480]
    };
getRow(1,6)->
    #guild_rideCfg {
    id = 1,
    level = 6,
    npcId = 30010,
    open = 1,
    costType = 106,
    costValue = 0,
    playerMax = 6,
    maintain = 200,
    upgrade = 6000,
    upgradePower = 3,
    timeMin = 60,
    timeMax = 120,
    buffID = 61506,
    des = "转啊~转啊~我的骄傲放纵！",
    rewardDes = "旋转超过[00ff00]1分钟[-]可获得旋转BUFF和家族贡献值！每日获取上限480点。",
    weapon_hiden = 1,
    playspeed = 0.1,
    animation_1 = 1,
    name = "旋转木马",
    background = "guild_trojan",
    camera = [{-3.87,3.49,-12.45},{6.5,20.33,0.45}],
    guild_contribution = [4,480]
    };
getRow(1,7)->
    #guild_rideCfg {
    id = 1,
    level = 7,
    npcId = 30010,
    open = 1,
    costType = 106,
    costValue = 0,
    playerMax = 6,
    maintain = 200,
    upgrade = 7000,
    upgradePower = 3,
    timeMin = 60,
    timeMax = 120,
    buffID = 61507,
    des = "转啊~转啊~我的骄傲放纵！",
    rewardDes = "旋转超过[00ff00]1分钟[-]可获得旋转BUFF和家族贡献值！每日获取上限480点。",
    weapon_hiden = 1,
    playspeed = 0.1,
    animation_1 = 1,
    name = "旋转木马",
    background = "guild_trojan",
    camera = [{-3.87,3.49,-12.45},{6.5,20.33,0.45}],
    guild_contribution = [4,480]
    };
getRow(2,1)->
    #guild_rideCfg {
    id = 2,
    level = 1,
    npcId = 30011,
    open = 1,
    costType = 106,
    costValue = 0,
    playerMax = 6,
    maintain = 200,
    upgrade = 1000,
    upgradePower = 3,
    timeMin = 60,
    timeMax = 120,
    buffID = 61601,
    des = "慢悠悠的，我带你上天！",
    rewardDes = "乘坐[00ff00]1分钟[-]以上，可获得BUFF和家族贡献值！每日获取上限480点。",
    weapon_hiden = 1,
    playspeed = 0.2,
    animation_1 = 1,
    name = "摩天轮",
    background = "guild_wheel",
    camera = [{-5.09,8.68,-9.25},{15.6,41.3,6.64}],
    guild_contribution = [4,480]
    };
getRow(2,2)->
    #guild_rideCfg {
    id = 2,
    level = 2,
    npcId = 30011,
    open = 1,
    costType = 106,
    costValue = 0,
    playerMax = 6,
    maintain = 200,
    upgrade = 2000,
    upgradePower = 3,
    timeMin = 60,
    timeMax = 120,
    buffID = 61602,
    des = "慢悠悠的，我带你上天！",
    rewardDes = "乘坐[00ff00]1分钟[-]以上，可获得BUFF和家族贡献值！每日获取上限480点。",
    weapon_hiden = 1,
    playspeed = 0.2,
    animation_1 = 1,
    name = "摩天轮",
    background = "guild_wheel",
    camera = [{-5.09,8.68,-9.25},{15.6,41.3,6.64}],
    guild_contribution = [4,480]
    };
getRow(2,3)->
    #guild_rideCfg {
    id = 2,
    level = 3,
    npcId = 30011,
    open = 1,
    costType = 106,
    costValue = 0,
    playerMax = 6,
    maintain = 200,
    upgrade = 3000,
    upgradePower = 3,
    timeMin = 60,
    timeMax = 120,
    buffID = 61603,
    des = "慢悠悠的，我带你上天！",
    rewardDes = "乘坐[00ff00]1分钟[-]以上，可获得BUFF和家族贡献值！每日获取上限480点。",
    weapon_hiden = 1,
    playspeed = 0.2,
    animation_1 = 1,
    name = "摩天轮",
    background = "guild_wheel",
    camera = [{-5.09,8.68,-9.25},{15.6,41.3,6.64}],
    guild_contribution = [4,480]
    };
getRow(2,4)->
    #guild_rideCfg {
    id = 2,
    level = 4,
    npcId = 30011,
    open = 1,
    costType = 106,
    costValue = 0,
    playerMax = 6,
    maintain = 200,
    upgrade = 4000,
    upgradePower = 3,
    timeMin = 60,
    timeMax = 120,
    buffID = 61604,
    des = "慢悠悠的，我带你上天！",
    rewardDes = "乘坐[00ff00]1分钟[-]以上，可获得BUFF和家族贡献值！每日获取上限480点。",
    weapon_hiden = 1,
    playspeed = 0.2,
    animation_1 = 1,
    name = "摩天轮",
    background = "guild_wheel",
    camera = [{-5.09,8.68,-9.25},{15.6,41.3,6.64}],
    guild_contribution = [4,480]
    };
getRow(2,5)->
    #guild_rideCfg {
    id = 2,
    level = 5,
    npcId = 30011,
    open = 1,
    costType = 106,
    costValue = 0,
    playerMax = 6,
    maintain = 200,
    upgrade = 5000,
    upgradePower = 3,
    timeMin = 60,
    timeMax = 120,
    buffID = 61605,
    des = "慢悠悠的，我带你上天！",
    rewardDes = "乘坐[00ff00]1分钟[-]以上，可获得BUFF和家族贡献值！每日获取上限480点。",
    weapon_hiden = 1,
    playspeed = 0.2,
    animation_1 = 1,
    name = "摩天轮",
    background = "guild_wheel",
    camera = [{-5.09,8.68,-9.25},{15.6,41.3,6.64}],
    guild_contribution = [4,480]
    };
getRow(2,6)->
    #guild_rideCfg {
    id = 2,
    level = 6,
    npcId = 30011,
    open = 1,
    costType = 106,
    costValue = 0,
    playerMax = 6,
    maintain = 200,
    upgrade = 6000,
    upgradePower = 3,
    timeMin = 60,
    timeMax = 120,
    buffID = 61606,
    des = "慢悠悠的，我带你上天！",
    rewardDes = "乘坐[00ff00]1分钟[-]以上，可获得BUFF和家族贡献值！每日获取上限480点。",
    weapon_hiden = 1,
    playspeed = 0.2,
    animation_1 = 1,
    name = "摩天轮",
    background = "guild_wheel",
    camera = [{-5.09,8.68,-9.25},{15.6,41.3,6.64}],
    guild_contribution = [4,480]
    };
getRow(2,7)->
    #guild_rideCfg {
    id = 2,
    level = 7,
    npcId = 30011,
    open = 1,
    costType = 106,
    costValue = 0,
    playerMax = 6,
    maintain = 200,
    upgrade = 7000,
    upgradePower = 3,
    timeMin = 60,
    timeMax = 120,
    buffID = 61607,
    des = "慢悠悠的，我带你上天！",
    rewardDes = "乘坐[00ff00]1分钟[-]以上，可获得BUFF和家族贡献值！每日获取上限480点。",
    weapon_hiden = 1,
    playspeed = 0.2,
    animation_1 = 1,
    name = "摩天轮",
    background = "guild_wheel",
    camera = [{-5.09,8.68,-9.25},{15.6,41.3,6.64}],
    guild_contribution = [4,480]
    };
getRow(3,1)->
    #guild_rideCfg {
    id = 3,
    level = 1,
    npcId = 30012,
    open = 3,
    costType = 106,
    costValue = 0,
    playerMax = 6,
    maintain = 200,
    upgrade = 1000,
    upgradePower = 3,
    timeMin = 60,
    timeMax = 120,
    buffID = 61701,
    des = "摇摆不定的船，就如你那荡漾的心！",
    rewardDes = "乘坐[00ff00]1分钟[-]以上，可获得BUFF和家族贡献值！每日获取上限480点。",
    weapon_hiden = 1,
    playspeed = 1,
    animation_1 = 1,
    name = "海盗船",
    background = "guild_ship",
    camera = [{17,9.5,0.47},{18.3,-90,1.26}],
    guild_contribution = [4,480]
    };
getRow(3,2)->
    #guild_rideCfg {
    id = 3,
    level = 2,
    npcId = 30012,
    open = 3,
    costType = 106,
    costValue = 0,
    playerMax = 6,
    maintain = 200,
    upgrade = 2000,
    upgradePower = 3,
    timeMin = 60,
    timeMax = 120,
    buffID = 61702,
    des = "摇摆不定的船，就如你那荡漾的心！",
    rewardDes = "乘坐[00ff00]1分钟[-]以上，可获得BUFF和家族贡献值！每日获取上限480点。",
    weapon_hiden = 1,
    playspeed = 1,
    animation_1 = 1,
    name = "海盗船",
    background = "guild_ship",
    camera = [{17,9.5,0.47},{18.3,-90,1.26}],
    guild_contribution = [4,480]
    };
getRow(3,3)->
    #guild_rideCfg {
    id = 3,
    level = 3,
    npcId = 30012,
    open = 3,
    costType = 106,
    costValue = 0,
    playerMax = 6,
    maintain = 200,
    upgrade = 3000,
    upgradePower = 3,
    timeMin = 60,
    timeMax = 120,
    buffID = 61703,
    des = "摇摆不定的船，就如你那荡漾的心！",
    rewardDes = "乘坐[00ff00]1分钟[-]以上，可获得BUFF和家族贡献值！每日获取上限480点。",
    weapon_hiden = 1,
    playspeed = 1,
    animation_1 = 1,
    name = "海盗船",
    background = "guild_ship",
    camera = [{17,9.5,0.47},{18.3,-90,1.26}],
    guild_contribution = [4,480]
    };
getRow(3,4)->
    #guild_rideCfg {
    id = 3,
    level = 4,
    npcId = 30012,
    open = 3,
    costType = 106,
    costValue = 0,
    playerMax = 6,
    maintain = 200,
    upgrade = 4000,
    upgradePower = 3,
    timeMin = 60,
    timeMax = 120,
    buffID = 61704,
    des = "摇摆不定的船，就如你那荡漾的心！",
    rewardDes = "乘坐[00ff00]1分钟[-]以上，可获得BUFF和家族贡献值！每日获取上限480点。",
    weapon_hiden = 1,
    playspeed = 1,
    animation_1 = 1,
    name = "海盗船",
    background = "guild_ship",
    camera = [{17,9.5,0.47},{18.3,-90,1.26}],
    guild_contribution = [4,480]
    };
getRow(3,5)->
    #guild_rideCfg {
    id = 3,
    level = 5,
    npcId = 30012,
    open = 3,
    costType = 106,
    costValue = 0,
    playerMax = 6,
    maintain = 200,
    upgrade = 5000,
    upgradePower = 3,
    timeMin = 60,
    timeMax = 120,
    buffID = 61705,
    des = "摇摆不定的船，就如你那荡漾的心！",
    rewardDes = "乘坐[00ff00]1分钟[-]以上，可获得BUFF和家族贡献值！每日获取上限480点。",
    weapon_hiden = 1,
    playspeed = 1,
    animation_1 = 1,
    name = "海盗船",
    background = "guild_ship",
    camera = [{17,9.5,0.47},{18.3,-90,1.26}],
    guild_contribution = [4,480]
    };
getRow(3,6)->
    #guild_rideCfg {
    id = 3,
    level = 6,
    npcId = 30012,
    open = 3,
    costType = 106,
    costValue = 0,
    playerMax = 6,
    maintain = 200,
    upgrade = 6000,
    upgradePower = 3,
    timeMin = 60,
    timeMax = 120,
    buffID = 61706,
    des = "摇摆不定的船，就如你那荡漾的心！",
    rewardDes = "乘坐[00ff00]1分钟[-]以上，可获得BUFF和家族贡献值！每日获取上限480点。",
    weapon_hiden = 1,
    playspeed = 1,
    animation_1 = 1,
    name = "海盗船",
    background = "guild_ship",
    camera = [{17,9.5,0.47},{18.3,-90,1.26}],
    guild_contribution = [4,480]
    };
getRow(3,7)->
    #guild_rideCfg {
    id = 3,
    level = 7,
    npcId = 30012,
    open = 3,
    costType = 106,
    costValue = 0,
    playerMax = 6,
    maintain = 200,
    upgrade = 7000,
    upgradePower = 3,
    timeMin = 60,
    timeMax = 120,
    buffID = 61707,
    des = "摇摆不定的船，就如你那荡漾的心！",
    rewardDes = "乘坐[00ff00]1分钟[-]以上，可获得BUFF和家族贡献值！每日获取上限480点。",
    weapon_hiden = 1,
    playspeed = 1,
    animation_1 = 1,
    name = "海盗船",
    background = "guild_ship",
    camera = [{17,9.5,0.47},{18.3,-90,1.26}],
    guild_contribution = [4,480]
    };
getRow(4,1)->
    #guild_rideCfg {
    id = 4,
    level = 1,
    npcId = 30013,
    open = 2,
    costType = 106,
    costValue = 0,
    playerMax = 6,
    maintain = 200,
    upgrade = 1000,
    upgradePower = 3,
    timeMin = 60,
    timeMax = 120,
    buffID = 61801,
    des = "放开双手，我在远方等你！",
    rewardDes = "乘坐[00ff00]1分钟[-]以上，可获得BUFF和家族贡献值！每日获取上限480点。",
    weapon_hiden = 1,
    playspeed = 0.1,
    animation_1 = 1,
    name = "旋转飞椅",
    background = "guild_chair",
    camera = [{-5.71,13.46,-13.5},{36.5,25.62,-37.4}],
    guild_contribution = [4,480]
    };
getRow(4,2)->
    #guild_rideCfg {
    id = 4,
    level = 2,
    npcId = 30013,
    open = 2,
    costType = 106,
    costValue = 0,
    playerMax = 6,
    maintain = 200,
    upgrade = 2000,
    upgradePower = 3,
    timeMin = 60,
    timeMax = 120,
    buffID = 61802,
    des = "放开双手，我在远方等你！",
    rewardDes = "乘坐[00ff00]1分钟[-]以上，可获得BUFF和家族贡献值！每日获取上限480点。",
    weapon_hiden = 1,
    playspeed = 0.1,
    animation_1 = 1,
    name = "旋转飞椅",
    background = "guild_chair",
    camera = [{-5.71,13.46,-13.5},{36.5,25.62,-37.4}],
    guild_contribution = [4,480]
    };
getRow(4,3)->
    #guild_rideCfg {
    id = 4,
    level = 3,
    npcId = 30013,
    open = 2,
    costType = 106,
    costValue = 0,
    playerMax = 6,
    maintain = 200,
    upgrade = 3000,
    upgradePower = 3,
    timeMin = 60,
    timeMax = 120,
    buffID = 61803,
    des = "放开双手，我在远方等你！",
    rewardDes = "乘坐[00ff00]1分钟[-]以上，可获得BUFF和家族贡献值！每日获取上限480点。",
    weapon_hiden = 1,
    playspeed = 0.1,
    animation_1 = 1,
    name = "旋转飞椅",
    background = "guild_chair",
    camera = [{-5.71,13.46,-13.5},{36.5,25.62,-37.4}],
    guild_contribution = [4,480]
    };
getRow(4,4)->
    #guild_rideCfg {
    id = 4,
    level = 4,
    npcId = 30013,
    open = 2,
    costType = 106,
    costValue = 0,
    playerMax = 6,
    maintain = 200,
    upgrade = 4000,
    upgradePower = 3,
    timeMin = 60,
    timeMax = 120,
    buffID = 61804,
    des = "放开双手，我在远方等你！",
    rewardDes = "乘坐[00ff00]1分钟[-]以上，可获得BUFF和家族贡献值！每日获取上限480点。",
    weapon_hiden = 1,
    playspeed = 0.1,
    animation_1 = 1,
    name = "旋转飞椅",
    background = "guild_chair",
    camera = [{-5.71,13.46,-13.5},{36.5,25.62,-37.4}],
    guild_contribution = [4,480]
    };
getRow(4,5)->
    #guild_rideCfg {
    id = 4,
    level = 5,
    npcId = 30013,
    open = 2,
    costType = 106,
    costValue = 0,
    playerMax = 6,
    maintain = 200,
    upgrade = 5000,
    upgradePower = 3,
    timeMin = 60,
    timeMax = 120,
    buffID = 61805,
    des = "放开双手，我在远方等你！",
    rewardDes = "乘坐[00ff00]1分钟[-]以上，可获得BUFF和家族贡献值！每日获取上限480点。",
    weapon_hiden = 1,
    playspeed = 0.1,
    animation_1 = 1,
    name = "旋转飞椅",
    background = "guild_chair",
    camera = [{-5.71,13.46,-13.5},{36.5,25.62,-37.4}],
    guild_contribution = [4,480]
    };
getRow(4,6)->
    #guild_rideCfg {
    id = 4,
    level = 6,
    npcId = 30013,
    open = 2,
    costType = 106,
    costValue = 0,
    playerMax = 6,
    maintain = 200,
    upgrade = 6000,
    upgradePower = 3,
    timeMin = 60,
    timeMax = 120,
    buffID = 61806,
    des = "放开双手，我在远方等你！",
    rewardDes = "乘坐[00ff00]1分钟[-]以上，可获得BUFF和家族贡献值！每日获取上限480点。",
    weapon_hiden = 1,
    playspeed = 0.1,
    animation_1 = 1,
    name = "旋转飞椅",
    background = "guild_chair",
    camera = [{-5.71,13.46,-13.5},{36.5,25.62,-37.4}],
    guild_contribution = [4,480]
    };
getRow(4,7)->
    #guild_rideCfg {
    id = 4,
    level = 7,
    npcId = 30013,
    open = 2,
    costType = 106,
    costValue = 0,
    playerMax = 6,
    maintain = 200,
    upgrade = 7000,
    upgradePower = 3,
    timeMin = 60,
    timeMax = 120,
    buffID = 61807,
    des = "放开双手，我在远方等你！",
    rewardDes = "乘坐[00ff00]1分钟[-]以上，可获得BUFF和家族贡献值！每日获取上限480点。",
    weapon_hiden = 1,
    playspeed = 0.1,
    animation_1 = 1,
    name = "旋转飞椅",
    background = "guild_chair",
    camera = [{-5.71,13.46,-13.5},{36.5,25.62,-37.4}],
    guild_contribution = [4,480]
    };
getRow(5,1)->
    #guild_rideCfg {
    id = 5,
    level = 1,
    npcId = 30014,
    open = 4,
    costType = 106,
    costValue = 0,
    playerMax = 6,
    maintain = 200,
    upgrade = 1000,
    upgradePower = 3,
    timeMin = 60,
    timeMax = 120,
    buffID = 61901,
    des = "呜呜呜~~开车啦！乘客们，请坐好！",
    rewardDes = "乘坐[00ff00]1分钟[-]以上，可获得BUFF和家族贡献值！每日获取上限480点。",
    weapon_hiden = 1,
    playspeed = 1,
    animation_1 = 1,
    name = "青龙列车",
    background = "guild_train",
    camera = [{-21.32,9.26,-22.42},{11,48.7,0}],
    guild_contribution = [4,480]
    };
getRow(5,2)->
    #guild_rideCfg {
    id = 5,
    level = 2,
    npcId = 30014,
    open = 4,
    costType = 106,
    costValue = 0,
    playerMax = 6,
    maintain = 200,
    upgrade = 2000,
    upgradePower = 3,
    timeMin = 60,
    timeMax = 120,
    buffID = 61902,
    des = "呜呜呜~~开车啦！乘客们，请坐好！",
    rewardDes = "乘坐[00ff00]1分钟[-]以上，可获得BUFF和家族贡献值！每日获取上限480点。",
    weapon_hiden = 1,
    playspeed = 1,
    animation_1 = 1,
    name = "青龙列车",
    background = "guild_train",
    camera = [{-21.32,9.26,-22.42},{11,48.7,0}],
    guild_contribution = [4,480]
    };
getRow(5,3)->
    #guild_rideCfg {
    id = 5,
    level = 3,
    npcId = 30014,
    open = 4,
    costType = 106,
    costValue = 0,
    playerMax = 6,
    maintain = 200,
    upgrade = 3000,
    upgradePower = 3,
    timeMin = 60,
    timeMax = 120,
    buffID = 61903,
    des = "呜呜呜~~开车啦！乘客们，请坐好！",
    rewardDes = "乘坐[00ff00]1分钟[-]以上，可获得BUFF和家族贡献值！每日获取上限480点。",
    weapon_hiden = 1,
    playspeed = 1,
    animation_1 = 1,
    name = "青龙列车",
    background = "guild_train",
    camera = [{-21.32,9.26,-22.42},{11,48.7,0}],
    guild_contribution = [4,480]
    };
getRow(5,4)->
    #guild_rideCfg {
    id = 5,
    level = 4,
    npcId = 30014,
    open = 4,
    costType = 106,
    costValue = 0,
    playerMax = 6,
    maintain = 200,
    upgrade = 4000,
    upgradePower = 3,
    timeMin = 60,
    timeMax = 120,
    buffID = 61904,
    des = "呜呜呜~~开车啦！乘客们，请坐好！",
    rewardDes = "乘坐[00ff00]1分钟[-]以上，可获得BUFF和家族贡献值！每日获取上限480点。",
    weapon_hiden = 1,
    playspeed = 1,
    animation_1 = 1,
    name = "青龙列车",
    background = "guild_train",
    camera = [{-21.32,9.26,-22.42},{11,48.7,0}],
    guild_contribution = [4,480]
    };
getRow(5,5)->
    #guild_rideCfg {
    id = 5,
    level = 5,
    npcId = 30014,
    open = 4,
    costType = 106,
    costValue = 0,
    playerMax = 6,
    maintain = 200,
    upgrade = 5000,
    upgradePower = 3,
    timeMin = 60,
    timeMax = 120,
    buffID = 61905,
    des = "呜呜呜~~开车啦！乘客们，请坐好！",
    rewardDes = "乘坐[00ff00]1分钟[-]以上，可获得BUFF和家族贡献值！每日获取上限480点。",
    weapon_hiden = 1,
    playspeed = 1,
    animation_1 = 1,
    name = "青龙列车",
    background = "guild_train",
    camera = [{-21.32,9.26,-22.42},{11,48.7,0}],
    guild_contribution = [4,480]
    };
getRow(5,6)->
    #guild_rideCfg {
    id = 5,
    level = 6,
    npcId = 30014,
    open = 4,
    costType = 106,
    costValue = 0,
    playerMax = 6,
    maintain = 200,
    upgrade = 6000,
    upgradePower = 3,
    timeMin = 60,
    timeMax = 120,
    buffID = 61906,
    des = "呜呜呜~~开车啦！乘客们，请坐好！",
    rewardDes = "乘坐[00ff00]1分钟[-]以上，可获得BUFF和家族贡献值！每日获取上限480点。",
    weapon_hiden = 1,
    playspeed = 1,
    animation_1 = 1,
    name = "青龙列车",
    background = "guild_train",
    camera = [{-21.32,9.26,-22.42},{11,48.7,0}],
    guild_contribution = [4,480]
    };
getRow(5,7)->
    #guild_rideCfg {
    id = 5,
    level = 7,
    npcId = 30014,
    open = 4,
    costType = 106,
    costValue = 0,
    playerMax = 6,
    maintain = 200,
    upgrade = 7000,
    upgradePower = 3,
    timeMin = 60,
    timeMax = 120,
    buffID = 61907,
    des = "呜呜呜~~开车啦！乘客们，请坐好！",
    rewardDes = "乘坐[00ff00]1分钟[-]以上，可获得BUFF和家族贡献值！每日获取上限480点。",
    weapon_hiden = 1,
    playspeed = 1,
    animation_1 = 1,
    name = "青龙列车",
    background = "guild_train",
    camera = [{-21.32,9.26,-22.42},{11,48.7,0}],
    guild_contribution = [4,480]
    };
getRow(6,1)->
    #guild_rideCfg {
    id = 6,
    level = 1,
    npcId = 30015,
    open = 1,
    costType = 106,
    costValue = 0,
    playerMax = 6,
    maintain = 200,
    upgrade = 1000,
    upgradePower = 3,
    timeMin = 60,
    timeMax = 120,
    buffID = 62001,
    des = "浓浓的爱的味道！",
    rewardDes = "不同的爱给你不同的味道，不同的BUFF！",
    weapon_hiden = 1,
    playspeed = 0.2,
    animation_1 = 1,
    name = "冰淇淋车",
    background = "guild_car",
    camera = [{0,0,0},{0,0,0}],
    guild_contribution = []
    };
getRow(6,2)->
    #guild_rideCfg {
    id = 6,
    level = 2,
    npcId = 30015,
    open = 1,
    costType = 106,
    costValue = 0,
    playerMax = 6,
    maintain = 200,
    upgrade = 2000,
    upgradePower = 3,
    timeMin = 60,
    timeMax = 120,
    buffID = 62002,
    des = "浓浓的爱的味道！",
    rewardDes = "不同的爱给你不同的味道，不同的BUFF！",
    weapon_hiden = 1,
    playspeed = 0.2,
    animation_1 = 1,
    name = "冰淇淋车",
    background = "guild_car",
    camera = [{0,0,0},{0,0,0}],
    guild_contribution = []
    };
getRow(6,3)->
    #guild_rideCfg {
    id = 6,
    level = 3,
    npcId = 30015,
    open = 1,
    costType = 106,
    costValue = 0,
    playerMax = 6,
    maintain = 200,
    upgrade = 3000,
    upgradePower = 3,
    timeMin = 60,
    timeMax = 120,
    buffID = 62003,
    des = "浓浓的爱的味道！",
    rewardDes = "不同的爱给你不同的味道，不同的BUFF！",
    weapon_hiden = 1,
    playspeed = 0.2,
    animation_1 = 1,
    name = "冰淇淋车",
    background = "guild_car",
    camera = [{0,0,0},{0,0,0}],
    guild_contribution = []
    };
getRow(6,4)->
    #guild_rideCfg {
    id = 6,
    level = 4,
    npcId = 30015,
    open = 1,
    costType = 106,
    costValue = 0,
    playerMax = 6,
    maintain = 200,
    upgrade = 4000,
    upgradePower = 3,
    timeMin = 60,
    timeMax = 120,
    buffID = 62004,
    des = "浓浓的爱的味道！",
    rewardDes = "不同的爱给你不同的味道，不同的BUFF！",
    weapon_hiden = 1,
    playspeed = 0.2,
    animation_1 = 1,
    name = "冰淇淋车",
    background = "guild_car",
    camera = [{0,0,0},{0,0,0}],
    guild_contribution = []
    };
getRow(6,5)->
    #guild_rideCfg {
    id = 6,
    level = 5,
    npcId = 30015,
    open = 1,
    costType = 106,
    costValue = 0,
    playerMax = 6,
    maintain = 200,
    upgrade = 5000,
    upgradePower = 3,
    timeMin = 60,
    timeMax = 120,
    buffID = 62005,
    des = "浓浓的爱的味道！",
    rewardDes = "不同的爱给你不同的味道，不同的BUFF！",
    weapon_hiden = 1,
    playspeed = 0.2,
    animation_1 = 1,
    name = "冰淇淋车",
    background = "guild_car",
    camera = [{0,0,0},{0,0,0}],
    guild_contribution = []
    };
getRow(6,6)->
    #guild_rideCfg {
    id = 6,
    level = 6,
    npcId = 30015,
    open = 1,
    costType = 106,
    costValue = 0,
    playerMax = 6,
    maintain = 200,
    upgrade = 6000,
    upgradePower = 3,
    timeMin = 60,
    timeMax = 120,
    buffID = 62006,
    des = "浓浓的爱的味道！",
    rewardDes = "不同的爱给你不同的味道，不同的BUFF！",
    weapon_hiden = 1,
    playspeed = 0.2,
    animation_1 = 1,
    name = "冰淇淋车",
    background = "guild_car",
    camera = [{0,0,0},{0,0,0}],
    guild_contribution = []
    };
getRow(6,7)->
    #guild_rideCfg {
    id = 6,
    level = 7,
    npcId = 30015,
    open = 1,
    costType = 106,
    costValue = 0,
    playerMax = 6,
    maintain = 200,
    upgrade = 7000,
    upgradePower = 3,
    timeMin = 60,
    timeMax = 120,
    buffID = 62007,
    des = "浓浓的爱的味道！",
    rewardDes = "不同的爱给你不同的味道，不同的BUFF！",
    weapon_hiden = 1,
    playspeed = 0.2,
    animation_1 = 1,
    name = "冰淇淋车",
    background = "guild_car",
    camera = [{0,0,0},{0,0,0}],
    guild_contribution = []
    };
getRow(_,_)->[].

getKeyList()->[
    {1,1},
    {1,2},
    {1,3},
    {1,4},
    {1,5},
    {1,6},
    {1,7},
    {2,1},
    {2,2},
    {2,3},
    {2,4},
    {2,5},
    {2,6},
    {2,7},
    {3,1},
    {3,2},
    {3,3},
    {3,4},
    {3,5},
    {3,6},
    {3,7},
    {4,1},
    {4,2},
    {4,3},
    {4,4},
    {4,5},
    {4,6},
    {4,7},
    {5,1},
    {5,2},
    {5,3},
    {5,4},
    {5,5},
    {5,6},
    {5,7},
    {6,1},
    {6,2},
    {6,3},
    {6,4},
    {6,5},
    {6,6},
    {6,7}
    ].

get1KeyList()->[
    1,
    2,
    3,
    4,
    5,
    6
    ].

get2KeyList(1)->[
    1,
    2,
    3,
    4,
    5,
    6,
    7
    ];
get2KeyList(2)->[
    1,
    2,
    3,
    4,
    5,
    6,
    7
    ];
get2KeyList(3)->[
    1,
    2,
    3,
    4,
    5,
    6,
    7
    ];
get2KeyList(4)->[
    1,
    2,
    3,
    4,
    5,
    6,
    7
    ];
get2KeyList(5)->[
    1,
    2,
    3,
    4,
    5,
    6,
    7
    ];
get2KeyList(6)->[
    1,
    2,
    3,
    4,
    5,
    6,
    7
    ];
get2KeyList(_)->[].

