%% coding: latin-1
%%: 实现
-module(cfg_guideAction_chs).
-compile(export_all).
-include("cfg_guideAction.hrl").
-include("logger.hrl").

getRow(1001)->
    #guideActionCfg {
    id = 1001,
    trigger = 1,
    triggerParam = 100,
    guideType = [1,3,6],
    uiTarget = "TaskTipsPanel&Anchor/Offset/TaskList/TaskItem(Clone)",
    finishTrigger = 1,
    watingtime = 0,
    content = "[A06729]欢迎来到露娜世界，点击这里开始魔幻之旅吧！",
    nextGuide = 0,
    resControl = "6&vfx_25_66&vfx_25_67&5||1&2&50",
    couldBeSkip = 0,
    needWaitTarget = 0,
    mainStep = 1,
    module = 0,
    closemsgpanle = 0
    };
getRow(1002)->
    #guideActionCfg {
    id = 1002,
    trigger = 1,
    triggerParam = 100,
    guideType = [1,3,6],
    uiTarget = "EquipmentGuidePanel&Anchor/Offest/PutOnBtn",
    finishTrigger = 1,
    watingtime = 0,
    content = "[A06729]冒险之中[ff4242]【武器】[-]可是至关重要的！",
    nextGuide = 1003,
    resControl = "6&vfx_25_66&vfx_25_67&4||1&2&50",
    couldBeSkip = 0,
    needWaitTarget = 0,
    mainStep = 0,
    module = 0,
    closemsgpanle = 0
    };
getRow(1003)->
    #guideActionCfg {
    id = 1003,
    trigger = 1,
    triggerParam = 100,
    guideType = [1,3,6],
    uiTarget = "TaskTipsPanel&Anchor/Offset/TaskList/TaskItem(Clone)",
    finishTrigger = 1,
    watingtime = 0,
    content = "[A06729]继续冒险，试试[ff4242]【武器】[-]的威力吧！",
    nextGuide = 0,
    resControl = "6&vfx_25_66&vfx_25_67&4||1&2&50",
    couldBeSkip = 0,
    needWaitTarget = 0,
    mainStep = 0,
    module = -1,
    closemsgpanle = 0
    };
getRow(1004)->
    #guideActionCfg {
    id = 1004,
    trigger = 1,
    triggerParam = 100,
    guideType = [1,3,6],
    uiTarget = "MainPanel&BottomRight/SkillOffset/AttackButton",
    finishTrigger = 1,
    watingtime = 1,
    content = "[A06729]使用[ff4242]【攻击】[-]击败小鱼人",
    nextGuide = 0,
    resControl = "6&vfx_25_66&vfx_25_67&1||1&2&50",
    couldBeSkip = 0,
    needWaitTarget = 1,
    mainStep = 1,
    module = 0,
    closemsgpanle = 0
    };
getRow(1005)->
    #guideActionCfg {
    id = 1005,
    trigger = 1,
    triggerParam = 100,
    guideType = [1,3,6],
    uiTarget = "MainPanel&TopLeft/MyHeadOffset/Head",
    finishTrigger = 1,
    watingtime = 0,
    content = "[A06729]冒险者的战斗需要更加强力的技能",
    nextGuide = 1006,
    resControl = "6&vfx_25_66&vfx_25_67&8||1&2&50",
    couldBeSkip = 0,
    needWaitTarget = 0,
    mainStep = 0,
    module = 0,
    closemsgpanle = 0
    };
getRow(1006)->
    #guideActionCfg {
    id = 1006,
    trigger = 1,
    triggerParam = 100,
    guideType = [1,3,6],
    uiTarget = "CharacterPanel&Anchor/Offset/switchBtns/Skill_Button",
    finishTrigger = 1,
    watingtime = 0,
    content = "[A06729]点击[ff4242]【技能】[-]查看自己的全部技能",
    nextGuide = 1007,
    resControl = "6&vfx_25_66&vfx_25_67&0||1&2&50",
    couldBeSkip = 0,
    needWaitTarget = 0,
    mainStep = 0,
    module = 0,
    closemsgpanle = 0
    };
getRow(1007)->
    #guideActionCfg {
    id = 1007,
    trigger = 1,
    triggerParam = 100,
    guideType = [1,3,6],
    uiTarget = "CharacterPanel&Anchor/Offset/skill/skill(Clone)/allSkills/panel/grid/0/add",
    finishTrigger = 1,
    watingtime = 0,
    content = "[A06729]技能需要经常[ff4242]【升级】[-]，提升伤害和效果！",
    nextGuide = 1008,
    resControl = "6&vfx_25_66&vfx_25_67&0||1&2&50",
    couldBeSkip = 0,
    needWaitTarget = 0,
    mainStep = 1,
    module = 0,
    closemsgpanle = 0
    };
getRow(1008)->
    #guideActionCfg {
    id = 1008,
    trigger = 1,
    triggerParam = 100,
    guideType = [1,3,6],
    uiTarget = "CharacterPanel&Anchor/Offset/Close_Button",
    finishTrigger = 1,
    watingtime = 0,
    content = "[A06729]点击[ff4242]关闭[-]，继续冒险吧！",
    nextGuide = 0,
    resControl = "6&vfx_25_66&vfx_25_67&0||1&2&50",
    couldBeSkip = 0,
    needWaitTarget = 0,
    mainStep = 0,
    module = 0,
    closemsgpanle = 0
    };
getRow(1009)->
    #guideActionCfg {
    id = 1009,
    trigger = 1,
    triggerParam = 100,
    guideType = [1,3,6],
    uiTarget = "MainPanel&BottomRight/SkillOffset/AllSkill/Skill_0/Button",
    finishTrigger = 1,
    watingtime = 0,
    content = "[A06729]请使用[ff4242]【技能】[-]，消灭阻挡的魔物！",
    nextGuide = 0,
    resControl = "6&vfx_25_66&vfx_25_67&1||1&2&50",
    couldBeSkip = 0,
    needWaitTarget = 1,
    mainStep = 1,
    module = 0,
    closemsgpanle = 0
    };
getRow(1010)->
    #guideActionCfg {
    id = 1010,
    trigger = 1,
    triggerParam = 100,
    guideType = [1,3,6],
    uiTarget = "MainPanel&TopRight/OtherBtns/Skill_6/Button",
    finishTrigger = 1,
    watingtime = 0,
    content = "[A06729]使用[ff4242]【自动战斗】[-]，打怪物更轻松哦！",
    nextGuide = 0,
    resControl = "6&vfx_25_66&vfx_25_67&4||1&2&50",
    couldBeSkip = 0,
    needWaitTarget = 0,
    mainStep = 0,
    module = 0,
    closemsgpanle = 0
    };
getRow(1011)->
    #guideActionCfg {
    id = 1011,
    trigger = 1,
    triggerParam = 100,
    guideType = [1,3,6],
    uiTarget = "SpecificEventPanel&UIAchor/Skill_Goddess/Button",
    finishTrigger = 1,
    watingtime = 0,
    content = "[A06729]冒险旅途危险重重，使用[ff4242]【女神之力-仁慈】[-]可以治愈自己。",
    nextGuide = 0,
    resControl = "6&vfx_25_66&vfx_25_67&6||1&2&50",
    couldBeSkip = 0,
    needWaitTarget = 1,
    mainStep = 0,
    module = 0,
    closemsgpanle = 0
    };
getRow(1012)->
    #guideActionCfg {
    id = 1012,
    trigger = 1,
    triggerParam = 100,
    guideType = [1,3,6],
    uiTarget = "MainPanel&TopRight/Goddness",
    finishTrigger = 1,
    watingtime = 0,
    content = "[A06729]女神之力溢满身体，请激活仁慈女神为你而战吧！",
    nextGuide = 1013,
    resControl = "6&vfx_25_66&vfx_25_67&6||1&2&50",
    couldBeSkip = 0,
    needWaitTarget = 1,
    mainStep = 0,
    module = 18,
    closemsgpanle = 0
    };
getRow(1013)->
    #guideActionCfg {
    id = 1013,
    trigger = 1,
    triggerParam = 100,
    guideType = [1,3,6],
    uiTarget = "TransformPanel&PageGoddess/Btn/GoddessGoFight",
    finishTrigger = 1,
    watingtime = 0,
    content = "[A06729]请[ff4242][出战][-]仁慈女神！",
    nextGuide = 1014,
    resControl = "6&vfx_25_66&vfx_25_67&0||1&2&50",
    couldBeSkip = 0,
    needWaitTarget = 0,
    mainStep = 0,
    module = 0,
    closemsgpanle = 0
    };
getRow(1014)->
    #guideActionCfg {
    id = 1014,
    trigger = 1,
    triggerParam = 100,
    guideType = [1,3,6],
    uiTarget = "TransformPanel&PageGoddess/SpBg/BtnLevelUp",
    finishTrigger = 1,
    watingtime = 0,
    content = "[A06729]请经常[ff4242][升级女神][-]，提升女神的属性",
    nextGuide = 1015,
    resControl = "6&vfx_25_66&vfx_25_67&0||1&2&50",
    couldBeSkip = 0,
    needWaitTarget = 0,
    mainStep = 1,
    module = 0,
    closemsgpanle = 0
    };
getRow(1015)->
    #guideActionCfg {
    id = 1015,
    trigger = 1,
    triggerParam = 100,
    guideType = [1,3,6],
    uiTarget = "TransformPanel&ButtonClose",
    finishTrigger = 1,
    watingtime = 0,
    content = "[A06729]点击[ff4242]关闭[-]，继续冒险吧！",
    nextGuide = 1016,
    resControl = "6&vfx_25_66&vfx_25_67&0||1&2&50",
    couldBeSkip = 0,
    needWaitTarget = 0,
    mainStep = 0,
    module = 0,
    closemsgpanle = 0
    };
getRow(1016)->
    #guideActionCfg {
    id = 1016,
    trigger = 1,
    triggerParam = 100,
    guideType = [1,3,6],
    uiTarget = "MainPanel&BottomLeft/System",
    finishTrigger = 1,
    watingtime = 0,
    content = "[A06729]新功能解锁啦，点击这里查看",
    nextGuide = 1017,
    resControl = "6&vfx_25_66&vfx_25_67&3||1&2&50",
    couldBeSkip = 1,
    needWaitTarget = 0,
    mainStep = 0,
    module = 0,
    closemsgpanle = 0
    };
