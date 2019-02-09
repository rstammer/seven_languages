-module(tictactoe).
-export([result/1]).

%%% TODO: Recognize the "cat" case 🐱

result([
        P, P, P,
        _, _, _,
        _, _, _
       ]) -> {winner, P};

result([
        _, _, _,
        P, P, P,
        _, _, _
       ]) -> {winner, P};

result([
        _, _, _,
        _, _, _,
        P, P, P
       ]) -> {winner, P};

result([
        P, _, _,
        _, P, _,
        _, _, P
       ]) -> {winner, P};

result([
        _, _, P,
        _, P, _,
        P, _, _
       ]) -> {winner, P};

result([
        _, _, _,
        _, _, _,
        _, _, _
       ]) -> no_winner.
