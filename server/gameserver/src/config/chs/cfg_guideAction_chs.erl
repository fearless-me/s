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
    triggerParam = 1,
    guideType = [1,3,6],
    uiTarget = "TaskTipsPanel&Anchor/Offset/TaskList/TaskItem(Clone)",
    finishTrigger = 1,
    watingtime = 0,
    content = "[A06729]欢迎来到露娜世界，点击这里开始魔幻之旅吧！",
    nextGuide = 0,
    resControl = "6&vfx_25_66&vfx_25_67&0||1&2&50",
    couldBeSkip = 0,
    needWaitTarget = 0,
    mainStep = 1
    };
getRow(1002)->
    #guideActionCfg {
    id = 1002,
    trigger = 3,
    triggerParam = 1,
    guideType = [1,3,6],
    uiTarget = "TaskTipsPanel&Anchor/Offset/TaskList/TaskItem(Clone)",
    finishTrigger = 1,
    watingtime = 0,
    content = "[A06729]完成了任务，点击[ff4242]领取[-]任务奖励！",
    nextGuide = 0,
    resControl = "6&vfx_25_66&vfx_25_67&0||1&2&50",
    couldBeSkip = 0,
    needWaitTarget = 0,
    mainStep = 1
    };
getRow(1003)->
    #guideActionCfg {
    id = 1003,
    trigger = 7,
    triggerParam = 303,
    guideType = [1,3,6],
    uiTarget = "MainPanel&BottomRight/SkillOffset/AttackButton",
    finishTrigger = 1,
    watingtime = 3,
    content = "[A06729]点击[ff4242]攻击[-]按钮进行攻击击杀小鱼人",
    nextGuide = 0,
    resControl = "6&vfx_25_66&vfx_25_67&1||1&2&50",
    couldBeSkip = 0,
    needWaitTarget = 1,
    mainStep = 1
    };
getRow(1004)->
    #guideActionCfg {
    id = 1004,
    trigger = 7,
    triggerParam = 304,
    guideType = [1,3,6],
    uiTarget = "MainPanel&BottomRight/SkillOffset/AllSkill/Skill_0/Button",
    finishTrigger = 1,
    watingtime = 0,
    content = "[A06729]点击[ff4242]技能[-]图标释放技能，能更高效的消灭敌人！",
    nextGuide = 0,
    resControl = "6&vfx_25_66&vfx_25_67&0||1&2&50",
    couldBeSkip = 0,
    needWaitTarget = 1,
    mainStep = 1
    };
getRow(1005)->
    #guideActionCfg {
    id = 1005,
    trigger = 2,
    triggerParam = 10,
    guideType = [1,3,6],
    uiTarget = "MainPanel&TopLeft/MyHeadOffset/Head",
    finishTrigger = 1,
    watingtime = 0,
    content = "[A06729]快点击人物头像看看刚获取的技能吧",
    nextGuide = 1006,
    resControl = "6&vfx_25_66&vfx_25_67&0||1&2&50",
    couldBeSkip = 0,
    needWaitTarget = 0,
    mainStep = 0
    };
getRow(1006)->
    #guideActionCfg {
    id = 1006,
    trigger = 6,
    triggerParam = 1005,
    guideType = [1,3,6],
    uiTarget = "CharacterPanel&Anchor/Offset/switchBtns/Skill_Button",
    finishTrigger = 1,
    watingtime = 0,
    content = "[A06729]点击“[ff4242]技能[-]”页签可查看刚获取的技能",
    nextGuide = 1007,
    resControl = "6&vfx_25_66&vfx_25_67&0||1&2&50",
    couldBeSkip = 0,
    needWaitTarget = 0,
    mainStep = 0
    };
getRow(1007)->
    #guideActionCfg {
    id = 1007,
    trigger = 6,
    triggerParam = 1006,
    guideType = [1,3,6],
    uiTarget = "CharacterPanel&Anchor/Offset/skill/skill(Clone)/allSkills/panel/grid/0/add",
    finishTrigger = 1,
    watingtime = 0,
    content = "[A06729]点击技能后的[ff4242]加号[-]按钮能升级技能，提高技能的伤害",
    nextGuide = 0,
    resControl = "6&vfx_25_66&vfx_25_67&0||1&2&50",
    couldBeSkip = 0,
    needWaitTarget = 0,
    mainStep = 1
    };
getRow(1008)->
    #guideActionCfg {
    id = 1008,
    trigger = 2,
    triggerParam = 12,
    guideType = [1,3,6],
    uiTarget = "EquipmentGuidePanel&Anchor/Offest/PutOnBtn",
    finishTrigger = 1,
    watingtime = 0,
    content = "[A06729]恭喜你获得了一件装备，快穿上吧！",
    nextGuide = 0,
    resControl = "6&vfx_25_66&vfx_25_67&0||1&2&50",
    couldBeSkip = 0,
    needWaitTarget = 0,
    mainStep = 0
    };
getRow(1009)->
    #guideActionCfg {
    id = 1009,
    trigger = 7,
    triggerParam = 305,
    guideType = [1,3,6],
    uiTarget = "MainPanel&TopRight/OtherBtns/Skill_6/Button",
    finishTrigger = 1,
    watingtime = 0,
    content = "[A06729]使用[ff4242]自动战斗[-]，打怪物更轻松哦！",
    nextGuide = 0,
    resControl = "6&vfx_25_66&vfx_25_67&0||1&2&50",
    couldBeSkip = 0,
    needWaitTarget = 0,
    mainStep = 0
    };
getRow(1010)->
    #guideActionCfg {
    id = 1010,
    trigger = 1,
    triggerParam = 5,
    guideType = [1,3,6],
    uiTarget = "MainPanel&TopLeft/MyHeadOffset/Head",
    finishTrigger = 1,
    watingtime = 0,
    content = "[A06729]又学会了一个技能，我们来看看吧",
    nextGuide = 1011,
    resControl = "6&vfx_25_66&vfx_25_67&0||1&2&50",
    couldBeSkip = 0,
    needWaitTarget = 0,
    mainStep = 0
    };
getRow(1011)->
    #guideActionCfg {
    id = 1011,
    trigger = 6,
    triggerParam = 1010,
    guideType = [1,3,6],
    uiTarget = "CharacterPanel&Anchor/Offset/switchBtns/Skill_Button",
    finishTrigger = 1,
    watingtime = 0,
    content = "[A06729]点击“[ff4242]技能[-]”页签可查看刚获取的技能",
    nextGuide = 0,
    resControl = "6&vfx_25_66&vfx_25_67&0||1&2&50",
    couldBeSkip = 0,
    needWaitTarget = 0,
    mainStep = 0
    };
getRow(1012)->
    #guideActionCfg {
    id = 1012,
    trigger = 7,
    triggerParam = 307,
    guideType = [1,3,6],
    uiTarget = "SpecificEventPanel&UIAchor/Skill_Goddess/Button",
    finishTrigger = 1,
    watingtime = 0,
    content = "[A06729]女神之力—仁慈召唤可以使用了，赶紧试试吧",
    nextGuide = 0,
    resControl = "6&vfx_25_66&vfx_25_67&0||1&2&50",
    couldBeSkip = 0,
    needWaitTarget = 1,
    mainStep = 0
    };
getRow(1013)->
    #guideActionCfg {
    id = 1013,
    trigger = 1,
    triggerParam = 6,
    guideType = [1,3,6],
    uiTarget = "MainPanel&TopRight/Goddness",
    finishTrigger = 1,
    watingtime = 0,
    content = "[A06729]善良的女神们前来帮助你闯荡露娜世界啦~",
    nextGuide = 1014,
    resControl = "6&vfx_25_66&vfx_25_67&0||1&2&50",
    couldBeSkip = 0,
    needWaitTarget = 1,
    mainStep = 0
    };
getRow(1014)->
    #guideActionCfg {
    id = 1014,
    trigger = 6,
    triggerParam = 1013,
    guideType = [1,3,6],
    uiTarget = "MainPanel&TopRight/Goddness",
    finishTrigger = 1,
    watingtime = 0,
    content = "[A06729]仁慈女神，擅长治愈！",
    nextGuide = 1015,
    resControl = "6&vfx_25_66&vfx_25_67&0||1&2&50",
    couldBeSkip = 0,
    needWaitTarget = 1,
    mainStep = 0
    };
getRow(1015)->
    #guideActionCfg {
    id = 1015,
    trigger = 6,
    triggerParam = 1014,
    guideType = [1,3,6],
    uiTarget = "TransformPanel&PageGoddess/Btn/GoddessGoFight",
    finishTrigger = 1,
    watingtime = 0,
    content = "[A06729]请点击[ff4242][出战][-]吧~",
    nextGuide = 1016,
    resControl = "6&vfx_25_66&vfx_25_67&0||1&2&50",
    couldBeSkip = 0,
    needWaitTarget = 0,
    mainStep = 0
    };
getRow(1016)->
    #guideActionCfg {
    id = 1016,
    trigger = 6,
    triggerParam = 1015,
    guideType = [1,3,6],
    uiTarget = "TransformPanel&PageGoddess/SpBg/BtnLevelUp",
    finishTrigger = 1,
    watingtime = 0,
    content = "[A06729]点击[ff4242][升级][-]按钮，可以提升女神的属性",
    nextGuide = 1017,
    resControl = "6&vfx_25_66&vfx_25_67&0||1&2&50",
    couldBeSkip = 0,
    needWaitTarget = 0,
    mainStep = 1
    };
getRow(1017)->
    #guideActionCfg {
    id = 1017,
    trigger = 6,
    triggerParam = 1016,
    guideType = [1,3,6],
    uiTarget = "TransformPanel&ButtonClose",
    finishTrigger = 1,
    watingtime = 0,
    content = "[A06729]点击[ff4242]关闭[-]按钮，关闭当前界面",
    nextGuide = 1018,
    resControl = "6&vfx_25_66&vfx_25_67&0||1&2&50",
    couldBeSkip = 0,
    needWaitTarget = 0,
    mainStep = 0
    };
