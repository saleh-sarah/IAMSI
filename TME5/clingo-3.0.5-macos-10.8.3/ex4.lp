nombres(1..4).
noeud(1..7).

%On définit les noeuds qui sont adjacents
adjacent(1,2).
adjacent(1,3).
adjacent(1,5).

adjacent(2,3).
adjacent(2,4).
adjacent(2,6).

adjacent(3,4).
adjacent(3,5).
adjacent(3,6).

adjacent(4,5).
adjacent(4,6).

adjacent(5,6).
adjacent(5,7).

adjacent(6,7).

1{f(X,Z):nombres(Z)}1 :- noeud(X).
:- adjacent(X,XX), f(X,Y), f(XX,YY), noeud(X), noeud(XX), nombres(Y), nombres(YY), Y==YY.



