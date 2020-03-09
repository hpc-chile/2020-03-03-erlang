-module(procesos1).
-export([hola/0, chao/0]).

hola() ->
	Pid = spawn(procesos1, chao, []), 
	Pid ! {self()},
	receive
		{PidChao} -> io:format("~p me dijo chao!~n", [PidChao])
	end.

chao() ->
	receive
		{Pid} ->
			io:format("Me saludó ~p! ~n", [Pid]),
			Pid ! {self()}
	end.