getRow(1018)->
    #guideActionCfg {
    id = 1018,
    trigger = 6,
    triggerParam = 1017,
    guideType = [3,6],
    uiTarget = "MainPanel&TopRight/Goddness",
    finishTrigger = 2,
    watingtime = 1,
    content = "[A06729]在这里可以查看女神的解锁进度！",
    nextGuide = 1019,
    resControl = "6&vfx_25_66&vfx_25_67&0",
    couldBeSkip = 0,
    needWaitTarget = 0,
    mainStep = 0
    };
getRow(1019)->
    #guideActionCfg {
    id = 1019,
    trigger = 6,
    triggerParam = 1018,
    guideType = [1,3,6],
    uiTarget = "MainPanel&BottomLeft/System",
    finishTrigger = 1,
    watingtime = 0,
    content = "[A06729]获得了一个成就，快来这里看看吧！",
    nextGuide = 1020,
    resControl = "6&vfx_25_66&vfx_25_67&0||1&2&50",
    couldBeSkip = 1,
    needWaitTarget = 0,
    mainStep = 0
    };
getRow(1020)->
    #guideActionCfg {
    id = 1020,
    trigger = 6,
    triggerParam = 1019,
    guideType = [1,3,6],
    uiTarget = "MainMenuPanel&BottomLeft/Panel2/Grid/29",
    finishTrigger = 1,
    watingtime = 0,
    content = "[A06729]点击[ff4242]成就[-]图标，看看你完成了什么成就吧",
    nextGuide = 1021,
    resControl = "6&vfx_25_66&vfx_25_67&0||1&2&50",
    couldBeSkip = 0,
    needWaitTarget = 0,
    mainStep = 0
    };
getRow(1021)->
    #guideActionCfg {
    id = 1021,
    trigger = 6,
    triggerParam = 1020,
    guideType = [1,3,6],
    uiTarget = "AchievementPanel&Anchor/Offset/AchievePanel/TypeList%3",
    finishTrigger = 1,
    watingtime = 0,
    content = "[A06729]点击“[ff4242]登峰造极[-]”页签，切换到登峰造极界面",
    nextGuide = 1022,
    resControl = "6&vfx_25_66&vfx_25_67&0||1&2&50",
    couldBeSkip = 0,
    needWaitTarget = 0,
    mainStep = 0
    };
getRow(1022)->
    #guideActionCfg {
    id = 1022,
    trigger = 6,
    triggerParam = 1021,
    guideType = [1,3,6],
    uiTarget = "AchievementPanel&Anchor/Offset/AchievePanel/DetailList/DetailItem(Clone)_700/Button",
    finishTrigger = 1,
    watingtime = 0,
    content = "[A06729]点击[ff4242]领奖[-]按钮，领取奖励吧~",
    nextGuide = 0,
    resControl = "6&vfx_25_66&vfx_25_67&0||1&2&50",
    couldBeSkip = 0,
    needWaitTarget = 0,
    mainStep = 1
    };
getRow(1023)->
    #guideActionCfg {
    id = 1023,
    trigger = 3,
    triggerParam = 27,
    guideType = [5],
    uiTarget = "MainPanel&TopLeft/MyHeadOffset/Head",
    finishTrigger = 3,
    watingtime = 0,
    nextGuide = 1024,
    resControl = "5&9",
    couldBeSkip = 0,
    needWaitTarget = 0,
    mainStep = 0
    };
getRow(1024)->
    #guideActionCfg {
    id = 1024,
    trigger = 6,
    triggerParam = 1023,
    guideType = [1,3,6],
    uiTarget = "MainPanel&TopLeft/MyHeadOffset/Head",
    finishTrigger = 1,
    watingtime = 0,
    content = "[A06729]点击[ff4242]头像[-]，打开人物面板",
    nextGuide = 1025,
    resControl = "6&vfx_25_66&vfx_25_67&0||1&2&50",
    couldBeSkip = 0,
    needWaitTarget = 0,
    mainStep = 0
    };
getRow(1025)->
    #guideActionCfg {
    id = 1025,
    trigger = 6,
    triggerParam = 1024,
    guideType = [1,3,6],
    uiTarget = "CharacterPanel&Anchor/Offset/switchBtns/Strengthen_Button",
    finishTrigger = 1,
    watingtime = 0,
    content = "[A06729]点击选择“[ff4242]强化[-]”页签",
    nextGuide = 1026,
    resControl = "6&vfx_25_66&vfx_25_67&0||1&2&50",
    couldBeSkip = 0,
    needWaitTarget = 0,
    mainStep = 0
    };
getRow(1026)->
    #guideActionCfg {
    id = 1026,
    trigger = 6,
    triggerParam = 1025,
    guideType = [1,3,6],
    uiTarget = "CharacterPanel&Anchor/Offset/Strengthen/strengthen(Clone)/strengthen_content/SwitchPackage/EquipmentRefining/Parts/ScrollView/Grid/0",
    finishTrigger = 1,
    watingtime = 0,
    content = "[A06729]选择武器精炼提升武器等级",
    nextGuide = 1027,
    resControl = "6&vfx_25_66&vfx_25_67&0||1&2&50",
    couldBeSkip = 0,
    needWaitTarget = 0,
    mainStep = 0
    };
getRow(1027)->
    #guideActionCfg {
    id = 1027,
    trigger = 6,
    triggerParam = 1026,
    guideType = [1,3,6],
    uiTarget = "CharacterPanel&Anchor/Offset/Strengthen/strengthen(Clone)/strengthen_content/SwitchPackage/EquipmentRefining/ImproveBtn",
    finishTrigger = 1,
    watingtime = 0,
    content = "[A06729]点击[ff4242]精炼[-]按钮，提升武器的等级吧",
    nextGuide = 1028,
    resControl = "6&vfx_25_66&vfx_25_67&0||1&2&50",
    couldBeSkip = 0,
    needWaitTarget = 0,
    mainStep = 1
    };
getRow(1028)->
    #guideActionCfg {
    id = 1028,
    trigger = 6,
    triggerParam = 1027,
    guideType = [1,3,6],
    uiTarget = "CharacterPanel&Anchor/Offset/Strengthen/strengthen(Clone)/strengthen_content/SwitchPackage/EquipmentRefining/Parts/ScrollView/Grid/3",
    finishTrigger = 1,
    watingtime = 0,
    content = "[A06729]很好，接下来精炼一下衣服吧",
    nextGuide = 1029,
    resControl = "6&vfx_25_66&vfx_25_67&0||1&2&50",
    couldBeSkip = 0,
    needWaitTarget = 0,
    mainStep = 0
    };
getRow(1029)->
    #guideActionCfg {
    id = 1029,
    trigger = 6,
    triggerParam = 1028,
    guideType = [1,3,6],
    uiTarget = "CharacterPanel&Anchor/Offset/Strengthen/strengthen(Clone)/strengthen_content/SwitchPackage/EquipmentRefining/ImproveBtn",
    finishTrigger = 1,
    watingtime = 0,
    content = "[A06729]点击[ff4242]精炼[-]按钮，提升衣服的等级吧",
    nextGuide = 1030,
    resControl = "6&vfx_25_66&vfx_25_67&0||1&2&50",
    couldBeSkip = 0,
    needWaitTarget = 0,
    mainStep = 0
    };
getRow(1030)->
    #guideActionCfg {
    id = 1030,
    trigger = 6,
    triggerParam = 1029,
    guideType = [1,3,6],
    uiTarget = "CharacterPanel&Anchor/Offset/Close_Button",
    finishTrigger = 1,
    watingtime = 0,
    content = "[A06729]点击[ff4242]关闭[-]按钮，关闭当前界面",
    nextGuide = 0,
    resControl = "6&vfx_25_66&vfx_25_67&0||1&2&50",
    couldBeSkip = 0,
    needWaitTarget = 0,
    mainStep = 0
    };
getRow(1031)->
    #guideActionCfg {
    id = 1031,
    trigger = 2,
    triggerParam = 44,
    guideType = [1,3,6],
    uiTarget = "MainPanel&TopRight/Goddness",
    finishTrigger = 1,
    watingtime = 0,
    content = "[A06729]战争女神可以解锁了，快来解锁战争女神",
    nextGuide = 1032,
    resControl = "6&vfx_25_66&vfx_25_67&0||1&2&50",
    couldBeSkip = 0,
    needWaitTarget = 1,
    mainStep = 0
    };
getRow(1032)->
    #guideActionCfg {
    id = 1032,
    trigger = 6,
    triggerParam = 1031,
    guideType = [1,3,6],
    uiTarget = "MainPanel&TopRight/Goddness",
    finishTrigger = 1,
    watingtime = 0,
    content = "[A06729]让战争女神出战吧！",
    nextGuide = 1033,
    resControl = "6&vfx_25_66&vfx_25_67&0||1&2&50",
    couldBeSkip = 0,
    needWaitTarget = 1,
    mainStep = 0
    };
getRow(1033)->
    #guideActionCfg {
    id = 1033,
    trigger = 6,
    triggerParam = 1032,
    guideType = [1,3,6],
    uiTarget = "TransformPanel&PageGoddess/List%1",
    finishTrigger = 1,
    watingtime = 0,
    content = "[A06729]选中[ff4242]战争女神[-]",
    nextGuide = 1034,
    resControl = "6&vfx_25_66&vfx_25_67&0||1&2&50",
    couldBeSkip = 0,
    needWaitTarget = 1,
    mainStep = 0
    };
