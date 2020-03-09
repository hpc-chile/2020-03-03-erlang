-module(link2).
-export([chain/1]).

chain(0) ->
	receive
		_ -> ok
	after 2000 ->
		exit("chain(0) se murio!")
	end;
chain(N) ->
	process_flag(trap_exit, true),
	Pid = spawn_link(link2, chain, [N-1]),
	receive
		{'EXIT', Pid, Razon} ->
			io:format("~s~n", [Razon]),
			exit(io_lib:format("chain(~w) se murio!", [N]));
		_ -> ok
	end.