getRow(1017)->
    #guideActionCfg {
    id = 1017,
    trigger = 1,
    triggerParam = 100,
    guideType = [1,3,6],
    uiTarget = "MainMenuPanel&BottomLeft/Panel2/Grid/29",
    finishTrigger = 1,
    watingtime = 0,
    content = "[A06729]你获得了一个[ff4242]【成就】[-]！",
    nextGuide = 1018,
    resControl = "6&vfx_25_66&vfx_25_67&0||1&2&50",
    couldBeSkip = 0,
    needWaitTarget = 0,
    mainStep = 0,
    module = 0,
    closemsgpanle = 0
    };
getRow(1018)->
    #guideActionCfg {
    id = 1018,
    trigger = 1,
    triggerParam = 100,
    guideType = [1,3,6],
    uiTarget = "AchievementPanel&Anchor/Offset/AchievePanel/DetailList/DetailItem(Clone)_700/Button",
    finishTrigger = 1,
    watingtime = 0,
    content = "[A06729]请[ff4242]【领取】[-]你的奖励吧！",
    nextGuide = 1019,
    resControl = "6&vfx_25_66&vfx_25_67&0||1&2&50",
    couldBeSkip = 0,
    needWaitTarget = 0,
    mainStep = 1,
    module = 0,
    closemsgpanle = 0
    };
getRow(1019)->
    #guideActionCfg {
    id = 1019,
    trigger = 1,
    triggerParam = 100,
    guideType = [1,3,6],
    uiTarget = "AchievementPanel&Anchor/Offset/Btns/CloseBtn",
    finishTrigger = 1,
    watingtime = 0,
    content = "[A06729]点击[ff4242]【关闭】[-]，继续冒险吧！",
    nextGuide = 0,
    resControl = "6&vfx_25_66&vfx_25_67&0||1&2&50",
    couldBeSkip = 0,
    needWaitTarget = 0,
    mainStep = 0,
    module = 0,
    closemsgpanle = 0
    };
getRow(1020)->
    #guideActionCfg {
    id = 1020,
    trigger = 1,
    triggerParam = 100,
    guideType = [5],
    uiTarget = "MainPanel&BottomLeft/System",
    finishTrigger = 3,
    watingtime = 0,
    nextGuide = 1021,
    resControl = "5&9",
    couldBeSkip = 0,
    needWaitTarget = 0,
    mainStep = 0,
    module = 9,
    closemsgpanle = 0
    };
getRow(1021)->
    #guideActionCfg {
    id = 1021,
    trigger = 1,
    triggerParam = 100,
    guideType = [1,3,6],
    uiTarget = "MainPanel&BottomLeft/System",
    finishTrigger = 1,
    watingtime = 0,
    content = "[A06729]新功能解锁啦，点击这里查看",
    nextGuide = 1022,
    resControl = "6&vfx_25_66&vfx_25_67&3||1&2&50",
    couldBeSkip = 1,
    needWaitTarget = 0,
    mainStep = 0,
    module = 0,
    closemsgpanle = 0
    };
getRow(1022)->
    #guideActionCfg {
    id = 1022,
    trigger = 1,
    triggerParam = 100,
    guideType = [1,3,6],
    uiTarget = "MainMenuPanel&BottomLeft/Panel2/Grid/9",
    finishTrigger = 1,
    watingtime = 0,
    content = "[A06729][ff4242]【强化】[-]功能已解锁",
    nextGuide = 1023,
    resControl = "6&vfx_25_66&vfx_25_67&0||1&2&50",
    couldBeSkip = 0,
    needWaitTarget = 0,
    mainStep = 0,
    module = 0,
    closemsgpanle = 0
    };
getRow(1023)->
    #guideActionCfg {
    id = 1023,
    trigger = 1,
    triggerParam = 100,
    guideType = [1,3,6],
    uiTarget = "StrengthenPanel&strengthen_content/SwitchPackage/EquipmentRefining/Parts/ScrollView/Grid/0",
    finishTrigger = 1,
    watingtime = 0,
    content = "[A06729]武器是重要的力量，需要随时精炼",
    nextGuide = 1024,
    resControl = "6&vfx_25_66&vfx_25_67&0||1&2&50",
    couldBeSkip = 0,
    needWaitTarget = 0,
    mainStep = 0,
    module = 0,
    closemsgpanle = 0
    };
getRow(1024)->
    #guideActionCfg {
    id = 1024,
    trigger = 1,
    triggerParam = 100,
    guideType = [1,3,6],
    uiTarget = "StrengthenPanel&strengthen_content/SwitchPackage/EquipmentRefining/ImproveBtn",
    finishTrigger = 1,
    watingtime = 0,
    content = "[A06729]点击[ff4242]【精炼】[-]，提升武器的等级吧",
    nextGuide = 1025,
    resControl = "6&vfx_25_66&vfx_25_67&0||1&2&50",
    couldBeSkip = 0,
    needWaitTarget = 0,
    mainStep = 1,
    module = 0,
    closemsgpanle = 0
    };
getRow(1025)->
    #guideActionCfg {
    id = 1025,
    trigger = 1,
    triggerParam = 100,
    guideType = [1,3,6],
    uiTarget = "StrengthenPanel&Close_Button",
    finishTrigger = 1,
    watingtime = 0,
    content = "[A06729]点击[ff4242]【关闭】[-]，继续冒险吧！",
    nextGuide = 0,
    resControl = "6&vfx_25_66&vfx_25_67&0||1&2&50",
    couldBeSkip = 0,
    needWaitTarget = 0,
    mainStep = 0,
    module = 0,
    closemsgpanle = 0
    };
getRow(1026)->
    #guideActionCfg {
    id = 1026,
    trigger = 1,
    triggerParam = 100,
    guideType = [5],
    uiTarget = "MainPanel&TopLeft/MyHeadOffset/Head",
    finishTrigger = 1,
    watingtime = 0,
    nextGuide = 1027,
    resControl = "5&52",
    couldBeSkip = 0,
    needWaitTarget = 0,
    mainStep = 0,
    module = 52,
    closemsgpanle = 0
    };
getRow(1027)->
    #guideActionCfg {
    id = 1027,
    trigger = 1,
    triggerParam = 100,
    guideType = [1,3,6],
    uiTarget = "MainPanel&TopLeft/MyHeadOffset/Head",
    finishTrigger = 1,
    watingtime = 0,
    content = "[A06729]新功能解锁啦，点击这里查看",
    nextGuide = 1028,
    resControl = "6&vfx_25_66&vfx_25_67&8||1&2&50",
    couldBeSkip = 1,
    needWaitTarget = 0,
    mainStep = 0,
    module = 52,
    closemsgpanle = 0
    };
getRow(1028)->
    #guideActionCfg {
    id = 1028,
    trigger = 1,
    triggerParam = 100,
    guideType = [1,3,6],
    uiTarget = "CharacterPanel&Anchor/Offset/switchBtns/Fashion_Button",
    finishTrigger = 1,
    watingtime = 0,
    content = "[A06729][ff4242]【时装】[-]功能已开启",
    nextGuide = 1029,
    resControl = "6&vfx_25_66&vfx_25_67&0||1&2&50",
    couldBeSkip = 0,
    needWaitTarget = 0,
    mainStep = 0,
    module = 0,
    closemsgpanle = 0
    };
getRow(1029)->
    #guideActionCfg {
    id = 1029,
    trigger = 1,
    triggerParam = 100,
    guideType = [1,3,6],
    uiTarget = "CharacterPanel&Anchor/Offset/Fashion/fashion(Clone)/single/items/store/panel/grid/0/Grid/head/BG",
    finishTrigger = 1,
    watingtime = 0,
    content = "[A06729]点击可预览时装样式",
    nextGuide = 1030,
    resControl = "6&vfx_25_66&vfx_25_67&0||1&2&50",
    couldBeSkip = 0,
    needWaitTarget = 0,
    mainStep = 0,
    module = 0,
    closemsgpanle = 0
    };
getRow(1030)->
    #guideActionCfg {
    id = 1030,
    trigger = 1,
    triggerParam = 100,
    guideType = [2],
    uiTarget = "CharacterPanel&Anchor/Offset/Fashion/fashion(Clone)/single/items/store/panel/grid/0/Grid/cloth/BG",
    finishTrigger = 2,
    watingtime = 3,
    content = "[A06729]你可以购买任意一件绿色时装，然后在[ff4242]【我的衣橱】[-]里穿上它！",
    nextGuide = 0,
    couldBeSkip = 0,
    needWaitTarget = 0,
    mainStep = 0,
    module = 0,
    closemsgpanle = 0
    };
getRow(1031)->
    #guideActionCfg {
    id = 1031,
    trigger = 1,
    triggerParam = 100,
    guideType = [1,3,6],
    uiTarget = "MainPanel&TopRight/Goddness",
    finishTrigger = 1,
    watingtime = 0,
    content = "[A06729]女神之力溢满身体，请激活战争女神为你而战吧！",
    nextGuide = 1032,
    resControl = "6&vfx_25_66&vfx_25_67&6||1&2&50",
    couldBeSkip = 0,
    needWaitTarget = 1,
    mainStep = 0,
    module = 0,
    closemsgpanle = 0
    };
getRow(1032)->
    #guideActionCfg {
    id = 1032,
    trigger = 1,
    triggerParam = 100,
    guideType = [1,3,6],
    uiTarget = "TransformPanel&PageGoddess/List%2",
    finishTrigger = 1,
    watingtime = 0,
    content = "[A06729]不同女神具备不同的力量，需要看时机切换使用",
    nextGuide = 1033,
    resControl = "6&vfx_25_66&vfx_25_67&0||1&2&50",
    couldBeSkip = 0,
    needWaitTarget = 1,
    mainStep = 0,
    module = 0,
    closemsgpanle = 0
    };
getRow(1033)->
    #guideActionCfg {
    id = 1033,
    trigger = 1,
    triggerParam = 100,
    guideType = [1,3,6],
    uiTarget = "TransformPanel&PageGoddess/Btn/GoddessGoFight",
    finishTrigger = 1,
    watingtime = 0,
    content = "[A06729]现在让战争女神随你[ff4242]【出战】[-]吧！",
    nextGuide = 1034,
    resControl = "6&vfx_25_66&vfx_25_67&0||1&2&50",
    couldBeSkip = 0,
    needWaitTarget = 1,
    mainStep = 1,
    module = 0,
    closemsgpanle = 0
    };