getRow(1034)->
    #guideActionCfg {
    id = 1034,
    trigger = 6,
    triggerParam = 1033,
    guideType = [1,3,6],
    uiTarget = "TransformPanel&PageGoddess/Btn/GoddessGoFight",
    finishTrigger = 1,
    watingtime = 0,
    content = "[A06729]点击[ff4242]出战[-]按钮，让战争女神陪你征战吧！",
    nextGuide = 0,
    resControl = "6&vfx_25_66&vfx_25_67&0||1&2&50",
    couldBeSkip = 0,
    needWaitTarget = 1,
    mainStep = 1
    };
getRow(1035)->
    #guideActionCfg {
    id = 1035,
    trigger = 1,
    triggerParam = 10,
    guideType = [1,3,6],
    uiTarget = "CopyPanel&Copy/Enter",
    finishTrigger = 1,
    watingtime = 0,
    content = "[A06729]点击[ff4242]单人前往[-]按钮，进行副本历练吧！",
    nextGuide = 1036,
    resControl = "6&vfx_25_66&vfx_25_67&0||1&2&50",
    couldBeSkip = 0,
    needWaitTarget = 1,
    mainStep = 1
    };
getRow(1036)->
    #guideActionCfg {
    id = 1036,
    trigger = 6,
    triggerParam = 1035,
    guideType = [1,3,6],
    uiTarget = "MessageBoxPanel&Anchor/Offset/ButtonOne",
    finishTrigger = 1,
    watingtime = 0,
    content = "[A06729]点击[ff4242]进入[-]按钮，进入副本吧！",
    nextGuide = 1037,
    resControl = "6&vfx_25_66&vfx_25_67&0||1&2&50",
    couldBeSkip = 0,
    needWaitTarget = 0,
    mainStep = 0
    };
getRow(1037)->
    #guideActionCfg {
    id = 1037,
    trigger = 6,
    triggerParam = 1036,
    guideType = [1,3,6],
    uiTarget = "SpecificEventPanel&WeaponSkill/Button",
    finishTrigger = 1,
    watingtime = 0,
    content = "[A06729]器灵觉醒了，让我们体验一下吧！",
    nextGuide = 0,
    resControl = "6&vfx_25_66&vfx_25_67&0||1&2&50",
    couldBeSkip = 0,
    needWaitTarget = 1,
    mainStep = 0
    };
getRow(1038)->
    #guideActionCfg {
    id = 1038,
    trigger = 2,
    triggerParam = 46,
    guideType = [5],
    uiTarget = "MainPanel&BottomLeft/System",
    finishTrigger = 3,
    watingtime = 0,
    nextGuide = 1039,
    resControl = "5&34",
    couldBeSkip = 0,
    needWaitTarget = 0,
    mainStep = 0
    };
getRow(1039)->
    #guideActionCfg {
    id = 1039,
    trigger = 6,
    triggerParam = 1038,
    guideType = [1,3,6],
    uiTarget = "MainPanel&BottomLeft/System",
    finishTrigger = 1,
    watingtime = 0,
    content = "[A06729]有新的功能解锁了，点击这里可以查看新功能",
    nextGuide = 1040,
    resControl = "6&vfx_25_66&vfx_25_67&0||1&2&50",
    couldBeSkip = 1,
    needWaitTarget = 0,
    mainStep = 0
    };
getRow(1040)->
    #guideActionCfg {
    id = 1040,
    trigger = 6,
    triggerParam = 1039,
    guideType = [1,3,6],
    uiTarget = "MainMenuPanel&BottomLeft/Panel2/Grid/34",
    finishTrigger = 1,
    watingtime = 0,
    content = "[A06729]点击[ff4242]器灵[-]图标，打开器灵界面",
    nextGuide = 1041,
    resControl = "6&vfx_25_66&vfx_25_67&0||1&2&50",
    couldBeSkip = 0,
    needWaitTarget = 0,
    mainStep = 0
    };
getRow(1041)->
    #guideActionCfg {
    id = 1041,
    trigger = 6,
    triggerParam = 1040,
    guideType = [1,3,6],
    uiTarget = "WeaponImprovePanel&Anchor/Offset/Content/BaseDesc/ActiveBtn",
    finishTrigger = 1,
    watingtime = 0,
    content = "[A06729]有可解封的器灵，快进行器灵解封吧！",
    nextGuide = 1042,
    resControl = "6&vfx_25_66&vfx_25_67&0||1&2&50",
    couldBeSkip = 0,
    needWaitTarget = 0,
    mainStep = 1
    };
getRow(1042)->
    #guideActionCfg {
    id = 1042,
    trigger = 6,
    triggerParam = 1041,
    guideType = [1,6],
    uiTarget = "MessageBoxPanel&Anchor/Offset/ButtonOne",
    finishTrigger = 1,
    watingtime = 0,
    nextGuide = 1043,
    resControl = "6&vfx_25_66&vfx_25_67&0||1&2&50",
    couldBeSkip = 0,
    needWaitTarget = 0,
    mainStep = 0
    };
getRow(1043)->
    #guideActionCfg {
    id = 1043,
    trigger = 6,
    triggerParam = 1042,
    guideType = [1,3,6],
    uiTarget = "WeaponImprovePanel&Anchor/Offset/CloseButton",
    finishTrigger = 1,
    watingtime = 0,
    content = "[A06729]点击[ff4242]关闭[-]按钮，关闭当前界面",
    nextGuide = 1044,
    resControl = "6&vfx_25_66&vfx_25_67&0||1&2&50",
    couldBeSkip = 0,
    needWaitTarget = 0,
    mainStep = 0
    };
getRow(1044)->
    #guideActionCfg {
    id = 1044,
    trigger = 6,
    triggerParam = 1043,
    guideType = [1,3,6],
    uiTarget = "MainPanel&TopRight/ActivityOffset/ActivityClip/MenuOne/22",
    finishTrigger = 1,
    watingtime = 0,
    content = "[A06729]点击[ff4242]日常[-]按钮，打开日常界面",
    nextGuide = 1045,
    resControl = "6&vfx_25_66&vfx_25_67&0||1&2&50",
    couldBeSkip = 1,
    needWaitTarget = 0,
    mainStep = 0
    };
getRow(1045)->
    #guideActionCfg {
    id = 1045,
    trigger = 6,
    triggerParam = 1044,
    guideType = [1,3,6],
    uiTarget = "DailyPanel&Anchor/Offset/ScrollView/PveButton/34",
    finishTrigger = 1,
    watingtime = 0,
    content = "[A06729]点击“[ff4242]混沌灵界[-]”页签，进入混沌灵界页签",
    nextGuide = 1046,
    resControl = "6&vfx_25_66&vfx_25_67&0||1&2&50",
    couldBeSkip = 0,
    needWaitTarget = 0,
    mainStep = 0
    };
getRow(1046)->
    #guideActionCfg {
    id = 1046,
    trigger = 6,
    triggerParam = 1045,
    guideType = [3,6],
    uiTarget = "DailyPanel&Anchor/Offset/Content/34/ButtonChallenge",
    finishTrigger = 1,
    watingtime = 0,
    content = "[A06729]在这里进行挑战吧！",
    nextGuide = 0,
    resControl = "6&vfx_25_66&vfx_25_67&0",
    couldBeSkip = 0,
    needWaitTarget = 0,
    mainStep = 0
    };
getRow(1047)->
    #guideActionCfg {
    id = 1047,
    trigger = 2,
    triggerParam = 55,
    guideType = [1,3,6],
    uiTarget = "MainPanel&TopRight/BeibaoButton",
    finishTrigger = 1,
    watingtime = 0,
    content = "[A06729]点击背包，查看刚获得的骑宠！",
    nextGuide = 1048,
    resControl = "6&vfx_25_66&vfx_25_67&0||1&2&50",
    couldBeSkip = 0,
    needWaitTarget = 0,
    mainStep = 0
    };
getRow(1048)->
    #guideActionCfg {
    id = 1048,
    trigger = 6,
    triggerParam = 1047,
    guideType = [1,3,6],
    uiTarget = "BagPanel&Anchor/Offset/Package/Pack_Content/RolePackage/SwitchButton/Props",
    finishTrigger = 1,
    watingtime = 0,
    content = "[A06729]刚获得的骑宠存放于“[ff4242]道具[-]”页签！",
    nextGuide = 1049,
    resControl = "6&vfx_25_66&vfx_25_67&0||1&2&50",
    couldBeSkip = 0,
    needWaitTarget = 0,
    mainStep = 0
    };
getRow(1049)->
    #guideActionCfg {
    id = 1049,
    trigger = 6,
    triggerParam = 1048,
    guideType = [1,3,6],
    uiTarget = "!BagPanel&1811",
    finishTrigger = 1,
    watingtime = 0,
    content = "[A06729]点击[ff4242]骑宠[-]图标，进行上阵",
    nextGuide = 1050,
    resControl = "6&vfx_25_66&vfx_25_67&0||1&2&50",
    couldBeSkip = 0,
    needWaitTarget = 1,
    mainStep = 0
    };
getRow(1050)->
    #guideActionCfg {
    id = 1050,
    trigger = 6,
    triggerParam = 1049,
    guideType = [1,3,6],
    uiTarget = "ItemTips&Anchor/Offset/btns/ButtonOne",
    finishTrigger = 1,
    watingtime = 0,
    content = "[A06729]点击[ff4242]使用[-]按钮，进行出战",
    nextGuide = 0,
    resControl = "6&vfx_25_66&vfx_25_67&0||1&2&50",
    couldBeSkip = 0,
    needWaitTarget = 0,
    mainStep = 1
    };
getRow(1051)->
    #guideActionCfg {
    id = 1051,
    trigger = 2,
    triggerParam = 66,
    guideType = [1,3,6],
    uiTarget = "MainPanel&BottomLeft/System",
    finishTrigger = 1,
    watingtime = 0,
    content = "[A06729]点击这里，展开功能列表",
    nextGuide = 1052,
    resControl = "6&vfx_25_66&vfx_25_67&0||1&2&50",
    couldBeSkip = 0,
    needWaitTarget = 0,
    mainStep = 0
    };
