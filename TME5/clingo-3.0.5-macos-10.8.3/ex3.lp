nombres(1..9).
ligne(0..8).
colonne(0..8).
1{coordonnees(X,Y,Z):nombres(Z)}1 :- ligne(X),colonne(Y).


:- coordonnees(X,Y,Z), coordonnees(X,YY,ZZ), Y!=YY, Z == ZZ, ligne(X), colonne(Y), nombres(Z), colonne(YY), nombres(ZZ).

:- coordonnees(X,Y,Z), coordonnees(XX,Y,ZZ), X!=XX, Z == ZZ, ligne(X), colonne(Y), nombres(Z), ligne(XX), nombres(ZZ).

:-coordonnees(X,Y,Z), coordonnees(X,Y+1,ZZ), Z == ZZ, ligne(X), colonne(Y), colonne(YY), nombres(Z), nombres(ZZ). 
:-coordonnees(X,Y,Z), coordonnees(X,Y-1,ZZ), Z == ZZ, ligne(X), colonne(Y), colonne(YY), nombres(Z), nombres(ZZ). 
:-coordonnees(X,Y,Z), coordonnees(X+1,Y,ZZ), Z == ZZ, ligne(X), colonne(Y), ligne(XX), nombres(Z), nombres(ZZ). 
:-coordonnees(X,Y,Z), coordonnees(X-1,Y,ZZ), Z == ZZ, ligne(X), colonne(Y), ligne(XX), nombres(Z), nombres(ZZ). 
 
:-coordonnees(R,C,D),coordonnees(RR,CC,D),R/3==RR/3,C/3==CC/3,R!=RR,C!=CC.

%Ligne 0
coordonnees(0,1,8).
coordonnees(0,4,6).
coordonnees(0,5,9).
coordonnees(0,7,4).
coordonnees(0,8,3).

%Ligne 1
coordonnees(1,0,7).
coordonnees(1,2,6).
coordonnees(1,5,2).
coordonnees(1,6,5).

%Ligne 2
coordonnees(2,2,3).
coordonnees(2,7,1).
coordonnees(2,8,6).

%Ligne 3
coordonnees(3,0,6).
coordonnees(3,2,2).
coordonnees(3,4,9).
coordonnees(3,5,4).
coordonnees(3,6,8).
coordonnees(3,7,3).
coordonnees(3,8,1).

%Ligne 4
coordonnees(4,1,9).
coordonnees(4,2,1).
coordonnees(4,3,3).
coordonnees(4,7,6).

%Ligne 5
coordonnees(5,0,3).
coordonnees(5,5,1).
coordonnees(5,7,2).

%Ligne 6
coordonnees(6,2,8).
coordonnees(6,4,4).
coordonnees(6,7,7).
coordonnees(6,8,9).

%Ligne 7
coordonnees(7,0,1).
coordonnees(7,3,5).
coordonnees(7,7,8).

%Ligne 8
coordonnees(8,0,4).
coordonnees(8,3,9).
coordonnees(8,4,1).
coordonnees(8,5,8).
coordonnees(8,6,3).
coordonnees(8,8,2).

%La réponse à la grille données est la suivante :
%Answer: 1
%coordonnees(0,1,8) coordonnees(0,4,6) coordonnees(0,5,9) coordonnees(0,7,4) coordonnees(0,8,3) coordonnees(1,0,7) coordonnees(1,2,6) coordonnees(1,5,2) coordonnees(1,6,5) coordonnees(2,2,3) coordonnees(2,7,1) coordonnees(2,8,6) coordonnees(3,0,6) coordonnees(3,2,2) coordonnees(3,4,9) coordonnees(3,5,4) coordonnees(3,6,8) coordonnees(3,7,3) coordonnees(3,8,1) coordonnees(4,1,9) coordonnees(4,2,1) coordonnees(4,3,3) coordonnees(4,7,6) coordonnees(5,0,3) coordonnees(5,5,1) coordonnees(5,7,2) coordonnees(6,2,8) coordonnees(6,4,4) coordonnees(6,7,7) coordonnees(6,8,9) coordonnees(7,0,1) coordonnees(7,3,5) coordonnees(7,7,8) coordonnees(8,0,4) coordonnees(8,3,9) coordonnees(8,4,1) coordonnees(8,5,8) coordonnees(8,6,3) coordonnees(8,8,2) coordonnees(8,7,5) coordonnees(8,2,7) coordonnees(8,1,6) coordonnees(7,8,4) coordonnees(7,6,6) coordonnees(7,5,3) coordonnees(7,4,7) coordonnees(7,2,9) coordonnees(7,1,2) coordonnees(6,6,1) coordonnees(6,5,6) coordonnees(6,3,2) coordonnees(6,1,3) coordonnees(6,0,5) coordonnees(5,8,5) coordonnees(5,6,9) coordonnees(5,4,8) coordonnees(5,3,6) coordonnees(5,2,4) coordonnees(5,1,7) coordonnees(4,8,7) coordonnees(4,6,4) coordonnees(4,5,5) coordonnees(4,4,2) coordonnees(4,0,8) coordonnees(3,3,7) coordonnees(3,1,5) coordonnees(2,6,2) coordonnees(2,5,7) coordonnees(2,4,5) coordonnees(2,3,8) coordonnees(2,1,4) coordonnees(2,0,9) coordonnees(1,8,8) coordonnees(1,7,9) coordonnees(1,4,3) coordonnees(1,3,4) coordonnees(1,1,1) coordonnees(0,6,7) coordonnees(0,3,1) coordonnees(0,2,5) coordonnees(0,0,2)  


%Une manière d'évaluer la difficulté de résolution d'une grille de sudoku est liée au nombres de modèles possibles. En effet, plus il y a de modèles plus il y a de possibilités de remplir la grille de manière différente donc la grille est peu remplie et inversement moins il y a moins de modèles moins la grille est remplie et plus c'est facile de la résoudre.

#hide.
#show coordonnees/3.