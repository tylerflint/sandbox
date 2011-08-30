-module(rebar_test_app).

-behaviour(application).

%% Application callbacks
-export([start/2, stop/1, status/0]).

%% ===================================================================
%% Application callbacks
%% ===================================================================

start(_StartType, _StartArgs) ->
    rebar_test_sup:start_link().

stop(_State) ->
    ok.

status() ->
  "hello world".
