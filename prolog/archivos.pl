arch1 :- open('datos.txt',write,Arch),
	write(Arch, "'Termino1'."), nl(Arch),
	write(Arch, "'Termino1'."), nl(Arch),
	write(Arch, "'Termino1'."), nl(Arch),
	close(Arch).

arch2 :- open('datos.txt', read, Arch),
	 read(Arch,Term1),
	 read(Arch,Term2),
	 read(Arch,Term3),
         close(Arch),
	 write([Term1, Term2, Term3]),nl.

creaArch(X) :- tell(X),
	       put_char('H'),
	       put_char('o'),
	       put_char('l'),
	       put_char('a'),
	       told.

muestraArch(Arch,L) :- leeArch(Arch,T),
		       write(T),
		       string_codes(S,T),
		       write(S),
		       split_string(S, '\n', '',L),
		       write(L).

leeArch(Arch,Texto) :- open(Arch,read,F),
		       leeCaracter(F,Texto),
		       close(F),
		       !.

leeCaracter(F,[]) :- at_end_of_stream(F). % condicion de salida

leeCaracter(F,[Ch|Chs]):- get0(F,Ch),
	                  leeCaracter(F,Chs).



