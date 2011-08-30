-module(echo_server).

% export public functions
-export([start/0]).

% export gen_server callbacks
-export([init/1,
         handle_call/3,
         handle_cast/2,
         handle_info/2,
         terminate/2,
         code_change/3]).

-record (state, {listener}).

start() ->
	application:start(crypto),
	application:start(public_key),
	application:start(ssl),
	% {ok, ListenSocket} = gen_tcp:listen(1801, [binary, {packet_size, 4096}, {packet, raw}]),
	{ok, ListenSocket} = ssl:listen(1801, [binary, 
											{verify, 0},
											{depth, 0},
											{packet_size, 4096}, 
											{packet, raw}, 
											{certfile, "cert.pem"}, 
											{keyfile, "key.pem"},
											{reuseaddr, true}]),
    gen_server:start(?MODULE, [ListenSocket], []).

init([ListenSocket]) ->
    gen_server:cast(self(), accept),
    {ok, #state{listener=ListenSocket}}.

handle_call(Message, _From, State) ->
	io:format("handle call: ~p~n", [Message]),
	{reply, [], State}.

handle_cast(accept, #state{listener=ListenSocket}=State) ->
	% gen_tcp:accept(ListenSocket),
	io:format("ready to accept~n"),
	{ok, Socket} = ssl:transport_accept(ListenSocket),
	io:format("have socket... I think~n"),
	% io:format("result: ~p~n", Result),
	ssl:ssl_accept(Socket),
	io:format("accepted!~n"),
    % inet:setopts(ClientSocket, [{active, once}]),
    {noreply, State}.

handle_info({tcp, Socket, Data}, State) ->
    % Handle incoming data
	io:format("received: ~p~n", [binary_to_list(Data)]),
	gen_tcp:send(Socket, Data),
    {noreply, State};

handle_info({tcp_closed, Socket}, State) ->
	io:format("server closed!~n"),
	gen_tcp:close(Socket),
	gen_server:cast(self(), accept),
	{noreply, State};
	
handle_info(Message, State) ->
	io:format("handle_info: ~p~n", [Message]),
	{noreply, State}.

terminate(_Reason, State) ->
    {ok, State}.

code_change(_, State, _) ->
    {ok, State}.