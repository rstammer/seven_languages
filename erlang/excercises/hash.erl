-module(hash).
-export([fetch/2]).

%%% Consider a list of keyword-value tuples, such as
%%% [{erlang, "a functional language"}, {ruby, "an OO language with a lot of functional flavour"}]
%%%
%%% Excercise: Write a function that accepts the list and a keyword
%%% and returns the associated value for the keyword.

fetch([], _) -> [];
fetch([{Key, Value} | _], Key) -> Value;
fetch([{_, _}, Tail], Key) -> fetch(Tail, Key).
