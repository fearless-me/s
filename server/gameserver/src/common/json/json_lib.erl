%%%-------------------------------------------------------------------
%%% @author wenshaofei
%%% @copyright (C) 2016, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 03. 十一月 2016 16:54
%%%-------------------------------------------------------------------
-module(json_lib).
-author("wenshaofei").

%% API
-export([encodeJsonByRecord/2, encodeJsonByKVList/1,decord2KvList/1,decord2Record/3]).
%%将erlang记录格式化成json字符串
%%record_info(fields,RecordValue),
%%
encodeJsonByRecord(RecordInfo, RecordValue)->
  [_H|RecordValueList]=erlang:tuple_to_list(RecordValue),
  KVList = to_kv_list(RecordInfo,RecordValueList,[]),
  encodeJsonByKVList(KVList).
%%将kv列表或数组编码成json二进制字符串
encodeJsonByKVList(KVList)->
  jsx:encode(KVList).
to_kv_list([],[],KVList)->
  KVList;
to_kv_list([RecAttrName|AttrNameT],[RecAttrValue|AttrValueT],KVList)->
  to_kv_list(AttrNameT,AttrValueT,[{RecAttrName,RecAttrValue}|KVList]).

%%将一个二进制json串解析成kv列表，或数组
decord2KvList(JsonBin)->
  jsx:decode(JsonBin).
%%将json数据解析成记录
%%RecordName 记录名字
%% RecordInfo=record_info(fields,RecordValue),
%% JsonBin json二进制数据
decord2Record(RecordName,RecordInfo,JsonBin)->
  KVList = decord2KvList(JsonBin),
  RecordList = [RecordName|decord2Record1(RecordInfo,KVList,[])],
  erlang:list_to_tuple(RecordList).
decord2Record1([],_KVList,NewRecordValueList)->
  lists:reverse(NewRecordValueList);
decord2Record1([RecordArrtKey|T],KVList,NewRecordValueList)->
  case lists:keyfind(erlang:term_to_binary(RecordArrtKey),1,KVList) of
    false ->
      decord2Record1(T,KVList,NewRecordValueList);
    {_,Value}->
      decord2Record1(T,KVList,[Value|NewRecordValueList])
  end.