getRow(1034)->
    #guideActionCfg {
    id = 1034,
    trigger = 1,
    triggerParam = 100,
    guideType = [1,3,6],
    uiTarget = "TransformPanel&ButtonClose",
    finishTrigger = 1,
    watingtime = 0,
    content = "[A06729]点击[ff4242]【关闭】[-]，继续冒险吧！",
    nextGuide = 0,
    resControl = "6&vfx_25_66&vfx_25_67&0||1&2&50",
    couldBeSkip = 0,
    needWaitTarget = 0,
    mainStep = 0,
    module = 0,
    closemsgpanle = 0
    };
getRow(1035)->
    #guideActionCfg {
    id = 1035,
    trigger = 1,
    triggerParam = 100,
    guideType = [1,3,6],
    uiTarget = "CopyPanel&Copy/Enter",
    finishTrigger = 1,
    watingtime = 0,
    content = "[A06729]点击[ff4242]单人前往[-]，进行副本历练吧！",
    nextGuide = 1036,
    resControl = "6&vfx_25_66&vfx_25_67&0||1&2&50",
    couldBeSkip = 0,
    needWaitTarget = 1,
    mainStep = 1,
    module = 0,
    closemsgpanle = 1
    };
getRow(1036)->
    #guideActionCfg {
    id = 1036,
    trigger = 1,
    triggerParam = 100,
    guideType = [1,3,6],
    uiTarget = "MessageBoxPanel&Anchor/Offset/ButtonOne",
    finishTrigger = 1,
    watingtime = 0,
    content = "[A06729]副本功能已开启，前方危机重重，请小心[ff4242]【进入】[-]！",
    nextGuide = 1037,
    resControl = "6&vfx_25_66&vfx_25_67&0||1&2&50",
    couldBeSkip = 0,
    needWaitTarget = 0,
    mainStep = 0,
    module = 0,
    closemsgpanle = 1
    };
getRow(1037)->
    #guideActionCfg {
    id = 1037,
    trigger = 1,
    triggerParam = 100,
    guideType = [1,3,6],
    uiTarget = "SpecificEventPanel&UIAchor/WeaponSkill/Button",
    finishTrigger = 1,
    watingtime = 0,
    content = "[A06729]器灵之力在体内流淌，使用[ff4242]【器灵觉醒】[-]体验一下力量吧！",
    nextGuide = 0,
    resControl = "6&vfx_25_66&vfx_25_67&0||1&2&50",
    couldBeSkip = 0,
    needWaitTarget = 1,
    mainStep = 0,
    module = 0,
    closemsgpanle = 0
    };
getRow(1038)->
    #guideActionCfg {
    id = 1038,
    trigger = 1,
    triggerParam = 100,
    guideType = [5],
    uiTarget = "MainPanel&BottomLeft/System",
    finishTrigger = 1,
    watingtime = 0,
    nextGuide = 1039,
    resControl = "5&34",
    couldBeSkip = 0,
    needWaitTarget = 0,
    mainStep = 0,
    module = 0,
    closemsgpanle = 1
    };
getRow(1039)->
    #guideActionCfg {
    id = 1039,
    trigger = 1,
    triggerParam = 100,
    guideType = [1,3,6],
    uiTarget = "MainPanel&BottomLeft/System",
    finishTrigger = 1,
    watingtime = 0,
    content = "[A06729]有新的功能解锁啦，点击这里查看",
    nextGuide = 1040,
    resControl = "6&vfx_25_66&vfx_25_67&0||1&2&50",
    couldBeSkip = 1,
    needWaitTarget = 0,
    mainStep = 0,
    module = 0,
    closemsgpanle = 1
    };
getRow(1040)->
    #guideActionCfg {
    id = 1040,
    trigger = 1,
    triggerParam = 100,
    guideType = [1,3,6],
    uiTarget = "MainMenuPanel&BottomLeft/Panel2/Grid/34",
    finishTrigger = 1,
    watingtime = 0,
    content = "[A06729][ff4242]【器灵】[-]功能已解锁",
    nextGuide = 1041,
    resControl = "6&vfx_25_66&vfx_25_67&0||1&2&50",
    couldBeSkip = 0,
    needWaitTarget = 0,
    mainStep = 0,
    module = 0,
    closemsgpanle = 1
    };
getRow(1041)->
    #guideActionCfg {
    id = 1041,
    trigger = 1,
    triggerParam = 100,
    guideType = [1,3,6],
    uiTarget = "WeaponImprovePanel&Anchor/Offset/Content/BaseDesc/ActiveBtn",
    finishTrigger = 1,
    watingtime = 0,
    content = "[A06729]每个器灵需要对应的解锁道具才能激活！",
    nextGuide = 1042,
    resControl = "6&vfx_25_66&vfx_25_67&0||1&2&50",
    couldBeSkip = 0,
    needWaitTarget = 0,
    mainStep = 1,
    module = 0,
    closemsgpanle = 1
    };
getRow(1042)->
    #guideActionCfg {
    id = 1042,
    trigger = 1,
    triggerParam = 100,
    guideType = [1,3,6],
    uiTarget = "MessageBoxPanel&Anchor/Offset/ButtonOne",
    finishTrigger = 1,
    watingtime = 0,
    content = "[A06729]请激活火器灵",
    nextGuide = 1043,
    resControl = "6&vfx_25_66&vfx_25_67&0||1&2&50",
    couldBeSkip = 0,
    needWaitTarget = 0,
    mainStep = 0,
    module = 0,
    closemsgpanle = 1
    };
getRow(1043)->
    #guideActionCfg {
    id = 1043,
    trigger = 1,
    triggerParam = 100,
    guideType = [2],
    uiTarget = "WeaponImprovePanel&Anchor/Offset/Content2/Top/WeaponBtn",
    finishTrigger = 2,
    watingtime = 3,
    content = "[A06729]提升各个器灵都将为你的觉醒武器提供经验值！力量来自于日夜累积！",
    nextGuide = 0,
    couldBeSkip = 0,
    needWaitTarget = 0,
    mainStep = 0,
    module = 0,
    closemsgpanle = 1
    };
getRow(1044)->
    #guideActionCfg {
    id = 1044,
    trigger = 1,
    triggerParam = 100,
    guideType = [1,3,6],
    uiTarget = "MainPanel&TopRight/ActivityOffset/Show",
    finishTrigger = 1,
    watingtime = 0,
    content = "[A06729]有新的[ff4242]【活动】[-]解锁啦，点击这里查看",
    nextGuide = 1045,
    resControl = "6&vfx_25_66&vfx_25_67&0||1&2&50",
    couldBeSkip = 1,
    needWaitTarget = 0,
    mainStep = 0,
    module = 0,
    closemsgpanle = 0
    };
getRow(1045)->
    #guideActionCfg {
    id = 1045,
    trigger = 1,
    triggerParam = 100,
    guideType = [1,3,6],
    uiTarget = "MainPanel&TopRight/ActivityOffset/ActivityClip/MenuOne/22",
    finishTrigger = 1,
    watingtime = 0,
    content = "[A06729]有新的功能[ff4242]【活动】[-]解锁啦，点击这里查看",
    nextGuide = 1046,
    resControl = "6&vfx_25_66&vfx_25_67&6||1&2&50",
    couldBeSkip = 0,
    needWaitTarget = 0,
    mainStep = 0,
    module = 0,
    closemsgpanle = 0
    };
getRow(1046)->
    #guideActionCfg {
    id = 1046,
    trigger = 1,
    triggerParam = 100,
    guideType = [1,3,6],
    uiTarget = "DailyPanel&Anchor/Offset/ScrollView/PveButton/34",
    finishTrigger = 1,
    watingtime = 0,
    content = "[A06729][ff4242]【混沌灵界】[-]已开启",
    nextGuide = 1047,
    resControl = "6&vfx_25_66&vfx_25_67&0||1&2&50",
    couldBeSkip = 0,
    needWaitTarget = 0,
    mainStep = 0,
    module = 0,
    closemsgpanle = 0
    };
getRow(1047)->
    #guideActionCfg {
    id = 1047,
    trigger = 1,
    triggerParam = 100,
    guideType = [1,3,6],
    uiTarget = "DailyPanel&Anchor/Offset/Content/34/ButtonChallenge",
    finishTrigger = 1,
    watingtime = 0,
    content = "[A06729]许多挑战地域中你都需要先[ff4242]【创建组队】[-]",
    nextGuide = 1048,
    resControl = "6&vfx_25_66&vfx_25_67&0||1&2&50",
    couldBeSkip = 0,
    needWaitTarget = 0,
    mainStep = 0,
    module = 0,
    closemsgpanle = 0
    };
getRow(1048)->
    #guideActionCfg {
    id = 1048,
    trigger = 1,
    triggerParam = 100,
    guideType = [1,3,6],
    uiTarget = "NewTeamHallPanel&rightBottom/creatTeamBtn",
    finishTrigger = 1,
    watingtime = 0,
    content = "[A06729]许多挑战地域中你都需要先[ff4242]【创建组队】[-]",
    nextGuide = 1049,
    resControl = "6&vfx_25_66&vfx_25_67&0||1&2&50",
    couldBeSkip = 0,
    needWaitTarget = 0,
    mainStep = 0,
    module = 0,
    closemsgpanle = 0
    };
getRow(1049)->
    #guideActionCfg {
    id = 1049,
    trigger = 1,
    triggerParam = 100,
    guideType = [1,3,6],
    uiTarget = "NewTeamPanel&rightBottom/btnGrid/quickStartBtn",
    finishTrigger = 1,
    watingtime = 0,
    content = "[A06729]选择[ff4242]【快速开始】[-]挑战六系元素器灵吧！",
    nextGuide = 0,
    resControl = "6&vfx_25_66&vfx_25_67&0||1&2&50",
    couldBeSkip = 0,
    needWaitTarget = 0,
    mainStep = 0,
    module = 0,
    closemsgpanle = 0
    };
