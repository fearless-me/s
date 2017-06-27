%%窗口类
-module(window).
-include("window.hrl").
-include("logger.hrl").
-include_lib("wx/include/wx.hrl").

-compile(export_all).

-behavoiur(wx_object).

-type wxWindow() :: wx:wx_object().

%%创建一个窗口
-spec create_window(TitleName, StatusName, Width, Height) -> wxWindow() when
		  TitleName :: string(), StatusName :: string(), Width :: non_neg_integer(), Height :: non_neg_integer().
create_window(TitleName, StatusName, Width, Height) ->
	wx_object:start_link(?MODULE, [TitleName, StatusName, Width, Height], [{timeout, 600000}]).

%%销毁窗口
-spec destory_window(WinPid) -> ok when
		  WinPid :: wxWindow().
destory_window(WinPid)->
	deal_fuc(WinPid, {destory_window}).

%%显示窗口
-spec show_window(WinPid) -> ok when
		  WinPid :: wxWindow().
show_window(WinPid)->
	deal_fuc(WinPid, {show_window}).

%%隐藏窗口
-spec hide_window(WinPid) -> ok when
		  WinPid :: wxWindow().
hide_window(WinPid)->
	deal_fuc(WinPid, {show_window}).

%%插入一条记录
-spec insert_record(WinPid, Text, MsgLevel) -> ok when
		  WinPid :: wxWindow(), Text :: string(), MsgLevel :: non_neg_integer().
insert_record(WinPid, Text, MsgLevel)->
	deal_fuc(WinPid, {insert_record, Text, MsgLevel}).

%%执行函数
-spec deal_fuc(Pid, Param) -> ok when
		  Pid :: wxWindow(), Param :: term().
deal_fuc(Pid, Param)->
	try
		case Param of
			{destory_window} ->
                wx_object:cast(Pid, {destory_window});
			{show_window} ->
                wx_object:cast(Pid, {show_window});
			{hide_window} ->
                wx_object:cast(Pid, {hide_window});
			{insert_record, Text, MsgLevel} ->
                wx_object:cast(Pid, {insert_record, Text, MsgLevel});
			UnkownMsg ->
                ?ERROR_OUT("window deal_fuc, recv unkown msg: ~p", [UnkownMsg])
		end
	catch
		_:_Why -> 
			?ERROR_OUT("exception _Why: ~p, erlang:get_stacktrace: ~p", [_Why, erlang:get_stacktrace()])
	end.

%% Init is called in the new process.
init([TitleName, StatusName, Width, Height]) ->
	wx:new(),
    Frame = wxFrame:new(wx:null(), 
			?wxID_ANY, % window id
			TitleName, % window title
			[{size, {Width, Height}}]),
  	
    wxFrame:createStatusBar(Frame, []),
	
    %% if we don't handle this ourselves, wxwidgets will close the window
    %% when the user clicks the frame's close button, but the event loop still runs
    wxFrame:connect(Frame, close_window),
    
    ok = wxFrame:setStatusText(Frame, StatusName, []),
	
    LogTextCtrl = wxTextCtrl:new(Frame, ?wxID_ANY, 
				 [{style, ?wxTE_MULTILINE bor ?wxTE_READONLY bor ?wxTE_RICH2}]),
	wxWindow:show(Frame),
	FixedFont = wxFont:new(11, ?wxFONTFAMILY_TELETYPE, ?wxNORMAL, ?wxNORMAL, []),
	wxTextCtrl:setFont(LogTextCtrl, FixedFont),
    wxTextCtrl:setBackgroundColour(LogTextCtrl, ?wxLIGHT_GREY),
	wxTextCtrl:connect(LogTextCtrl, right_down),
	
	Entry = wxAcceleratorEntry:new([{flags, ?wxACCEL_CTRL},{keyCode, $D},{cmd, ?wxID_CLEAR}]),
	AT = wxAcceleratorTable:new(1,[Entry]),
	wxFrame:setAcceleratorTable(LogTextCtrl,AT),

