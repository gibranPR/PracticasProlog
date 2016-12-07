muestraMatriz3([]).
muestraMatriz3([E|Es]) :- [_,_,Parcial1,Parcial2,Parcial3]=E,
	                   writef("%5L%40L%5R%5R%5R",E),
			   atom_number(Parcial1,P1),
			   atom_number(Parcial2,P2),
			   atom_number(Parcial3,P3),
			   Prom is (P1+P2+P3)/3,
			   format(string(Txt),"~2F", [Prom]),
			   writef("%8R\n", [Txt]),
			   muestraMatriz3(Es).
promedio([],0,0).
promedio([E|Es], Suma, Nmat) :- promedio(Es, Suma2, Nmat2),
			        [_,_,Parcial1,Parcial2,Parcial3]=3,
				atom_number(Parcial1,P1),
				atom_number(Parcial2,P2),
				atom_number(Parcial3,P3),
				Cal is (P1+P2+P3)/3.