getRow(1050)->
    #guideActionCfg {
    id = 1050,
    trigger = 1,
    triggerParam = 100,
    guideType = [1,3,6],
    uiTarget = "MainPanel&BottomLeft/System",
    finishTrigger = 1,
    watingtime = 0,
    content = "[A06729]获得了厉害的道具，来强化骑宠吧！",
    nextGuide = 1051,
    resControl = "6&vfx_25_66&vfx_25_67&0||1&2&50",
    couldBeSkip = 1,
    needWaitTarget = 0,
    mainStep = 0,
    module = 0,
    closemsgpanle = 0
    };
getRow(1051)->
    #guideActionCfg {
    id = 1051,
    trigger = 1,
    triggerParam = 100,
    guideType = [1,3,6],
    uiTarget = "MainMenuPanel&BottomLeft/Panel2/Grid/5",
    finishTrigger = 1,
    watingtime = 0,
    content = "[A06729]获得了厉害的道具，来强化骑宠吧！",
    nextGuide = 1052,
    resControl = "6&vfx_25_66&vfx_25_67&0||1&2&50",
    couldBeSkip = 0,
    needWaitTarget = 0,
    mainStep = 0,
    module = 0,
    closemsgpanle = 0
    };
getRow(1052)->
    #guideActionCfg {
    id = 1052,
    trigger = 1,
    triggerParam = 100,
    guideType = [1,3,6],
    uiTarget = "RidePetPanel&Pages/RidePet/InfoPanel/Info/BtnInfo",
    finishTrigger = 1,
    watingtime = 0,
    content = "[A06729]在[ff4242]【详情】[-]可以查看骑宠的信息",
    nextGuide = 1053,
    resControl = "6&vfx_25_66&vfx_25_67&0||1&2&50",
    couldBeSkip = 0,
    needWaitTarget = 0,
    mainStep = 0,
    module = 0,
    closemsgpanle = 0
    };
getRow(1053)->
    #guideActionCfg {
    id = 1053,
    trigger = 1,
    triggerParam = 100,
    guideType = [1,3,6],
    uiTarget = "RidePetInfoPanel&Anchor/Offset/InfoPanel/MAndPInfoBasePanel/Content/Attribute/Up/ButtonUpdate",
    finishTrigger = 1,
    watingtime = 0,
    content = "[A06729]请经常[ff4242]【升星】[-]你的骑宠，它将变得更加灵性和强大！",
    nextGuide = 0,
    resControl = "6&vfx_25_66&vfx_25_67&0||1&2&50",
    couldBeSkip = 0,
    needWaitTarget = 0,
    mainStep = 0,
    module = 0,
    closemsgpanle = 0
    };
getRow(1054)->
    #guideActionCfg {
    id = 1054,
    trigger = 1,
    triggerParam = 100,
    guideType = [1,3,6],
    uiTarget = "MainPanel&TopRight/ActivityOffset/Show",
    finishTrigger = 1,
    watingtime = 0,
    content = "[A06729]有新的功能解锁啦，点击这里查看",
    nextGuide = 1055,
    resControl = "6&vfx_25_66&vfx_25_67&0||1&2&50",
    couldBeSkip = 1,
    needWaitTarget = 0,
    mainStep = 0,
    module = 0,
    closemsgpanle = 1
    };
getRow(1055)->
    #guideActionCfg {
    id = 1055,
    trigger = 1,
    triggerParam = 100,
    guideType = [1,3,6],
    uiTarget = "MainPanel&TopRight/ActivityOffset/ActivityClip/MenuOne/12",
    finishTrigger = 1,
    watingtime = 0,
    content = "[A06729][ff4242]【兑换】[-]功能已解锁",
    nextGuide = 1056,
    resControl = "6&vfx_25_66&vfx_25_67&6||1&2&50",
    couldBeSkip = 0,
    needWaitTarget = 0,
    mainStep = 0,
    module = 0,
    closemsgpanle = 1
    };
getRow(1056)->
    #guideActionCfg {
    id = 1056,
    trigger = 1,
    triggerParam = 100,
    guideType = [1,3,6],
    uiTarget = "ResExchangePanel&Anchor/Offset/Background/ButtonAnchor/_ToggleButtonClone(Clone)",
    finishTrigger = 1,
    watingtime = 0,
    content = "[A06729][ff4242]选择【硬币兑换】[-]",
    nextGuide = 1057,
    resControl = "6&vfx_25_66&vfx_25_67&6||1&2&50",
    couldBeSkip = 0,
    needWaitTarget = 0,
    mainStep = 0,
    module = 0,
    closemsgpanle = 1
    };
getRow(1057)->
    #guideActionCfg {
    id = 1057,
    trigger = 1,
    triggerParam = 100,
    guideType = [1,3,6],
    uiTarget = "ResExchangePanel&Anchor/Offset/Package/Panel/Sprite(Clone)/2160",
    finishTrigger = 1,
    watingtime = 0,
    content = "[A06729]尝试兑换一些[ff4242]【兽灵精华I】[-]",
    nextGuide = 1058,
    resControl = "6&vfx_25_66&vfx_25_67&0||1&2&50",
    couldBeSkip = 0,
    needWaitTarget = 1,
    mainStep = 0,
    module = 0,
    closemsgpanle = 1
    };
getRow(1058)->
    #guideActionCfg {
    id = 1058,
    trigger = 1,
    triggerParam = 100,
    guideType = [1,3,6],
    uiTarget = "ResExchangePanel&Anchor/Offset/BuyInfo/BuyButton",
    finishTrigger = 1,
    watingtime = 0,
    content = "[A06729]点击[ff4242]【购买】[-]！",
    nextGuide = 1059,
    resControl = "6&vfx_25_66&vfx_25_67&0||1&2&50",
    couldBeSkip = 0,
    needWaitTarget = 0,
    mainStep = 1,
    module = 0,
    closemsgpanle = 1
    };
getRow(1059)->
    #guideActionCfg {
    id = 1059,
    trigger = 1,
    triggerParam = 100,
    guideType = [1,3,6],
    uiTarget = "MessageBoxPanel&Anchor/Offset/ButtonOne",
    finishTrigger = 1,
    watingtime = 0,
    content = "[A06729][ff4242]【确定】[-]购买，就是这么简单！",
    nextGuide = 1060,
    resControl = "6&vfx_25_66&vfx_25_67&0||1&2&50",
    couldBeSkip = 0,
    needWaitTarget = 0,
    mainStep = 0,
    module = 0,
    closemsgpanle = 1
    };
getRow(1060)->
    #guideActionCfg {
    id = 1060,
    trigger = 1,
    triggerParam = 100,
    guideType = [2],
    uiTarget = "ResExchangePanel&Anchor/Offset/BuyInfo/BuyButton",
    finishTrigger = 2,
    watingtime = 3,
    content = "[A06729]通过在[ff4242]【背包】[-]中[ff4242]【分解】[-]装备，您可以获得大量的紫色精华哦！",
    nextGuide = 0,
    couldBeSkip = 0,
    needWaitTarget = 0,
    mainStep = 0,
    module = 0,
    closemsgpanle = 1
    };
getRow(1061)->
    #guideActionCfg {
    id = 1061,
    trigger = 1,
    triggerParam = 100,
    guideType = [1,3,6],
    uiTarget = "MainPanel&TopRight/ActivityOffset/Show",
    finishTrigger = 1,
    watingtime = 0,
    content = "[A06729]有新的功能解锁啦，点击这里查看",
    nextGuide = 1062,
    resControl = "6&vfx_25_66&vfx_25_67&0||1&2&50",
    couldBeSkip = 1,
    needWaitTarget = 0,
    mainStep = 0,
    module = 53,
    closemsgpanle = 0
    };
getRow(1062)->
    #guideActionCfg {
    id = 1062,
    trigger = 1,
    triggerParam = 100,
    guideType = [1,3,6],
    uiTarget = "MainPanel&TopRight/ActivityOffset/ActivityClip/MenuOne/53",
    finishTrigger = 1,
    watingtime = 0,
    content = "[A06729][ff4242]【扭蛋】[-]功能已解锁",
    nextGuide = 1063,
    resControl = "6&vfx_25_66&vfx_25_67&6||1&2&50",
    couldBeSkip = 0,
    needWaitTarget = 0,
    mainStep = 0,
    module = 0,
    closemsgpanle = 0
    };
getRow(1063)->
    #guideActionCfg {
    id = 1063,
    trigger = 1,
    triggerParam = 100,
    guideType = [1,3,6],
    uiTarget = "TreasurehousePanel&Offset/InnerPanelBg/Preview_0/btnOnceTime/Bg",
    finishTrigger = 1,
    watingtime = 0,
    content = "[A06729]来一次免费的抽取吧",
    nextGuide = 1064,
    resControl = "6&vfx_25_66&vfx_25_67&0||1&2&50",
    couldBeSkip = 0,
    needWaitTarget = 0,
    mainStep = 1,
    module = 0,
    closemsgpanle = 0
    };
getRow(1064)->
    #guideActionCfg {
    id = 1064,
    trigger = 1,
    triggerParam = 100,
    guideType = [1,3,6],
    uiTarget = "TreasurehouseRewardPanel&Offset/Btns/CloseBtn",
    finishTrigger = 1,
    watingtime = 0,
    content = "[A06729]点击[ff4242]【离开】[-]，离开当前界面",
    nextGuide = 1065,
    resControl = "6&vfx_25_66&vfx_25_67&0||1&2&50",
    couldBeSkip = 0,
    needWaitTarget = 1,
    mainStep = 0,
    module = 0,
    closemsgpanle = 0
    };
getRow(1065)->
    #guideActionCfg {
    id = 1065,
    trigger = 1,
    triggerParam = 100,
    guideType = [1,3,6],
    uiTarget = "TreasurehousePanel&Offset/Btns/CloseBtn",
    finishTrigger = 1,
    watingtime = 0,
    content = "[A06729]点击[ff4242]【关闭】[-]，关闭当前界面",
    nextGuide = 1066,
    resControl = "6&vfx_25_66&vfx_25_67&0||1&2&50",
    couldBeSkip = 0,
    needWaitTarget = 0,
    mainStep = 0,
    module = 0,
    closemsgpanle = 0
    };
