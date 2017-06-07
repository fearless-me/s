%% @author zhongyunawei
%% @doc @todo 怪物的行为选择树设置模块.
%% 在构造树的时候，请注意按树形结构设置好缩进，以让代码直观的看到一棵树


-module(monsterAITree).
-author(zhongyuanwei).

-include("gsInc.hrl").
-include("bstTree.hrl").
-include("bst.hrl").

%% ====================================================================
%% API functions
%% ====================================================================
-export([
		 initMonsterAI/4
		]).

-spec initMonsterAI(Code::uint(),AI, MoveType,Params::uint()) -> #bstTree{} | none when
	AI :: list(), MoveType :: bstMoveType().
initMonsterAI(Code,AI,MoveType,Params) ->
	case AI of
		[?AI_Type_PassivePursue, SelTarget, SelSkill] ->
			%% 有目的的被动怪
			case get({aiType,AI}) of
				#bstTree{} = Tree ->
					Tree;
				_ ->
					Tree = initPassiveMonsterAIByPursue(SelTarget, SelSkill),
					put({aiType,AI},Tree),
					Tree
			end;
		[?AI_Type_Active, SelTarget, SelSkill] ->
			%% 普通主动怪
			case get({aiType,AI}) of
				#bstTree{} = Tree ->
					Tree;
				_ ->
					Tree = initActiveMonsterAI(SelTarget, SelSkill),
					put({aiType,AI},Tree),
					Tree
			end;
		[?AI_Type_Carrier, _SelTarget, _SelSkill] ->
			%% 载体AI
			Key = AI ++ [MoveType],
			case get({aiType,Key}) of
				#bstTree{} = Tree ->
					Tree;
				_ ->
					Tree = initCarrierAI(MoveType),
					put({aiType,Key},Tree),
					Tree
			end;
		[?AI_Type_SpecWay1,_,_] ->
			%%按本地图所配置的路点作为路径移动的怪物
			monsterAI:initSpecWayLine(Code,true);
		[?AI_Type_SpecWay2,_,_] ->
			%%按本地图所配置的路点作为路径移动的怪物
			monsterAI:initSpecWayLine(Code,false);
		[?AI_Type_SpecWayList,_,_] ->
			%%按本地图所配置的路点作为路径移动的怪物
			monsterAI:initSpecWayLine2(Code,Params);
		[?AI_Type_PassiveSpecWay, SelTarget, SelSkill] ->
			%%按本地图所配置的路点作为路径移动的怪物
			%% 有目的的被动怪
			monsterAI:initSpecWayLine2(Code,Params),
			%%初始化选择技能
%%			monsterAI:selSkill(Code, ?BST_SELSKILL_NORMAL_MONSTER),
			case get({aiType,AI}) of
				#bstTree{} = Tree ->
					Tree;
				_ ->
					Tree = initPassiveMonsterAIMaterial(SelTarget, SelSkill),
					put({aiType,AI},Tree),
					Tree
			end;
		[?AI_TYPE_ConvoyFollowPlayer|_] ->
			%% 跟随玩家的护送怪物
			case get({aiType,AI}) of
				#bstTree{} = Tree ->
					Tree;
				_ ->
					Tree = initConvoyFollowPlayerMonsterAI(),
					put({aiType,AI},Tree),
					Tree
			end;
		[?AI_TYPE_ConvoyPlayerFollow|_] ->
			none;
		[?AI_TYPE_None | _] ->
			none;
		_ ->
			?ERROR_OUT("Error ! ai can't init "),
			none
	end.

%% ====================================================================
%% Internal functions
%% ====================================================================
%% 
initCarrierAI(MoveType) ->
	%%根节点
	RootNodeID = bstTree:addRootNode(),
		%%顺序节点
	    SeqID = bstTree:addNodeSeq(RootNodeID,0),
			%%顺序节点1
			SeqID1 = bstTree:addNodeSeq(SeqID,0),
				%%非装饰节点
				DecID = bstTree:addNodeDecNot(SeqID1,0),
					%%是否在公共CD
					bstTree:addCondIsAttackCD(DecID,0),
				%%自己是否存活
				ID1 = bstTree:addCondIsAlive(SeqID1,DecID),
				%%目标是否存在
				ID2 = bstTree:addCondIsTargetExist(SeqID1,ID1),
				%%目标是否存活
				ID3 = bstTree:addCondIsTargetAlive(SeqID1,ID2),
				%%攻击
				bstTree:addActionAttack(SeqID1,ID3),
		    %%顺序节点2
		    SeqID2 = bstTree:addNodeSeq(SeqID,SeqID1),
		    	case MoveType of
				    ?BST_MOVE_TRACE_TARGET -> %%移动跟踪
	                	bstTree:addActionPursue(SeqID2,0);
					?BST_MOVE_RAND_DIR -> %%随机移动
	                	bstTree:addActionMove(SeqID2,0);
					_ ->
				    	skip
				end,
	
	%%树结点挂载结束，添加到树
	Tree = #bstTree{
					root = RootNodeID
				   },
	bstTree:revertBstTree(Tree),
	Tree.

