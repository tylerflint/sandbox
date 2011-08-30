-module(mailbox).

% export public functions
-export([start/0,
		 loop/0,
		 loop/1,
		 print_immediately/1]).

% export gen_server callbacks
-export([init/1,
         handle_call/3,
         handle_cast/2,
         handle_info/2,
         terminate/2,
         code_change/3]).

start() ->
    gen_server:start(?MODULE, [], []).

loop() ->
	loop(0).
	
loop(Count) ->
	case Count of
		10000000 ->
			ok;
		_ ->
			loop(Count + 1)
	end,
	ok.

print_immediately(Pid) ->
	gen_server:cast(Pid, print_immediately),
	ok.

init([]) ->
	gen_server:cast(self(), delay_then_print),
    {ok, []}.

handle_cast(delay_then_print, State) ->
	gen_server:cast(self(), print_immediately),
	% timer:sleep(2000),
	loop(),
	io:format("printing after delay~n"),
	{noreply, State};

handle_cast(print_immediately, State) ->
	io:format("printing immediately~n"),
	% exit(self(), kill),
	{noreply, State}.

handle_call('_', '_', '_') ->
	ok.

handle_info('_', '_') ->
	ok.

terminate(_Reason, State) ->
    {ok, State}.

code_change(_, State, _) ->
    {ok, State}.