getRow(1066)->
    #guideActionCfg {
    id = 1066,
    trigger = 1,
    triggerParam = 100,
    guideType = [1,3,6],
    uiTarget = "MainPanel&TopLeft/PetHeadOffset/Head",
    finishTrigger = 1,
    watingtime = 0,
    content = "[A06729]点击[ff4242]【骑宠】[-]，打开骑宠界面",
    nextGuide = 1067,
    resControl = "6&vfx_25_66&vfx_25_67&0||1&2&50",
    couldBeSkip = 0,
    needWaitTarget = 0,
    mainStep = 0,
    module = 0,
    closemsgpanle = 0
    };
getRow(1067)->
    #guideActionCfg {
    id = 1067,
    trigger = 1,
    triggerParam = 100,
    guideType = [1,3,6],
    uiTarget = "RidePetPanel&Pages/RidePet/InfoPanel/Info/BtnInfo",
    finishTrigger = 1,
    watingtime = 0,
    content = "[A06729]点击[ff4242]【详情】[-]，打开骑宠详情界面",
    nextGuide = 1068,
    resControl = "6&vfx_25_66&vfx_25_67&0||1&2&50",
    couldBeSkip = 0,
    needWaitTarget = 0,
    mainStep = 0,
    module = 0,
    closemsgpanle = 0
    };
getRow(1068)->
    #guideActionCfg {
    id = 1068,
    trigger = 1,
    triggerParam = 100,
    guideType = [3,6],
    uiTarget = "RidePetInfoPanel&Anchor/Offset/InfoPanel/MAndPInfoBasePanel/Content/Attribute/Up/ButtonReborn",
    finishTrigger = 1,
    watingtime = 0,
    content = "[A06729]使用相同骑宠的碎片，可以[ff4242]【转生】[-]骑宠",
    nextGuide = 0,
    resControl = "6&vfx_25_66&vfx_25_67&0",
    couldBeSkip = 0,
    needWaitTarget = 0,
    mainStep = 0,
    module = 0,
    closemsgpanle = 0
    };
getRow(1069)->
    #guideActionCfg {
    id = 1069,
    trigger = 1,
    triggerParam = 100,
    guideType = [1,3,6],
    uiTarget = "MainPanel&TopLeft/PetHeadOffset/Head",
    finishTrigger = 1,
    watingtime = 0,
    content = "[A06729]恭喜你获得了一只新的骑宠！",
    nextGuide = 1070,
    resControl = "6&vfx_25_66&vfx_25_67&5||1&2&50",
    couldBeSkip = 0,
    needWaitTarget = 1,
    mainStep = 0,
    module = 0,
    closemsgpanle = 0
    };
getRow(1070)->
    #guideActionCfg {
    id = 1070,
    trigger = 1,
    triggerParam = 100,
    guideType = [1,3,6],
    uiTarget = "RidePetPanel&Pages/RidePet/InfoPanel/List/1",
    finishTrigger = 1,
    watingtime = 0,
    content = "[A06729]选择新骑宠",
    nextGuide = 1071,
    resControl = "6&vfx_25_66&vfx_25_67&0||1&2&50",
    couldBeSkip = 0,
    needWaitTarget = 0,
    mainStep = 0,
    module = 0,
    closemsgpanle = 0
    };
getRow(1071)->
    #guideActionCfg {
    id = 1071,
    trigger = 1,
    triggerParam = 100,
    guideType = [1,3,6],
    uiTarget = "RidePetPanel&Pages/RidePet/InfoPanel/Info/BtnFight",
    finishTrigger = 1,
    watingtime = 0,
    content = "[A06729]出战新骑宠",
    nextGuide = 1072,
    resControl = "6&vfx_25_66&vfx_25_67&0||1&2&50",
    couldBeSkip = 0,
    needWaitTarget = 0,
    mainStep = 0,
    module = 0,
    closemsgpanle = 0
    };
getRow(1072)->
    #guideActionCfg {
    id = 1072,
    trigger = 1,
    triggerParam = 100,
    guideType = [1,3,6],
    uiTarget = "RidePetPanel&Tab/Assist",
    finishTrigger = 1,
    watingtime = 0,
    content = "[A06729][ff4242]【骑宠助阵】[-]功能已开启",
    nextGuide = 1073,
    resControl = "6&vfx_25_66&vfx_25_67&0||1&2&50",
    couldBeSkip = 0,
    needWaitTarget = 0,
    mainStep = 0,
    module = 0,
    closemsgpanle = 0
    };
getRow(1073)->
    #guideActionCfg {
    id = 1073,
    trigger = 1,
    triggerParam = 100,
    guideType = [1,3,6],
    uiTarget = "RidePetPanel&Pages/Assist/RidePetAssistPanel(Clone)/Offset/Assist/PetList/1",
    finishTrigger = 1,
    watingtime = 0,
    content = "[A06729]上阵一只骑宠，你将获得其[ff4242]【10%】[-]的属性加成！",
    nextGuide = 1074,
    resControl = "6&vfx_25_66&vfx_25_67&0||1&2&50",
    couldBeSkip = 0,
    needWaitTarget = 0,
    mainStep = 1,
    module = 0,
    closemsgpanle = 0
    };
getRow(1074)->
    #guideActionCfg {
    id = 1074,
    trigger = 1,
    triggerParam = 100,
    guideType = [1,3,6],
    uiTarget = "RidePetPanel&ButtonClose",
    finishTrigger = 1,
    watingtime = 0,
    content = "[A06729]点击[ff4242]【关闭】[-]，继续冒险吧！",
    nextGuide = 0,
    resControl = "6&vfx_25_66&vfx_25_67&0||1&2&50",
    couldBeSkip = 0,
    needWaitTarget = 0,
    mainStep = 0,
    module = 0,
    closemsgpanle = 0
    };
getRow(1075)->
    #guideActionCfg {
    id = 1075,
    trigger = 1,
    triggerParam = 100,
    guideType = [1,3,6],
    uiTarget = "MainPanel&TopLeft/PetHeadOffset/Head",
    finishTrigger = 1,
    watingtime = 0,
    content = "[A06729]有新的功能解锁啦，点击这里查看",
    nextGuide = 1076,
    resControl = "6&vfx_25_66&vfx_25_67&5||1&2&50",
    couldBeSkip = 0,
    needWaitTarget = 0,
    mainStep = 0,
    module = 0,
    closemsgpanle = 0
    };
getRow(1076)->
    #guideActionCfg {
    id = 1076,
    trigger = 1,
    triggerParam = 100,
    guideType = [1,3,6],
    uiTarget = "RidePetPanel&Tab/Equip",
    finishTrigger = 1,
    watingtime = 0,
    content = "[A06729][ff4242]【骑宠装备】[-]功能已开启",
    nextGuide = 1077,
    resControl = "6&vfx_25_66&vfx_25_67&0||1&2&50",
    couldBeSkip = 0,
    needWaitTarget = 0,
    mainStep = 0,
    module = 0,
    closemsgpanle = 0
    };
getRow(1077)->
    #guideActionCfg {
    id = 1077,
    trigger = 1,
    triggerParam = 100,
    guideType = [1,3,6],
    uiTarget = "RidePetPanel&Pages/Equip/RidePetEquipPanel(Clone)/Anchor/Offset/EquipPanel/Content/Attribute/ButtonUpdate",
    finishTrigger = 1,
    watingtime = 0,
    content = "[A06729]点击[ff4242]【升级】[-]，升级骑宠装备",
    nextGuide = 1078,
    resControl = "6&vfx_25_66&vfx_25_67&0||1&2&50",
    couldBeSkip = 0,
    needWaitTarget = 0,
    mainStep = 0,
    module = 0,
    closemsgpanle = 0
    };
getRow(1078)->
    #guideActionCfg {
    id = 1078,
    trigger = 1,
    triggerParam = 100,
    guideType = [1,3,6],
    uiTarget = "RidePetPanel&Pages/Equip/RidePetEquipPanel(Clone)/Anchor/Offset/EquipPanel/Equip/1",
    finishTrigger = 1,
    watingtime = 0,
    content = "[A06729]选中另一级装备，再次进行升级",
    nextGuide = 1079,
    resControl = "6&vfx_25_66&vfx_25_67&0||1&2&50",
    couldBeSkip = 0,
    needWaitTarget = 0,
    mainStep = 0,
    module = 0,
    closemsgpanle = 0
    };
getRow(1079)->
    #guideActionCfg {
    id = 1079,
    trigger = 1,
    triggerParam = 100,
    guideType = [1,3,6],
    uiTarget = "RidePetPanel&Pages/Equip/RidePetEquipPanel(Clone)/Anchor/Offset/EquipPanel/Content/Attribute/ButtonUpdate",
    finishTrigger = 1,
    watingtime = 0,
    content = "[A06729]点击[ff4242]【升级】[-]，升级骑宠装备",
    nextGuide = 1080,
    resControl = "6&vfx_25_66&vfx_25_67&0||1&2&50",
    couldBeSkip = 0,
    needWaitTarget = 0,
    mainStep = 0,
    module = 0,
    closemsgpanle = 0
    };
getRow(1080)->
    #guideActionCfg {
    id = 1080,
    trigger = 1,
    triggerParam = 100,
    guideType = [1,3,6],
    uiTarget = "RidePetPanel&ButtonClose",
    finishTrigger = 1,
    watingtime = 0,
    content = "[A06729]点击[ff4242]【关闭】[-]，继续冒险吧！",
    nextGuide = 0,
    resControl = "6&vfx_25_66&vfx_25_67&0||1&2&50",
    couldBeSkip = 0,
    needWaitTarget = 0,
    mainStep = 0,
    module = 0,
    closemsgpanle = 0
    };
getRow(1081)->
    #guideActionCfg {
    id = 1081,
    trigger = 1,
    triggerParam = 100,
    guideType = [1,3,6],
    uiTarget = "MainPanel&TopRight/ActivityOffset/Show",
    finishTrigger = 1,
    watingtime = 0,
    content = "[A06729]有新的[ff4242]【活动】[-]解锁啦，点击这里查看",
    nextGuide = 1082,
    resControl = "6&vfx_25_66&vfx_25_67&0||1&2&50",
    couldBeSkip = 1,
    needWaitTarget = 0,
    mainStep = 0,
    module = 0,
    closemsgpanle = 0
    };
