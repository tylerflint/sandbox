-module (app_list).

-export ([create_schema/0, build_db/0, register_app/1, remove_all_apps/0, remove_app_hosts/1, add_host_to_app/2, add_host_to_app/3, app_hosts/1, show_app/1, app_count/0]).
-export ([find_and_secure_host/1, find_available_host_from_list/1, find_available_host_from_list/2, find_busy_host_from_list/2, find_busy_host_from_list/3]).
-export ([release_host/2]).

-record (app, {name, hosts=[]}).
% todo: potentially add a "released" stamp on the host record so that we can
% implement a "round robin" routine instead of hitting the first each time
-record (host, {address, status=ready}). % status="ready/busy"

create_schema() ->
	mnesia:stop(),
	mnesia:create_schema([node()]),
	mnesia:start().
	
build_db() ->
	mnesia:create_table(app, [{ram_copies, [node()]}, {type, set}, {attributes, record_info(fields, app)}]).
	
register_app(AppName) ->
	mnesia:transaction( fun() -> mnesia:write(#app{name=AppName}) end ).
		
add_host_to_app(AppName, Address) ->
	add_host_to_app(AppName, Address, true).
		
add_host_to_app(AppName, Address, Available) ->
	F = fun() ->
			case mnesia:read(app, AppName) of
				[] ->
					register_app(AppName),
					add_host_to_app(AppName, Address);
				[#app{hosts=Hosts}=App] ->
					case Available of
						true -> 
							mnesia:write(App#app{hosts=[#host{address=Address} | Hosts]});
						false ->
							mnesia:write(App#app{hosts=[#host{address=Address, status=busy} | Hosts]})
					end
			end
			% {ok, "hello"} % the result of the transaction is the return data of the fun
		end,
	{atomic, Result} = mnesia:transaction(F),
	Result.

app_hosts(AppName) ->
	F = fun() ->
		List = case mnesia:read(app, AppName) of
				[] -> {error, no_app};
				[#app{hosts=Hosts}] -> Hosts
			end,
		List
		end,
	{atomic, Result} = mnesia:transaction(F),
	Result.
	
show_app(AppName) ->
	case mnesia:dirty_read({app, AppName}) of
		[] -> io:format("empty result~n");
		[App] -> io:format("~p~n", [App])
	end.
	
remove_all_apps() ->
	mnesia:transaction(fun () -> [mnesia:delete(app, Key, sticky_write) || Key <- mnesia:all_keys(app)] end).
	
app_count() -> 
	AppCount = mnesia:table_info(app,size),
	io:format("total app entries: ~p~n", [AppCount]).

remove_app_hosts(AppName) ->
	F = fun() ->
			case mnesia:read(app, AppName) of
				[] -> {error, no_app};
				[App] ->
					mnesia:write(App#app{hosts=[]})
			end
		end,
	{atomic, Result} = mnesia:transaction(F),
	Result.

find_and_secure_host(AppName) ->
	F = fun() ->
			Address = case mnesia:read(app, AppName) of
						[] -> {error, no_app};
						[#app{hosts=Hosts}=App] ->
							case find_available_host_from_list(Hosts) of
								{error, no_match}							-> {error, no_host_available};
								[{match, Host}, {leftover, Leftover}]	->
									mnesia:write(App#app{hosts=[Host#host{status=busy} | Leftover]}),
									Host#host.address
							end
					end,
			Address
		end,
	{atomic, Result} = mnesia:transaction(F),
	Result.
	
find_available_host_from_list(Hosts) ->
	find_available_host_from_list(Hosts, []).

find_available_host_from_list([Head | Tail], Leftover) ->	
	Result = case Head of
		#host{status=ready}=Host ->
			case Leftover of
				[]	-> [{match, Host}, {leftover, Tail}];
				_	-> 
					case Tail of
						[]	-> [{match, Host}, {leftover, Leftover}];
						_	-> [{match, Host}, {leftover, [Leftover | Tail]}]
					end
			end;
		NoMatch ->
			case Tail of
				[]	-> {error, no_match};
				_	-> find_available_host_from_list(Tail, [NoMatch | Leftover])
			end
	end,
	Result.

find_busy_host_from_list(Hosts, Address) ->
	find_busy_host_from_list(Hosts, Address, []).

find_busy_host_from_list([Head | Tail], Address, Leftover) ->	
	Result = case Head of
		#host{status=busy,address=Address}=Host ->
			case Leftover of
				[]	-> [{match, Host}, {leftover, Tail}];
				_	-> 
					case Tail of
						[]	-> [{match, Host}, {leftover, Leftover}];
						_	-> [{match, Host}, {leftover, [Leftover | Tail]}]
					end
			end;
		NoMatch ->
			case Tail of
				[]	-> {error, no_match};
				_	-> find_busy_host_from_list(Tail, Address, [NoMatch | Leftover])
			end
	end,
	Result.
		
release_host(AppName, Address) ->
	F = fun() ->
			case mnesia:read(app, AppName) of
				[]	-> {error, no_app};
				[#app{hosts=Hosts}=App] ->
					case find_busy_host_from_list(Hosts, Address) of
						{error, no_match} -> {error, no_host_available};
						[{match, Host}, {leftover, Leftover}]	->
							mnesia:write(App#app{hosts=[Host#host{status=ready} | Leftover]})
					end
			end
		end,
	{atomic, Result} = mnesia:transaction(F),
	Result.
		