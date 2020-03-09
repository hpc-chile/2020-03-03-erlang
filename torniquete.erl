-module(torniquete).
-behaviour(gen_fsm).
-export([start_link/0]).
%% gen_fsm callbacks
-export([init/1]).
-export([coin/0,push/0,locked/2,unlocked/2]).
-define(SERVER, ?MODULE).
%%--------------------------------------------------------------------

start_link() ->
	gen_fsm:start_link({local, ?SERVER}, ?MODULE, [], []).

init([]) ->
	{ok, locked, []}.

coin() ->
	gen_fsm:send_event(?MODULE, coin).

push() ->
	gen_fsm:send_event(?MODULE, push).

locked(Input, State)->
	case Input of
		coin->
			io:fwrite("Unlocked ~n"),
			{next_state, unlocked, State};
		push->
			io:fwrite("Already locked ~n"),
			{next_state, locked, State}
	end.

unlocked(Input, State) ->
	case Input of
		push ->
			io:fwrite("Locked ~n"),
			{next_state, locked, State};
		coin ->
			io:fwrite("Already unlocked ~n"),
			{next_state, unlocked, State}
	end.