getRow(1082)->
    #guideActionCfg {
    id = 1082,
    trigger = 1,
    triggerParam = 100,
    guideType = [1,3,6],
    uiTarget = "MainPanel&TopRight/ActivityOffset/ActivityClip/MenuOne/22",
    finishTrigger = 1,
    watingtime = 0,
    content = "[A06729]有新的[ff4242]【活动】[-]解锁啦，点击这里查看",
    nextGuide = 1083,
    resControl = "6&vfx_25_66&vfx_25_67&6||1&2&50",
    couldBeSkip = 0,
    needWaitTarget = 0,
    mainStep = 0,
    module = 0,
    closemsgpanle = 0
    };
getRow(1083)->
    #guideActionCfg {
    id = 1083,
    trigger = 1,
    triggerParam = 100,
    guideType = [1,3,6],
    uiTarget = "DailyPanel&Anchor/Offset/ScrollView/PveButton/30",
    finishTrigger = 1,
    watingtime = 0,
    content = "[A06729]经验副本-[ff4242]【萝莉与绅士】[-]已开启",
    nextGuide = 1084,
    resControl = "6&vfx_25_66&vfx_25_67&0||1&2&50",
    couldBeSkip = 0,
    needWaitTarget = 0,
    mainStep = 0,
    module = 0,
    closemsgpanle = 0
    };
getRow(1084)->
    #guideActionCfg {
    id = 1084,
    trigger = 1,
    triggerParam = 100,
    guideType = [1,3,6],
    uiTarget = "DailyPanel&Anchor/Offset/Content/30/ButtonChallenge",
    finishTrigger = 1,
    watingtime = 0,
    content = "[A06729][ff4242]【进入】[-]副本获得大量经验吧！",
    nextGuide = 1085,
    resControl = "6&vfx_25_66&vfx_25_67&0||1&2&50",
    couldBeSkip = 0,
    needWaitTarget = 0,
    mainStep = 0,
    module = 0,
    closemsgpanle = 0
    };
getRow(1085)->
    #guideActionCfg {
    id = 1085,
    trigger = 1,
    triggerParam = 100,
    guideType = [1,3,6],
    uiTarget = "MainPanel&TopRight/ActivityOffset/Expbutton",
    finishTrigger = 1,
    watingtime = 0,
    content = "[A06729]获得经验时，需要一些[ff4242]【效率】[-]！",
    nextGuide = 1086,
    resControl = "6&vfx_25_66&vfx_25_67&0||1&2&50",
    couldBeSkip = 0,
    needWaitTarget = 1,
    mainStep = 0,
    module = 0,
    closemsgpanle = 0
    };
getRow(1086)->
    #guideActionCfg {
    id = 1086,
    trigger = 1,
    triggerParam = 100,
    guideType = [1,3,6],
    uiTarget = "UseExpPanel&Anchor/Offset/Information/grid/tmp(Clone)/Buttonuse",
    finishTrigger = 1,
    watingtime = 0,
    content = "[A06729][ff4242]【使用】[-]经验药水可以极大的提升效率！",
    nextGuide = 0,
    resControl = "6&vfx_25_66&vfx_25_67&0||1&2&50",
    couldBeSkip = 0,
    needWaitTarget = 0,
    mainStep = 0,
    module = 0,
    closemsgpanle = 0
    };
getRow(1087)->
    #guideActionCfg {
    id = 1087,
    trigger = 1,
    triggerParam = 100,
    guideType = [1,3,6],
    uiTarget = "MainPanel&BottomLeft/System",
    finishTrigger = 1,
    watingtime = 0,
    content = "[A06729]获得了更高等级的[ff4242]【药水】[-]，来替换上去吧",
    nextGuide = 1088,
    resControl = "6&vfx_25_66&vfx_25_67&0||1&2&50",
    couldBeSkip = 1,
    needWaitTarget = 0,
    mainStep = 0,
    module = 0,
    closemsgpanle = 0
    };
getRow(1088)->
    #guideActionCfg {
    id = 1088,
    trigger = 1,
    triggerParam = 100,
    guideType = [1,3,6],
    uiTarget = "MainMenuPanel&BottomLeft/Panel2/Grid/16",
    finishTrigger = 1,
    watingtime = 0,
    content = "[A06729]获得了更高等级的[ff4242]【药水】[-]，来替换上去吧",
    nextGuide = 1089,
    resControl = "6&vfx_25_66&vfx_25_67&0||1&2&50",
    couldBeSkip = 0,
    needWaitTarget = 0,
    mainStep = 0,
    module = 0,
    closemsgpanle = 0
    };
getRow(1089)->
    #guideActionCfg {
    id = 1089,
    trigger = 1,
    triggerParam = 100,
    guideType = [1,3,6],
    uiTarget = "GameSetting&Anchor/Offset/hangContents/autoUseItem/change/SelectItem",
    finishTrigger = 1,
    watingtime = 0,
    content = "[A06729]选择[ff4242]【切换】[-]药水！",
    nextGuide = 1090,
    resControl = "6&vfx_25_66&vfx_25_67&0||1&2&50",
    couldBeSkip = 0,
    needWaitTarget = 0,
    mainStep = 0,
    module = 0,
    closemsgpanle = 0
    };
getRow(1090)->
    #guideActionCfg {
    id = 1090,
    trigger = 1,
    triggerParam = 100,
    guideType = [1,3,6],
    uiTarget = "GameSetting&Anchor/Offset/hangContents/autoUseItem/autoUseItemObj/autoUseItemPanel/grid/103",
    finishTrigger = 1,
    watingtime = 0,
    content = "[A06729][ff4242]【选择】[-]使用30级药水！",
    nextGuide = 1091,
    resControl = "6&vfx_25_66&vfx_25_67&0||1&2&50",
    couldBeSkip = 0,
    needWaitTarget = 0,
    mainStep = 0,
    module = 0,
    closemsgpanle = 0
    };
getRow(1091)->
    #guideActionCfg {
    id = 1091,
    trigger = 1,
    triggerParam = 100,
    guideType = [1,3,6],
    uiTarget = "GameSetting&Anchor/Offset/Close_Button",
    finishTrigger = 1,
    watingtime = 0,
    content = "[A06729]点击[ff4242]【关闭】[-]，继续冒险吧！",
    nextGuide = 0,
    resControl = "6&vfx_25_66&vfx_25_67&0||1&2&50",
    couldBeSkip = 0,
    needWaitTarget = 0,
    mainStep = 0,
    module = 0,
    closemsgpanle = 0
    };
getRow(1092)->
    #guideActionCfg {
    id = 1092,
    trigger = 1,
    triggerParam = 100,
    guideType = [1,3,6],
    uiTarget = "MainPanel&TopLeft/MyHeadOffset/Head",
    finishTrigger = 1,
    watingtime = 0,
    content = "[A06729]转职后你将获得新的技能！",
    nextGuide = 1093,
    resControl = "6&vfx_25_66&vfx_25_67&0||1&2&50",
    couldBeSkip = 0,
    needWaitTarget = 0,
    mainStep = 0,
    module = 0,
    closemsgpanle = 0
    };
getRow(1093)->
    #guideActionCfg {
    id = 1093,
    trigger = 1,
    triggerParam = 100,
    guideType = [1,3,6],
    uiTarget = "CharacterPanel&Anchor/Offset/switchBtns/Skill_Button",
    finishTrigger = 1,
    watingtime = 0,
    content = "[A06729]转职后你将获得新的技能！",
    nextGuide = 1094,
    resControl = "6&vfx_25_66&vfx_25_67&0||1&2&50",
    couldBeSkip = 0,
    needWaitTarget = 0,
    mainStep = 0,
    module = 0,
    closemsgpanle = 0
    };
getRow(1094)->
    #guideActionCfg {
    id = 1094,
    trigger = 1,
    triggerParam = 100,
    guideType = [2],
    uiTarget = "CharacterPanel&Anchor/Offset/skill/skill(Clone)/allSkills/resetSkillPoint",
    finishTrigger = 2,
    watingtime = 3,
    content = "[A06729]你的技能点已被重置，请随意升级你的技能吧！",
    nextGuide = 0,
    couldBeSkip = 0,
    needWaitTarget = 0,
    mainStep = 0,
    module = 0,
    closemsgpanle = 0
    };
getRow(1095)->
    #guideActionCfg {
    id = 1095,
    trigger = 1,
    triggerParam = 100,
    guideType = [5],
    uiTarget = "MainPanel&BottomLeft/System",
    finishTrigger = 3,
    watingtime = 0,
    nextGuide = 1096,
    resControl = "5&42",
    couldBeSkip = 0,
    needWaitTarget = 0,
    mainStep = 0,
    module = 42,
    closemsgpanle = 0
    };
getRow(1096)->
    #guideActionCfg {
    id = 1096,
    trigger = 1,
    triggerParam = 100,
    guideType = [1,3,6],
    uiTarget = "MainPanel&BottomLeft/System",
    finishTrigger = 1,
    watingtime = 0,
    content = "[A06729]有新的功能解锁啦，点击这里查看",
    nextGuide = 1097,
    resControl = "6&vfx_25_66&vfx_25_67&0||1&2&50",
    couldBeSkip = 1,
    needWaitTarget = 0,
    mainStep = 0,
    module = 0,
    closemsgpanle = 0
    };
getRow(1097)->
    #guideActionCfg {
    id = 1097,
    trigger = 1,
    triggerParam = 100,
    guideType = [1,3,6],
    uiTarget = "MainMenuPanel&BottomLeft/Panel2/Grid/42",
    finishTrigger = 1,
    watingtime = 0,
    content = "[A06729][ff4242]【星空之翼】[-]功能已解锁",
    nextGuide = 1098,
    resControl = "6&vfx_25_66&vfx_25_67&0||1&2&50",
    couldBeSkip = 0,
    needWaitTarget = 0,
    mainStep = 0,
    module = 0,
    closemsgpanle = 0
    };
getRow(1098)->
    #guideActionCfg {
    id = 1098,
    trigger = 1,
    triggerParam = 100,
    guideType = [1,3,6],
    uiTarget = "WingPanel&Anchor/Offset/Right/ItemSelect/ItemAdd",
    finishTrigger = 1,
    watingtime = 0,
    content = "[A06729]请添加升级星空之翼所需的材料",
    nextGuide = 1099,
    resControl = "6&vfx_25_66&vfx_25_67&0||1&2&50",
    couldBeSkip = 0,
    needWaitTarget = 0,
    mainStep = 0,
    module = 0,
    closemsgpanle = 0
    };
