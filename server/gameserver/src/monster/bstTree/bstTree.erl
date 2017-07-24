%% @author zhongyunawei
%% @doc @todo 行为选择树.


-module(bstTree).
-author(zhongyuanwei).

-include("gsInc.hrl").
-include("bstTree.hrl").
-include("bst.hrl").

%% ====================================================================
%% API functions
%% ====================================================================

%%导出基础函数
-export([
	initNodeId/0,
	getNode/1,
	getParentNodeID/1,
	getNextNodeID/1,
	addRootNode/0,
	revertBstTree/1,
	dumpBstTree/1
]).

%%导出行为树流程节点函数
-export([
	addNodeDecLoop/2,
	addNodeDecNot/2,
	addNodeSeq/2,
	addNodeSelector/2,
	addNodeParal/2
]).

%%导出添加条件节点的函数
-export([
	addCondIsBeAttacked/2,
	addCondIsAlive/2,
	addCondIsAttackCD/2,
	addCondIsCast/2,
	addCondIsTargetExist/2,
	addCondIsTargetAlive/2,
	addCondIsInAttackRange/2,
	addCondHasTarget/2
]).

%%导出添加行为节点的函数
-export([
	addActionMove/2,
	addActionMove2/2,
	addActionMoveSpec/2,
	addActionIdle/2,
	addActionSelectTarget/3,
	addActionSelectSkill/3,
	addActionAttack/2,
	addActionPursue/2,
	addActionMoveConvoy/2
]).

-spec initNodeId() -> ok.
initNodeId() ->
	put(bstNodeId,1),
	ok.

%%根据节点ID获取相应的节点
-spec getNode(NodeID) -> bstNode() when
	NodeID::uint().
getNode(NodeID) ->
	get({bstNode,NodeID}).

%%获取指定节点ID的父节点ID
-spec getParentNodeID(NodeID) -> ParentNodeID when
	NodeID::uint(),ParentNodeID::uint().
getParentNodeID(NodeID) ->
	Node = getNode(NodeID),
	case Node of
		#bstSelNode{parent = ID} ->
			ID;
		#bstSeqNode{parent = ID} ->
			ID;
		#bstParalNode{parent = ID} ->
			ID;
		#bstDecNode{parent = ID} ->
			ID;
		#bstCondNode{parent = ID} ->
			ID;
		#bstActionNode{parent = ID} ->
			ID;
		#bstRootNode{} ->
			0
	end.

-spec addRootNode() -> ID :: uint().
addRootNode() ->
	Root = #bstRootNode{name="Root"},
	ID = registerNode(Root),
	setNode(ID,Root#bstRootNode{id = ID}),
	ID.

-spec revertBstTree(#bstTree{}) -> ok.
revertBstTree(#bstTree{root = RootNodeID}) ->
	revertBstTreeChilds(RootNodeID),
	ok.

-spec dumpBstTree(#bstTree{}) -> ok.
dumpBstTree(#bstTree{root = RootNodeID}) ->
	dumpTree([RootNodeID],0),
	ok.

%% ====================================================================
%% 以下为条件检测节点
%% ====================================================================

-spec addCondIsBeAttacked(ParentID,PrevNodeID) -> uint() when
	ParentID::uint(),PrevNodeID::uint().
addCondIsBeAttacked(ParentID,PrevNodeID) ->
	Cond = #bstCondNode{
		name="IsBeAttacked",
		condVar = ?BSTCondVar_IsBeAttacked,
		condRelation = ?BSTCondEqual,
		condValue = 1
	},
	addNode(ParentID,Cond,PrevNodeID).

-spec addCondHasTarget(ParentID,PrevNodeID) -> uint() when
	ParentID::uint(),PrevNodeID::uint().
addCondHasTarget(ParentID,PrevNodeID) ->
	Cond = #bstCondNode{
		name="HasTarget",
		condVar = ?BSTCondVar_HasTarget,
		condRelation = ?BSTCondEqual,
		condValue = 1
	},
	addNode(ParentID,Cond,PrevNodeID).

-spec addCondIsAlive(ParentID,PrevNodeID) -> uint() when
	ParentID::uint(),PrevNodeID::uint().
addCondIsAlive(ParentID,PrevNodeID) ->
	Cond = #bstCondNode{
		name="IsSelfAlive",
		condVar = ?BSTCondVar_IsSelfAlive,
		condRelation = ?BSTCondEqual,
		condValue = 1
	},
	addNode(ParentID,Cond,PrevNodeID).

-spec addCondIsAttackCD(ParentID,PrevNodeID) -> uint() when
	ParentID::uint(),PrevNodeID::uint().
addCondIsAttackCD(ParentID,PrevNodeID) ->
	Cond = #bstCondNode{
		name="IsAttackCD",
		condVar = ?BSTCondVar_IsAttackCD,
		condRelation = ?BSTCondEqual,
		condValue = 1
	},
	addNode(ParentID,Cond,PrevNodeID).

-spec addCondIsCast(ParentID,PrevNodeID) -> uint() when
	ParentID :: uint(),PrevNodeID::uint().
addCondIsCast(ParentID,PrevNodeID) ->
	Cond = #bstCondNode{
		name = "IsCast",
		condVar = ?BSTCondVar_IsCast,
		condRelation = ?BSTCondEqual,
		condValue = 1
	},
	addNode(ParentID,Cond,PrevNodeID).