initPassiveMonsterAIByPursue(SelTarget, SelSkill) ->
	%%根节点
	RootNodeID = bstTree:addRootNode(),
		%%顺序节点
		SeqID = bstTree:addNodeSeq(RootNodeID,0),
			%%巡逻移动
			ID1 = bstTree:addActionMove(SeqID,0),
			%%非装饰节点
			DecNotNodeID = bstTree:addNodeDecNot(SeqID,ID1),
				%%攻击顺序节点
				SeqID1 = bstTree:addNodeSeq(DecNotNodeID,0),
					%%是否被击
					ID2 = bstTree:addCondIsBeAttacked(SeqID1,0),
		            %%循环装饰节点
					LoopID1 = bstTree:addNodeDecLoop(SeqID1,ID2),
		            %%顺序节点
					SeqID2 = bstTree:addNodeSeq(LoopID1,0),
		            	%%选择目标
					    ID3 = bstTree:addActionSelectTarget(SeqID2, SelTarget,0),
		                %%自己是否存活
						ID4 = bstTree:addCondIsAlive(SeqID2,ID3),
						%%目标是否存在
						ID5 = bstTree:addCondIsTargetExist(SeqID2,ID4),
						%%目标是否存活
						ID6 = bstTree:addCondIsTargetAlive(SeqID2,ID5),
		                %%非装饰节点
						DecNotID1 = bstTree:addNodeDecNot(SeqID2,ID6),
							%%循环装饰节点
							LoopID2 = bstTree:addNodeDecLoop(DecNotID1,0),
								%%是否在公共CD
								bstTree:addCondIsAttackCD(LoopID2,0),
			            %%非装饰节点
						DecNotID2 = bstTree:addNodeDecNot(SeqID2,DecNotID1),
							%%循环装饰节点
							LoopID3 = bstTree:addNodeDecLoop(DecNotID2,0),
								%%是否在施法中
	                        	bstTree:addCondIsCast(LoopID3,0),
						%%选择技能
						ID7 = bstTree:addActionSelectSkill(SeqID2, SelSkill,DecNotID2),
		                %%顺序节点
						SeqID3 = bstTree:addNodeSeq(SeqID2,ID7),
	                    	%%追逐
							ID8 = bstTree:addActionPursue(SeqID3,0),
							%%攻击
							bstTree:addActionAttack(SeqID3,ID8),
	%%树结点挂载结束，添加到树
	Tree = #bstTree{
					root = RootNodeID
				   },
	bstTree:revertBstTree(Tree),
	Tree.

initActiveMonsterAI(SelTarget, SelSkill) ->
	%%根节点
	RootNodeID = bstTree:addRootNode(),
		%%顺序节点
		SeqID = bstTree:addNodeSeq(RootNodeID,0),
			%%巡逻移动
			bstTree:addActionMove(SeqID,0),
		%%非装饰节点
		DecNotNodeID = bstTree:addNodeDecNot(SeqID,SeqID),
			%%攻击顺序节点
			SeqID1 = bstTree:addNodeSeq(DecNotNodeID,0),
				%%选择节点
				SelectID = bstTree:addNodeSelector(SeqID1,0),
					%%周围是否有目标
					TID = bstTree:addCondHasTarget(SelectID,0),
					%%是否被击
					bstTree:addCondIsBeAttacked(SelectID,TID),
				%%循环装饰节点
				LoopID1 = bstTree:addNodeDecLoop(SeqID1,SelectID),
	            	%%顺序节点
					SeqID2 = bstTree:addNodeSeq(LoopID1,0),
	                   	 %%选择目标
				         ID1 = bstTree:addActionSelectTarget(SeqID2, SelTarget,0),
	                     %%自己是否存活
						 ID2 = bstTree:addCondIsAlive(SeqID2,ID1),
						 %%目标是否存在
						 ID3 = bstTree:addCondIsTargetExist(SeqID2,ID2),
						 %%目标是否存活
						 ID4 = bstTree:addCondIsTargetAlive(SeqID2,ID3),
	                     %%非装饰节点
						 DecNotID1 = bstTree:addNodeDecNot(SeqID2,ID4),
						      %%循环装饰节点
							  LoopID2 = bstTree:addNodeDecLoop(DecNotID1,0),
									%%是否在公共CD
									bstTree:addCondIsAttackCD(LoopID2,0),
		                 %%非装饰节点
						 DecNotID2 = bstTree:addNodeDecNot(SeqID2,DecNotID1),
						      %%循环装饰节点
							  LoopID3 = bstTree:addNodeDecLoop(DecNotID2,0),
									 %%是否在施法中
                                    bstTree:addCondIsCast(LoopID3,0),
						 %%选择技能
						 ID5 = bstTree:addActionSelectSkill(SeqID2, SelSkill, DecNotID2),
	                     %%顺序节点
						 SeqID3 = bstTree:addNodeSeq(SeqID2,ID5),
                         	%%追逐
						 	ID6 = bstTree:addActionPursue(SeqID3,0),
						 	%%攻击
						 	bstTree:addActionAttack(SeqID3,ID6),
	
	%%树结点挂载结束，添加到树
	Tree = #bstTree{
					root = RootNodeID
				   },
	bstTree:revertBstTree(Tree),
	Tree.
