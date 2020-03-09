-module(funexample).
-export([start/0]).

% add/2
add(X, Y) -> 
   Z = X + Y, 
   io:fwrite("add(X,Y): ~w~n",[Z]). 
   
% add/3
add(0, Y, Z) -> 
   A = Y + Z, 
   io:fwrite("add(0, Y, Z): ~w~n",[A]);
add(X, Y, Z) when X < 0 -> 
   A = X + Y + Z, 
   io:fwrite("add(X, Y, Z) when X < 0: ~w~n",[A]);
add(X, Y, Z) -> 
   A = X + Y + Z, 
   io:fwrite("add(X, Y, Z): ~w~n",[A]). 

% start/0
start() ->
   add(5,6),
   add(0, 1, 2),
   add(-5, 4, 3),
   add(5, 6, 6).