-spec addCondIsTargetExist(ParentID,PrevNodeID) -> uint() when
	ParentID::uint(),PrevNodeID::uint().
addCondIsTargetExist(ParentID,PrevNodeID) ->
	Cond = #bstCondNode{
		name="IsTargetExist",
		condVar = ?BSTCondVar_IsTargetExist,
		condRelation = ?BSTCondEqual,
		condValue = 1
	},
	addNode(ParentID,Cond,PrevNodeID).

-spec addCondIsTargetAlive(ParentID,PrevNodeID) -> NodeID when
	ParentID::uint(),NodeID::uint(),PrevNodeID::uint().
addCondIsTargetAlive(ParentID,PrevNodeID) ->
	Cond = #bstCondNode{
		name="IsTargetAlive",
		condVar = ?BSTCondVar_IsTargetAlive,
		condRelation = ?BSTCondEqual,
		condValue = 1
	},
	addNode(ParentID,Cond,PrevNodeID).

-spec addCondIsInAttackRange(ParentID,PrevNodeID) -> NodeID when
	ParentID::uint(),NodeID::uint(),PrevNodeID::uint().
addCondIsInAttackRange(ParentID,PrevNodeID) ->
	Cond = #bstCondNode{
		name="IsInAttackRange",
		condVar = ?BSTCondVar_IsInAttackRange,
		condRelation = ?BSTCondEqual,
		condValue = 1
	},
	addNode(ParentID,Cond,PrevNodeID).


%% ====================================================================
%% 以下为行为节点
%% ====================================================================

-spec addActionMove(ParentID,PrevNodeID) -> NodeID when
	ParentID::uint(),NodeID::uint(),PrevNodeID::uint().
addActionMove(ParentID,PrevNodeID) ->
	Action = #bstActionNode{
		name="ActionMove",
		actionType = ?BSTActionMove,
		actionArg = ?BST_MOVE_RAND_DIR
	},
	addNode(ParentID,Action,PrevNodeID).

-spec addActionMove2(ParentID,PrevNodeID) -> NodeID when
	ParentID::uint(),NodeID::uint(),PrevNodeID::uint().
addActionMove2(ParentID,PrevNodeID) ->
	Action = #bstActionNode{
		name="ActionMove",
		actionType = ?BSTActionMove,
		actionArg = ?BST_MOVE_STAND
	},
	addNode(ParentID,Action,PrevNodeID).

-spec addActionMoveSpec(ParentID,PrevNodeID) -> NodeID when
	ParentID::uint(),NodeID::uint(),PrevNodeID::uint().
addActionMoveSpec(ParentID,PrevNodeID) ->
	Action = #bstActionNode{
		name="ActionMove",
		actionType = ?BSTActionMove,
		actionArg = ?BST_MOVE_WAY_LIST
	},
	addNode(ParentID,Action,PrevNodeID).

-spec addActionMoveConvoy(ParentID,PrevNodeID) -> NodeID when
	ParentID::uint(),NodeID::uint(),PrevNodeID::uint().
addActionMoveConvoy(ParentID,PrevNodeID) ->
	Action = #bstActionNode{
		name="ActionMove",
		actionType = ?BSTActionMove,
		actionArg = ?BST_MOVE_CONVOY
	},
	addNode(ParentID,Action,PrevNodeID).


-spec addActionIdle(ParentID,PrevNodeID) -> NodeID when
	ParentID::uint(),NodeID::uint(),PrevNodeID::uint().
