%%
%% @author luowei
%% @doc @todo 解析XML.


-module(xml_to_erlang).

%% ====================================================================
%% API functions
%% ====================================================================
-export([start/0]).
-include("gsInc.hrl").
-include_lib("xmerl/include/xmerl.hrl").
-define(MinCell, 4).
-define(ReadFileDir, "../data/ai").
-define(WriteFileDir, "../src/monster/bstTree").


start() ->
	case file:list_dir(?ReadFileDir) of
		{ok, FileList} ->
			FilterList = filterFile(FileList),
			ErlFile = lists:concat([?WriteFileDir, "/monsterAITree.erl"]),
			HrlFile = lists:concat([?WriteFileDir, "/monsterAITree.hrl"]),
			
			loadAIHrl(HrlFile),
			[aiHeadDefineApped(FileName, HrlFile) || FileName <- FilterList],
			aiHeadTailApped(HrlFile),
			
			loadAIDefineFromXml(ErlFile, FilterList),
			[loadAIFromXml(FileName, ErlFile) || FileName <- FilterList],
			io:format("Load All Ai:---~p~n",["Success"]);
		Why -> 
			io:format("Error Dir: ~w", [Why])
	end,
	ok.

loadAIHrl(File) ->
	aiHeadBaseApped(File).

loadAIDefineFromXml(File, FileList) ->
    aiBaseAppend(File),
	aiDefineHeadAppend(File),
	aiDefineAppend(File, FileList),
	aiDefineTailAppend(File),
	io:format("~n",[]),
	ok.

loadAIFromXml(FileName, File) ->
	file:write_file(File, " \t\n",[append]),
	io:format("Load Ai:---~p~n",[FileName]),
	Str = lists:concat([?ReadFileDir, "/", FileName]),	
	Ret = file:read_file(Str),
	PreFileName = lists:nth(1, string:tokens(FileName, "_")),
	case Ret of
		{ok, Bin} ->
			readAIXml(Bin, PreFileName, File);
		{error, Reson} ->
			io:format("read ai xml failed, reason: [~p]",[Reson]),
			Reson
	end.
          
readAIXml(ResList, FileName, File) when is_list(ResList) ->
	{ResDoc, _} = xmerl_scan:string(ResList),
	DocEntity = xmerl_xpath:string("/root", ResDoc),
	aiHeadAppend(File, FileName),
	ParentNodeName = value(DocEntity, File, ""),
	aiTailAppend(File, ParentNodeName);
readAIXml(ResBin, FileName, File) when is_binary(ResBin) ->
	{ResDoc, _} = xmerl_scan:string(binary_to_list(ResBin)),
	DocEntity = xmerl_xpath:string("/root", ResDoc),
	aiHeadAppend(File, FileName),
	ParentNodeName = value(DocEntity, File, ""),
	aiTailAppend(File, ParentNodeName).

value([], _File, ParentNodeName) ->
	ParentNodeName;
