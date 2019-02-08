-module(scratchpad).
-export([hello/0]).

hello() ->
  io:format("Hey 👋"),
  io:format("Let's write some more Erlang!").
