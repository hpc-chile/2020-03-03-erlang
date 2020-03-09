-module(link1).
-export([chain/1]).

chain(0) ->
	receive
		_ -> ok
	after 2000 ->
		exit("chain 0 se murió!")
	end;
chain(N) ->
	Pid = spawn_link(fun() -> chain(N-1) end),
	receive
		_ -> ok
	end.