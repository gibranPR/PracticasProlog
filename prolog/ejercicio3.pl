%3. tenemos el siguiente conocimiento directo;
%Pedro padece gripe
%Pedro padece hepatitis
%Juan padece hepatitis
%Maria padece gripe
%Carlos padece intoxicacion
%Fiebre es sintoma de gripe	sintomade(fiebre,gripe)
%Cansancio es sintoma de hepatitis
%Diarrea es sintoma de intoxicacion
%Cansancio es sintoma de gripe
%Aspirina suprime la fiebre
%Lomotil suprime la diarrea
padece(pedro, gripe).
padece(pedro, hepatitis).
padece(juan, hepatitis).
padece(maria, gripe).
padece(carlos, intoxicacion).
sintoma(fiebre, gripe).
sintoma(cansancio, hepatitis).
sintoma(diarrea, intoxicacion).
sintoma(cansancio, gripe).
suprime(aspirina, fiebre).
suprime(lomotil, diarrea).

%Adem�s podemos aportar el siguiente conocimiento inferido:

% Un farmaco alivia una enfermedad si la enfermedad tiene un sintoma que
% sea suprimido por el farmaco
alivia(X,Y) :- suprime(X,Z), sintoma(Z,Y).

% Una persona deber�a tomar un farmaco si padece una enfermedad que sea
% aliviada por el farmaco
queToma(X,Y) :- alivia(Y,X).
quienToma(X,Y) :- padece(X,Z), alivia(Y,Z).

%1: podemos conocer que dolencia tiene Pedro? y maria?
%pa todos
queTiene(X,Y) :- padece(X,Z), sintoma(Y,Z).
%pa pedro
queTienePedro(X) :- queTiene(pedro,X).
%pa maria
queTieneMaria(X) :- queTiene(maria,X).

%2: quien padece gripe?
quienConGripe(X) :- padece(X,gripe).

%3: que sintomas tiene Pedro?
sintomasPedro(X) :- padece(pedro,X).

%4: quien padece diarrea?
quienDiarrea(X) :- sintoma(diarrea,Y), padece(X,Y).

%5: quien esta cansado?
quienCansado(X) :- sintoma(cansancio,Y), padece(X,Y).

%6: hay algun farmaco que alivie a Pedro?

pedroRecetamos(X) :- quienToma(pedro,X).

%7: Hay algun sintoma que comparta Juan y Maria?
%pa todos
comparten(A,B,X) :- padece(A,X), padece(B,X).

compartenJuanMaria(X) :- comparten(juan,maria,X).








