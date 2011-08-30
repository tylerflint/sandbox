-module(match_partition).

-export([find_first_match/2,
		 mock_list1/0]).


mock_list1() ->
	["a", "b", "c", "d", "e", "f"].

find_first_match(MatchSpec, List) ->
	find_first_match(MatchSpec, List, []).

find_first_match(_, [], _) ->
	{error, no_match};
	
find_first_match(MatchSpec, [Head | Tail], Leftover) ->
	case MatchSpec(Head) of
		true ->
			case Leftover of
				[]	-> [{match, Head}, {leftover, Tail}];
				_	-> 
					case Tail of
						[]	-> [{match, Head}, {leftover, Leftover}];
						_	-> [{match, Head}, {leftover, lists:merge(Tail, Leftover)}]
					end
			end;
		false ->
			find_first_match(MatchSpec, Tail, lists:merge(Leftover, [Head]))
	end.
	
