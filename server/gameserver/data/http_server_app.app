%% Feel free to use, reuse and abuse the code in this file.

{application, http_server_app, [
	{description, "luna http server."},
	{vsn, "1"},
	{modules, []},
	{registered, [http_server_sup]},
	{applications, [
		cowboy
	]},
	{mod, {http_server_app, []}},
	{env, []}
]}.
