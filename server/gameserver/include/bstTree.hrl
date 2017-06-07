%% @author zhongyunawei
%% @doc @todo 行为选择树定义.

-ifndef(BST_TREE_HRL).
-define(BST_TREE_HRL,1).

-author(zhongyuanwei).

%%节点类型
-define(BSTNodeTypeRoot,1).
-define(BSTNodeTypeAction,2).
-define(BSTNodeTypeCondtion,3).
-define(BSTNodeTypeSelector,4).
-define(BSTNodeTypeSequence,5).
-define(BSTNodeTypeParallel,6).
-define(BSTNodeTypeDecorator,7).

-type bstNodeType():: 1 .. 7.

%%并行节点的策略
-define(BSTPolicySelector,1).
-define(BSTPolicySequence,2).

-type bstPolicy() :: 1 .. 2.

%%装饰行为
%%非
-define(BSTDecTypeNot,1).
%%次数限制
-define(BSTDecTypeCounter,2).
%%boolean循环
-define(BSTDecTypeLoop,3).
%%次数循环
-define(BSTDecTypeLoopCounter,4).
%%等待时间
-define(BSTDecTypeWaitTime,5).

-type bstDecType() :: 1 .. 5.


%%条件关系运算符
-define(BSTCondEqual,1).			%%等于
-define(BSTCondNotEqual,2).			%%不等于
-define(BSTCondGreatEqual,3).		%%大于等于
-define(BSTCondLessEqual,4).		%%小于等于
-define(BSTCondGreater,5).			%%大于
-define(BSTCondLesser,6).			%%小于

-type bstCond() :: 1 .. 6.

-record(bstActor,{
	code,
	pid
}).

%%行为选择树的并行节点
-record(bstParalNode,{
	parent,				%%父节点
	id,					%%节点ID
	name,
	policy,				%%策略
	childs = [],		%%子节点
	prevNodeID,			%%本节点的上一个节点ID
	nextNodeID			%%本节点的下一个节点ID
}).

%%行为选择树选择节点
-record(bstSelNode,{
	parent,				%%父节点
	id,					%%节点ID
	name,				%%节点名字
	prevNodeID,			%%本节点的上一个节点ID
	nextNodeID,			%%本节点的下一个节点ID
	childs = []			%%子节点
}).

%%行为选择树顺序节点
-record(bstSeqNode,{
	parent,				%%父节点
	id,
	name,
	prevNodeID,			%%本节点的上一个节点ID
	nextNodeID,			%%本节点的下一个节点ID
	childs = []			%%子节点
}).

%%行为选择树装饰节点
-record(bstDecNode,{
	parent,				%%父节点
	id,
	name,
	decType,			%%装饰类型
	decArg,				%%装饰参数
	prevNodeID,			%%本节点的上一个节点ID
	nextNodeID,			%%本节点的下一个节点ID
	child				%%装饰节点只能有一个子节点
}).

%%行为选择树条件节点
-record(bstCondNode,{
	parent,			%%父节点
	id,
	name,
	condVar,			%%条件变量
	condRelation,		%%条件关系，可以是大于、等于、小于、大于等于、小于等于、不等于
	condValue,			%%条件值
	prevNodeID,			%%本节点的上一个节点ID
	nextNodeID			%%本节点的下一个节点ID
}).

%%行为选择的行为节点
-record(bstActionNode,{
	parent,			%%父节点
	id,
	name,
	actionType,		%%行为类型
	actionArg,		%%函数参数
	prevNodeID,			%%本节点的上一个节点ID
	nextNodeID			%%本节点的下一个节点ID
}).

-record(bstRootNode,{
	id,
	name,
	child				%%根节点只能有一个子节点
}).
%%行为选择树
-record(bstTree,{
	root = 0 ::uint(),
	varList = []
}).

-type bstNode() :: #bstRootNode{} | #bstActionNode{} | #bstCondNode{} | #bstDecNode{} | #bstSeqNode{} | #bstSelNode{} | #bstParalNode{}.
-endif.