getRow(1052)->
    #guideActionCfg {
    id = 1052,
    trigger = 6,
    triggerParam = 1051,
    guideType = [1,3,6],
    uiTarget = "MainMenuPanel&BottomLeft/Panel2/Grid/5",
    finishTrigger = 1,
    watingtime = 0,
    content = "[A06729]点击[ff4242]骑宠[-]图标，打开骑宠界面",
    nextGuide = 1053,
    resControl = "6&vfx_25_66&vfx_25_67&0||1&2&50",
    couldBeSkip = 0,
    needWaitTarget = 0,
    mainStep = 0
    };
getRow(1053)->
    #guideActionCfg {
    id = 1053,
    trigger = 6,
    triggerParam = 1052,
    guideType = [1,3,6],
    uiTarget = "RidePetPanel&Pages/RidePet/InfoPanel/Info/BtnInfo",
    finishTrigger = 1,
    watingtime = 0,
    content = "[A06729]点击[ff4242]详情[-]按钮，打开详情面板",
    nextGuide = 1054,
    resControl = "6&vfx_25_66&vfx_25_67&0||1&2&50",
    couldBeSkip = 0,
    needWaitTarget = 0,
    mainStep = 0
    };
getRow(1054)->
    #guideActionCfg {
    id = 1054,
    trigger = 6,
    triggerParam = 1053,
    guideType = [1,3,6],
    uiTarget = "RidePetInfoPanel&Anchor/Offset/InfoPanel/MAndPInfoBasePanel/Content/Attribute/Up/ButtonUpdate",
    finishTrigger = 1,
    watingtime = 0,
    content = "[A06729]点击“[ff4242]升星[-]”按钮，为骑宠升星吧",
    nextGuide = 0,
    resControl = "6&vfx_25_66&vfx_25_67&0||1&2&50",
    couldBeSkip = 0,
    needWaitTarget = 0,
    mainStep = 0
    };
getRow(1055)->
    #guideActionCfg {
    id = 1055,
    trigger = 2,
    triggerParam = 72,
    guideType = [1,3,6],
    uiTarget = "MainPanel&TopRight/ActivityOffset/Show",
    finishTrigger = 1,
    watingtime = 0,
    content = "[A06729]点击这里查看新开启的功能吧",
    nextGuide = 1056,
    resControl = "6&vfx_25_66&vfx_25_67&0||1&2&50",
    couldBeSkip = 1,
    needWaitTarget = 0,
    mainStep = 0
    };
getRow(1056)->
    #guideActionCfg {
    id = 1056,
    trigger = 6,
    triggerParam = 1055,
    guideType = [1,3,6],
    uiTarget = "MainPanel&TopRight/ActivityOffset/ActivityClip/MenuOne/12",
    finishTrigger = 1,
    watingtime = 0,
    content = "[A06729]点击“[ff4242]兑换[-]’图标，打开资源兑换界面",
    nextGuide = 1057,
    resControl = "6&vfx_25_66&vfx_25_67&0||1&2&50",
    couldBeSkip = 0,
    needWaitTarget = 0,
    mainStep = 0
    };
getRow(1057)->
    #guideActionCfg {
    id = 1057,
    trigger = 6,
    triggerParam = 1056,
    guideType = [1,3,6],
    uiTarget = "ResExchangePanel&Anchor/Offset/Package/Panel/Sprite(Clone)/2160",
    finishTrigger = 1,
    watingtime = 0,
    content = "[A06729]选择[ff4242]兽灵精华[-]来进行一次兑换吧！",
    nextGuide = 1058,
    resControl = "6&vfx_25_66&vfx_25_67&0||1&2&50",
    couldBeSkip = 0,
    needWaitTarget = 1,
    mainStep = 0
    };
getRow(1058)->
    #guideActionCfg {
    id = 1058,
    trigger = 6,
    triggerParam = 1057,
    guideType = [1,3,6],
    uiTarget = "ResExchangePanel&Anchor/Offset/BuyInfo/MaxButton",
    finishTrigger = 1,
    watingtime = 0,
    content = "[A06729]点击这里，能够将购买数量设置为最大哦！",
    nextGuide = 1059,
    resControl = "6&vfx_25_66&vfx_25_67&0||1&2&50",
    couldBeSkip = 0,
    needWaitTarget = 0,
    mainStep = 0
    };
getRow(1059)->
    #guideActionCfg {
    id = 1059,
    trigger = 6,
    triggerParam = 1058,
    guideType = [1,3,6],
    uiTarget = "ResExchangePanel&Anchor/Offset/BuyInfo/BuyButton",
    finishTrigger = 1,
    watingtime = 0,
    content = "[A06729]点击“[ff4242]购买[-]”按钮，进行购买操作吧",
    nextGuide = 0,
    resControl = "6&vfx_25_66&vfx_25_67&0||1&2&50",
    couldBeSkip = 0,
    needWaitTarget = 0,
    mainStep = 1
    };
getRow(1060)->
    #guideActionCfg {
    id = 1060,
    trigger = 1,
    triggerParam = 15,
    guideType = [1,3,6],
    uiTarget = "MainPanel&TopRight/ActivityOffset/Show",
    finishTrigger = 1,
    watingtime = 0,
    content = "[A06729]点击这里查看新开启的功能吧",
    nextGuide = 1061,
    resControl = "6&vfx_25_66&vfx_25_67&0||1&2&50",
    couldBeSkip = 1,
    needWaitTarget = 0,
    mainStep = 0
    };
getRow(1061)->
    #guideActionCfg {
    id = 1061,
    trigger = 6,
    triggerParam = 1060,
    guideType = [1,3,6],
    uiTarget = "MainPanel&TopRight/ActivityOffset/ActivityClip/MenuOne/53",
    finishTrigger = 1,
    watingtime = 0,
    content = "[A06729]点击“[ff4242]扭蛋[-]”图标，打开扭蛋界面",
    nextGuide = 1062,
    resControl = "6&vfx_25_66&vfx_25_67&0||1&2&50",
    couldBeSkip = 0,
    needWaitTarget = 0,
    mainStep = 0
    };
getRow(1062)->
    #guideActionCfg {
    id = 1062,
    trigger = 6,
    triggerParam = 1061,
    guideType = [1,3,6],
    uiTarget = "TreasurehousePanel&Offset/InnerPanelBg/Preview_0/btnOnceTime/Bg",
    finishTrigger = 1,
    watingtime = 0,
    content = "[A06729]点击按钮进行一次免费抽取吧",
    nextGuide = 1063,
    resControl = "6&vfx_25_66&vfx_25_67&0||1&2&50",
    couldBeSkip = 0,
    needWaitTarget = 0,
    mainStep = 1
    };
getRow(1063)->
    #guideActionCfg {
    id = 1063,
    trigger = 6,
    triggerParam = 1062,
    guideType = [1,3,6],
    uiTarget = "TreasurehouseRewardPanel&Offset/Btns/CloseBtn",
    finishTrigger = 1,
    watingtime = 0,
    content = "[A06729]点击[ff4242]离开[-]按钮，离开当前界面",
    nextGuide = 1064,
    resControl = "6&vfx_25_66&vfx_25_67&0||1&2&50",
    couldBeSkip = 0,
    needWaitTarget = 1,
    mainStep = 0
    };
getRow(1064)->
    #guideActionCfg {
    id = 1064,
    trigger = 6,
    triggerParam = 1063,
    guideType = [1,3,6],
    uiTarget = "TreasurehousePanel&Offset/Btns/CloseBtn",
    finishTrigger = 1,
    watingtime = 0,
    content = "[A06729]点击[ff4242]关闭[-]按钮，关闭当前界面",
    nextGuide = 1065,
    resControl = "6&vfx_25_66&vfx_25_67&0||1&2&50",
    couldBeSkip = 0,
    needWaitTarget = 0,
    mainStep = 0
    };
getRow(1065)->
    #guideActionCfg {
    id = 1065,
    trigger = 6,
    triggerParam = 1064,
    guideType = [1,3,6],
    uiTarget = "MainPanel&TopLeft/PetHeadOffset/Head",
    finishTrigger = 1,
    watingtime = 0,
    content = "[A06729]点击[ff4242]骑宠[-]按钮，打开骑宠界面",
    nextGuide = 1066,
    resControl = "6&vfx_25_66&vfx_25_67&0||1&2&50",
    couldBeSkip = 0,
    needWaitTarget = 0,
    mainStep = 0
    };
getRow(1066)->
    #guideActionCfg {
    id = 1066,
    trigger = 6,
    triggerParam = 1065,
    guideType = [1,3,6],
    uiTarget = "RidePetPanel&Pages/RidePet/InfoPanel/Info/BtnInfo",
    finishTrigger = 1,
    watingtime = 0,
    content = "[A06729]点击“[ff4242]详情[-]”按钮，打开骑宠详情界面",
    nextGuide = 1067,
    resControl = "6&vfx_25_66&vfx_25_67&0||1&2&50",
    couldBeSkip = 0,
    needWaitTarget = 0,
    mainStep = 0
    };
getRow(1067)->
    #guideActionCfg {
    id = 1067,
    trigger = 6,
    triggerParam = 1066,
    guideType = [3,6],
    uiTarget = "RidePetInfoPanel&Anchor/Offset/InfoPanel/MAndPInfoBasePanel/Content/Attribute/Up/ButtonReborn",
    finishTrigger = 1,
    watingtime = 0,
    content = "[A06729]当材料足够时，点击“[ff4242]转生[-]”按钮，可以转生骑宠",
    nextGuide = 0,
    resControl = "6&vfx_25_66&vfx_25_67&0",
    couldBeSkip = 0,
    needWaitTarget = 0,
    mainStep = 0
    };
