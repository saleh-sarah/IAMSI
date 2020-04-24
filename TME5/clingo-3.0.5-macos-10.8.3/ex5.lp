animal(chien;oiseaux;chat;chevaux;poissons).
maison(rouge;verte;blanche;jaune;bleue).
boisson(the;cafe;lait;biere;eau).
cigarettes(pallMall;dunhhill;blend;bluemaster;princess).
personne(britannique;suedois;danois;norvegien;allemand).

nombres(1..5).

1{vivre(X,Z):maison(Z)}1 :- personne(X).
1{boire(X,Z):boisson(Z)}1 :- personne(X).
1{fumer(X,Z):cigarettes(Z)}1 :- personne(X).
1{garder(X,Z):animal(Z)}1 :- personne(X).
%On suppose que la maison la plus à gauche se trouve à la position 0, celle à côté à la position 1, etc.
1{position(X,Z):nombres(Z)}1 :- maison(X).

:- position(X,Z), position(XX,ZZ), maison(X), maison(XX), nombres(Z), nombres(ZZ), Z == ZZ, X != XX.
:- vivre(P,M), vivre(PP,MM), personne(P), personne(PP), maison(M), maison(MM), M==MM, P!=PP.
:- boire(P,B), boire(PP,BB), personne(P), personne(PP), boisson(B), boisson(BB), B==BB, P!=PP.
:- fumer(P,C), fumer(PP,CC), personne(P), personne(PP), cigarettes(C), cigarettes(CC), C==CC, P!=PP.
:- garder(P,A), garder(PP,AA), personne(P), personne(PP), animal(A), animal(AA), A==AA, P!=PP.

%Proposition 1
vivre(britannique, rouge).

%Proposition 2
garder(suedois,chien).

%Proposition 3
boire(danois,the).

%Proposition 4
:- position(blanche,ZZ), position(verte,Z), nombres(Z), nombres(ZZ), Z > ZZ. 

%Proposition 5
:- boire(P,B), personne(P), boisson(B), vivre(P,verte), B!=cafe.

%Proposition 6
:- fumer(P,pallMall), personne(P), garder(P,A), animal(A), A!=oiseaux.

%Proposition 7
:- vivre(P,jaune), personne(P), fumer(P,C), cigarettes(C), C!=dunhhill.

%Proposition 8
:- vivre(P,M), personne(P), maison(M), position(M,3), boire(P,B), boisson(B), B!=lait.

%Proposition 9
:- vivre(norvegien,M), maison(M), position(M,N), nombres(N), N!=1.

%Proposition 10
:- fumer(P,blend), personne(P), vivre(P,M), maison(M), position(M,N), nombres(N), garder(PP,chat), personne(PP), vivre(PP,MM), maison(MM), position(MM,NN), nombres(NN), |N - NN| != 1.

%Proposition 11
:- garder(P,chevaux), personne(P), vivre(P,M), maison(M), position(M,N), nombres(N), fumer(PP,dunhhill), personne(PP), vivre(PP,MM), maison(MM), position(MM,NN), nombres(NN), |N-NN| != 1.

%Proposition 12
:- fumer(P,bluemaster), personne(P), boire(P,B), boisson(B), B!=biere.

%Proposition 13
fumer(allemand,princess).

%Proposition 14
:- vivre(norvegien,M), maison(M), position(M,N), nombres(N), position(bleue,NN), nombres(NN), |N-NN| != 1.

%Proposition 15
:- fumer(P,blend), personne(P), vivre(P,M), maison(M), position(M,N), nombres(N), boire(PP,eau), personne(PP), vivre(PP,MM), maison(MM), position(MM,NN), nombres(NN), |N-NN| != 1.


%Il y a 7 modèles différents : dans 3 d'entres eux l'allemand garde les poissons, dans 3 autres c'est le danois qui garde les poissons et enfin dans le dernier c'est le norvégien qui les garde.



#show vivre/2.
#show boire/2.
#show fumer/2.
#show garder/2.
#show position/2.
#hide.