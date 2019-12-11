% permutacion(X,Y) - Unifica si la lista X es una
% permutacion de la lista Y. El segundo argumento
% siempre debe estar completamente definido.
% Ej: permutacion([a,b,c],[b,a,c]).
permutacion([],[]).
permutacion([X|T],Y):-extraer(X,Y,Z),permutacion(T,Z).

%%============ HECHOS POSIBLES===========
orilla(L,[pastor,oveja]):- permutacion(L,[pastor,oveja]).
orilla(L,[lobo,col]):- permutacion(L,[lobo,col]).
orilla(L,[pastor,lobo,col]):- permutacion(L,[pastor,lobo,col]).
orilla(L,[pastor,lobo,oveja]):- permutacion(L,[pastor,lobo,oveja]).
orilla(L,[pastor,oveja,col]):- permutacion(L,[pastor,oveja,col]).
orilla(L,[oveja]):- permutacion(L,[oveja]).
orilla(L,[lobo]):- permutacion(L,[lobo]).
orilla(L,[col]):- permutacion(L,[col]).
orilla(L,[pastor,oveja,lobo,col]):- permutacion(L,[pastor,oveja,lobo,col]).
orilla(L,[]):- permutacion(L,[]).
%=======================================

%% extraer(X,L,R) - Unifica si la lista R equivale
% a la lista L, extrayendo de ella el elemento X.
% Ej: extraer(c,[a,b,c,d,e],[a,b,d,e]).
extraer(X,[X|T],T).
extraer(X,[A|T],[A|R]):-extraer(X,T,R).

% Extrae 2 elementos de la cabeza de la lista
extraer(X1,X2,[X1,X2|T],T).
extraer(X1, X2, [A|T],[A|R]):-extraer(X1,X2,T,R).

paso(L1,L2,X,Resultado):-
    length(L1,0) , length(L2,4),
    Resultado = X.

paso(L1,L2,X,Resultado):-
    (
      ( % Si se solo se tiene que mover el pastor desde la izquierda.
        member(pastor, L1),
          extraer(pastor,L1,Y1) , orilla(Y1,Z1) , R2 = [pastor|L2],
          orilla(R2,Z2), Z = [Z1,Z2] , not(member(Z,X)) , append(X,[Z],Acc),
          paso(Z1,Z2,Acc,Resultado)
      );
      ( % Si solo se tiene que mover al pastor desde la derecha.
        member(pastor, L2),
          extraer(pastor,L2,Y2), orilla(Y2,Z2) , R1 = [pastor|L1],
          orilla(R1,Z1), Z = [Z1,Z2] , not(member(Z,X)) , append(X,[Z],Acc),
          paso(Z1,Z2,Acc,Resultado)
      );
      ( % Si el pastor se tiene que mover desde la derecha con otro elemento.
      	member(pastor, L1),
          extraer(pastor,L1,Y1), extraer(E1,Y1,Y11), orilla(Y11,Z1), R2 = [pastor,E1|L2],
          orilla(R2,Z2), Z = [Z1,Z2] , not(member(Z,X)) , append(X,[Z],Acc),
          paso(Z1,Z2,Acc,Resultado)
      );
      ( % Si el pastor se tiene que mover desde la izquierda con otro elemento.
        member(pastor, L2),
          extraer(pastor,L2,Y2), extraer(E2,Y2,Y22), orilla(Y22,Z2) , R1 = [pastor,E2|L1],
          orilla(R1,Z1), Z = [Z1,Z2] , not(member(Z,X)) , append(X,[Z],Acc),
          paso(Z1,Z2,Acc,Resultado)
      )
    ).

solucion(L1,L2,Resultado):-
    X = [[L1,L2]],
    paso(L1,L2,X,Resultado).
