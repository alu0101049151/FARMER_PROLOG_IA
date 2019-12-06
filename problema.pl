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

% Extrae 2 elementos de la cabeza de la lista
extraer(X1,X2,[X1,X2|T],T).
extraer(X1, X2, [A|T],[A|R]):-extraer(X1,X2,T,R).

% Insertar un elemento en la cabeza de una LISTA
insertar(X,L1,[X|L1]).

% Insertar varios elementos en la cabeza de una LISTA
insertar(X1,X2,L1,[X1,X2|L1]).

% Calcula el número de elementos de la lista que le hemos pasado.
acclen([],Acc,Length):-
  Length = Acc.

acclen([_|L], OldAcc, Length):-
  NewAcc is OldAcc + 1 ,
  acclen(L,NewAcc,Length).

% Comprueba si la lista inicial tiene 4 elementos.
comprobarInicio(ListaInicial):-
  acclen(ListaInicial,0,Length), Length is 4.

% Etapa inicial
configInicial(ListaInicial,ListaVacia):-
  write('Etapa inicial --'), write(' [ '),print(ListaInicial), write(','),print(ListaVacia), write(' ] '),
  mover(ListaInicial,ListaVacia).

% 1º Movimiento: Mueve un elemento de una lista a otra. Extrae pastor y oveja
mover([X1,X2,lobo,col], []):-
  extraer(X1,X2,[X1,X2,lobo,col],T),  % [lobo,col]
  insertar(X1,X2,[],R),   % [pastor,oveja]
  nl,write('El pastor transporta a la oveja >> '), write('[ '), print(T), write(','), print(R), write(' ] '),mover(T,R).

% 2º Movimiento: Mueve el pastor que regresa solo
mover([lobo,col], [X,oveja]):-
  extraer(X,[X,oveja],R),        % [oveja]
  insertar(X,[lobo,col],T),     % [pastor,lobo,col]
  nl,write('El pastor regresa solo << '), write('[ '), print(T), write(','), print(R), write(' ] '),mover(T,R).


% 3º Movimiento: El pastor transporta al Lobo
mover([X1,X2,col], [oveja]):-
  extraer(X1,X2,[X1,X2,col],T),  % [col]
  insertar(X1,X2,[oveja],R),   % [pastor,lobo,oveja]
  nl,write('El pastor transporta el lobo >>'), write('[ '), print(T), write(','), print(R), write(' ] '),mover(T,R).


% 4º Movimiento: El pastor regresa con la Oveja
mover([col], [X1,lobo,X2]):-
  extraer(X1,X2,[X1,X2,lobo],R), % [lobo]
  insertar(X1,X2,[col],T), % [pastor,oveja,col]
  nl,write('El pastor regresa con la oveja << '), write('[ '), print(T), write(','), print(R), write(' ] '),mover(T,R).

% 5º Movimiento: El pastor transporta la col
mover([X1,oveja,X2],[lobo]):-
  extraer(X1,X2,[X1,X2,oveja],T),  % [oveja]
  insertar(X1,X2,[lobo],R),   % [pastor,col,lobo]
  nl,write('El pastor transporta la col >> '), write('[ '), print(T), write(','), print(R), write(' ] '),mover(T,R).

% 6º Movimiento: El pastor regresa solo
mover([oveja], [X,col,lobo]):-
  extraer(X,[X,col,lobo],R),        % [col,lobo]
  insertar(X,[oveja],T),     % [pastor,oveja]
  nl,write('El pastor regresa solo << '), write('[ '), print(T), write(','), print(R), write(' ] '),mover(T,R).

% El pastor transporta a la oveja (FIN)
mover([X1,X2], [col,lobo]):-
  extraer(X1,X2,[X1,X2], T), % []
  insertar(X1,X2,[col,lobo],R),   % [pastor,oveja,col,lobo]
  nl,write('El pastor transporta a la oveja (FIN) >>'), write('[ '), print(T), write(','), print(R), write(' ] '),mover(T,R).

mover([], [pastor,oveja,col,lobo]):-
  true,!.

% Genera la solución del problema.
solucion(ListaInicial, X) :-
  comprobarInicio(ListaInicial),
  configInicial(ListaInicial,[]).
