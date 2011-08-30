-module(record_test).

-record(record, {a}).

-export([test/0]).

test() ->
	Record = #record{},
	Record#record.a.