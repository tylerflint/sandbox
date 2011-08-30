-module(mongo).

-export ([start/0, execute/0]).

start() ->
	application:start(emongo),
	emongo:add_pool(pool1, "localhost", 27017, "pagoda_production", 1),
	execute().
	
execute() ->
	Res = emongo:find_all(pool1, "web_transactions"),
	length(Res).
	