getRow(1099)->
    #guideActionCfg {
    id = 1099,
    trigger = 1,
    triggerParam = 100,
    guideType = [1,3,6],
    uiTarget = "WingPanel&Anchor/Offset/Right/ItemAdd/ListPoint1/0",
    finishTrigger = 1,
    watingtime = 0,
    content = "[A06729]请添加升级星空之翼所需的材料",
    nextGuide = 1100,
    resControl = "6&vfx_25_66&vfx_25_67&0||1&2&50",
    couldBeSkip = 0,
    needWaitTarget = 0,
    mainStep = 0,
    module = 0,
    closemsgpanle = 0
    };
getRow(1100)->
    #guideActionCfg {
    id = 1100,
    trigger = 1,
    triggerParam = 100,
    guideType = [1,3,6],
    uiTarget = "WingPanel&Anchor/Offset/Right/ExpAdd/1",
    finishTrigger = 1,
    watingtime = 0,
    content = "[A06729]点击[ff4242]【提升】[-]，提升星空之翼的等级！",
    nextGuide = 1101,
    resControl = "6&vfx_25_66&vfx_25_67&0||1&2&50",
    couldBeSkip = 0,
    needWaitTarget = 0,
    mainStep = 0,
    module = 0,
    closemsgpanle = 0
    };
getRow(1101)->
    #guideActionCfg {
    id = 1101,
    trigger = 1,
    triggerParam = 100,
    guideType = [1,3,6],
    uiTarget = "WingPanel&Anchor/Offset/Right/ExpAdd/Auto",
    finishTrigger = 1,
    watingtime = 0,
    content = "[A06729][ff4242]自动提升[-]能够快速提升星空之翼的等级！",
    nextGuide = 0,
    resControl = "6&vfx_25_66&vfx_25_67&0||1&2&50",
    couldBeSkip = 0,
    needWaitTarget = 0,
    mainStep = 0,
    module = 0,
    closemsgpanle = 0
    };
getRow(1102)->
    #guideActionCfg {
    id = 1102,
    trigger = 1,
    triggerParam = 100,
    guideType = [1,3,6],
    uiTarget = "MainPanel&TopRight/BeibaoButton",
    finishTrigger = 1,
    watingtime = 0,
    content = "[A06729]请注意在冒险中时刻补充[ff4242]【恢复药水】[-]！",
    nextGuide = 1103,
    resControl = "6&vfx_25_66&vfx_25_67&0||1&2&50",
    couldBeSkip = 0,
    needWaitTarget = 0,
    mainStep = 0,
    module = 0,
    closemsgpanle = 0
    };
getRow(1103)->
    #guideActionCfg {
    id = 1103,
    trigger = 1,
    triggerParam = 100,
    guideType = [1,3,6],
    uiTarget = "BagPanel&Anchor/Offset/BtnGrid/NpcShop_Button",
    finishTrigger = 1,
    watingtime = 0,
    content = "[A06729][ff4242]【恢复药水】[-]可以在随身补给商店中购买！",
    nextGuide = 1104,
    resControl = "6&vfx_25_66&vfx_25_67&0||1&2&50",
    couldBeSkip = 0,
    needWaitTarget = 0,
    mainStep = 0,
    module = 0,
    closemsgpanle = 0
    };
getRow(1104)->
    #guideActionCfg {
    id = 1104,
    trigger = 1,
    triggerParam = 100,
    guideType = [2],
    uiTarget = "BagPanel&Anchor/Offset/NpcShopRoot/NPCShopPanel(Clone)/Anchor/Offset/BuyInfo/BuyButton",
    finishTrigger = 2,
    watingtime = 3,
    content = "[A06729][ff4242]【恢复药水】[-]每10级一种，请根据自身等级选择使用！",
    nextGuide = 0,
    couldBeSkip = 0,
    needWaitTarget = 0,
    mainStep = 0,
    module = 0,
    closemsgpanle = 0
    };
getRow(1105)->
    #guideActionCfg {
    id = 1105,
    trigger = 1,
    triggerParam = 100,
    guideType = [5],
    uiTarget = "MainPanel&BottomLeft/System",
    finishTrigger = 3,
    watingtime = 0,
    nextGuide = 1106,
    resControl = "5&15",
    couldBeSkip = 0,
    needWaitTarget = 1,
    mainStep = 0,
    module = 15,
    closemsgpanle = 0
    };
getRow(1106)->
    #guideActionCfg {
    id = 1106,
    trigger = 1,
    triggerParam = 100,
    guideType = [1,3,6],
    uiTarget = "MainPanel&BottomLeft/System",
    finishTrigger = 1,
    watingtime = 0,
    content = "[A06729]有新的功能解锁啦，点击这里查看",
    nextGuide = 1107,
    resControl = "6&vfx_25_66&vfx_25_67&0||1&2&50",
    couldBeSkip = 1,
    needWaitTarget = 0,
    mainStep = 0,
    module = 0,
    closemsgpanle = 0
    };
getRow(1107)->
    #guideActionCfg {
    id = 1107,
    trigger = 1,
    triggerParam = 100,
    guideType = [1,3,6],
    uiTarget = "MainMenuPanel&BottomLeft/Panel2/Grid/15",
    finishTrigger = 1,
    watingtime = 0,
    content = "[A06729][ff4242]【家族】[-]功能已解锁",
    nextGuide = 1108,
    resControl = "6&vfx_25_66&vfx_25_67&0||1&2&50",
    couldBeSkip = 0,
    needWaitTarget = 0,
    mainStep = 0,
    module = 0,
    closemsgpanle = 0
    };
getRow(1108)->
    #guideActionCfg {
    id = 1108,
    trigger = 1,
    triggerParam = 100,
    guideType = [2],
    uiTarget = "OtherGuildPanel&BtnJoin",
    finishTrigger = 2,
    watingtime = 3,
    content = "[A06729]可以选择[ff4242]快速加入[-]，或者[ff4242]创建[-]一个家族！",
    nextGuide = 0,
    couldBeSkip = 0,
    needWaitTarget = 0,
    mainStep = 0,
    module = 0,
    closemsgpanle = 0
    };
getRow(1109)->
    #guideActionCfg {
    id = 1109,
    trigger = 1,
    triggerParam = 100,
    guideType = [1,3,6],
    uiTarget = "MainPanel&TopRight/ActivityOffset/Show",
    finishTrigger = 1,
    watingtime = 0,
    content = "[A06729]冒险中缺乏[ff4242]【经验】[-]时，可以选择进行副本扫荡",
    nextGuide = 1110,
    resControl = "6&vfx_25_66&vfx_25_67&0||1&2&50",
    couldBeSkip = 1,
    needWaitTarget = 0,
    mainStep = 0,
    module = 0,
    closemsgpanle = 0
    };
getRow(1110)->
    #guideActionCfg {
    id = 1110,
    trigger = 1,
    triggerParam = 100,
    guideType = [1,3,6],
    uiTarget = "MainPanel&TopRight/ActivityOffset/ActivityClip/MenuOne/20",
    finishTrigger = 1,
    watingtime = 0,
    content = "[A06729]冒险中缺乏[ff4242]【经验】[-]时，可以选择进行副本扫荡",
    nextGuide = 1111,
    resControl = "6&vfx_25_66&vfx_25_67&6||1&2&50",
    couldBeSkip = 0,
    needWaitTarget = 0,
    mainStep = 0,
    module = 0,
    closemsgpanle = 0
    };
getRow(1111)->
    #guideActionCfg {
    id = 1111,
    trigger = 1,
    triggerParam = 100,
    guideType = [2],
    uiTarget = "CopyPanel&Copy/Clear",
    finishTrigger = 2,
    watingtime = 3,
    content = "[A06729]所有副本的经验相同，但高级副本能获得更多的[ff4242]【强化材料】[-]！",
    nextGuide = 0,
    couldBeSkip = 0,
    needWaitTarget = 0,
    mainStep = 0,
    module = 0,
    closemsgpanle = 0
    };
getRow(1112)->
    #guideActionCfg {
    id = 1112,
    trigger = 1,
    triggerParam = 100,
    guideType = [1,3,6],
    uiTarget = "MainPanel&TopRight/ActivityOffset/Show",
    finishTrigger = 1,
    watingtime = 0,
    content = "[A06729]点击这里查看新开启的功能吧",
    nextGuide = 1113,
    resControl = "6&vfx_25_66&vfx_25_67&0||1&2&50",
    couldBeSkip = 1,
    needWaitTarget = 1,
    mainStep = 0,
    module = 0,
    closemsgpanle = 0
    };
getRow(1113)->
    #guideActionCfg {
    id = 1113,
    trigger = 1,
    triggerParam = 100,
    guideType = [1,3,6],
    uiTarget = "MainPanel&TopRight/ActivityOffset/ActivityClip/MenuOne/26",
    finishTrigger = 1,
    watingtime = 0,
    content = "[A06729]点击这里查看新开启的功能吧",
    nextGuide = 1114,
    resControl = "6&vfx_25_66&vfx_25_67&6||1&2&50",
    couldBeSkip = 0,
    needWaitTarget = 0,
    mainStep = 0,
    module = 0,
    closemsgpanle = 0
    };
getRow(1114)->
    #guideActionCfg {
    id = 1114,
    trigger = 1,
    triggerParam = 100,
    guideType = [1,3,6],
    uiTarget = "WelfarePanel&Anchor/Offset/ChangeButton/LeavedExp",
    finishTrigger = 1,
    watingtime = 0,
    content = "[A06729][ff4242]【灵力冥想】[-]功能已开启",
    nextGuide = 1115,
    resControl = "6&vfx_25_66&vfx_25_67&0||1&2&50",
    couldBeSkip = 0,
    needWaitTarget = 0,
    mainStep = 0,
    module = 0,
    closemsgpanle = 0
    };
