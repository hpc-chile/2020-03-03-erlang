-module(sumalistatr).
-export([suma/0]).

suma() ->
	suma([1, 2, 3, 4, 5, 6], 0).

suma([Head | Tail], Acc) ->
	suma(Tail, Head + Acc);
suma([], Acc) ->
	Acc.