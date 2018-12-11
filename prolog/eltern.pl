elternteil( heike, robert ).
elternteil( robert, petra ).
elternteil( thomas, robert ).
elternteil( petra, jakob ).
elternteil( thomas, lisa ).
elternteil( heike, lisa ).
elternteil( robert, maria ).
elternteil( thomas, martin ).
elternteil( martin, paula ).

maennlich( jakob ).
maennlich( martin ).
maennlich( robert ).
maennlich( thomas ).

weiblich( maria ).
weiblich( heike ).
weiblich( lisa ).
weiblich( petra ).
weiblich( paula ).

verschieden(X, Y) :- X \= Y.

ist_cousine_von(X, Y) :-
	elternteil(Z, Y),
	elternteil(V, Z),
	elternteil(V, U),
	elternteil(U, X),
	verschieden(Z, U),
	weiblich(X).

ist_tante_von(X, Y) :-
	elternteil(Z, Y),
	elternteil(V, Z),
	elternteil(V, X),
	verschieden(Z, X),
	weiblich(X).
