-module (http).

-export([start/0]).

-define(TCP_OPTIONS, [binary, {packet, 0}, {active, false}, {reuseaddr, true}]).

start() ->
	io:format("creating listener ~n"),
	% create a listener
	{ok, ListenSocket} = gen_tcp:listen(8000, ?TCP_OPTIONS),
	
	% accept a connection
	{ok, Socket} = gen_tcp:accept(ListenSocket),
	
	io:format("Connection opened ~n"),
	
	loop(Socket).
	
loop(Socket) ->
	case gen_tcp:recv(Socket, 0) of
		{ok, Binary} ->
			io:format(Binary),
			gen_tcp:close(Socket);
			% loop(Socket);
		{error, closed} ->
			io:format("Connection closed ~n")
	end.
	
