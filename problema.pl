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


acclen([],Acc,Length):-
  Lenght = Acc.

acclen([_|L], OldAcc, Length):
  NewAcc is OldAcc + 1 ,
  acclen(L, NewAcc, Lenght).



comprobarInicio(ListaInicial):-
  acclen(ListaInicial,0,Lenght), Lenght is 4.

/*solucion(ListaInicial, X) :-
  comprobarInicio(ListaInicial),  % Si se cumple que la ListaInicial contiene 4 elementos, continuamos.
  mover(pastor,)*/
