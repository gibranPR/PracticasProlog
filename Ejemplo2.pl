asciende(Num) :- write('----------'), nl, num1(1,Num);
	         write('--- Ok ---').
num1(Ini,Fin) :- Ini=<Fin,
		 Cuadrado is Ini * Ini,
		 write(Ini), write(' '),
		 write(Cuadrado), write(' '),nl,
		 I is Ini+1,
		 num1(I,Fin).


decimalABinario :- for(1,Num);
write(--- OK ---).
for(Ini,Fin) :-

dec_bin(0,'0').
dec_bin(1,'1').
dec_bin(N,B):-N>1,X is N mod 2,Y is N//2,dec_bin(Y,B1),atom_concat(B1, X, B).

concatena([],L2,L2).
concatena([H|L1],L2,[H|L3]) :- concatena(L1,L2,L3).

reversa(L,R) :- reversa2(L,[],R).
reversa2([],A,A) :- !.
reversa2([H|T],A,R) :- reversa2(T,[H|A],R).