getRow(1068)->
    #guideActionCfg {
    id = 1068,
    trigger = 2,
    triggerParam = 86,
    guideType = [1,3,6],
    uiTarget = "MainPanel&TopRight/BeibaoButton",
    finishTrigger = 1,
    watingtime = 0,
    content = "[A06729]点击[ff4242]背包[-]，查看刚获得的骑宠！",
    nextGuide = 1069,
    resControl = "6&vfx_25_66&vfx_25_67&0||1&2&50",
    couldBeSkip = 0,
    needWaitTarget = 1,
    mainStep = 0
    };
getRow(1069)->
    #guideActionCfg {
    id = 1069,
    trigger = 6,
    triggerParam = 1068,
    guideType = [1,3,6],
    uiTarget = "BagPanel&Anchor/Offset/Package/Pack_Content/RolePackage/SwitchButton/Props",
    finishTrigger = 1,
    watingtime = 0,
    content = "[A06729]刚获得的骑宠存放于“[ff4242]道具[-]”页签！",
    nextGuide = 1070,
    resControl = "6&vfx_25_66&vfx_25_67&0||1&2&50",
    couldBeSkip = 0,
    needWaitTarget = 0,
    mainStep = 0
    };
getRow(1070)->
    #guideActionCfg {
    id = 1070,
    trigger = 6,
    triggerParam = 1069,
    guideType = [1,3,6],
    uiTarget = "!BagPanel&1824",
    finishTrigger = 1,
    watingtime = 0,
    content = "[A06729]点击[ff4242]骑宠[-]图标，进行上阵",
    nextGuide = 1071,
    resControl = "6&vfx_25_66&vfx_25_67&0||1&2&50",
    couldBeSkip = 0,
    needWaitTarget = 1,
    mainStep = 0
    };
getRow(1071)->
    #guideActionCfg {
    id = 1071,
    trigger = 6,
    triggerParam = 1070,
    guideType = [1,3,6],
    uiTarget = "ItemTips&Anchor/Offset/btns/ButtonOne",
    finishTrigger = 1,
    watingtime = 0,
    content = "[A06729]点击[ff4242]使用[-]按钮，进行出战",
    nextGuide = 1072,
    resControl = "6&vfx_25_66&vfx_25_67&0||1&2&50",
    couldBeSkip = 0,
    needWaitTarget = 0,
    mainStep = 1
    };
getRow(1072)->
    #guideActionCfg {
    id = 1072,
    trigger = 6,
    triggerParam = 1071,
    guideType = [1,3,6],
    uiTarget = "MessageBoxPanel&Anchor/Offset/ButtonTwo",
    finishTrigger = 1,
    watingtime = 0,
    content = "[A06729]点击[ff4242]取消[-]按钮，取消上阵替换",
    nextGuide = 1073,
    resControl = "6&vfx_25_66&vfx_25_67&0||1&2&50",
    couldBeSkip = 0,
    needWaitTarget = 1,
    mainStep = 0
    };
getRow(1073)->
    #guideActionCfg {
    id = 1073,
    trigger = 6,
    triggerParam = 1072,
    guideType = [1,3,6],
    uiTarget = "BagPanel&Anchor/Offset/Close_Button",
    finishTrigger = 1,
    watingtime = 0,
    content = "[A06729]点击[ff4242]关闭[-]按钮，关闭当前界面",
    nextGuide = 1074,
    resControl = "6&vfx_25_66&vfx_25_67&0||1&2&50",
    couldBeSkip = 0,
    needWaitTarget = 0,
    mainStep = 0
    };
getRow(1074)->
    #guideActionCfg {
    id = 1074,
    trigger = 6,
    triggerParam = 1073,
    guideType = [1,3,6],
    uiTarget = "MainPanel&BottomLeft/System",
    finishTrigger = 1,
    watingtime = 0,
    content = "[A06729]骑宠助阵功能解锁了，点击这里可以查看新功能",
    nextGuide = 1075,
    resControl = "6&vfx_25_66&vfx_25_67&0||1&2&50",
    couldBeSkip = 1,
    needWaitTarget = 0,
    mainStep = 0
    };
getRow(1075)->
    #guideActionCfg {
    id = 1075,
    trigger = 6,
    triggerParam = 1074,
    guideType = [1,3,6],
    uiTarget = "MainMenuPanel&BottomLeft/Panel2/Grid/5",
    finishTrigger = 1,
    watingtime = 0,
    content = "[A06729]点击[ff4242]骑宠[-]图标，打开骑宠界面",
    nextGuide = 1076,
    resControl = "6&vfx_25_66&vfx_25_67&0||1&2&50",
    couldBeSkip = 0,
    needWaitTarget = 0,
    mainStep = 0
    };
getRow(1076)->
    #guideActionCfg {
    id = 1076,
    trigger = 6,
    triggerParam = 1075,
    guideType = [1,3,6],
    uiTarget = "RidePetPanel&Tab/Assist",
    finishTrigger = 1,
    watingtime = 0,
    content = "[A06729]选择“[ff4242]骑宠助阵[-]”页签",
    nextGuide = 1077,
    resControl = "6&vfx_25_66&vfx_25_67&0||1&2&50",
    couldBeSkip = 0,
    needWaitTarget = 0,
    mainStep = 0
    };
getRow(1077)->
    #guideActionCfg {
    id = 1077,
    trigger = 6,
    triggerParam = 1076,
    guideType = [1,3,6],
    uiTarget = "RidePetPanel&Pages/Assist/RidePetAssistPanel(Clone)/Offset/Assist/PetList/1",
    finishTrigger = 1,
    watingtime = 0,
    content = "[A06729]选择[ff4242]未出战[-]的骑宠进行助战",
    nextGuide = 1078,
    resControl = "6&vfx_25_66&vfx_25_67&0||1&2&50",
    couldBeSkip = 0,
    needWaitTarget = 0,
    mainStep = 1
    };
getRow(1078)->
    #guideActionCfg {
    id = 1078,
    trigger = 6,
    triggerParam = 1077,
    guideType = [1,3,6],
    uiTarget = "RidePetPanel&ButtonClose",
    finishTrigger = 1,
    watingtime = 0,
    content = "[A06729]点击[ff4242]关闭[-]按钮，关闭当前界面",
    nextGuide = 1079,
    resControl = "6&vfx_25_66&vfx_25_67&0||1&2&50",
    couldBeSkip = 0,
    needWaitTarget = 0,
    mainStep = 0
    };
getRow(1079)->
    #guideActionCfg {
    id = 1079,
    trigger = 6,
    triggerParam = 1078,
    guideType = [1,3,6],
    uiTarget = "MainPanel&TopRight/ActivityOffset/Show",
    finishTrigger = 1,
    watingtime = 0,
    content = "[A06729]点击这里查看新开启的功能吧",
    nextGuide = 1080,
    resControl = "6&vfx_25_66&vfx_25_67&0||1&2&50",
    couldBeSkip = 1,
    needWaitTarget = 0,
    mainStep = 0
    };
getRow(1080)->
    #guideActionCfg {
    id = 1080,
    trigger = 6,
    triggerParam = 1079,
    guideType = [1,3,6],
    uiTarget = "MainPanel&TopRight/ActivityOffset/ActivityClip/MenuOne/22",
    finishTrigger = 1,
    watingtime = 0,
    content = "[A06729]点击[ff4242]日常[-]按钮，打开日常界面",
    nextGuide = 1081,
    resControl = "6&vfx_25_66&vfx_25_67&0||1&2&50",
    couldBeSkip = 0,
    needWaitTarget = 0,
    mainStep = 0
    };
getRow(1081)->
    #guideActionCfg {
    id = 1081,
    trigger = 6,
    triggerParam = 1080,
    guideType = [1,3,6],
    uiTarget = "DailyPanel&Anchor/Offset/Pagebutton/PvpButton",
    finishTrigger = 1,
    watingtime = 0,
    content = "[A06729]点击“[ff4242]竞技活动[-]”页签，切换到竞技活动页签",
    nextGuide = 1082,
    resControl = "6&vfx_25_66&vfx_25_67&0||1&2&50",
    couldBeSkip = 0,
    needWaitTarget = 0,
    mainStep = 0
    };
getRow(1082)->
    #guideActionCfg {
    id = 1082,
    trigger = 6,
    triggerParam = 1081,
    guideType = [1,3,6],
    uiTarget = "DailyPanel&Anchor/Offset/ScrollView/PvpButton/36",
    finishTrigger = 1,
    watingtime = 0,
    content = "[A06729]点击“[ff4242]骑宠领地[-]”页签，切换到骑宠领地页签",
    nextGuide = 1083,
    resControl = "6&vfx_25_66&vfx_25_67&0||1&2&50",
    couldBeSkip = 0,
    needWaitTarget = 0,
    mainStep = 0
    };
getRow(1083)->
    #guideActionCfg {
    id = 1083,
    trigger = 6,
    triggerParam = 1082,
    guideType = [1,3,6],
    uiTarget = "DailyPanel&Anchor/Offset/Content/36/ButtonChallenge",
    finishTrigger = 1,
    watingtime = 0,
    content = "[A06729]点击“[ff4242]前往挑战[-]”按钮，进行挑战",
    nextGuide = 1084,
    resControl = "6&vfx_25_66&vfx_25_67&0||1&2&50",
    couldBeSkip = 0,
    needWaitTarget = 0,
    mainStep = 0
    };
getRow(1084)->
    #guideActionCfg {
    id = 1084,
    trigger = 6,
    triggerParam = 1083,
    guideType = [1,3,6],
    uiTarget = "PetTerritoryPanel&Anchor/Offset/main/territoryPanel/0/exploitBtn",
    finishTrigger = 1,
    watingtime = 0,
    content = "[A06729]点击[ff4242]开采[-]按钮，进行开采操作",
    nextGuide = 1085,
    resControl = "6&vfx_25_66&vfx_25_67&0||1&2&50",
    couldBeSkip = 0,
    needWaitTarget = 0,
    mainStep = 0
    };
