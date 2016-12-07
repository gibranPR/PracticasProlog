%2. Generar un n�mero aleatorio entero de 1 a 1000 (random)
%   y deber� interactuar con el usuario para que �ste lo
%   adivine, deber� indicar al usuario si ya lo encontr�
%   o si el numero es mayor o menor al numero aleatorio.
juego :- random(1,1000,X), demas(X,0).
demas(X,I) :- writeln('Adivina el n�mero que pens�: '), read(Y),
	      generaRandom(Y,X,I).
generaRandom(Y,X,I) :- I1 is I+1,
		      (X == Y -> write('\n\n�Le atinaste!\tIntentos: '), write(I1);
		      X<Y -> writeln('Mas abajo.\n\n'), demas(X,I1);
		      writeln('M�s arriba.\n\n'),demas(X,I1)).
