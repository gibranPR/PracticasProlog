suma(X,Y,Z) :- nonvar(X), nonvar(Y), Z is X+Y,!.
suma(X,Y,Z) :- nonvar(X), nonvar(Z), Y is Z-X,!.
suma(X,Y,Z) :- nonvar(Y), nonvar(Z), X is Z-Y,!.
suma(X,_,_) :- nonvar(X), write('Falta algo we'),!.
suma(_,Y,_) :- nonvar(Y), write('Falta algo we'),!.
suma(_,_,Z) :- nonvar(Z), write('Falta algo we'),!.
suma(_,_,_) :- write('Falta algo we'),!.