addActionIdle(ParentID,PrevNodeID) ->
	Action = #bstActionNode{
		name="ActionIdle",
		actionType = ?BSTActionIdle
	},
	addNode(ParentID,Action,PrevNodeID).

-spec addActionSelectTarget(ParentID, Arg,PrevNodeID) -> NodeID when
	ParentID::uint(), Arg :: uint() | {uint(), uint()}, NodeID :: uint(),PrevNodeID::uint().
addActionSelectTarget(ParentID, Arg,PrevNodeID) ->
	Action = #bstActionNode{
		name="ActionSelTarget",
		actionType = ?BSTActionSelTarget,
		actionArg = Arg
	},
	addNode(ParentID, Action,PrevNodeID).

-spec addActionSelectSkill(ParentID, Arg,PrevNodeID) -> NodeID when
	ParentID::uint(), Arg :: uint() | {uint(), uint(), uint()}, NodeID::uint(),PrevNodeID::uint().
addActionSelectSkill(ParentID, Arg,PrevNodeID) ->
	Action = #bstActionNode{
		name="ActionSelSkill",
		actionType = ?BSTActionSelSkill,
		actionArg = Arg
	},
	addNode(ParentID,Action,PrevNodeID).

-spec addActionAttack(ParentID,PrevNodeID) -> NodeID when
	ParentID::uint(),NodeID::uint(),PrevNodeID::uint().
addActionAttack(ParentID,PrevNodeID) ->
	Action = #bstActionNode{
		name="ActionAttack",
		actionType = ?BSTActionAttack
	},
	addNode(ParentID,Action,PrevNodeID).

-spec addActionPursue(ParentID,PrevNodeID) -> NodeID when
	ParentID::uint(),NodeID::uint(),PrevNodeID::uint().
addActionPursue(ParentID,PrevNodeID) ->
	Action = #bstActionNode{
		name="ActionMove",
		actionType = ?BSTActionMove,
		actionArg = ?BST_MOVE_TRACE_TARGET
	},
	addNode(ParentID,Action,PrevNodeID).

%% ====================================================================
%% 以下为流程控制节点
%% ====================================================================

-spec addNodeDecLoop(ParentID,PrevNodeID) -> NodeID when
	ParentID::uint(),NodeID::uint(),PrevNodeID::uint().
addNodeDecLoop(ParentID,PrevNodeID) ->
	Node = #bstDecNode{
		name="DecTypeLoop",
		decType = ?BSTDecTypeLoop,
		decArg = true
	},
	addNode(ParentID,Node,PrevNodeID).

-spec addNodeDecNot(ParentID,PrevNodeID) -> NodeID when
	ParentID::uint(),NodeID::uint(),PrevNodeID::uint().
addNodeDecNot(ParentID,PrevNodeID) ->
	Node = #bstDecNode{
		name="DecTypeNot",
		decType = ?BSTDecTypeNot
	},
	addNode(ParentID,Node,PrevNodeID).

-spec addNodeSeq(ParentID,PrevNodeID) -> NodeID when
	ParentID::uint(),NodeID::uint(),PrevNodeID::uint().
addNodeSeq(ParentID,PrevNodeID) ->
	Node = #bstSeqNode{
		name="SeqNode"
	},
	addNode(ParentID,Node,PrevNodeID).

-spec addNodeSelector(ParentID,PrevNodeID) -> NodeID when
	ParentID::uint(),NodeID::uint(),PrevNodeID::uint().
addNodeSelector(ParentID,PrevNodeID) ->
	Node = #bstSelNode{
		name="SelectorNode"
	},
	addNode(ParentID,Node,PrevNodeID).

-spec addNodeParal(ParentID,PrevNodeID) -> NodeID when
	ParentID::uint(),NodeID::uint(),PrevNodeID::uint().
addNodeParal(ParentID,PrevNodeID) ->
	Node = #bstParalNode{
		name="ParalNode"
	},
	addNode(ParentID,Node,PrevNodeID).

%% ====================================================================
%% Internal functions
%% ====================================================================


%%添加一个节点到父节点
-spec addNode(ParentID,Node,PrevNodeID) -> NodeID when
	ParentID::uint(),Node::bstNode(),NodeID::uint(),PrevNodeID::uint().
addNode(ParentID,#bstActionNode{} = Node,PrevNodeID) when ParentID > 0 ->
	NodeID = registerNode(Node),
	Node1 = Node#bstActionNode{
		id = NodeID,
		parent = ParentID,
		prevNodeID = PrevNodeID			%%本节点的上一个节点ID
	},
	storeNode(ParentID,NodeID,PrevNodeID,Node1);
