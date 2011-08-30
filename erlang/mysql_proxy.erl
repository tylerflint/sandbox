-module(mysql_proxy).

% export public functions
-export([start_link/0]).

% export gen_server callbacks
-export([init/1,
         handle_call/3,
         handle_cast/2,
         handle_info/2,
         terminate/2,
         code_change/3]).

-record (state, {listener, client, server}).

start_link() ->
	{ok, ListenSocket} = gen_tcp:listen(3308, [binary, {packet_size, 4096}, {packet, raw}]),
    gen_server:start_link(?MODULE, [ListenSocket], []).

init([ListenSocket]) ->
    gen_server:cast(self(), accept),
    {ok, #state{listener=ListenSocket}}.

handle_call(_, _, State) ->
    {reply, [], State}.

handle_cast(accept, #state{listener=ListenSocket}=State) ->
    {ok, ClientSocket} = gen_tcp:accept(ListenSocket),
	io:format("accepted!~n"),
    % inet:setopts(ClientSocket, [{active, once}]),
	gen_server:cast(self(), establish_server_connection),
    {noreply, State#state{client=ClientSocket}};

handle_cast(establish_server_connection, State) ->
	NewState =	case gen_tcp:connect("127.0.0.1", 3306, [binary, {packet_size, 4096}, {packet, raw}]) of
					{ok, Socket} -> 
						State#state{server=Socket};
					{error, _} ->
						gen_server:cast(self(), server_connection_error),
						State
				end,
	{noreply, NewState};
	
handle_cast(server_connection_error, #state{client=Client}=State) ->
	io:format("server connection error!~n"),
	gen_tcp:close(Client),
	gen_server:cast(self(), accept),
	{noreply, State}.
	
handle_info({tcp, Socket, Data}, #state{client=Client, server=Server}=State) ->
	case Socket of
		Client ->
			gen_tcp:send(Server, Data);
		Server ->
			gen_tcp:send(Client, Data)
	end,
    % Handle incoming data
    {noreply, State};

handle_info({tcp_closed, Socket}, #state{client=Client, server=Server}=State) ->
	case Socket of
		Client ->
			io:format("client closed!~n"),
			gen_tcp:close(Server);
		Server ->
			io:format("server closed!~n"),
			gen_tcp:close(Client)
	end,
	gen_server:cast(self(), accept),
	{noreply, State}.

terminate(_Reason, State) ->
    {ok, State}.

code_change(_, State, _) ->
    {ok, State}.