getRow(1085)->
    #guideActionCfg {
    id = 1085,
    trigger = 6,
    triggerParam = 1084,
    guideType = [1,3,6],
    uiTarget = "PetTerritoryPanel&Anchor/Offset/exploitSelect/pets/1/bg",
    finishTrigger = 1,
    watingtime = 0,
    content = "[A06729]点击上阵骑宠",
    nextGuide = 1086,
    resControl = "6&vfx_25_66&vfx_25_67&0||1&2&50",
    couldBeSkip = 0,
    needWaitTarget = 0,
    mainStep = 0
    };
getRow(1086)->
    #guideActionCfg {
    id = 1086,
    trigger = 6,
    triggerParam = 1085,
    guideType = [1,3,6],
    uiTarget = "PetTerritoryPanel&Anchor/Offset/editePet/oneKeyBtn",
    finishTrigger = 1,
    watingtime = 0,
    content = "[A06729]点击“[ff4242]一键放入[-]”可快速上阵骑宠",
    nextGuide = 1087,
    resControl = "6&vfx_25_66&vfx_25_67&0||1&2&50",
    couldBeSkip = 0,
    needWaitTarget = 0,
    mainStep = 0
    };
getRow(1087)->
    #guideActionCfg {
    id = 1087,
    trigger = 6,
    triggerParam = 1086,
    guideType = [1,3,6],
    uiTarget = "PetTerritoryPanel&Anchor/Offset/editePet/saveBtn",
    finishTrigger = 1,
    watingtime = 0,
    content = "[A06729]点击“[ff4242]保存[-]”才会保存当前的操作",
    nextGuide = 1088,
    resControl = "6&vfx_25_66&vfx_25_67&0||1&2&50",
    couldBeSkip = 0,
    needWaitTarget = 0,
    mainStep = 0
    };
getRow(1088)->
    #guideActionCfg {
    id = 1088,
    trigger = 6,
    triggerParam = 1087,
    guideType = [1,3,6],
    uiTarget = "PetTerritoryPanel&Anchor/Offset/exploitSelect/time/grid/3",
    finishTrigger = 1,
    watingtime = 0,
    content = "[A06729]选择开启[ff4242]3小时[-]",
    nextGuide = 1089,
    resControl = "6&vfx_25_66&vfx_25_67&0||1&2&50",
    couldBeSkip = 0,
    needWaitTarget = 0,
    mainStep = 0
    };
getRow(1089)->
    #guideActionCfg {
    id = 1089,
    trigger = 6,
    triggerParam = 1088,
    guideType = [1,3,6],
    uiTarget = "PetTerritoryPanel&Anchor/Offset/exploitSelect/level/grid/1",
    finishTrigger = 1,
    watingtime = 0,
    content = "[A06729]选择[ff4242]普通模式[-]开采",
    nextGuide = 1090,
    resControl = "6&vfx_25_66&vfx_25_67&0||1&2&50",
    couldBeSkip = 0,
    needWaitTarget = 0,
    mainStep = 0
    };
getRow(1090)->
    #guideActionCfg {
    id = 1090,
    trigger = 6,
    triggerParam = 1089,
    guideType = [1,3,6],
    uiTarget = "PetTerritoryPanel&Anchor/Offset/exploitSelect/exploitBtn",
    finishTrigger = 1,
    watingtime = 0,
    content = "[A06729]点击“[ff4242]开采[-]”进行采集",
    nextGuide = 0,
    resControl = "6&vfx_25_66&vfx_25_67&0||1&2&50",
    couldBeSkip = 0,
    needWaitTarget = 0,
    mainStep = 0
    };
getRow(1091)->
    #guideActionCfg {
    id = 1091,
    trigger = 2,
    triggerParam = 90,
    guideType = [1,3,6],
    uiTarget = "MainPanel&TopLeft/PetHeadOffset/Head",
    finishTrigger = 1,
    watingtime = 0,
    content = "[A06729]点击[ff4242]骑宠[-]按钮，打开骑宠界面",
    nextGuide = 1092,
    resControl = "6&vfx_25_66&vfx_25_67&0||1&2&50",
    couldBeSkip = 0,
    needWaitTarget = 0,
    mainStep = 0
    };
getRow(1092)->
    #guideActionCfg {
    id = 1092,
    trigger = 6,
    triggerParam = 1091,
    guideType = [1,3,6],
    uiTarget = "RidePetPanel&Tab/Equip",
    finishTrigger = 1,
    watingtime = 0,
    content = "[A06729]点击“[ff4242]装备[-]”页签，切换至骑宠装备界面",
    nextGuide = 1093,
    resControl = "6&vfx_25_66&vfx_25_67&0||1&2&50",
    couldBeSkip = 0,
    needWaitTarget = 0,
    mainStep = 0
    };
getRow(1093)->
    #guideActionCfg {
    id = 1093,
    trigger = 6,
    triggerParam = 1092,
    guideType = [1,3,6],
    uiTarget = "RidePetPanel&Pages/Equip/RidePetEquipPanel(Clone)/Anchor/Offset/EquipPanel/Content/Attribute/ButtonUpdate",
    finishTrigger = 1,
    watingtime = 0,
    content = "[A06729]点击“[ff4242]升级[-]”按钮，升级骑宠装备",
    nextGuide = 1094,
    resControl = "6&vfx_25_66&vfx_25_67&0||1&2&50",
    couldBeSkip = 0,
    needWaitTarget = 0,
    mainStep = 0
    };
getRow(1094)->
    #guideActionCfg {
    id = 1094,
    trigger = 6,
    triggerParam = 1093,
    guideType = [1,3,6],
    uiTarget = "RidePetPanel&Pages/Equip/RidePetEquipPanel(Clone)/Anchor/Offset/EquipPanel/Equip/1",
    finishTrigger = 1,
    watingtime = 0,
    content = "[A06729]选中骑宠铠甲装备，再次进行升级",
    nextGuide = 1095,
    resControl = "6&vfx_25_66&vfx_25_67&0||1&2&50",
    couldBeSkip = 0,
    needWaitTarget = 0,
    mainStep = 0
    };
getRow(1095)->
    #guideActionCfg {
    id = 1095,
    trigger = 6,
    triggerParam = 1094,
    guideType = [1,3,6],
    uiTarget = "RidePetPanel&Pages/Equip/RidePetEquipPanel(Clone)/Anchor/Offset/EquipPanel/Content/Attribute/ButtonUpdate",
    finishTrigger = 1,
    watingtime = 0,
    content = "[A06729]点击“[ff4242]升级[-]”按钮，升级骑宠铠甲",
    nextGuide = 1096,
    resControl = "6&vfx_25_66&vfx_25_67&0||1&2&50",
    couldBeSkip = 0,
    needWaitTarget = 0,
    mainStep = 0
    };
getRow(1096)->
    #guideActionCfg {
    id = 1096,
    trigger = 6,
    triggerParam = 1095,
    guideType = [1,3,6],
    uiTarget = "RidePetPanel&ButtonClose",
    finishTrigger = 1,
    watingtime = 0,
    content = "[A06729]点击[ff4242]关闭[-]按钮，关闭当前界面",
    nextGuide = 0,
    resControl = "6&vfx_25_66&vfx_25_67&0||1&2&50",
    couldBeSkip = 0,
    needWaitTarget = 0,
    mainStep = 0
    };
getRow(1097)->
    #guideActionCfg {
    id = 1097,
    trigger = 1,
    triggerParam = 18,
    guideType = [1,3,6],
    uiTarget = "MainPanel&TopRight/ActivityOffset/Show",
    finishTrigger = 1,
    watingtime = 0,
    content = "[A06729]点击这里查看新开启的功能吧",
    nextGuide = 1098,
    resControl = "6&vfx_25_66&vfx_25_67&0||1&2&50",
    couldBeSkip = 1,
    needWaitTarget = 0,
    mainStep = 0
    };
getRow(1098)->
    #guideActionCfg {
    id = 1098,
    trigger = 6,
    triggerParam = 1097,
    guideType = [1,3,6],
    uiTarget = "MainPanel&TopRight/ActivityOffset/ActivityClip/MenuOne/22",
    finishTrigger = 1,
    watingtime = 0,
    content = "[A06729]点击“[ff4242]日常[-]”按钮，打开日常界面",
    nextGuide = 1099,
    resControl = "6&vfx_25_66&vfx_25_67&0||1&2&50",
    couldBeSkip = 0,
    needWaitTarget = 0,
    mainStep = 0
    };
getRow(1099)->
    #guideActionCfg {
    id = 1099,
    trigger = 6,
    triggerParam = 1098,
    guideType = [1,3,6],
    uiTarget = "DailyPanel&Anchor/Offset/ScrollView/PveButton/30",
    finishTrigger = 1,
    watingtime = 0,
    content = "[A06729]点击“[ff4242]萝莉与绅士[-]”页签，进入副本界面",
    nextGuide = 1100,
    resControl = "6&vfx_25_66&vfx_25_67&0||1&2&50",
    couldBeSkip = 0,
    needWaitTarget = 0,
    mainStep = 0
    };
getRow(1100)->
    #guideActionCfg {
    id = 1100,
    trigger = 6,
    triggerParam = 1099,
    guideType = [1,3,6],
    uiTarget = "DailyPanel&Anchor/Offset/Content/30/ButtonChallenge",
    finishTrigger = 1,
    watingtime = 0,
    content = "[A06729]点击“[ff4242]进入[-]”按钮，进入副本吧！",
    nextGuide = 1101,
    resControl = "6&vfx_25_66&vfx_25_67&0||1&2&50",
    couldBeSkip = 0,
    needWaitTarget = 0,
    mainStep = 0
    };
