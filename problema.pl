orilla([pastor, lobo, oveja, col]).
orilla([lobo, col]).
orilla([pastor, oveja]).
orilla([pastor, lobo, col]).
orilla([pastor, lobo, oveja]).
orilla([pastor, oveja, col]).
orilla([lobo]).
orilla([oveja]).
orilla([col]).
% LA LISTA VACÍA??

% Extrae un elmento de la cabeza de la lista.
extraer(X,[X|T],T).
extraer(X,[A|T],[A|R]):-extraer(X,T,R).

% Calcula el número de elementos de la lista que le hemos pasado.
acclen([],Acc,Length):-
  Length = Acc.

acclen([_|L], OldAcc, Length):-
  NewAcc is OldAcc + 1 ,
  acclen(L,NewAcc,Length).

% Comprueba si la lista inicial tiene 4 elementos.
comprobarInicio(ListaInicial):-
  acclen(ListaInicial,0,Length), Length is 4.

% Mueve un elemento de una lista a otra.
mover(X,):-
  extraer(X,)


% Genera la solución del problema.
solucion(ListaInicial, X) :-
  comprobarInicio(ListaInicial),  % Si se cumple que la ListaInicial contiene 4 elementos, continuamos.
%  mover(pastor,)