addNode(ParentID,#bstCondNode{} = Node,PrevNodeID) when ParentID > 0 ->
	NodeID = registerNode(Node),
	Node1 = Node#bstCondNode{
		id = NodeID,
		parent = ParentID,
		prevNodeID = PrevNodeID			%%本节点的上一个节点ID
	},
	storeNode(ParentID,NodeID,PrevNodeID,Node1);
addNode(ParentID,#bstSeqNode{} = Node,PrevNodeID) when ParentID > 0 ->
	NodeID = registerNode(Node),
	Node1 = Node#bstSeqNode{
		id = NodeID,
		parent = ParentID,
		prevNodeID = PrevNodeID			%%本节点的上一个节点ID
	},
	storeNode(ParentID,NodeID,PrevNodeID,Node1);
addNode(ParentID,#bstSelNode{} = Node,PrevNodeID) when ParentID > 0 ->
	NodeID = registerNode(Node),
	Node1 = Node#bstSelNode{
		id = NodeID,
		parent = ParentID,
		prevNodeID = PrevNodeID			%%本节点的上一个节点ID
	},
	storeNode(ParentID,NodeID,PrevNodeID,Node1);
addNode(ParentID,#bstParalNode{} = Node,PrevNodeID) when ParentID > 0 ->
	NodeID = registerNode(Node),
	Node1 = Node#bstParalNode{
		id = NodeID,
		parent = ParentID,
		prevNodeID = PrevNodeID			%%本节点的上一个节点ID
	},
	storeNode(ParentID,NodeID,PrevNodeID,Node1);
addNode(ParentID,#bstDecNode{} = Node,PrevNodeID) when ParentID > 0 ->
	NodeID = registerNode(Node),
	Node1 = Node#bstDecNode{
		id = NodeID,
		parent = ParentID,
		prevNodeID = PrevNodeID			%%本节点的上一个节点ID
	},
	storeNode(ParentID,NodeID,PrevNodeID,Node1).

storeNode(ParentID,NodeID,PrevNodeID,Node) ->
	setNode(NodeID,Node),
	Parent = getNode(ParentID),
	addChildNode(Parent,NodeID),
	case PrevNodeID > 0 of
		true ->
			PrevNode = getNode(PrevNodeID),
			setNextNodeID(PrevNode,NodeID);
		_ ->
			skip
	end,
	NodeID.

