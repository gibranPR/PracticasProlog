%1. Leer un archivo de datos que contenga una
%   lista de palabras (una palabra por renglon), las
%   ordene alfabeticamente (no usar predicados predefinidos
%   para el ordenamiento) y que genere otro archivo con las
%   palabras ordenadas. Deberá usar un nombre de archivo
%   como parametro de entrada y otro nombre de archivo
%   como parametro de salida.
%%      ojo. verificar argumentos. Var nonvar, integer noninteger, etc...
%	openread, openwrite

ordena(X,_) :- var(X), write('\nError, debes colocar el nombre del archivo sin ordenar\nEjemplo: ''sinOrdenar.txt'''), !.
ordena(_,Y) :- var(Y), write('\nError, debes teclear el nombre del archivo destino\nEjemplo: ''ordenado.txt'''), !.
ordena(X,Y) :- muestra(X,L), quicksrt(L,Lo), crearArchivin(Y,Lo), writeln('\nTodo salió bien.').
%Cosas del manejo de archivos.
%
%convertir el archivo a lista
muestra(Arch,L) :- leer(Arch,T),
		       string_codes(S,T),
		       split_string(S, '\n', '',L).

leer(Arch,Texto) :- open(Arch,read,F),
		       leeChar(F,Texto),
		       close(F),
		       !.

leeChar(F,[]) :- at_end_of_stream(F). % condicion de salida

leeChar(F,[Ch|Chs]):- get0(F,Ch),
	                  leeChar(F,Chs).


%crea el archivo ya ordenado
crearArchivin(X,L) :- tell(X),
	           imprimir(L),
	           told.

%Separar lista para quicksort
partirListaEnDos([],_,[],[]).
partirListaEnDos([X|ListaResto],Pivote,[X|ListaMenor],ListaMayor) :- X @< Pivote,
								     partirListaEnDos(ListaResto,Pivote,ListaMenor,ListaMayor).
partirListaEnDos([X|ListaResto],Pivote,ListaMenor,[X|ListaMayor]) :- Pivote @=< X,
								     partirListaEnDos(ListaResto,Pivote,ListaMenor,ListaMayor).

%concatenar listas para quicksort
concatena([], ListaResultante,ListaResultante).
concatena([_|Lista1Resto],Lista2, [_|ListaResultanteResto]) :- concatena(Lista1Resto,Lista2,ListaResultanteResto).

%Ordenamiento quicksort
quicksrt([],[]).
quicksrt([Primero|Resto],Ordenado) :- partirListaEnDos(Resto,Primero,Izquierdo,Derecho),
	                            quicksrt(Izquierdo,Izq),
				    quicksrt(Derecho,Der),
				    append(Izq,[Primero|Der],Ordenado).

%recorrer la lista ordenada.
imprimir([]).
imprimir([H|T]):- write(H),write('\n'), imprimir(T).
