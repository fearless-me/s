%%: 声明
-ifndef(cfg_task_new).
-define(cfg_task_new, 1).

-record(task_newCfg, {
        %%: 任务id
        %%: 30000以下是主线/分支
        %%: 30000以上是节日任务
        %%: 40000以上是情缘任务
        %%: 50000以上是循环任务
        id,

        %%: 判定活动类型
        %%: 0为普通类型
        %%: 1为循环任务
        %%: 2为春节活动
        %%: 3为情缘任务
        tasktype,

        %%: admin:
        %%: 任务涉及到的地图名
        maps,

        %%: 属于的组id
        groupid,

        %%: 张龙:
        %%: 史诗任务组id
        %%: 所有组ID为0的则为主线任务，其它相同组ID的任务为一组支线任务
        epic_task_groupid,

        %%: 任务类型
        target_type,

        %%: Windows 用户:
        %%: 后置任务，没有后置任务则填0
        task_after,

        %%: Windows 用户:
        %%: 前置任务，没有前置任务则填0
        task_before,

        %%: 任务目标参数
        target_para,

        %%: 任务名字
        task_name,

        %%: 面板上的任务说明
        task_content,

        %%: 张龙:
        %%: 史诗任务的说明
        task_epic_content,

        %%: Windows 用户:
        %%: 数据型奖励，如经验，金钱
        %%: gold 绑定金币，游戏中最常用的货币，不想让服务器改名字了
        %%: exp 经验值
        %%: diamond 钻石，充值获得的东西
        %%: honor 荣誉值，一种特殊货币
        %%: credit 声望，一种特殊货币
        %%: shenli 神力值，原活跃度，升级女神的货币
        %%: 其他更多类型会跟随系统增加
        task_reward_num,

        %%: Windows 用户:
        %%: 物品型奖励
        %%: item1 第一种道具奖励的名字
        %%: num1 第一种奖励道具的个数
        %%: 后面的以此类推，最多4种，每种最多一组
        task_reward_item,

        %%: Windows 用户:
        %%: 装备奖励
        %%: equip1 第一种道具装备的名字
        %%: quality1 第一种奖励装备的品质
        %%: equipjob1 第一奖励装备的职业限定 1 2 4 8 分别对应 1234 这4个职业，可累加
        %%: 后面的以此类推，目前最多4种，每种只有1件
        %%: 以后可能会扩展
        task_reward_equip,

        %%: 刘展:
        %%: 任务完成后奖励副本次数
        %%: copyid=副本id
        %%: num=次数
        task_reward_copy,

        %%: 弹小头像的表现组id
        show_type1,

        %%: 弹半身像的表现组id
        show_type2,

        %%: 脚本动画id
        show_type3,

        %%: 执行特殊脚本的id
        runscript,

        %%: aa:
        %%: 任务开启系统
        open,

        open_epic_group,

        %%: 刘展:
        %%: 接取任务是否自动寻路
        %%: 0是寻路
        %%: 1是不寻
        is_pathfinding,

        %%: 张龙:
        %%: j接取任务后的过场动画名字
        cutscene,

        %%: 刘展:
        %%: 支线任务是弹出面板还是寻路
        %%: 0面板
        %%: 1寻路
        %%: 如果是主线任务，忽略此参数
        branch_is_pathfinding

 }).

-record(target_paraCfg, {
        mst,
        mstnum,
        kitem,
        knum,
        kmst,
        krate,
        kot,
        citem,
        cnum,
        cobj,
        cmin,
        cmax,
        ucontent,
        unum,
        uobj,
        getnpc,
        finishcopy,
        minicopy,
        mininpc,
        minishow,
        dailyid,
        getlevel
 }).

-record(task_reward_numCfg, {
        gold,
        diamond,
        exp,
        honor,
        credit,
        shenli,
        qinmidu
 }).

-record(task_reward_itemCfg, {
        item1,
        item2,
        item3,
        item4,
        num1,
        num2,
        num3,
        num4
 }).

-record(task_reward_equipCfg, {
        equip1,
        quality1,
        equipjob1,
        equip2,
        quality2,
        equipjob2,
        equip3,
        quality3,
        equipjob3,
        equip4,
        quality4,
        equipjob4,
        equip5,
        quality5,
        equipjob5
 }).

-record(task_reward_copyCfg, {
        copyid1,
        num1
 }).

-endif.