value([#xmlElement{name = NodeName, parents = Parents, content=Content, attributes = Attributes} | NodeList], File, ParentNodeName) ->
	RetractLen =  length(Parents) * ?MinCell + ?MinCell,
	PNode = readXmlAttribute(NodeName, Attributes, File, ParentNodeName, RetractLen),
	value(Content, File, PNode),
	value(NodeList, File, PNode);
value([#xmlPI{} | NodeList], File, ParentNodeName) ->
	value(NodeList, File, ParentNodeName);
value([#xmlDecl{} | NodeList], File, ParentNodeName) ->
	value(NodeList, File, ParentNodeName);
value([#xmlText{} | NodeList], File, ParentNodeName) ->
	value(NodeList, File, ParentNodeName);
value([#xmlComment{value = Value, parents = Parents} | NodeList], File, ParentNodeName) ->
    RetractLen =  length(Parents) * ?MinCell + ?MinCell,
	readXmlComment(Value, File, ParentNodeName, RetractLen),
	value(NodeList, File, ParentNodeName);
value([_| NodeList], File, ParentNodeName) ->
	value(NodeList, File, ParentNodeName).

readXmlAttribute(_NodeName, [], _File, PNode, _RetractLen) ->
	PNode;
readXmlAttribute(root, [#xmlAttribute{value = Value, name = Name} | AttributleList], File, ParentNodeName, RetractLen) ->
	PNode = rootAppend(Name, Value, File, ParentNodeName, RetractLen),
	readXmlAttribute(root, AttributleList, File, PNode, RetractLen);

readXmlAttribute(seq, [#xmlAttribute{value = Value, name = Name} | AttributleList], File, ParentNodeName, RetractLen) ->
	PNode = seqAppend(Name, Value, File, ParentNodeName, RetractLen),
	readXmlAttribute(seq, AttributleList, File, PNode, RetractLen);

readXmlAttribute(sel, [#xmlAttribute{value = Value, name = Name} | AttributleList], File, ParentNodeName, RetractLen) ->
	PNode = selAppend(Name, Value, File, ParentNodeName, RetractLen),
	readXmlAttribute(sel, AttributleList, File, PNode, RetractLen);

readXmlAttribute(ndec, [#xmlAttribute{value = Value, name = Name} | AttributleList], File, ParentNodeName, RetractLen) ->
	PNode = ndecAppend(Name, Value, File, ParentNodeName, RetractLen),
	readXmlAttribute(ndec, AttributleList, File, PNode, RetractLen);

readXmlAttribute(ldec, [#xmlAttribute{value = Value, name = Name} | AttributleList], File, ParentNodeName, RetractLen) ->
    PNode = ldecAppend(Name, Value, File, ParentNodeName, RetractLen),
	readXmlAttribute(ldec, AttributleList, File, PNode, RetractLen);

readXmlAttribute(condi, [#xmlAttribute{value = Value, name = Name} | AttributleList] = Attributes, File, ParentNodeName, RetractLen) ->
	PNode = condiAppend(Name, Value, File, ParentNodeName, Attributes, RetractLen),
	readXmlAttribute(condi, AttributleList, File, PNode, RetractLen);

readXmlAttribute(action, [#xmlAttribute{value = Value, name = Name} | AttributleList] = Attributes, File, ParentNodeName, RetractLen) ->
	PNode = actionAppend(Name, Value, File, ParentNodeName, Attributes, RetractLen),
	readXmlAttribute(action, AttributleList, File, PNode, RetractLen);

readXmlAttribute(Node, [#xmlAttribute{} | AttributleList], File, ParentNodeName, RetractLen) ->
	io:format("error node ~p~n",[Node]),
	readXmlAttribute(Node, AttributleList, File, ParentNodeName, RetractLen).

readXmlComment(Value, File, ParentNodeName, RetractLen) ->
	commentAppend(Value, File, ParentNodeName, RetractLen).

rootAppend(id, Value, File, NodeName, RetractLen) ->
	Str = lists:concat([getSpace(RetractLen), Value, " = ", "bstTree:addRootNode(", NodeName, "), \t\n"]),
	file:write_file(File, Str, [append]),
	Value;
rootAppend(_, _Value, _File, NodeName, _RetractLen) ->
	NodeName.

seqAppend(id, Value, File, NodeName, RetractLen) ->
	Str = lists:concat([getSpace(RetractLen), Value, " = ", "bstTree:addNodeSeq(", NodeName, "), \t\n"]),
	file:write_file(File, Str, [append]),
	Value;
seqAppend(_, _Value, _File, NodeName, _RetractLen) ->
	NodeName.

selAppend(id, Value, File, NodeName, RetractLen) ->
	Str = lists:concat([getSpace(RetractLen), Value, " = ", "bstTree:addNodeSelector(", NodeName, "), \t\n"]),
	file:write_file(File, Str, [append]),
	Value;
selAppend(_, _Value, _File, NodeName, _RetractLen) ->
	NodeName.

ndecAppend(id, Value, File, NodeName, RetractLen) ->
	Str = lists:concat([getSpace(RetractLen), Value, " = ", "bstTree:addNodeDecNot(", NodeName, "), \t\n"]),
	file:write_file(File, Str, [append]),
	Value;
ndecAppend(_, _Value, _File, NodeName, _RetractLen) ->
	NodeName.

ldecAppend(id, Value, File, NodeName, RetractLen) ->
	Str = lists:concat([getSpace(RetractLen), Value, " = ", "bstTree:addNodeDecLoop(", NodeName, "), \t\n"]),
	file:write_file(File, Str, [append]),
	Value;
ldecAppend(_, _Value, _File, NodeName, _RetractLen) ->
	NodeName.

condiAppend(type, "IsTarget", File, NodeName, _AttributeList, RetractLen) ->
	Str = lists:concat([getSpace(RetractLen), "bstTree:addCondHasTarget(", NodeName, "), \t\n"]),
	file:write_file(File, Str, [append]),
	NodeName;
condiAppend(type, "IsBeAttacked", File, NodeName, _AttributeList, RetractLen) ->
	Str = lists:concat([getSpace(RetractLen), "bstTree:addCondIsBeAttacked(", NodeName, "), \t\n"]),
	file:write_file(File, Str, [append]),
	NodeName;
condiAppend(type, "IsAlive", File, NodeName, _AttributeList, RetractLen) ->
	Str = lists:concat([getSpace(RetractLen), "bstTree:addCondIsAlive(", NodeName, "), \t\n"]),
	file:write_file(File, Str, [append]),
	NodeName;
condiAppend(type, "IsExist", File, NodeName, _AttributeList, RetractLen) ->
	Str = lists:concat([getSpace(RetractLen), "bstTree:addCondIsTargetExist(", NodeName, "), \t\n"]),
	file:write_file(File, Str, [append]),
	NodeName;
condiAppend(type, "IsTargetAlive", File, NodeName, _AttributeList, RetractLen) ->
	Str = lists:concat([getSpace(RetractLen), "bstTree:addCondIsTargetAlive(", NodeName, "), \t\n"]),
	file:write_file(File, Str, [append]),
	NodeName;
condiAppend(type, "IsAttackCD", File, NodeName, _AttributeList, RetractLen) ->
	Str = lists:concat([getSpace(RetractLen), "bstTree:addCondIsAttackCD(", NodeName, "), \t\n"]),
	file:write_file(File, Str, [append]),
	NodeName;
condiAppend(type, "IsUseSkill", File, NodeName, AttributeList, RetractLen) ->
	#xmlAttribute{value = Time} = lists:keyfind(time, #xmlAttribute.name, AttributeList),
	#xmlAttribute{value = Cycle} = lists:keyfind(cycle, #xmlAttribute.name, AttributeList),
	Str = lists:concat([getSpace(RetractLen), "bstTree:addCondTimerUseSkill(", NodeName, "," , Time , ",", Cycle, "), \t\n"]),
	file:write_file(File, Str, [append]),
	NodeName;
condiAppend(_, _, _,NodeName, _, _) ->
	NodeName.

actionAppend(type, "Move", File, NodeName, _AttributeList, RetractLen) ->
	Str = lists:concat([getSpace(RetractLen), "bstTree:addActionMove(", NodeName, "), \t\n"]),
	file:write_file(File, Str, [append]),
	NodeName;
actionAppend(type, "SelTarget", File, NodeName, _AttributeList, RetractLen) ->
	Str = lists:concat([getSpace(RetractLen), "bstTree:addActionSelectTarget(", NodeName, "), \t\n"]),
	file:write_file(File, Str, [append]),
	NodeName;
actionAppend(type, "SelSkill", File, NodeName, AttributeList, RetractLen) ->
	#xmlAttribute{value = Value} = lists:keyfind(value, #xmlAttribute.name, AttributeList),
	Str = lists:concat([getSpace(RetractLen), "bstTree:addActionSelectSkill(", NodeName, ",", Value, "), \t\n"]),
	file:write_file(File, Str, [append]),
	NodeName;
actionAppend(type, "Pursue", File, NodeName, _AttributeList, RetractLen) ->
	Str = lists:concat([getSpace(RetractLen), "bstTree:addActionPursue(", NodeName, "), \t\n"]),
	file:write_file(File, Str, [append]),
	NodeName;
actionAppend(type, "Attack", File, NodeName, _AttributeList, RetractLen) ->
	Str = lists:concat([getSpace(RetractLen), "bstTree:addActionAttack(", NodeName, "), \t\n"]),
	file:write_file(File, Str, [append]),
	NodeName;
actionAppend(_, _, _,NodeName, _, _) ->
	NodeName.

commentAppend(Value, File, ParentNodeName, RetractLen) ->
	Str = lists:concat([getSpace(RetractLen), "%%", io_lib:format("~ts",[Value]), "\t\n"]),
	file:write_file(File, unicode:characters_to_binary(Str), [append]),
	ParentNodeName.

aiHeadBaseApped(File) ->
	file:write_file(File, ""),
	file:write_file(File, "%%%------------------------------------------------\t\n",[append]),
	file:write_file(File, "%%% File    : monsterAITree.hrl\t\n",[append]),
	file:write_file(File, "%%% Author  : luowei\t\n",[append]),
	Bytes0 = list_to_binary(io_lib:format("%%% Created : ~s\t\n", [time_format(os:timestamp())])),
	file:write_file(File, Bytes0,[append]),
	file:write_file(File, "%%% Description: 从XML生成的代码\t\n",[append]),
	file:write_file(File, "%%% Warning:  由程序自动生成，请不要随意修改！\t\n",[append]),	
	file:write_file(File, "%%%------------------------------------------------	\t\n",[append]),
	file:write_file(File, " \t\n",[append]),	
	file:write_file(File, " \t\n",[append]),	
	file:write_file(File, "-ifndef(MONSTERAITREE_HRL). \t\n",[append]),	
	file:write_file(File, "-define(MONSTERAITREE_HRL, 1). \t\n",[append]),
	file:write_file(File, "\t\n", [append]),
	file:write_file(File, "\t\n", [append]).

aiHeadDefineApped(FileName, File) ->
	PreFileName = lists:nth(1, string:tokens(FileName, "_")),
	SuffixFileName = lists:last(string:tokens(FileName, "_")),
	Index = lists:nth(1, string:tokens(SuffixFileName, ".")),
	Str = lists:concat(["-define(AI_TYPE_", PreFileName, ", ", Index, ").","\t\n"]),
	file:write_file(File, Str, [append]).

aiHeadTailApped(File) ->
	file:write_file(File, "\t\n", [append]),
	file:write_file(File, "\t\n", [append]),
	file:write_file(File, "-endif.  \t\n", [append]).

aiBaseAppend(File) ->
	file:write_file(File, ""),
	file:write_file(File, "%%%------------------------------------------------\t\n",[append]),
	file:write_file(File, "%%% File    : monsterAITree.erl\t\n",[append]),
	file:write_file(File, "%%% Author  : luowei\t\n",[append]),
	Bytes0 = list_to_binary(io_lib:format("%%% Created : ~s\t\n", [time_format(os:timestamp())])),
	file:write_file(File, Bytes0,[append]),
	file:write_file(File, "%%% Description: 从XML生成的代码\t\n",[append]),
	file:write_file(File, "%%% Warning:  由程序自动生成，请不要随意修改！\t\n",[append]),	
	file:write_file(File, "%%%------------------------------------------------	\t\n",[append]),
	file:write_file(File, " \t\n",[append]),	
	file:write_file(File, "-module(monsterAITree).\t\n",[append]),
	file:write_file(File, " \t\n",[append]),
	file:write_file(File, "%%  \t\n",[append]),
	file:write_file(File, "%% Include files  \t\n",[append]),
	file:write_file(File, "-include(\"gsInc.hrl\"). \t\n",[append]),
	file:write_file(File, "-include(\"bstTree.hrl\"). \t\n",[append]),
	file:write_file(File, "-include(\"bst.hrl\"). \t\n",[append]),
	file:write_file(File, "-include(\"monsterAITree.hrl\"). \t\n",[append]),
	file:write_file(File, "  \t\n",[append]),
	file:write_file(File, "%% \t\n",[append]),
	file:write_file(File, "%% ==================================================================== \t\n",[append]),
	file:write_file(File, "%% API functions \t\n",[append]),
	file:write_file(File, "%% ==================================================================== \t\n",[append]),
	file:write_file(File, "  \t\n",[append]),
	file:write_file(File, "-compile(export_all). \t\n",[append]),
	file:write_file(File, "  \t\n",[append]),
	file:write_file(File, "  \t\n",[append]),
	file:write_file(File, "%% ==================================================================== \t\n",[append]),
	file:write_file(File, "%% Internal functions \t\n",[append]),
	file:write_file(File, "%% ==================================================================== \t\n",[append]),
	file:write_file(File, "  \t\n",[append]),
	file:write_file(File, "  \t\n",[append]).

aiDefineHeadAppend(File) ->
	file:write_file(File, "initMonsterAI(AiId,MoveType)->\t\n",[append]),
	file:write_file(File, "    case AiId of\t\n",[append]).

aiDefineAppend(File, FileList) ->
	Fun = fun(FileName) ->
				  PreFileName = lists:nth(1, string:tokens(FileName, "_")),
				  Str = lists:concat(["        ?AI_TYPE_", PreFileName, " ->\t\n"]),
				  case FileName =:= "CarrierAI" of 
					  true ->
						  Str1 = lists:concat([getSpace(?MinCell * ?MinCell), "init", PreFileName, "(MoveType);\t\n"]);
					  _ ->
						  Str1 = lists:concat([getSpace(?MinCell * ?MinCell), "init", PreFileName, "();\t\n"])
				  end,				  
				  file:write_file(File, Str, [append]),
				  file:write_file(File, Str1, [append])
		  end,
	lists:foreach(Fun, FileList).

aiDefineTailAppend(File) ->
	file:write_file(File, "        _ ->\t\n",[append]),
	file:write_file(File, lists:concat([getSpace(?MinCell * ?MinCell),"initFirstBossAI()\t\n"]),[append]),
    file:write_file(File, "    end.\t\n",[append]).

aiHeadAppend(File, FileName) ->
	case FileName =:= "CarrierAI" of
		true ->
			Str = lists:concat(["init", FileName, "(MoveType)->\t\n"]);
		_ ->
			Str = lists:concat(["init", FileName, "()->\t\n"])
	end,
	file:write_file(File, Str, [append]).

aiTailAppend(File, NodeName) ->
	file:write_file(File, "    %%树结点挂载结束，添加到树\t\n", [append]),
	Str = lists:concat(["    Tree = #bstTree{root = ", NodeName, "}, \t\n"]),
	file:write_file(File, Str, [append]),
	file:write_file(File, "	bstTree:revertBstTree(Tree), \t\n", [append]),
	file:write_file(File, "	Tree. \t\n", [append]).
    
getSpace(Len) ->
	getSpace(Len, "").
getSpace(0, Str) ->
	Str;
getSpace(Num, Str) ->
	getSpace(Num - 1, lists:concat([Str, " "])).

filterFile(FileList) ->
	Fun = fun(FileName) ->
				  SuffixFileName = lists:last(string:tokens(FileName, ".")),
				  case SuffixFileName =:= "xml" of
					  true ->
						  true;
					  _ ->
						  false
				  end
		  end,
	lists:filter(Fun, FileList).
 
%% --------------------------------------------------
%% time format
%% --------------------------------------------------
one_to_two(One) -> io_lib:format("~2..0B", [One]).

time_format(Now) -> 
	{{Y,M,D},{H,MM,S}} = calendar:now_to_local_time(Now),
	lists:concat([Y, "-", one_to_two(M), "-", one_to_two(D), " ", 
						one_to_two(H) , ":", one_to_two(MM), ":", one_to_two(S)]).



	 