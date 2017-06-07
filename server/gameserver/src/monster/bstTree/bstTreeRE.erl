%% @author zhongyunawei
%% @doc @todo 行为选择树运行时环境.


-module(bstTreeRE).
-author(zhongyuanwei).

-include("bst.hrl").
-include("bstTree.hrl").
-include("type.hrl").
-include("gsInc.hrl").

%%怪物移动后的CD时间为5到8秒
-define(MinMonsterMoveCDTime,5000).
-define(MaxMonsterMoveCDTime,8000).

-record(bstState,{
				  code = 0,				%%宿主的流水号
				  pid,					%%宿主的进程ID
				  bstTreeRoot,			%%行为树的根节点
				  curRunNode,			%%当前执行的节点
				  varList				%%变量列表
				  }).

-type bstRet()::boolean() | running.

%% ====================================================================
%% API functions
%% ====================================================================
-export([
		 setVar/3,
		 onInit/2,
		 onExecute/1
		]).

%%It is invoked when instantiating the tree.
-spec onInit(#bstActor{},#bstTree{}) -> ok.
onInit(#bstActor{} = Actor,#bstTree{} = Tree) ->
	setLog(false),
	init(Actor,Tree),
	ok.

%%It is invoked every time when executing the tree and is the first
%%node member function to be invoked after the execution traversal starts.
-spec onExecute(Code) -> ok when
  Code::uint().
onExecute(Code) ->
	State = getState(Code),
	case State of
		#bstState{} ->
			CurRunNode = State#bstState.curRunNode,
			Pid = State#bstState.pid,
			Actor = #bstActor{
				code = Code,
				pid = Pid
			},
			case CurRunNode of
				undefined ->
					Root = State#bstState.bstTreeRoot,
					onExecuteNode(Actor,Root);
				_ ->
					onResumeExecuteNode(Actor,CurRunNode)
			end;
		_ ->
			%%没AI
			skip
	end,
	ok.

-spec setLog(IsLog) -> ok when
	IsLog::boolean().
setLog(IsLog) ->
	put(isLog,IsLog),
	ok.

%-spec isLog() -> boolean() | undefined.
%isLog() ->
%	get(isLog).
%
%-spec log(Fmt,A) -> ok when
%	Fmt::string(),A::list().
%log(Fmt,A) ->
%	case isLog() of
%		true ->
%			?DEBUG_OUT(Fmt,A);
%		_ ->
%			skip
%	end,
%	ok.

%%设置变量的值
-spec setVar(Code,VarName,VarValue) -> ok when
		  Code::uint(),VarName::bstCondVar(),VarValue::number().
setVar(Code,VarName,VarValue) ->
	State = getState(Code),
	case State of
		#bstState{} ->
			VarList = State#bstState.varList,
			VarList1 = lists:keystore(VarName, 1, VarList, {VarName,VarValue}),
			NewState = State#bstState{varList = VarList1},
			setState(Code,NewState),
%% 			case VarName of
%% 				?BSTCondVar_IsAttackCD ->
%% 					%%?DEBUG_OUT("set ACD[~p]",[VarValue]),
%% 					skip;
%% 				_ ->
%% 					skip
%% 			end,
			ok;
		_ ->
			skip
	end,
	ok.

%% ====================================================================
%% Internal functions
%% ====================================================================

-spec getState(Code) -> #bstState{} | undefined when
	Code::uint().
getState(Code) ->
	get({bstState, Code}).

-spec setState(Code,#bstState{}) -> ok when
	Code::uint().
setState(Code,#bstState{} = State) ->
	put({bstState, Code},State),
	ok.

%%初始化
-spec init(#bstActor{},#bstTree{}) -> ok.
init(#bstActor{} = Actor,#bstTree{} = Tree) ->
	Code = Actor#bstActor.code,
	List = Tree#bstTree.varList,
	Fun = fun(VarName,AccIn) ->
		lists:keystore(VarName,1,AccIn,{VarName,0})
	end,
	VarList = lists:foldl(Fun, [], List),
	State = #bstState{
					  code = Code, 
					  pid = Actor#bstActor.pid,
					  bstTreeRoot = Tree#bstTree.root,
					  varList = VarList
					 },
	setState(Code,State),
	ok.

%%检查某个变量的值
-spec checkVar(#bstActor{},VarName,Relation,VarValue) -> boolean() when
		  VarName::uint(),Relation::uint(),VarValue::number().
checkVar(#bstActor{code = Code},VarName,Relation,VarValue) ->
	State = getState(Code),
	VarList = State#bstState.varList,
	case lists:keyfind(VarName, 1, VarList) of
		{VarName,Value} ->
			case Relation of
				?BSTCondEqual ->
					Value =:= VarValue;
				?BSTCondNotEqual ->
					Value /= VarValue;
				?BSTCondGreatEqual ->
					Value >= VarValue;
				?BSTCondLessEqual ->
					Value =< VarValue;
				?BSTCondGreater ->
					Value > VarValue;
				_ ->
					Value < VarValue
			end;
		_ ->
			false
	end.
    
-spec onExecuteNode(Actor,Node) -> bstRet() when
		  Actor::#bstActor{},Node::uint() | bstNode().
onExecuteNode(Actor,NodeID) when erlang:is_integer(NodeID)->
	Node = bstTree:getNode(NodeID),
	onExecuteNode(Actor,Node);
onExecuteNode(#bstActor{} = Actor,Node) ->
	case Node of
		#bstSelNode{name = _Name,childs = SelChilds} ->
			%%log("BST Node Name[~p]~n",[_Name]),
			onExecuteSelChild(Actor,SelChilds);
		#bstSeqNode{name = _Name,childs = SeqChilds} ->
			%%log("BST Node Name[~p]~n",[_Name]),
			onExecuteSeqChild(Actor,SeqChilds);
		#bstDecNode{name = _Name,decType = DecType,decArg = Arg,child = DecChild} ->
			%%log("BST Node Name[~p]~n",[_Name]),
			onExecuteDecChild(Actor,DecType,Arg,DecChild);
		#bstParalNode{name = _Name,policy = Policy, childs = ParalChilds} ->
			%%log("BST Node Name[~p]~n",[_Name]),
			onExecuteParalChild(Actor,Policy,ParalChilds);
		#bstCondNode{name = _Name} ->
			%%log("BST Node Name[~p]~n",[_Name]),
			onExecuteCondNode(Actor,Node);
		#bstActionNode{name = _Name} ->
			%%log("BST Node Name[~p]~n",[_Name]),
			onExecuteActionNode(Actor,Node);
		#bstRootNode{name = _Name,child = Child} ->
			%%log("BST Node _Name[~p]~n",[_Name]),
			onExecuteNode(Actor,Child);
		Node ->
			?ERROR_OUT("Error Node:~p",[Node]),
			throw(badBstNode)
	end.

%%选择节点是只要有一个子节点返回true，则返回true，并中断执行后面的子节点
-spec onExecuteSelChild(#bstActor{},list()) -> bstRet().
onExecuteSelChild(_Actor,[]) ->
	false;
onExecuteSelChild(Actor,[Node | Tail]) ->
	Ret = onExecuteNode(Actor,Node),
	case Ret of
		false ->
			onExecuteSelChild(Actor,Tail);
		_ ->
			Ret
	end.

%%顺序节点是只要有一个子节点返回false，则返回false，并中断执行后面的子节点
-spec onExecuteSeqChild(#bstActor{},list()) -> bstRet().
onExecuteSeqChild(_Actor,[]) ->
	true;
onExecuteSeqChild(Actor,[Node | Tail]) ->
	Ret = onExecuteNode(Actor,Node),
	case Ret of
		true ->
			onExecuteSeqChild(Actor,Tail);
		_ ->
			Ret
	end.

%%并行节点根据策略进行返回
-spec onExecuteParalChild(#bstActor{},Policy,Childs) -> bstRet() when
	Policy::bstPolicy(),Childs::list().
onExecuteParalChild(Actor,Policy,Childs) when erlang:is_list(Childs) ->
	case Policy of
		?BSTPolicySelector ->
			onExecuteSelChild(Actor,Childs);
		?BSTPolicySequence ->
			onExecuteSeqChild(Actor,Childs);
		_ ->
			throw(badBstPolicy)
	end.

%%装饰节点
-spec onExecuteDecChild(#bstActor{},DecType,DecArg,Child) -> bstRet() when
	DecType::bstDecType(),DecArg::term(),Child::bstNode().
onExecuteDecChild(Actor,DecType,DecArg,Child) ->
	case DecType of
		?BSTDecTypeNot ->
			Ret = onExecuteNode(Actor,Child),
			case Ret of
				true ->
					not Ret;
				false ->
					not Ret;
				running ->
					Ret
			end;
		?BSTDecTypeCounter ->
			false;
		?BSTDecTypeLoopCounter when erlang:is_integer(DecArg) andalso DecArg > 0 ->
			Fun = fun(_I,_AccIn) ->
						  onExecuteNode(Actor,Child)
				  end,
			List = lists:seq(1,DecArg),
			lists:foldl(Fun,false,List),
			true;
		?BSTDecTypeLoop when erlang:is_boolean(DecArg) ->
			Ret = onExecuteNode(Actor,Child),
			case Ret =:= true andalso DecArg =:= true of
				true ->
					Code = Actor#bstActor.code,
					State = getState(Code),
					setState(Code,State#bstState{curRunNode = Child}),
					running;
				_ ->
					Ret
			end;
		%%暂时没用，暂时屏蔽
%% 		?BSTDecTypeWaitTime when erlang:is_integer(DecArg) andalso DecArg > 0 ->
%% 			timer:sleep(DecArg),
%% 			onExecuteNode(Actor,Child);
		_ ->
			false
	end.

%%条件节点
-spec onExecuteCondNode(#bstActor{},#bstCondNode{}) -> boolean().
onExecuteCondNode(#bstActor{} = Actor,#bstCondNode{condVar = Var,condRelation = R,condValue = Value}) ->
	Ret = checkVar(Actor,Var,R,Value),
%% 	case Var of
%% 		?BSTCondVar_IsBeAttacked ->
%% 			ok;
%% 		?BSTCondVar_IsAttackCD ->
%% 			ok;
%% 		_ ->
%% 			skip
%% 	end,
%% 	case Ret of
%% 		true ->
%% 			case Var of
%% 				?BSTCondVar_IsBeAttacked ->
%% 					%%setLog(true),
%% 					ok;
%% 				_ ->
%% 					skip
%% 			end;
%% 		_ ->
%% 			case Var of
%% 				?BSTCondVar_IsSelfAlive ->
%% 					setLog(false),
%% 					ok;
%% 				?BSTCondVar_IsTargetExist ->
%% 					setLog(false),
%% 					ok;
%% 				?BSTCondVar_IsTargetAlive ->
%% 					setLog(false),
%% 					ok;
%% 				_ ->
%% 					skip
%% 			end
%% 	end,
	Ret.

%%行为节点
-spec onExecuteActionNode(#bstActor{},#bstActionNode{}) -> true.
onExecuteActionNode(#bstActor{code = Code} = Actor,#bstActionNode{actionType = Type,actionArg = Arg}) ->
	case checkAction(Type,Actor) of
		true ->
			monsterAI:handleAIAction(Code,Type,Arg),
			ok;
		_ ->
			skip
	end,
	true.

-spec checkAction(Action,#bstActor{}) -> boolean() when
	Action::uint().
checkAction(?BSTActionMove,#bstActor{code = Code} = Actor) ->
	IsInBattle = checkVar(Actor,?BSTCondVar_IsTargetExist,?BSTCondEqual,1),
	case IsInBattle of
		true ->
			true;
		_ ->
			Now = time:getUTCNowMS(),
			Time = get({move,Code}),
			CDTime = get({moveCD,Code}),
			case CDTime of
				undefined ->
					CD = case monsterState:getIsConvoy(Code) of
							 true -> 1000;
							 _ -> misc:rand(?MinMonsterMoveCDTime, ?MaxMonsterMoveCDTime)
						 end,
					put({moveCD,Code},CD);
				_ ->
					CD = CDTime
			end,
			case Time of
				undefined ->
					IsOK = true;
				_ ->
					case Now - Time >= CD of
						true ->
							IsOK = true;
						_ ->
							IsOK = false
					end
			end,
			case IsOK of
				true ->
					put({move,Code},Now),
					true;
				_ ->
					false
			end
	end;
checkAction(_,_Code) ->
	true.

%%继续执行上次中断的节点
-spec onResumeExecuteNode(Actor,LastRunNodeID) -> bstRet() when
		  Actor::#bstActor{},LastRunNodeID::uint().
onResumeExecuteNode(Actor,LastRunNodeID) ->
	Ret = onExecuteNode(Actor,LastRunNodeID),
	onExecuteParentNode(Ret,Actor,LastRunNodeID).

%%根据当前节点执行其上级节点
-spec onExecuteParentNode(Ret,Actor,CurNodeID) -> bstRet() when
		  Ret::bstRet(),Actor::#bstActor{},CurNodeID::uint().
onExecuteParentNode(Ret,#bstActor{} = Actor,CurNodeID) ->
	PNodeID = bstTree:getParentNodeID(CurNodeID),
	case PNodeID > 0 of
		true ->
			PNode = bstTree:getNode(PNodeID),
			Policy = getNodePolicy(PNode),
			IsContinue = isContinue(Policy,Ret),
			case IsContinue of
				true ->
					NextNodeID = bstTree:getNextNodeID(PNode),
					Result = execNextNode(Policy,Actor,NextNodeID),
					onExecuteParentNode(Result,Actor,PNodeID);
				false ->
					Code = Actor#bstActor.code,
					State = getState(Code),
					setState(Code,State#bstState{curRunNode = undefined}),
					false;
				running ->
					Code = Actor#bstActor.code,
					State = getState(Code),
					setState(Code,State#bstState{curRunNode = CurNodeID}),
					running
			end;
		_ ->
			Ret
	end.

%%获取指定节点的执行策略
-spec getNodePolicy(Node) -> Policy::bstPolicy() when Node::bstNode().
getNodePolicy(Node) ->
	case Node of
		#bstSelNode{} ->
			?BSTPolicySelector;
		#bstSeqNode{} ->
			?BSTPolicySequence;
		#bstDecNode{} ->
			?BSTPolicySequence;
		#bstParalNode{policy = Policy} ->
			Policy;
		#bstCondNode{} ->
			?BSTPolicySequence;
		#bstActionNode{} ->
			?BSTPolicySequence;
		#bstRootNode{} ->
			?BSTPolicySequence
	end.

%%执行下一个节点
-spec execNextNode(Policy,Actor,List) -> bstRet() when
		  Policy::bstPolicy(),Actor::#bstActor{},List::list().
execNextNode(Policy,#bstActor{} = Actor,NextNodeID) when erlang:is_integer(NextNodeID), NextNodeID > 0 ->
	Node = bstTree:getNode(NextNodeID),
	Ret = onExecuteNode(Actor,Node),
	case Policy of
		?BSTPolicySelector ->
			case Ret of
				false ->
					execNextNode(Policy,Actor,bstTree:getNextNodeID(Node));
				_ ->
					Ret
			end;
		?BSTPolicySequence ->
			case Ret of
				true ->
					execNextNode(Policy,Actor,bstTree:getNextNodeID(Node));
				_ ->
					Ret
			end
	end;
execNextNode(Policy,#bstActor{} = _Actor,_) ->
	case Policy of
		?BSTPolicySelector ->
			false;
		?BSTPolicySequence ->
			true
	end.

%%根据返回值与策略判定是否断续执行后面的节点
-spec isContinue(Policy,Ret) -> bstRet() when
		  Policy::bstPolicy(),Ret::bstRet().
isContinue(Policy,Ret) ->
	case Policy of
		?BSTPolicySelector ->
			case Ret of
				false ->
					true;
				true ->
					false;
				_ ->
					Ret
			end;
		?BSTPolicySequence ->
			case Ret of
				false ->
					false;
				true ->
					true;
				_ ->
					Ret
			end
	end.
