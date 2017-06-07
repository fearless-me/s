-ifndef(Mail_hrl).
-define(Mail_hrl, 1).

-define(AttachmentItemNumber, 2).           %%邮件附件道具的最大个数
-define(AttachmentCoinNumber, 1).           %%邮件附件货币的最大个数
-define(Mail_Title_Max_Len, 128). 			%%邮件标题最大长度
-define(Mail_Content_Max_Len, 1024). 		%%邮件内容最大长度
-define(Mail_Player_Max_Count, 100). 		%%玩家邮件最大数量

%%修改邮件
-define(MAIL_RECV,0).		%%获取邮件
-define(MAIL_OPEN,1).		%%打开邮件
-define(MAIL_GET_ITEM,2).	%%获取道具
-define(MAIL_DEL,3).		%%删除邮件
-define(MAIL_DEL_DELAY,4).	%%过期自动删除邮件
-define(MAIL_LOCK,5).	    %%锁定邮件
-define(MAIL_GET_COIN,6).	%%获取货币

%% 系统帐号ID
-define(SystemID, 0).

%% 道具附件
-record(recMailItem,
{
    itemUID = 0, %%物品唯一id
    itemID  = 0  %%物品data id
}).

%% 货币附件
-record(recMailCoin,
{
    coinType    = 0, %%货币类型
    coinNum     = 0	 %%货币数量
}).

%% 邮件，gs与cs之间的邮件通信结构
-record(recMail,
{
    mailID          = 0, % 邮件ID
    mailReadTime    = 0, % 邮件阅读时间
    mailSendTime    = 0, % 邮件发送时间
    isLocked        = 0, % 是否锁定，0未锁定，1锁定
    senderRoleID    = 0, % 发送者角色ID
    toRoleID        = 0, % 接收者角色ID
    mailTitle       = [],% 邮件标题
    mailContent     = [],% 邮件内容
    mailSubjoinMsg  = [],% 邮件附加信息
    deleteTime      = 0, % 邮件删除时间
    attachment      = [] % 附件列表
}).

%% 普通邮件表，注，普通玩家邮件没有附件
-define(MnesiaMail, mailRec).

%% 附件，注，这里用的表是dh.hrl中定义的噢
-define(RecAttach, recMailAttachMent).

%% 系统邮件表
-define(MnesiaSysMail, sysMailRec).

-record(?MnesiaMail,
{
    mailID          = 0, % 邮件ID
    mailReadTime    = 0, % 邮件阅读时间
    mailSendTime    = 0, % 邮件发送时间
    isLocked        = 0, % 是否锁定，0未锁定，1锁定
    senderRoleID    = 0, % 发送者角色ID
    toRoleID        = 0, % 接收者角色ID
    mailTitle       = [],% 邮件标题
    mailContent     = [],% 邮件内容
    mailSubjoinMsg  = [],% 邮件附加信息
    deleteTime      = 0  % 邮件删除时间
}).

-record(?MnesiaSysMail,
{
    mailID          = 0, % 邮件ID
    mailReadTime    = 0, % 邮件阅读时间
    mailSendTime    = 0, % 邮件发送时间
    isLocked        = 0, % 是否锁定，0未锁定，1锁定
    senderRoleID    = 0, % 发送者角色ID
    toRoleID        = 0, % 接收者角色ID
    mailTitle       = [],% 邮件标题
    mailContent     = [],% 邮件内容
    mailSubjoinMsg  = [],% 邮件附加信息
    deleteTime      = 0, % 邮件删除时间
    attachment      = [] % 附件列表
}).

-endif.

