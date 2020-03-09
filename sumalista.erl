-module(sumalista).
-export([suma/0]).

suma() ->
	suma([1, 2, 3, 4, 5, 6]).

suma([Head | Tail]) ->
	Head + suma(Tail);
suma([]) ->
	0.