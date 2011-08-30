-module(syntax_test).

-export ([test/0]).


test() ->
	case what of
		what ->
			A = "a";
		_	-> 
			ok
	end,
	ok.

