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
configInicial(ListaInicial,ListaVacia,X):-
  insertar(ListaInicial,ListaVacia,[],X),
  mover(ListaInicial,ListaVacia,X).

% 1º Movimiento: Mueve un elemento de una lista a otra. Extrae pastor y oveja
mover([X1,X2,lobo,col], [], X):-
  extraer(X1,X2,[X1,X2,lobo,col],T),  % [lobo,col]
  insertar(X1,X2,[],R),   % [pastor,oveja]
  insertar(T,R,[],Z),
  insertar(X,Z,[],Y),
  mover(T,R,Y).

% 2º Movimiento: Mueve el pastor que regresa solo
mover([lobo,col], [X1,oveja], X):-
  extraer(X1,[X1,oveja],R),        % [oveja]
  insertar(X1,[lobo,col],T),     % [pastor,lobo,col]
  insertar(T,R,[],Z),
  insertar(X,Z,[],Y),
  %nl,write('Y2 = '), write(Y),
  mover(T,R,Y).


% 3º Movimiento: El pastor transporta al Lobo
mover([X1,X2,col], [oveja], X):-
  extraer(X1,X2,[X1,X2,col],T),  % [col]
  insertar(X1,X2,[oveja],R),   % [pastor,lobo,oveja]
  insertar(T,R,[],Z),
  insertar(X,Z,[],Y),
  %nl,write('Y3 = '), write(Y),
  mover(T,R,Y).

% 4º Movimiento: El pastor regresa con la Oveja
mover([col], [X1,lobo,X2], X):-
  extraer(X1,X2,[X1,X2,lobo],R), % [lobo]
  insertar(X1,X2,[col],T), % [pastor,oveja,col]
  insertar(T,R,[],Z),
  insertar(X,Z,[],Y),
  %nl,write('Y4 = '), write(Y),
  mover(T,R,Y).

% 5º Movimiento: El pastor transporta la col
mover([X1,oveja,X2],[lobo], X):-
  extraer(X1,X2,[X1,X2,oveja],T),  % [oveja]
  insertar(X1,X2,[lobo],R),   % [pastor,col,lobo]
  insertar(T,R,[],Z),
  insertar(X,Z,[],Y),
  %nl,write('Y5 = '), write(Y),
  mover(T,R,Y).

% 6º Movimiento: El pastor regresa solo
mover([oveja], [X1,col,lobo], X):-
  extraer(X1,[X1,col,lobo],R),        % [col,lobo]
  insertar(X1,[oveja],T),     % [pastor,oveja]
  insertar(T,R,[],Z),
  insertar(X,Z,[],Y),
  %nl,write('Y6 = '), write(Y),
  mover(T,R,Y).

% El pastor transporta a la oveja (FIN)
mover([X1,X2], [col,lobo], X):-
  extraer(X1,X2,[X1,X2], T), % []
  insertar(X1,X2,[col,lobo],R),   % [pastor,oveja,col,lobo]
  insertar(T,R,[],Z),
  insertar(X,Z,[],Y),
  nl,write('X = '),write(Y).

% Genera la solución del problema.
solucion(ListaInicial, X) :-
  comprobarInicio(ListaInicial),
  configInicial(ListaInicial,[],X).
