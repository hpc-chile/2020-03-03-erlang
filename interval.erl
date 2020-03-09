-module(interval).
-export([print_interval/2]).

print_interval(X, Y) when X > Y ->
	done;
print_interval(X, Y) ->
	io:format("~p~n", [X]),
	print_interval(X + 1, Y).