getRow(1101)->
    #guideActionCfg {
    id = 1101,
    trigger = 6,
    triggerParam = 1100,
    guideType = [1,3,6],
    uiTarget = "MainPanel&TopRight/ActivityOffset/Expbutton",
    finishTrigger = 1,
    watingtime = 0,
    content = "[A06729]点击“[ff4242]效率[-]”图标，使用药水，提高练级效率",
    nextGuide = 1102,
    resControl = "6&vfx_25_66&vfx_25_67&0||1&2&50",
    couldBeSkip = 0,
    needWaitTarget = 1,
    mainStep = 0
    };
getRow(1102)->
    #guideActionCfg {
    id = 1102,
    trigger = 6,
    triggerParam = 1101,
    guideType = [1,3,6],
    uiTarget = "UseExpPanel&Anchor/Offset/Information/grid/tmp(Clone)/Buttonuse",
    finishTrigger = 1,
    watingtime = 0,
    content = "[A06729]点击“[ff4242]使用[-]”按钮，使用药水！",
    nextGuide = 0,
    resControl = "6&vfx_25_66&vfx_25_67&0||1&2&50",
    couldBeSkip = 0,
    needWaitTarget = 0,
    mainStep = 0
    };
getRow(1103)->
    #guideActionCfg {
    id = 1103,
    trigger = 2,
    triggerParam = 111,
    guideType = [1,3,6],
    uiTarget = "MainPanel&TopLeft/MyHeadOffset/Head",
    finishTrigger = 1,
    watingtime = 0,
    content = "[A06729]转职后，技能点会被重置",
    nextGuide = 1104,
    resControl = "6&vfx_25_66&vfx_25_67&0||1&2&50",
    couldBeSkip = 0,
    needWaitTarget = 0,
    mainStep = 0
    };
getRow(1104)->
    #guideActionCfg {
    id = 1104,
    trigger = 6,
    triggerParam = 1103,
    guideType = [1,3,6],
    uiTarget = "CharacterPanel&Anchor/Offset/switchBtns/Skill_Button",
    finishTrigger = 1,
    watingtime = 0,
    content = "[A06729]点击技能面板重新进行加点儿吧！",
    nextGuide = 0,
    resControl = "6&vfx_25_66&vfx_25_67&0||1&2&50",
    couldBeSkip = 0,
    needWaitTarget = 0,
    mainStep = 0
    };
getRow(1105)->
    #guideActionCfg {
    id = 1105,
    trigger = 2,
    triggerParam = 114,
    guideType = [5],
    uiTarget = "MainPanel&BottomLeft/System",
    finishTrigger = 3,
    watingtime = 0,
    nextGuide = 1106,
    resControl = "5&42",
    couldBeSkip = 0,
    needWaitTarget = 0,
    mainStep = 0
    };
getRow(1106)->
    #guideActionCfg {
    id = 1106,
    trigger = 6,
    triggerParam = 1105,
    guideType = [1,3,6],
    uiTarget = "MainPanel&BottomLeft/System",
    finishTrigger = 1,
    watingtime = 0,
    content = "[A06729]有新的功能解锁了，点击这里可以查看新功能",
    nextGuide = 1107,
    resControl = "6&vfx_25_66&vfx_25_67&0||1&2&50",
    couldBeSkip = 0,
    needWaitTarget = 0,
    mainStep = 0
    };
getRow(1107)->
    #guideActionCfg {
    id = 1107,
    trigger = 6,
    triggerParam = 1106,
    guideType = [1,3,6],
    uiTarget = "MainMenuPanel&BottomLeft/Panel2/Grid/42",
    finishTrigger = 1,
    watingtime = 0,
    content = "[A06729]点击[ff4242]星空之翼[-]图标，打开星空之翼界面",
    nextGuide = 1108,
    resControl = "6&vfx_25_66&vfx_25_67&0||1&2&50",
    couldBeSkip = 0,
    needWaitTarget = 0,
    mainStep = 0
    };
getRow(1108)->
    #guideActionCfg {
    id = 1108,
    trigger = 6,
    triggerParam = 1107,
    guideType = [1,3,6],
    uiTarget = "WingPanel&Anchor/Offset/Right/ItemSelect/ItemAdd",
    finishTrigger = 1,
    watingtime = 0,
    content = "[A06729]点击这里，添加升级星空之翼所需的材料",
    nextGuide = 1109,
    resControl = "6&vfx_25_66&vfx_25_67&0||1&2&50",
    couldBeSkip = 0,
    needWaitTarget = 0,
    mainStep = 0
    };
getRow(1109)->
    #guideActionCfg {
    id = 1109,
    trigger = 6,
    triggerParam = 1108,
    guideType = [1,3,6],
    uiTarget = "WingPanel&Anchor/Offset/Right/ItemAdd/ListPoint1/0",
    finishTrigger = 1,
    watingtime = 0,
    content = "[A06729]使用刚获得的[ff4242]星星石[-]来提升星空之翼的等级吧！",
    nextGuide = 1110,
    resControl = "6&vfx_25_66&vfx_25_67&0||1&2&50",
    couldBeSkip = 0,
    needWaitTarget = 0,
    mainStep = 0
    };
getRow(1110)->
    #guideActionCfg {
    id = 1110,
    trigger = 6,
    triggerParam = 1109,
    guideType = [1,3,6],
    uiTarget = "WingPanel&Anchor/Offset/Right/ExpAdd/1",
    finishTrigger = 1,
    watingtime = 0,
    content = "[A06729]点击[ff4242]提升[-]按钮，提升星空之翼的等级！",
    nextGuide = 1111,
    resControl = "6&vfx_25_66&vfx_25_67&0||1&2&50",
    couldBeSkip = 0,
    needWaitTarget = 0,
    mainStep = 0
    };
getRow(1111)->
    #guideActionCfg {
    id = 1111,
    trigger = 6,
    triggerParam = 1110,
    guideType = [1,3,6],
    uiTarget = "WingPanel&Anchor/Offset/Right/ExpAdd/Auto",
    finishTrigger = 1,
    watingtime = 0,
    content = "[A06729][ff4242]自动提升[-]能够快速提升星空之翼的等级！",
    nextGuide = 1112,
    resControl = "6&vfx_25_66&vfx_25_67&0||1&2&50",
    couldBeSkip = 0,
    needWaitTarget = 0,
    mainStep = 0
    };
getRow(1112)->
    #guideActionCfg {
    id = 1112,
    trigger = 6,
    triggerParam = 1111,
    guideType = [1,3,6],
    uiTarget = "MainPanel&TopRight/ActivityOffset/Show",
    finishTrigger = 1,
    watingtime = 0,
    content = "[A06729]点击这里查看新开启的功能吧",
    nextGuide = 1113,
    resControl = "6&vfx_25_66&vfx_25_67&0||1&2&50",
    couldBeSkip = 1,
    needWaitTarget = 0,
    mainStep = 0
    };
getRow(1113)->
    #guideActionCfg {
    id = 1113,
    trigger = 6,
    triggerParam = 1112,
    guideType = [1,3,6],
    uiTarget = "MainPanel&TopRight/ActivityOffset/ActivityClip/MenuOne/22",
    finishTrigger = 1,
    watingtime = 0,
    content = "[A06729]点击[ff4242]日常[-]按钮，打开日常界面",
    nextGuide = 1114,
    resControl = "6&vfx_25_66&vfx_25_67&0||1&2&50",
    couldBeSkip = 0,
    needWaitTarget = 0,
    mainStep = 0
    };
getRow(1114)->
    #guideActionCfg {
    id = 1114,
    trigger = 6,
    triggerParam = 1113,
    guideType = [1,3,6],
    uiTarget = "DailyPanel&Anchor/Offset/ScrollView/PveButton/13",
    finishTrigger = 1,
    watingtime = 0,
    content = "[A06729]点击“[ff4242]女神禁闭室[-]”页签，切换到女神禁闭室页签",
    nextGuide = 1115,
    resControl = "6&vfx_25_66&vfx_25_67&0||1&2&50",
    couldBeSkip = 0,
    needWaitTarget = 0,
    mainStep = 0
    };
getRow(1115)->
    #guideActionCfg {
    id = 1115,
    trigger = 6,
    triggerParam = 1114,
    guideType = [1,3,6],
    uiTarget = "DailyPanel&Anchor/Offset/Content/13/ButtonChallenge",
    finishTrigger = 1,
    watingtime = 0,
    content = "[A06729]点击“[ff4242]寻路前往[-]”按钮，前往参加女神禁闭室",
    nextGuide = 0,
    resControl = "6&vfx_25_66&vfx_25_67&0||1&2&50",
    couldBeSkip = 0,
    needWaitTarget = 0,
    mainStep = 0
    };
getRow(1116)->
    #guideActionCfg {
    id = 1116,
    trigger = 1,
    triggerParam = 22,
    guideType = [1,3,6],
    uiTarget = "MainPanel&TopRight/ActivityOffset/Show",
    finishTrigger = 1,
    watingtime = 0,
    content = "[A06729]点击这里查看新开启的功能吧",
    nextGuide = 1117,
    resControl = "6&vfx_25_66&vfx_25_67&0||1&2&50",
    couldBeSkip = 1,
    needWaitTarget = 1,
    mainStep = 0
    };
getRow(1117)->
    #guideActionCfg {
    id = 1117,
    trigger = 6,
    triggerParam = 1116,
    guideType = [1,3,6],
    uiTarget = "MainPanel&TopRight/ActivityOffset/ActivityClip/MenuOne/22",
    finishTrigger = 1,
    watingtime = 0,
    content = "[A06729]点击[ff4242]日常[-]按钮，打开日常界面",
    nextGuide = 1118,
    resControl = "6&vfx_25_66&vfx_25_67&0||1&2&50",
    couldBeSkip = 0,
    needWaitTarget = 0,
    mainStep = 0
    };
