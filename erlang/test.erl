-module(test).

-export([info/0]).

-define(HELLO, "hello there").

info() ->
	io:format("Hello world ~n").