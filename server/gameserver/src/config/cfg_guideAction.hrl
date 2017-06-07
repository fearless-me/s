%%: 声明
-ifndef(cfg_guideAction).
-define(cfg_guideAction, 1).

-record(guideActionCfg, {
        %%: admin:
        %%: 引导动作ID
        id,

        %%: admin:
        %%: 引导触发条件
        %%: 1 到达指定等级触发	
        %%: 2 接取指定任务触发	
        %%: 3 完成指定任务触发	
        %%: 4 获得指定物品触发	
        %%: 5 使用指定道具	
        %%: 6 完成指定引导	
        %%: 7 进入指定副本触发	
        %%: 8 HP达到指定百分比触发	
        %%: 9 击杀指定怪物	
        trigger,

        %%: admin:
        %%: 引导触发参数
        %%: 该值与trigger直接关联
        %%: trigger 为 1 时  该值表示 等级
        %%: trigger 为 2 时  该值表示 任务ID
        %%: trigger 为 3 时  该值表示 任务ID
        %%: trigger 为 4 时  该值表示 物品ID
        %%: trigger 为 5 时  该值表示 道具ID
        %%: trigger 为 6 时  该值表示 引导动作ID
        %%: trigger 为 7 时  该值表示 副本ID
        %%: trigger 为 8 时  该值表示 HP百分比
        %%: trigger 为 9 时  该值表示 怪物ID
        triggerParam,

        %%: admin:
        %%: 该引导动作表现类型
        %%: 同一个引导可以配置多个引导类型
        %%: 1 UI强制引导遮罩
        %%: 2 UI提示框
        %%: 3 UI特殊提示框
        %%: 4 UI帧动画提示
        %%: 5 UI曲线动画提示
        guideType,

        %%: admin:
        %%: 引导UI目标路径
        %%: 某个面板下的某个控件的路径，如果无则填空
        uiTarget,

        %%: admin:
        %%: 引导结束条件
        %%: 1 按钮点击完成
        %%: 2 等待N秒自动结束
        %%: 3 UI动作结束触发完成
        finishTrigger,

        %%: 吕建强:
        %%: 如需等待时间输入，单位s
        watingtime,

        %%: admin:
        %%: 引导提示内容
        %%: 颜色统一使用[ff4242]
        content,

        %%: admin:
        %%: 下一个引导ID
        nextGuide,

        %%: 需要控制的资源配置
        resControl,

        %%: 0为默认不可跳过
        %%: 1为可跳过
        couldBeSkip,

        %%: 王轶俊:
        %%: 是否需要等待ui引导目标出现
        %%: 1需要等待
        %%: 0不需要
        needWaitTarget,

        %%: Coby:
        %%: 判断掉线重连的依据
        mainStep

 }).

-endif.