getRow(1115)->
    #guideActionCfg {
    id = 1115,
    trigger = 1,
    triggerParam = 100,
    guideType = [2],
    uiTarget = "WelfarePanel&Anchor/Offset/Content/LeavedExp/Buttons/ButtonThree",
    finishTrigger = 2,
    watingtime = 3,
    content = "[A06729]角色会经常进入[ff4242]【灵力冥想】[-]状态，请记得回来领取经验值",
    nextGuide = 0,
    couldBeSkip = 0,
    needWaitTarget = 0,
    mainStep = 0,
    module = 0,
    closemsgpanle = 0
    };
getRow(1116)->
    #guideActionCfg {
    id = 1116,
    trigger = 1,
    triggerParam = 100,
    guideType = [5],
    uiTarget = "MainPanel&BottomLeft/System",
    finishTrigger = 3,
    watingtime = 0,
    nextGuide = 1117,
    resControl = "5&43",
    couldBeSkip = 0,
    needWaitTarget = 0,
    mainStep = 0,
    module = 43,
    closemsgpanle = 0
    };
getRow(1117)->
    #guideActionCfg {
    id = 1117,
    trigger = 1,
    triggerParam = 100,
    guideType = [1,3,6],
    uiTarget = "MainPanel&BottomLeft/System",
    finishTrigger = 1,
    watingtime = 0,
    content = "[A06729]新功能解锁啦，点击这里查看",
    nextGuide = 1118,
    resControl = "6&vfx_25_66&vfx_25_67&3||1&2&50",
    couldBeSkip = 1,
    needWaitTarget = 0,
    mainStep = 0,
    module = 0,
    closemsgpanle = 0
    };
getRow(1118)->
    #guideActionCfg {
    id = 1118,
    trigger = 1,
    triggerParam = 100,
    guideType = [1,3,6],
    uiTarget = "MainMenuPanel&BottomLeft/Panel2/Grid/43",
    finishTrigger = 1,
    watingtime = 0,
    content = "[A06729][ff4242]【合成】[-]功能已解锁",
    nextGuide = 1119,
    resControl = "6&vfx_25_66&vfx_25_67&3||1&2&50",
    couldBeSkip = 0,
    needWaitTarget = 0,
    mainStep = 0,
    module = 0,
    closemsgpanle = 0
    };
getRow(1119)->
    #guideActionCfg {
    id = 1119,
    trigger = 1,
    triggerParam = 100,
    guideType = [1,3,6],
    uiTarget = "ResourceMakePanel&Anchor/Offset/SwitchButton/MakeEquips",
    finishTrigger = 1,
    watingtime = 0,
    content = "[A06729][ff4242]【合成】[-]功能已解锁",
    nextGuide = 1120,
    resControl = "6&vfx_25_66&vfx_25_67&3||1&2&50",
    couldBeSkip = 0,
    needWaitTarget = 0,
    mainStep = 0,
    module = 0,
    closemsgpanle = 0
    };
getRow(1120)->
    #guideActionCfg {
    id = 1120,
    trigger = 1,
    triggerParam = 100,
    guideType = [3,6],
    uiTarget = "ResourceMakePanel&Anchor/Offset/Content/MakeEquips/Detail/Panel/List%2/Make",
    finishTrigger = 1,
    watingtime = 0,
    content = "[A06729][ff4242]【合成】[-]一件30级红色胸甲",
    nextGuide = 1121,
    resControl = "6&vfx_25_66&vfx_25_67&3||1&2&50",
    couldBeSkip = 0,
    needWaitTarget = 0,
    mainStep = 0,
    module = 0,
    closemsgpanle = 0
    };
getRow(1121)->
    #guideActionCfg {
    id = 1121,
    trigger = 1,
    triggerParam = 100,
    guideType = [3,6],
    uiTarget = "EquipmentGuidePanel&Anchor/Offest/PutOnBtn",
    finishTrigger = 2,
    watingtime = 2,
    content = "[A06729]穿上新装备继续冒险吧！",
    nextGuide = 0,
    resControl = "6&vfx_25_66&vfx_25_67&3||1&2&50",
    couldBeSkip = 1,
    needWaitTarget = 0,
    mainStep = 0,
    module = 0,
    closemsgpanle = 0
    };
getRow(1122)->
    #guideActionCfg {
    id = 1122,
    trigger = 1,
    triggerParam = 100,
    guideType = [5],
    uiTarget = "MainPanel&BottomLeft/System",
    finishTrigger = 3,
    watingtime = 0,
    nextGuide = 1123,
    resControl = "5&38",
    couldBeSkip = 0,
    needWaitTarget = 0,
    mainStep = 0,
    module = 9,
    closemsgpanle = 0
    };
getRow(1123)->
    #guideActionCfg {
    id = 1123,
    trigger = 1,
    triggerParam = 100,
    guideType = [1,3,6],
    uiTarget = "MainPanel&BottomLeft/System",
    finishTrigger = 1,
    watingtime = 0,
    content = "[A06729]新功能解锁啦，点击这里查看",
    nextGuide = 1124,
    resControl = "6&vfx_25_66&vfx_25_67&3||1&2&50",
    couldBeSkip = 1,
    needWaitTarget = 0,
    mainStep = 0,
    module = 0,
    closemsgpanle = 0
    };
getRow(1124)->
    #guideActionCfg {
    id = 1124,
    trigger = 1,
    triggerParam = 100,
    guideType = [1,3,6],
    uiTarget = "MainMenuPanel&BottomLeft/Panel2/Grid/9",
    finishTrigger = 1,
    watingtime = 0,
    content = "[A06729][ff4242]【升星】[-]功能已解锁",
    nextGuide = 1125,
    resControl = "6&vfx_25_66&vfx_25_67&0||1&2&50",
    couldBeSkip = 0,
    needWaitTarget = 0,
    mainStep = 0,
    module = 0,
    closemsgpanle = 0
    };
getRow(1125)->
    #guideActionCfg {
    id = 1125,
    trigger = 1,
    triggerParam = 100,
    guideType = [1,3,6],
    uiTarget = "StrengthenPanel&switchBtn/ImproveEquip",
    finishTrigger = 1,
    watingtime = 0,
    content = "[A06729][ff4242]【升星】[-]功能已解锁",
    nextGuide = 1126,
    resControl = "6&vfx_25_66&vfx_25_67&0||1&2&50",
    couldBeSkip = 0,
    needWaitTarget = 0,
    mainStep = 0,
    module = 0,
    closemsgpanle = 0
    };
getRow(1126)->
    #guideActionCfg {
    id = 1126,
    trigger = 1,
    triggerParam = 100,
    guideType = [2],
    uiTarget = "StrengthenPanel&strengthen_content/SwitchPackage/ImproveEquip/Buttons/ImproveBtn",
    finishTrigger = 2,
    watingtime = 3,
    content = "[A06729][ff4242]【升星】[-]可以激发装备的本源力量，请尽情尝试吧！",
    nextGuide = 0,
    couldBeSkip = 0,
    needWaitTarget = 0,
    mainStep = 0,
    module = 0,
    closemsgpanle = 0
    };
getRow(_)->[].

getKeyList()->[
    {1001},
    {1002},
    {1003},
    {1004},
    {1005},
    {1006},
    {1007},
    {1008},
    {1009},
    {1010},
    {1011},
    {1012},
    {1013},
    {1014},
    {1015},
    {1016},
    {1017},
    {1018},
    {1019},
    {1020},
    {1021},
    {1022},
    {1023},
    {1024},
    {1025},
    {1026},
    {1027},
    {1028},
    {1029},
    {1030},
    {1031},
    {1032},
    {1033},
    {1034},
    {1035},
    {1036},
    {1037},
    {1038},
    {1039},
    {1040},
    {1041},
    {1042},
    {1043},
    {1044},
    {1045},
    {1046},
    {1047},
    {1048},
    {1049},
    {1050},
    {1051},
    {1052},
    {1053},
    {1054},
    {1055},
    {1056},
    {1057},
    {1058},
    {1059},
    {1060},
    {1061},
    {1062},
    {1063},
    {1064},
    {1065},
    {1066},
    {1067},
    {1068},
    {1069},
    {1070},
    {1071},
    {1072},
    {1073},
    {1074},
    {1075},
    {1076},
    {1077},
    {1078},
    {1079},
    {1080},
    {1081},
    {1082},
    {1083},
    {1084},
    {1085},
    {1086},
    {1087},
    {1088},
    {1089},
    {1090},
    {1091},
    {1092},
    {1093},
    {1094},
    {1095},
    {1096},
    {1097},
    {1098},
    {1099},
    {1100},
    {1101},
    {1102},
    {1103},
    {1104},
    {1105},
    {1106},
    {1107},
    {1108},
    {1109},
    {1110},
    {1111},
    {1112},
    {1113},
    {1114},
    {1115},
    {1116},
    {1117},
    {1118},
    {1119},
    {1120},
    {1121},
    {1122},
    {1123},
    {1124},
    {1125},
    {1126}
    ].

get1KeyList()->[
    1001,
    1002,
    1003,
    1004,
    1005,
    1006,
    1007,
    1008,
    1009,
    1010,
    1011,
    1012,
    1013,
    1014,
    1015,
    1016,
    1017,
    1018,
    1019,
    1020,
    1021,
    1022,
    1023,
    1024,
    1025,
    1026,
    1027,
    1028,
    1029,
    1030,
    1031,
    1032,
    1033,
    1034,
    1035,
    1036,
    1037,
    1038,
    1039,
    1040,
    1041,
    1042,
    1043,
    1044,
    1045,
    1046,
    1047,
    1048,
    1049,
    1050,
    1051,
    1052,
    1053,
    1054,
    1055,
    1056,
    1057,
    1058,
    1059,
    1060,
    1061,
    1062,
    1063,
    1064,
    1065,
    1066,
    1067,
    1068,
    1069,
    1070,
    1071,
    1072,
    1073,
    1074,
    1075,
    1076,
    1077,
    1078,
    1079,
    1080,
    1081,
    1082,
    1083,
    1084,
    1085,
    1086,
    1087,
    1088,
    1089,
    1090,
    1091,
    1092,
    1093,
    1094,
    1095,
    1096,
    1097,
    1098,
    1099,
    1100,
    1101,
    1102,
    1103,
    1104,
    1105,
    1106,
    1107,
    1108,
    1109,
    1110,
    1111,
    1112,
    1113,
    1114,
    1115,
    1116,
    1117,
    1118,
    1119,
    1120,
    1121,
    1122,
    1123,
    1124,
    1125,
    1126
    ].

