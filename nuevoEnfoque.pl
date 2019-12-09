%============ HECHOS POSIBLES===========
orilla(L,[]):- permutacion(L,[]).
orilla(L,[pastor,oveja]):- permutacion(L,[pastor,oveja]).
orilla(L,[lobo,col]):- permutacion(L,[lobo,col]).
orilla(L,[pastor,lobo,col]):- permutacion(L,[pastor,lobo,col]).
orilla(L,[pastor,lobo,oveja]):- permutacion(L,[pastor,lobo,oveja]).
orilla(L,[pastor,oveja,col]):- permutacion(L,[pastor,oveja,col]).
orilla(L,[oveja]):- permutacion(L,[oveja]).
orilla(L,[lobo]):- permutacion(L,[lobo]).
orilla(L,[col]):- permutacion(L,[col]).
%[pastor,oveja,lobo,col]?????
%=======================================
%orilla([pastor,oveja]).  % Si no unifica con ninguno de los otros hechos.

% extraer(X,L,R) - Unifica si la lista R equivale
% a la lista L, extrayendo de ella el elemento X.
% Ej: extraer(c,[a,b,c,d,e],[a,b,d,e]).
extraer(X,[X|T],T).
extraer(X,[A|T],[A|R]):-extraer(X,T,R).

% permutacion(X,Y) - Unifica si la lista X es una
% permutacion de la lista Y. El segundo argumento
% siempre debe estar completamente definido.
% Ej: permutacion([a,b,c],[b,a,c]).
permutacion([],[]).
permutacion([X|T],Y):-extraer(X,Y,Z),permutacion(T,Z).

% Insertar un elemento en la cabeza de una LISTA
insertar(X,L1,[X|L1]).
% Insertar varios elementos en la cabeza de una LISTA
insertar(X1,X2,L1,[X1,X2|L1]).

% Para insertar: append.
% Para ver si es miembro: memeber.
% Para revertir: reverse.
% NO OLVIDAR OR (;)
% NO OLVIDAR \= (NOT EQUAL)

solucion(L1,L2,X):-
    orilla(L1,Y1), orilla(L2,Y2),
    insertar(L1,L2,[],Z),
    write(Z),
    not(member(Z,X)), append([[ Z,[] ]],X,Y),
    write(Y).

juntar(Y,X):-
    append(Y,X).


/*solucion(L1,L2,X):-
    % Ver si L1 es valido y L2 es valido
    %
    % Para comprobar si es valido:
    % 	Miramos si es permutacion de alguno de los hechos
    % 		en tal caso, miramos de cual y trabajamos con ese hecho
    % 	Una vez hecho eso, extraemos e insertamos segun el estado
    % 	en el que estamos.
    %
    .*/
