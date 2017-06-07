%%: 声明
-ifndef(cfg_notification).
-define(cfg_notification, 1).

-record(notificationCfg, {
        id,

        %%: None = 0,       // 不重复，只提示一次，超时忽略 m_param: yy_mm_dd        m_time hh_mm
        %%: Year = 1,      // 以 年 为间隔时间，重复      m_param mm_dd      m_time  hh_mm
        %%:  Month = 2,     // 以 月 为间隔时间，重复      m_param: dd        m_time  hh_mm
        %%: Day = 3,       // 以 日 为间隔时间，重复      m_param: 0         m_time  hh_mm
        %%: Hour = 4,      // 以 小时 为间隔时间，重复    m_param: 0         m_time  hh_mm
        %%: Weekday = 6,   // 以 周 为间隔时间，重复      m_param: weekday  m_time  hh_mm
        %%:         
        type,

        %%: None = 0,       // 不重复，只提示一次，超时忽略 m_param: yy_mm_dd        m_time hh_mm
        %%: Year = 1,      // 以 年 为间隔时间，重复      m_param mm_dd      m_time hh_mm
        %%:  Month = 2,     // 以 月 为间隔时间，重复      m_param: dd        m_time hh_mm
        %%: Day = 3,       // 以 日 为间隔时间，重复      m_param: 0         m_time hh_mm
        %%: Hour = 4,      // 以 小时 为间隔时间，重复    m_param: 0         m_time  hh_mm
        %%: Weekday = 6,   // 以 周 为间隔时间，重复      m_param: weekday  m_time hh_mm
        %%:         
        param,

        %%: 推送时间，
        %%: 格式 hh_mm
        %%: 使用":"导出内容不对
        day_time,

        %%: 推送标题
        title,

        %%: 推送内容
        desc

 }).

-endif.