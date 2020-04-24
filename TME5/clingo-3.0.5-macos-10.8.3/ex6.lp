%Nombres de jours et nombres d'équipes
#const ne = 4.
#const maxnj = 20.
1{nj(1..maxnj)}1.
%#minimize{nj(N)}.



%Pourcentages pour les contraintes d'équilibre
pext(50).
pdom(40).


%Initialisation des variables
equipes(1..ne).
jours(1..maxnj).  %Le mercredi est un jour impair, et le dimanche un jour pair.

1{match(X,Y,Z):jours(Z)}1 :- equipes(X), equipes(Y), X!=Y.
%On suppose que l'équipe X joue à domicile et donc que Y joue à l'extérieur.


%Contraintes de base
:- match(E1,E2,J), match(E1,E3,J), E2!=E3,equipes(E1), equipes(E2), equipes(E3), jours(J),  nj(NJ), J<=NJ.
:- match(E1,E2,J), match(E2,E3,J), E2!=E3,equipes(E1), equipes(E2), equipes(E3), jours(J), nj(NJ), J<=NJ.
:- match(E2,E1,J), match(E3,E1,J), equipes(E1), equipes(E2), equipes(E3), jours(J), E2!=E3, nj(NJ), J<=NJ.
:- match(E1,E2,J), match(E2,E1,J), equipes(E1), equipes(E2), jours(J), nj(NJ), J<NJ.
:- match(X,Y,J), match(X,Y,JJ), equipes(X), equipes(Y), jours(J), jours(JJ), J!=JJ, nj(NJ), J<=NJ, JJ<=NJ.


%Contraintes d'équilibre

%Matchs le dimanche
%On calcule nombre de matchs à l'exterieur qui tombe un dimanche pour une equipe 
1{ext(X,J):equipes(X)}1 :- match(Y,X,J), equipes(Y),jours(J), J\2==0, nj(NJ), J<=NJ.

nbext(X,N) :- N={ext(X,J):jours(J)},equipes(X).

%On suppose pext = 50%, chaque équipe doit jouer (ne-1)*2 matchs, donc (ne-1) matchs à l'exterieur et (ne-1) matchs à domicile
:- nbext(X,Y),pext(E),equipes(X), Y<(((ne-1)*2)*E)/100.

%On calcule nombre de matchs à domicile qui tombe un dimanche pour une equipe 
1{dom(X,J):equipes(X)}1 :- match(X,Y,J), equipes(Y),jours(J), J\2==0.
nbdom(X,N) :- N={dom(X,J):jours(J)},equipes(X).
:- nbdom(X,Y),equipes(X),pdom(D), Y<(((ne-1)*2)*D)/100.

%Matchs consécutifs
:-match(E1,E2,J), match(E1,E3,JJ), match(E1,E4,JJJ), equipes(E1), equipes(E2), equipes(E3), equipes(E4), jours(J), jours(JJ), jours(JJJ), |J-JJ|==1, |JJJ-J|==2, nj(NJ), J<=NJ, JJ<=NJ, JJJ<=NJ.
:-match(E2,E1,J), match(E3,E1,JJ), match(E4,E1,JJJ), equipes(E1), equipes(E2), equipes(E3), equipes(E4), jours(J), jours(JJ), jours(JJJ), |J-JJ|==1, |JJJ-J|==2,nj(NJ), J<=NJ, JJ<=NJ, JJJ<=NJ.


#hide.
#show match/3.