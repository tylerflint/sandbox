-module(time).

-export([now_list/1,
		 sorted_now_list/1]).

-record(host, {
		 address,
		 status=ready, % status="ready/busy"
		 released
		}).

now_list(Length) ->
	now_list([], Length, 0).
	
now_list(List, Length, Count) ->
	Now = erlang:now(),
	NewList = [#host{address=random:seed(Now), released=Now}|List],
	case Count of
		Length -> NewList;
		_ -> now_list(NewList, Length, Count+1)
	end.
	
sorted_now_list(Length) ->
	Sort =	fun(A, B) ->
				A#host.released =< B#host.released
			end,
	lists:sort(Sort, now_list(Length)).