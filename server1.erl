-module(server1).
-export([start/0, loop/1]).

start() ->
	State = {"Servidor de ejemplo", 0},
	spawn(server1, loop, [State]).

loop(State) ->
	{Name, N} = State,
	receive
		{rename, NewName, Pid} ->
			NewState = {NewName, N + 1},
			Pid ! ok,
			loop(NewState);
		{echo, Mensaje, Pid} ->
			NewState = {Name, N + 1},
			Pid ! Mensaje,
			loop(NewState);
		{upper, Mensaje, Pid} ->
			NewState = {Name, N + 1},
			Pid ! string:uppercase(Mensaje),
			loop(NewState);
		{lower, Mensaje, Pid} ->
			NewState = {Name, N + 1},
			Pid ! string:lowercase(Mensaje),
			loop(NewState);
		dumpstats ->
			NewState = {Name, N + 1},
			io:format("Servidor '~s', ~p llamadas~n", [Name, N + 1]),
			loop(NewState);
		quit ->
			ok
	end.