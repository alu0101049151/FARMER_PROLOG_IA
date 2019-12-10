%============ HECHOS POSIBLES===========
/*orilla([pastor,oveja]).
orilla([oveja,pastor]).
orilla([lobo,col]).
orilla([col,lobo]).
orilla([pastor,lobo,col]).
orilla([pastor,col,lobo]).
orilla([lobo,pastor,col]).
orilla([lobo,col,pastor]).
orilla([col,pastor,lobo]).
orilla([col,lobo,pastor]).
orilla([pastor,lobo,oveja]).
orilla([pastor,oveja,lobo]).
orilla([oveja,lobo,pastor]).
orilla([oveja,pastor,lobo]).
orilla([lobo,pastor,oveja]).
orilla([lobo,oveja,pastor]).
orilla([pastor,oveja,col]).
orilla([pastor,col,oveja]).
orilla([oveja,pastor,col]).
orilla([oveja,col,pastor]).
orilla([col,oveja,pastor]).*/
orilla(L,[]):- permutacion(L,[]).
orilla(L,[pastor,oveja]):- permutacion(L,[pastor,oveja]).
orilla(L,[lobo,col]):- permutacion(L,[lobo,col]).
orilla(L,[pastor,lobo,col]):- permutacion(L,[pastor,lobo,col]).
orilla(L,[pastor,lobo,oveja]):- permutacion(L,[pastor,lobo,oveja]).
orilla(L,[pastor,oveja,col]):- permutacion(L,[pastor,oveja,col]).
orilla(L,[oveja]):- permutacion(L,[oveja]).
orilla(L,[lobo]):- permutacion(L,[lobo]).
orilla(L,[col]):- permutacion(L,[col]).
orilla(L,[pastor,oveja,lobo,col]):- permutacion(L,[pastor,oveja,lobo,col]).
% Se entiende que si solo hay un elemento, no hay ninguno o hay 4, la orilla
% también es válida.
%=======================================

%% extraer(X,L,R) - Unifica si la lista R equivale
% a la lista L, extrayendo de ella el elemento X.
% Ej: extraer(c,[a,b,c,d,e],[a,b,d,e]).
extraer(X,[X|T],T).
extraer(X,[A|T],[A|R]):-extraer(X,T,R).


pastorL1(L1):-
    esValida(L1) ,
    member(pastor,L1) , extraer(pastor,L1,Y1).

pastorL2(L2):-
    esValida(L2) ,
    member(pastor,L2) , extraer(pastor,L2,Y2).

pastorIzda(L1):-
    member(pastor, L1), extraer(pastor,L1,Y1),
    esValida(Y1).

paso(L1,L2,X,Result):-
    member(pastor, L1),
      ((extraer(pastor,L1,Y1) , orilla(Y1,Z1) , R2 = [pastor|L2],
      	orilla(R2,Z2), Z = [Z1,Z2] , not(member(Z,X)) , append(X,[Z],Acc),
        paso(Z1,Z2,Acc,Resultado);
      (extraer(pastor,L2,Y2), esValida(Y2) , append(pastor,[pastor|L1],R1),
        esValida(R1), append(Y2,Y))


        member(pastor, L2), extraer(pastor,L2,Y2),
        esValida(Y2) , append(pastor, L1,L1) ;
