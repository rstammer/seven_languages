-module(tictactoe).
-export([result/1]).

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
                    ]) -> true;

diagonal_winner_row(_) -> false.


horizontal_winner([]) -> false;
horizontal_winner([ [X, X, X] | _]) -> true;
horizontal_winner([ [_, _, _] | Tail]) -> horizontal_winner(Tail).

result(Board) -> 
  HorizontalWinner    = horizontal_winner(Board),
  VerticalWinner      = horizontal_winner(transpose(Board)),
  LeftDiagonalWinner  = diagonal_winner_row(Board),
  RightDiagonalWinner = diagonal_winner_row(transpose(Board)),
  HorizontalWinner or VerticalWinner or LeftDiagonalWinner or RightDiagonalWinner.
