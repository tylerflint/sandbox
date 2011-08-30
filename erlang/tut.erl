-module(tut).
-export([double/1]).
-export([triple/1]).
-export([fac/1]).

double(X) ->
    2 * X.

triple(X) ->
	3 * X.
	
fac(1) ->
    1;
fac(N) ->
    N * fac(N - 1).

convert_length({centimeter, X}) ->
    {inch, X / 2.54};
convert_length({inch, Y}) ->
    {centimeter, Y * 2.54}.