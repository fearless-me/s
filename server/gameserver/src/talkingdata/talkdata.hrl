-ifndef(Talkdata_hrl).
-define(Talkdata_hrl,1).

-include("gsInc.hrl").
-include_lib("stdlib/include/qlc.hrl").

-define(EtsRecharge,rechargeEts).%%缓存

-record(state,{
			   talkingdataChargeApi,
			   gameDBID %%大区编号
			   }).
-endif.