setNextNodeID(#bstActionNode{id = ID} = Node,NextNodeID) ->
	setNode(ID,Node#bstActionNode{nextNodeID = NextNodeID});
setNextNodeID(#bstCondNode{id = ID} = Node,NextNodeID) ->
	setNode(ID,Node#bstCondNode{nextNodeID = NextNodeID});
setNextNodeID(#bstSeqNode{id = ID} = Node,NextNodeID) ->
	setNode(ID,Node#bstSeqNode{nextNodeID = NextNodeID});
setNextNodeID(#bstSelNode{id = ID} = Node,NextNodeID) ->
	setNode(ID,Node#bstSelNode{nextNodeID = NextNodeID});
setNextNodeID(#bstDecNode{id = ID} = Node,NextNodeID) ->
	setNode(ID,Node#bstDecNode{nextNodeID = NextNodeID}).

getNextNodeID(#bstActionNode{nextNodeID = ID}) ->
	ID;
getNextNodeID(#bstCondNode{nextNodeID = ID}) ->
	ID;
getNextNodeID(#bstSeqNode{nextNodeID = ID}) ->
	ID;
getNextNodeID(#bstSelNode{nextNodeID = ID}) ->
	ID;
getNextNodeID(#bstDecNode{nextNodeID = ID}) ->
	ID;
getNextNodeID(_) ->
	0.


-spec addChildNode(bstNode(),ChildID) -> ok when
	ChildID::uint().
addChildNode(#bstRootNode{id = NodeID,child = Child} = Node,ChildID) when ChildID > 0 andalso Child =:= undefined ->
	Node1 = Node#bstRootNode{child = ChildID},
	setNode(NodeID,Node1),
	ok;
addChildNode(#bstSeqNode{id = NodeID,childs = List} = Node,ChildID) when ChildID > 0 ->
	Node1 = Node#bstSeqNode{childs = [ChildID | List]},
	setNode(NodeID,Node1),
	ok;
addChildNode(#bstSelNode{id = NodeID,childs = List} = Node,ChildID) when ChildID > 0 ->
	Node1 = Node#bstSelNode{childs = [ChildID | List]},
	setNode(NodeID,Node1),
	ok;
addChildNode(#bstParalNode{id = NodeID,childs = List} = Node,ChildID) when ChildID > 0 ->
	Node1 = Node#bstParalNode{childs = [ChildID | List]},
	setNode(NodeID,Node1),
	ok;
addChildNode(#bstDecNode{id = NodeID,child = Child} = Node,ChildID) when ChildID > 0 andalso Child =:= undefined ->
	Node1 = Node#bstDecNode{child = ChildID},
	setNode(NodeID,Node1),
	ok.

-spec registerNode(Node) -> uint() when
	Node::bstNode().
registerNode(Node) ->
	ID = getNodeId(),
	put({bstNode,ID},Node),
	ID.

-spec setNode(ID,Node) -> ok when
	ID::uint(),Node::bstNode().
setNode(ID,Node) ->
	case get({bstNode,ID}) of
		undefined ->
			throw("Unregistered Node");
		_ ->
			put({bstNode,ID},Node)
	end,
	ok.

-spec getNodeId() -> uint().
getNodeId() ->
	N = get(bstNodeId),
	put(bstNodeId,N + 1),
	N.

-spec revertBstTreeChilds(NodeID) -> ok when
	NodeID::uint().
revertBstTreeChilds(NodeID) ->
	Node = getNode(NodeID),
	revertNodeChilds(Node).

-spec revertNodeChilds(Node) -> ok when
	Node::bstNode().
revertNodeChilds(#bstRootNode{child = Child}) ->
	revertChildNode([Child]),
	ok;
revertNodeChilds(#bstDecNode{child = Child}) ->
	revertChildNode([Child]),
	ok;
revertNodeChilds(#bstSeqNode{id = NodeID,childs = List} = Node) ->
	Node1 = Node#bstSeqNode{childs = lists:reverse(List)},
	setNode(NodeID,Node1),
	revertChildNode(List),
	ok;
revertNodeChilds(#bstSelNode{id = NodeID,childs = List} = Node) ->
	Node1 = Node#bstSelNode{childs = lists:reverse(List)},
	setNode(NodeID,Node1),
	revertChildNode(List),
	ok;
revertNodeChilds(#bstParalNode{id = NodeID,childs = List} = Node) ->
	Node1 = Node#bstParalNode{childs = lists:reverse(List)},
	setNode(NodeID,Node1),
	revertChildNode(List),
	ok;
revertNodeChilds(_) ->
	ok.

-spec revertChildNode(list()) -> ok.
revertChildNode([]) ->
	ok;
revertChildNode([H|T]) ->
	revertBstTreeChilds(H),
	revertChildNode(T).

-spec dumpTree(List,Layer) -> ok when
	List::list(),Layer::uint().
dumpTree([],_Layer) ->
	ok;
dumpTree([H|T],Layer) ->
	Node = getNode(H),
	case Node of
		#bstSelNode{name = Name,childs = SelChilds} ->
			log([Name],Layer),
			dumpTree(SelChilds,Layer + 1);
		#bstSeqNode{name = Name,childs = SeqChilds} ->
			log([Name],Layer),
			dumpTree(SeqChilds,Layer + 1);
		#bstDecNode{name = Name,child = DecChild} ->
			log([Name],Layer),
			dumpTree([DecChild],Layer + 1);
		#bstParalNode{name = Name, childs = ParalChilds} ->
			log([Name],Layer),
			dumpTree(ParalChilds,Layer + 1);
		#bstCondNode{name = Name} ->
			log([Name],Layer);
		#bstActionNode{name = Name} ->
			log([Name],Layer);
		#bstRootNode{name = Name,child = Child} ->
			log([Name],Layer),
			dumpTree([Child],Layer + 1)
	end,
	dumpTree(T,Layer).

-spec log(A,Layer) -> ok when
	A::list(),Layer::uint().
log(A,Layer) ->
	Fun = fun(_N,AccIn) ->
		lists:flatten(["  " | AccIn])
	end,
	List = lists:seq(1, Layer),
	Space = lists:foldl(Fun, [], List),
	S = lists:flatten([Space|A]),
	?DEBUG_OUT("~p",[S]),
	ok.

