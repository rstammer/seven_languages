% Extracted from an university excercise:
% http://courses.cs.vt.edu/~cs3304/Spring02/projects/dtree.pdf
%
% Define all possible dimensions
attribute(size,  [ small, medium, big]).
attribute(color, [ while, yellow, brown, black]). 
attribute(spots, [ black, brown, white, none]). 
attribute(sex,   [ male, female ]).
attribute(eye,   [ brown, blue, grey ]).

% Given training samples
example(bichon, [ size = small, color = white, spots = none, sex = male]). 
example(germanshep, [ size = big, color = black, spots = none, sex = female]). 
example(chihuahua, [ size = small, color = white, spots = none, sex = female]). 
example(greatdane, [ size = big, color = black, spots = white, sex = female]). 
example(dalmation, [ size = medium, color = white, spots = black, sex = male]).

% Useful examples
% find all small dogs
example(Dog, [ size = small, color = X, spots = Y, sex = Z]).
