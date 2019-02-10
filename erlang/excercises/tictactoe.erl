-module(tictactoe).
-export([winner/1]).

transpose([
           [A, B, C],
           [D, E, F],
           [G, H, I]
          ]) -> [
                 [A, D, G],
                 [B, E, H],
                 [C, F, I]
                ].


diagonal_winner_row([
                     [P, _, _],
                     [_, P, _],
                     [_, _, P]
                    ]) -> P;

diagonal_winner_row(_) -> no_winner.


horizontal_winner([]) -> no_winner;
horizontal_winner([ [X, X, X] | _]) -> X;
horizontal_winner([ [_, _, _] | Tail]) -> horizontal_winner(Tail).

%%% Accepts a list of 3 3-element-sized lists that
%%% represent a classical tic-tac-toe board:
%%%
%%% X | X | O   is represented by [[x, x, o], [o, x, o], [o, o, x]]
%%% O | X | O
%%% O | O | X
%%%
%%% Returns winner player atom if game has a winner, no_winner if game has no winner
%%% yet and returns cat in case of a remis.
%%%
%%%
%%% TODO: Implement the cat case 🐱.
winner(Board) ->
  HorizontalWinner    = horizontal_winner(Board),
  VerticalWinner      = horizontal_winner(transpose(Board)),
  LeftDiagonalWinner  = diagonal_winner_row(Board),
  RightDiagonalWinner = diagonal_winner_row(transpose(Board)),
  hd([HorizontalWinner, VerticalWinner, LeftDiagonalWinner, RightDiagonalWinner]).
