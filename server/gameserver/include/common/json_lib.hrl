%%%-------------------------------------------------------------------
%%% @author wenshaofei
%%% @copyright (C) 2016, <公司>
%%% @doc
%%%
%%% @end
%%% Created : 3. 十一月 2016 16:35
%%%-------------------------------------------------------------------
-author("wenshaofei").

%%-define(DECODE_JSON_2_KV_LIST,fun()-> end ).
%%将json数据转换成kv列表
-define(DECODE_JSON_2_KV_LIST(JSONBin), json_lib:decord2KvList(JSONBin)).
%%将json数据转换成记录
-define(DECODE_JSON_2_RECORD(EmptyRecord,JSONBin), json_lib:decord2Record(element(1,EmptyRecord),record_info(fields,EmptyRecord),JsonBin)).
%%将一个记录转换成json字符串
-define(ENCODE_JSON_BY_RECORD(RecordName,RecordValue), json_lib:encodeJsonByRecord(record_info(fields,RecordName), RecordValue)).
%%-define(ENCODE_JSON_BY_RECORD(RecordValue), json_lib:encodeJsonByRecord(11111, RecordValue)).
%%将一个KVList或列表转换成json字符串
-define(ENCODE_JSON_BY_KV_LIST(KVList), json_lib:encodeJsonByKVList(KVList)).



%%-define(print_fields(Rec), io:format("~p~n", [record_info(fields, Rec)])).