%% ====================================================================
initPassiveMonsterAIMaterial(_SelTarget, SelSkill) ->
		%%根节点
	RootNodeID = bstTree:addRootNode(),
%%		%%顺序节点
%%		SeqID = bstTree:addNodeSeq(RootNodeID,0),
%%			%%巡逻移动
%%			bstTree:addActionMoveSpec(SeqID,0),
			%%非装饰节点
		DecNotNodeID = bstTree:addNodeDecNot(RootNodeID,0),
				%%攻击顺序节点
				SeqID1 = bstTree:addNodeSeq(DecNotNodeID,0),
				%%选择节点
				SelectID = bstTree:addNodeSelector(SeqID1,0),
					%%周围是否有目标
					TID = bstTree:addCondHasTarget(SelectID,0),
					%%是否被击
					bstTree:addCondIsBeAttacked(SelectID,TID),
		            %%循环装饰节点
				LoopID1 = bstTree:addNodeDecLoop(SeqID1,SelectID),
		            %%顺序节点
					SeqID2 = bstTree:addNodeSeq(LoopID1,0),
		            	%%选择目标
%%				         ID1 = bstTree:addActionSelectTarget(SeqID2, SelTarget,0),
		                %%自己是否存活
						 ID2 = bstTree:addCondIsAlive(SeqID2,0),
						%%目标是否存在
						 ID3 = bstTree:addCondIsTargetExist(SeqID2,ID2),
						%%目标是否存活
						 ID4 = bstTree:addCondIsTargetAlive(SeqID2,ID3),
%%						 ID5 = bstTree:addCondIsInAttackRange(SeqID2, ID4),
		                %%非装饰节点
						 DecNotID1 = bstTree:addNodeDecNot(SeqID2,ID4),
						      %%循环装饰节点
							  LoopID2 = bstTree:addNodeDecLoop(DecNotID1,0),
									%%是否在公共CD
									bstTree:addCondIsAttackCD(LoopID2,0),
			            %%非装饰节点
						 DecNotID2 = bstTree:addNodeDecNot(SeqID2,DecNotID1),
							%%循环装饰节点
							LoopID3 = bstTree:addNodeDecLoop(DecNotID2,0),
								%%是否在施法中
	                        	bstTree:addCondIsCast(LoopID3,0),
						%%选择技能
						 ID5 = bstTree:addActionSelectSkill(SeqID2, SelSkill, DecNotID2),
		                %%顺序节点
						 SeqID3 = bstTree:addNodeSeq(SeqID2,ID5),
                         	%%追逐
%%						 	ID6 = bstTree:addActionPursue(SeqID3,0),
						 	%%攻击
%%						 	bstTree:addActionAttack(SeqID3,ID6),
							bstTree:addActionAttack(SeqID3,0),

	%%树结点挂载结束，添加到树
	Tree = #bstTree{
					root = RootNodeID
				   },
	bstTree:revertBstTree(Tree),
	Tree.

initConvoyFollowPlayerMonsterAI() ->
	%%根节点
	RootNodeID = bstTree:addRootNode(),
		%%顺序节点
		SeqID = bstTree:addNodeSeq(RootNodeID,0),
			%%顺序节点1
			SeqID1 = bstTree:addNodeSeq(SeqID, 0),
				%%非装饰节点
				DecNotNodeID = bstTree:addNodeDecNot(SeqID1,0),
					%%循环装饰节点
					LoopID1 = bstTree:addNodeDecLoop(DecNotNodeID,0),
						%%顺序节点
						SeqID11 = bstTree:addNodeSeq(LoopID1,0),
%%							%%自己保存的目标坐标点，是否与目标整数一致
%%							ID1 = bstTree:addCondIsAlive(SeqID11,0),
							%%自己是否存活
							ID2 = bstTree:addCondIsAlive(SeqID11,0),
							%%移动向目标
							bstTree:addActionMoveConvoy(SeqID11,ID2),
%%			%%顺序节点1
%%			SeqID2 = bstTree:addNodeSeq(SeqID, SeqID1),
%%				%%巡逻移动
%%				bstTree:addActionMoveSpec(SeqID2,0),

	%%树结点挂载结束，添加到树
	Tree = #bstTree{root = RootNodeID},
	bstTree:revertBstTree(Tree),
	Tree.