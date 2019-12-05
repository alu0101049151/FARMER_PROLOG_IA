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
  mover(ListaInicial,ListaVacia).

% 1º Movimiento: Mueve un elemento de una lista a otra. Extrae pastor y oveja
mover([X1,X2,lobo,col], []):-
  extraer(X1,X2,ListaInicial,T),  % [lobo,col]
  insertar(X1,X2,ListaVacia,R),   % [pastor,oveja]
  mover(ListaInicial,ListaVacia).

% 2º Movimiento: Mueve el pastor que regresa solo
mover([lobo,col], [X,oveja]):-
  extraer(X,ListaVacia,R),        % [oveja]
  insertar(X,ListaInicial,T),     % [pastor,lobo,col]
  mover(ListaInicial,ListaVacia).

% 3º Movimiento: El pastor transporta al Lobo
mover([X1,X2|col], [oveja]):-
  extraer(X1,X2,ListaInicial,T),  % [col]
  insertar(X1,X2,ListaVacia,R).   % [pastor,lobo,oveja]

% 4º Movimiento: El pastor regresa con la Oveja
mover([col], [X1,lobo,X2]):-
  extraer(X1,ListaVacia,R),       % [lobo,oveja]
  extraer(X2,ListaVacia,R),       % [lobo]
  insertar(X1,X2,ListaInicial,T). % [pastor,oveja,col]

% 5º Movimiento: El pastor transporta la col
mover([X1,oveja,X2],[lobo]):-
  extraer(X1,ListaInicial,T),     % [oveja,col]
  extraer(X2,ListaInicial,T),     % [oveja]
  insertar(X1,X2,ListaVacia,R).   % [pastor,col,lobo]

% 6º Movimiento: El pastor regresa solo
mover([oveja], [X,col,lobo]):-
  extraer(X,ListaVacia,R),        % [col,lobo]
  insertar(X,ListaInicial,T).     % [pastor,oveja]

% El pastor transporta a la oveja (FIN)
mover([X1,X2], [col,lobo]):-
  extraer(X1,X2,ListaInicial, T), % []
  insertar(X1,X2,ListaVacia,R).   % [pastor,oveja,col,lobo]

% Genera la solución del problema.
solucion(ListaInicial, X) :-
  comprobarInicio(ListaInicial),
  configInicial(ListaInicial,ListaVacia).
%  mover([pastor,oveja,lobo,col],[]).  % Si se cumple que la ListaInicial contiene 4 elementos, continuamos.
%  mover(pastor,)
