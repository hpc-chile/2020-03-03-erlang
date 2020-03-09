-module(rpn).
-export([calcular/1]).

calcular(Entrada) ->
	rpn(string:tokens(Entrada, " ")).

read(N) ->
	case string:to_float(N) of
		{error, no_float} -> list_to_integer(N);
		{F, _} -> F
	end.

rpn(ListaTokens) ->
	[Res] = lists:foldl(fun rpn/2, [], ListaTokens),
	Res.
	
rpn("+", [N1, N2 | S]) ->
	[N2 + N1 | S];
rpn("-", [N1, N2 | S]) ->
	[N2 - N1 | S];
rpn("*", [N1 , N2 | S]) ->
	[N2 * N1 | S];
rpn("/", [N1 , N2 | S]) ->
	[N2/N1 | S];
rpn("^", [N1 , N2 | S]) ->
	[math:pow(N2, N1) | S];
rpn("ln", [N | S]) ->
	[math:log(N) | S];
rpn("log10", [N | S]) ->
	[math:log10(N) | S];
rpn(X, Stack) ->
	[read(X) | Stack].