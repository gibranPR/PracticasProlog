% Contar elementos
%
cuantos([],0).
cuantos([_|T], C) :- cuantos(T,R), C is R + 1.

% Promedio
%
% promedio(L,P) :- suma(L,S),
%	         long(L,N),
%		 P is S/N,
%		 write('Promedio = '),
%		 write(P), nl.
%Calcular el mayor de una lista
el_Mayor([X],X) :- !.
el_Mayor([H|T],X) :- el_Mayor(T,Y), (H>Y -> X is H;X is Y).

%Calcular el menor de una lista
el_Menor([X],X) :- !.
el_Menor([H|T],X) :- el_Menor(T,Y), (H<Y -> X is H;X is Y).
existe([X|_],X) :-!.
existe([_|T],X) :- existe(T,X).

pegarListas([],L2,L2).
pegarListas([H|T1],L2,L3) :- pegarListas(T1,L2,[H|L3]).
