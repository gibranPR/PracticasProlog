padre(juan, maria).
padre(juan, pedro).
padre(juan, susana).
padre(juan, enrique).
madre(cecilia, maria).
madre(cecilia, pedro).
madre(laura, susana).
madre(laura, enrique).
madre(laura, carlos).
madre(laura, eva).
padre(tomas, carlos).
padre(tomas, eva).

diferente(X,Y):- not(X=Y).

mismo_padre(X,Y) :- padre(Z,X), padre(Z,Y), diferente(X,Y).
misma_madre(X,Y) :- madre(Z,X), madre(Z,Y), diferente(X,Y).

hermanos(X,Y) :- padre(Z,X), padre(Z,Y),
	         madre(W,X), madre(W,Y),
		 diferente(X,Y).
hermanos2(X,Y) :- mismo_padre(X,Y), misma_madre(X,Y).

medios_hermanos(X,Y) :- mismo_padre(X,Y), not(misma_madre(X,Y)).
medios_hermanos(X,Y) :- misma_madre(X,Y), not(mismo_padre(X,Y)).

medios_hermanos2(X,Y) :- mismo_padre(X,Y), not(misma_madre(X,Y));
                         misma_madre(X,Y), not(mismo_padre(X,Y)).

no_hermanos(X,Y) :- not(mismo_padre(X,Y)), not(misma_madre(X,Y)).

factorial(0,1).
factorial(F,N) :- F1 is F-1, factorial(F1,N1), N is N1*F.

invFact(F,N):- F>=1, finv(F,1,N),
	       write(F), write(' es el factorial de '), write(N).

finv(N,N,N) :- !.
finv(F,X,N) :- C is F // X,
	       R is F mod X,
	       R =:= 0,
	       X1 is X+1,
	       finv(C,X1,N), !.

suma([],0).
suma([H|T],S) :- suma(T,S1), S is S1+H.


