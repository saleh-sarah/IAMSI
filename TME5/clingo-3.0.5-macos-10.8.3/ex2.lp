reines(1..4).
1{p(X,R):reines(R)}1 :- reines(X).
:- p(R,Q), p(R,QQ), Q!=QQ, reines(R), reines(Q), reines(QQ).
:- p(R,Q), p(RR,Q), R!=RR, reines(R), reines(Q), reines(RR).
:- p(R,Q), p(RR,QQ), Q < QQ, |R-RR| == QQ-Q, reines(R), reines(Q), reines(RR), reines(QQ).
%p(1,1).
%:- p(4,4).
#show p/2.


%Solution pour reines sur coordonnées (1,1) : 4 modèles

%Answer: 1
%p(1,1) reines(1) reines(2) reines(3) reines(4) reines(5) reines(6) reines(7) reines(8) p(8,5) p(7,2) p(6,4) p(5,7) p(4,3) p(3,8) p(2,6) 
%Answer: 2
%p(1,1) reines(1) reines(2) reines(3) reines(4) reines(5) reines(6) reines(7) reines(8) p(8,4) p(7,2) p(6,7) p(5,3) p(4,6) p(3,8) p(2,5) 
%Answer: 3
%p(1,1) reines(1) reines(2) reines(3) reines(4) reines(5) reines(6) reines(7) reines(8) p(8,3) p(7,5) p(6,2) p(5,8) p(4,6) p(3,4) p(2,7) 
%Answer: 4
%p(1,1) reines(1) reines(2) reines(3) reines(4) reines(5) reines(6) reines(7) reines(8) p(8,3) p(7,6) p(6,4) p(5,2) p(4,8) p(3,5) p(2,7) 


%84 solutions quand il n'y a aucune reine aux coordonnées (4,4)
% L'une d'elles est la suivante :
%Answer: 1
%reines(1) reines(2) reines(3) reines(4) reines(5) reines(6) reines(7) reines(8) p(8,4) p(7,2) p(6,8) p(5,5) p(4,7) p(3,1) p(2,3) p(1,6) 