%%	IsNeedAlter = case erlang:system_info(version) of
%%					  [$6 |_ ] ->
%%						  false;
%%					  _ ->
%%						  true
%%				  end,
	IsNeedAlter = false,
    {Frame, #window{win = Frame, textWin = LogTextCtrl, textColourWin = wxTextAttr:new(?wxWHITE), isNeedAlter = IsNeedAlter}}.

handle_cast({insert_record, Text, MsgLevel}, #window{} = State) ->
%%	Text = try
%%			   case IsNeedAlter of
%%				   true ->
%%					   str:utf8_to_utf16(Text0);
%%				   _ ->
%%					   Text0
%%			   end
%%		catch
%%			_:Why ->
%%				?ERROR_OUT("insert_record failed:~p ~p ~p",[Why,Text0,misc:getStackTrace()]),
%%				""
%%		end,
	case MsgLevel of
		?LogLevelError ->
			wxTextAttr:setTextColour(State#window.textColourWin, ?wxRED),
			wxTextCtrl:setDefaultStyle(State#window.textWin, State#window.textColourWin),
			wxTextCtrl:appendText(State#window.textWin, Text);
		?LogLevelDebug ->
			wxTextAttr:setTextColour(State#window.textColourWin, ?wxBLUE),
			wxTextCtrl:setDefaultStyle(State#window.textWin, State#window.textColourWin),
			wxTextCtrl:appendText(State#window.textWin, Text);
		?LogLevelWarn ->
			wxTextAttr:setTextColour(State#window.textColourWin, {255,255,255}),
			wxTextCtrl:setDefaultStyle(State#window.textWin, State#window.textColourWin),
			wxTextCtrl:appendText(State#window.textWin, Text);
		_ ->
			Default = wxSystemSettings:getColour(?wxSYS_COLOUR_WINDOWTEXT),
			wxTextAttr:setTextColour(State#window.textColourWin, Default),
			wxTextCtrl:setDefaultStyle(State#window.textWin, State#window.textColourWin),
			wxTextCtrl:appendText(State#window.textWin, Text)
	end,
    {noreply, State};

handle_cast({destory_window}, State) ->
	wxWindow:destroy(State#window.win),
    {noreply, State};

handle_cast({show_window}, State) ->
	wxWindow:show(State#window.win),
    {noreply, State};

handle_cast({hide_window}, State) ->
	wxWindow:hide(State#window.win),
    {noreply, State};

handle_cast(_Msg, State) ->
    {noreply, State}.

%% Handled as in normal gen_server callbacks
handle_info(Msg, State) ->
    io:format("Got Info ~p~n",[Msg]),
    {noreply, State}.

handle_call(Msg, _From, State) ->
    io:format("Got Call ~p~n", [Msg]),
    {reply, ok, State}.

handle_event(#wx{event = #wxMouse{}},State = #window{win = Frame}) ->
	Edit = wxMenu:new([]),
	wxMenu:append(Edit, ?wxID_CUT, "Cut\tCtrl+X"),
    wxMenu:append(Edit, ?wxID_COPY, "Copy\tCtrl+C"),
	wxMenu:append(Edit, ?wxID_PASTE, "Paste\tCtrl+V"),
	wxMenu:appendSeparator(Edit),
	wxMenu:append(Edit, ?wxID_SELECTALL, "Select All\tCtrl+A"),
	wxMenu:append(Edit, ?wxID_CLEAR, "Clear All\tCtrl+D"),
	wxMenu:connect(Edit, command_menu_selected),
	wxWindow:popupMenu(Frame,Edit),
	{noreply, State};

handle_event(#wx{id = Id,event = #wxCommand{type = command_menu_selected}},State = #window{textWin = TC}) ->
	case Id of
		?wxID_CLEAR ->
			wxTextCtrl:clear(TC);
		_ ->
			skip
	end,
	{noreply, State};

%% Async Events are handled in handle_event as in handle_info
handle_event(#wx{event = #wxClose{}}, State = #window{win = Frame}) ->
    ok = wxFrame:setStatusText(Frame, "Closing...", []),
    wxWindow:destroy(Frame),
    {stop, normal, State}.

code_change(_, _, State) ->
    {stop, not_yet_implemented, State}.

terminate(_Reason, _State) ->
    ok.

