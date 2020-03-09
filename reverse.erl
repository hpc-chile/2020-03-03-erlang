-module(reverse).
-export([example/0]).

% Esto es tail-recursivo 
reverse_bits(Bits) ->
	reverse_bits(Bits,<<>>).
reverse_bits(<<X:1,Rest/bits>>,Acc) ->
	reverse_bits(Rest,<<X:1, Acc/bits>>);
reverse_bits(<<>>,Acc) ->
	Acc.

example() ->
	% Reversar 01011011 (91) => 11011010 (218)
	B0 = <<91:8>>,
	B1 = reverse_bits(B0),
	{B0, B1}.