getRow(1118)->
    #guideActionCfg {
    id = 1118,
    trigger = 6,
    triggerParam = 1117,
    guideType = [1,3,6],
    uiTarget = "DailyPanel&Anchor/Offset/Pagebutton/PvpButton",
    finishTrigger = 1,
    watingtime = 0,
    content = "[A06729]点击“[ff4242]竞技活动[-]”页签，切换到竞技活动页签",
    nextGuide = 1119,
    resControl = "6&vfx_25_66&vfx_25_67&0||1&2&50",
    couldBeSkip = 0,
    needWaitTarget = 0,
    mainStep = 0
    };
getRow(1119)->
    #guideActionCfg {
    id = 1119,
    trigger = 6,
    triggerParam = 1118,
    guideType = [1,3,6],
    uiTarget = "DailyPanel&Anchor/Offset/ScrollView/PvpButton/16",
    finishTrigger = 1,
    watingtime = 0,
    content = "[A06729]选择“[ff4242]竞技场[-]”页签，切换到竞技场页签",
    nextGuide = 1120,
    resControl = "6&vfx_25_66&vfx_25_67&0||1&2&50",
    couldBeSkip = 0,
    needWaitTarget = 0,
    mainStep = 0
    };
getRow(1120)->
    #guideActionCfg {
    id = 1120,
    trigger = 6,
    triggerParam = 1119,
    guideType = [1,3,6],
    uiTarget = "DailyPanel&Anchor/Offset/Content/ArenaPanel/ArenaPanel/PlayerCardsShow/List%1/Button",
    finishTrigger = 1,
    watingtime = 0,
    content = "[A06729]点击“[ff4242]挑战[-]”按钮，进行一次挑战",
    nextGuide = 0,
    resControl = "6&vfx_25_66&vfx_25_67&0||1&2&50",
    couldBeSkip = 0,
    needWaitTarget = 0,
    mainStep = 0
    };
getRow(1121)->
    #guideActionCfg {
    id = 1121,
    trigger = 1,
    triggerParam = 23,
    guideType = [1,3,6],
    uiTarget = "MainPanel&TopRight/ActivityOffset/ActivityClip/MenuOne/22",
    finishTrigger = 1,
    watingtime = 0,
    content = "[A06729]点击“[ff4242]日常[-]”按钮，打开日常界面",
    nextGuide = 1122,
    resControl = "6&vfx_25_66&vfx_25_67&0||1&2&50",
    couldBeSkip = 0,
    needWaitTarget = 1,
    mainStep = 0
    };
getRow(1122)->
    #guideActionCfg {
    id = 1122,
    trigger = 6,
    triggerParam = 1121,
    guideType = [1,3,6],
    uiTarget = "DailyPanel&Anchor/Offset/ScrollView/PveButton/4",
    finishTrigger = 1,
    watingtime = 0,
    content = "[A06729]点击“[ff4242]惊天喵盗团[-]”页签，进入副本界面",
    nextGuide = 1123,
    resControl = "6&vfx_25_66&vfx_25_67&0||1&2&50",
    couldBeSkip = 0,
    needWaitTarget = 0,
    mainStep = 0
    };
getRow(1123)->
    #guideActionCfg {
    id = 1123,
    trigger = 6,
    triggerParam = 1122,
    guideType = [3,6],
    uiTarget = "DailyPanel&Anchor/Offset/Content/4/ButtonChallenge",
    finishTrigger = 1,
    watingtime = 0,
    content = "[A06729]点击“[ff4242]单人前往[-]”按钮，进入副本挑战",
    nextGuide = 0,
    resControl = "6&vfx_25_66&vfx_25_67&0",
    couldBeSkip = 0,
    needWaitTarget = 0,
    mainStep = 0
    };
getRow(1124)->
    #guideActionCfg {
    id = 1124,
    trigger = 1,
    triggerParam = 24,
    guideType = [5],
    uiTarget = "MainPanel&BottomLeft/System",
    finishTrigger = 3,
    watingtime = 0,
    nextGuide = 1125,
    resControl = "5&15",
    couldBeSkip = 0,
    needWaitTarget = 1,
    mainStep = 0
    };
getRow(1125)->
    #guideActionCfg {
    id = 1125,
    trigger = 6,
    triggerParam = 1124,
    guideType = [1,3,6],
    uiTarget = "MainPanel&BottomLeft/System",
    finishTrigger = 1,
    watingtime = 0,
    content = "[A06729]有新的功能解锁了，点击这里可以查看新功能",
    nextGuide = 1126,
    resControl = "6&vfx_25_66&vfx_25_67&0||1&2&50",
    couldBeSkip = 1,
    needWaitTarget = 0,
    mainStep = 0
    };
getRow(1126)->
    #guideActionCfg {
    id = 1126,
    trigger = 6,
    triggerParam = 1125,
    guideType = [1,3,6],
    uiTarget = "MainMenuPanel&BottomLeft/Panel2/Grid/15",
    finishTrigger = 1,
    watingtime = 0,
    content = "[A06729]点击[ff4242]家族[-]图标，可以加入或创建一个家族",
    nextGuide = 0,
    resControl = "6&vfx_25_66&vfx_25_67&0||1&2&50",
    couldBeSkip = 0,
    needWaitTarget = 0,
    mainStep = 0
    };
getRow(1127)->
    #guideActionCfg {
    id = 1127,
    trigger = 2,
    triggerParam = 140,
    guideType = [1,3,6],
    uiTarget = "MainPanel&TopLeft/MyHeadOffset/Head",
    finishTrigger = 1,
    watingtime = 0,
    content = "[A06729]刚获得了时装碎片，快来穿戴吧",
    nextGuide = 1128,
    resControl = "6&vfx_25_66&vfx_25_67&0||1&2&50",
    couldBeSkip = 0,
    needWaitTarget = 0,
    mainStep = 0
    };
getRow(1128)->
    #guideActionCfg {
    id = 1128,
    trigger = 6,
    triggerParam = 1127,
    guideType = [1,3,6],
    uiTarget = "CharacterPanel&Anchor/Offset/switchBtns/Fashion_Button",
    finishTrigger = 1,
    watingtime = 0,
    content = "[A06729]点击选择“[ff4242]时装[-]”页签",
    nextGuide = 1129,
    resControl = "6&vfx_25_66&vfx_25_67&0||1&2&50",
    couldBeSkip = 0,
    needWaitTarget = 0,
    mainStep = 0
    };
getRow(1129)->
    #guideActionCfg {
    id = 1129,
    trigger = 6,
    triggerParam = 1128,
    guideType = [1,3,6],
    uiTarget = "CharacterPanel&Anchor/Offset/Fashion/fashion(Clone)/single/items/cloth/panel/grid%2/BG",
    finishTrigger = 1,
    watingtime = 0,
    content = "[A06729]点击可预览时装样式",
    nextGuide = 1130,
    resControl = "6&vfx_25_66&vfx_25_67&0||1&2&50",
    couldBeSkip = 0,
    needWaitTarget = 0,
    mainStep = 0
    };
getRow(1130)->
    #guideActionCfg {
    id = 1130,
    trigger = 6,
    triggerParam = 1129,
    guideType = [1,3,6],
    uiTarget = "CharacterPanel&Anchor/Offset/Fashion/fashion(Clone)/single/items/cloth/panel/grid%4/BG",
    finishTrigger = 1,
    watingtime = 0,
    content = "[A06729]太棒了，再看看另一款时装吧！",
    nextGuide = 0,
    resControl = "6&vfx_25_66&vfx_25_67&0||1&2&50",
    couldBeSkip = 0,
    needWaitTarget = 0,
    mainStep = 0
    };
getRow(1131)->
    #guideActionCfg {
    id = 1131,
    trigger = 1,
    triggerParam = 26,
    guideType = [1,3,6],
    uiTarget = "MainPanel&TopRight/ActivityOffset/Show",
    finishTrigger = 1,
    watingtime = 0,
    content = "[A06729]点击这里查看新开启的功能吧",
    nextGuide = 1132,
    resControl = "6&vfx_25_66&vfx_25_67&0||1&2&50",
    couldBeSkip = 1,
    needWaitTarget = 1,
    mainStep = 0
    };
getRow(1132)->
    #guideActionCfg {
    id = 1132,
    trigger = 6,
    triggerParam = 1131,
    guideType = [1,3,6],
    uiTarget = "MainPanel&TopRight/ActivityOffset/ActivityClip/MenuOne/26",
    finishTrigger = 1,
    watingtime = 0,
    content = "[A06729]点击[ff4242]福利[-]页签，可打开福利界面",
    nextGuide = 1133,
    resControl = "6&vfx_25_66&vfx_25_67&0||1&2&50",
    couldBeSkip = 0,
    needWaitTarget = 0,
    mainStep = 0
    };
getRow(1133)->
    #guideActionCfg {
    id = 1133,
    trigger = 6,
    triggerParam = 1132,
    guideType = [1,3,6],
    uiTarget = "WelfarePanel&Anchor/Offset/ChangeButton/LeavedExp",
    finishTrigger = 1,
    watingtime = 0,
    content = "[A06729]点击“[ff4242]灵力冥想[-]”页签切换至灵力冥想页签",
    nextGuide = 0,
    resControl = "6&vfx_25_66&vfx_25_67&0||1&2&50",
    couldBeSkip = 0,
    needWaitTarget = 0,
    mainStep = 0
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
    {1126},
    {1127},
    {1128},
    {1129},
    {1130},
    {1131},
    {1132},
    {1133}
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
    1126,
    1127,
    1128,
    1129,
    1130,
    1131,
    1132,
    1133
    ].

