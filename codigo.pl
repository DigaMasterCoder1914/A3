% Atributos  Base Jogador

jogador(cleiton).

p(cleiton,70).
a(cleiton,1.78).
i(cleiton,35).
mPj(cleiton,0.7).
posi(cleiton,3).

% atributos de ataque

voltamArcar(cleiton,3).
mG(cleiton,0.25).
mA(cleiton,0.15).
mC(cleiton,50).
mP(cleiton,81).
sobeProataque(cleiton,3).

% atributos Defesa

mDBI(cleiton,30). 
mDFC(cleiton,0.4). 
mDdG(cleiton,10). 
mdGSF(cleiton,0.2).

% atributos DO TIME 

ctJ(cleiton,25).
atJ(cleiton,5).

% atRIBUTOS DOS estadios SEDIADORES DOS JogadorGenéricoOGOS DA COPA DO MUNDO

estadio(azteca).
estadio(akron).
estadio(bBVA).
estadio(mercedes_Benz).
estadio(atET).
estadio(arrowhead).
estadio(gillette).
estadio(nRG).
estadio(soFi).
estadio(hard_Rock).
estadio(metLife).
estadio(liNColn_Financial_Field).
estadio(llumen_Field).
estadio(leviS).
estadio(bC_Place).
estadio(bMO_Field).

% altitude dos estadios 

at(azteca,2240).
at( akron,1560).
at(bBVA,540).
at(mercedes_Benz,320).
at(atET,180).
at(arrowhead,270).
at(gillette,90).
at(nRG,13).
at(soFi,43).
at(hard_Rock,2).
at(metLife,5).
at(liNColn_Financial_Field,12).
at(llumen_Field,20).
at(leviS,20).
at(bC_Place,10).
at(bMO_Field,76).

%clima dos estadios 

ct(azteca,24).
ct( akron,24).
ct(bBVA,31).
ct(mercedes_Benz,27.5).
ct(atET,33).
ct(arrowhead,27.5).
ct(gillette,23).
ct(nRG,30).
ct(soFi,23).
ct(hard_Rock,29).
ct(metLife,25).
ct(liNColn_Financial_Field,27).
ct(llumen_Field,19.5).
ct(leviS,17.5).
ct(bC_Place,18).
ct(bMO_Field,22.5).

% estadios da primeira fase de grupo DO JogadorGenérico

f1Est1(cleiton,metLife).
f1Est2(cleiton,liNColn_Financial_Field).
f1Est3(cleiton,hard_Rock).


% Função que inferi a  postura Ofensiva

pOF(JogadorGenérico,conservador) :-   ( ((posi(JogadorGenérico,2);posi(JogadorGenérico,3)),voltamArcar(JogadorGenérico,X), X =< 1) ) ;( ( posi(JogadorGenérico,1),sobeProataque(JogadorGenérico,X), X =:=  3) ).
pOF(JogadorGenérico,mediano) :-  (((posi(JogadorGenérico,2);posi(JogadorGenérico,3)),voltamArcar(JogadorGenérico,X), X  =:= 2)  ;(posi(JogadorGenérico,1),sobeProataque(JogadorGenérico,X), X =:=  2))  .
pOF(JogadorGenérico,opressivo) :- (((posi(JogadorGenérico,2);posi(JogadorGenérico,3)),voltamArcar(JogadorGenérico,X), X  =:= 3)  ;(posi(JogadorGenérico,1),sobeProataque(JogadorGenérico,X), X =:=  1))  .

% Função que inferi a  postura Defensiva

pDEF(JogadorGenérico,conservador) :- (( (posi(JogadorGenérico,2);posi(JogadorGenérico,3)),voltamArcar(JogadorGenérico,X), X =:=  3 ) ; (posi(JogadorGenérico,1),sobeProataque(JogadorGenérico,X), X =:=  1))  .
pDEF(JogadorGenérico,mediano) :- (((posi(JogadorGenérico,2);posi(JogadorGenérico,3)),voltamArcar(JogadorGenérico,X), X =:=  2 ) ; (posi(JogadorGenérico,1),sobeProataque(JogadorGenérico,X), X =:=  2)) .
pDEF(JogadorGenérico,opressivo) :- (( (posi(JogadorGenérico,2);posi(JogadorGenérico,3)),voltamArcar(JogadorGenérico,X), X =< 1 ) ; ( posi(JogadorGenérico,1),sobeProataque(JogadorGenérico,X), X =:=  3)) .

% Função que inferi a  Dedicação em CamPo

dECM(JogadorGenérico,3) :- ((posi(JogadorGenérico,2);posi(JogadorGenérico,3)),pOF(JogadorGenérico,opressivo),pDEF(JogadorGenérico,conservador))  ;  (posi(JogadorGenérico,1),pOF(JogadorGenérico,conservador),pDEF(JogadorGenérico,opressivo)).
dECM(JogadorGenérico,2) :- ((posi(JogadorGenérico,2);posi(JogadorGenérico,3)),pOF(JogadorGenérico,mediano) ,pDEF(JogadorGenérico,mediano))  ;(posi(JogadorGenérico,1),pOF(JogadorGenérico,mediano),pDEF(JogadorGenérico,mediano)).
dECM(JogadorGenérico,1) :- ((posi(JogadorGenérico,2);posi(JogadorGenérico,3)),pOF(JogadorGenérico,conservador),pDEF(JogadorGenérico,opressivo))  ;(posi(JogadorGenérico,1),pOF(JogadorGenérico,opressivo),pDEF(JogadorGenérico,conservador)) .

% Função que inferi a  Intensidade NO clube

iNC(JogadorGenérico,3) :- mPj(JogadorGenérico,X), X >= 0.60 .
iNC(JogadorGenérico,2)  :-  mPj(JogadorGenérico,X), X >= 0.35 ,X < 0.60  .
iNC(JogadorGenérico,1) :- mPj(JogadorGenérico,X), X < 0.35.

% Função que inferi O NIVEL DE DESGASTE 

dG(JogadorGenérico,muito_pouco) :- dECM(JogadorGenérico,A),i(JogadorGenérico,B),iNC(JogadorGenérico,C),A =:= 1, B >= 18,B =< 25 , C =:= 1.
dG(JogadorGenérico,pouco) :- dECM(JogadorGenérico,A),i(JogadorGenérico,B),iNC(JogadorGenérico,C) , A =:= 3, B >= 18,B =< 25 , C =:= 1 . 
dG(JogadorGenérico,pouco) :- dECM(JogadorGenérico,A),i(JogadorGenérico,B),iNC(JogadorGenérico,C), A =:= 2 , B > 25,B =< 31 , C =:= 1 .
dG(JogadorGenérico,pouco) :- dECM(JogadorGenérico,A),i(JogadorGenérico,B),iNC(JogadorGenérico,C), A =:= 1 , B >= 18,B =< 25   , C =:= 2 .
dG(JogadorGenérico,pouco) :- dECM(JogadorGenérico,A),i(JogadorGenérico,B),iNC(JogadorGenérico,C) ,A =:= 1 , B >= 18,B =< 25  , C =:= 3 .
dG(JogadorGenérico,pouco) :- dECM(JogadorGenérico,A),i(JogadorGenérico,B),iNC(JogadorGenérico,C), A =:= 1 , B > 25,B =< 31   , C =:= 1 .
dG(JogadorGenérico,pouco) :- dECM(JogadorGenérico,A),i(JogadorGenérico,B),iNC(JogadorGenérico,C) ,A =:= 1 , B  > 31  , C =:= 1 .
dG(JogadorGenérico,pouco) :- dECM(JogadorGenérico,A),i(JogadorGenérico,B),iNC(JogadorGenérico,C) ,A =:= 2 , B >= 18,B =< 25  , C =:= 1 .
dG(JogadorGenérico,normAl) :- dECM(JogadorGenérico,A),i(JogadorGenérico,B),iNC(JogadorGenérico,C), A =:= 3 , B > 25,B =< 31  , C =:= 1  .
dG(JogadorGenérico,normAl) :- dECM(JogadorGenérico,A),i(JogadorGenérico,B),iNC(JogadorGenérico,C), A =:= 3 , B >= 18,B =< 25 , C =:= 2  .
dG(JogadorGenérico,normAl) :- dECM(JogadorGenérico,A),i(JogadorGenérico,B),iNC(JogadorGenérico,C) ,A =:= 1 ,  B > 25,B =< 31 , C =:= 2   .
dG(JogadorGenérico,normAl) :- dECM(JogadorGenérico,A),i(JogadorGenérico,B),iNC(JogadorGenérico,C) ,A =:= 1  , B > 25,B =< 31    , C =:=  3 .
dG(JogadorGenérico,normAl) :- dECM(JogadorGenérico,A),i(JogadorGenérico,B),iNC(JogadorGenérico,C) ,A =:= 2 ,  B >= 18,B =< 25   , C =:=  2 .
dG(JogadorGenérico,normAl) :- dECM(JogadorGenérico,A),i(JogadorGenérico,B),iNC(JogadorGenérico,C) ,A =:=  2,  B > 25,B =< 31   , C =:=  2 .
dG(JogadorGenérico,normAl) :- dECM(JogadorGenérico,A),i(JogadorGenérico,B),iNC(JogadorGenérico,C) ,A =:=  1,   B  > 31   , C =:=  2.
dG(JogadorGenérico,normAl) :- dECM(JogadorGenérico,A),i(JogadorGenérico,B),iNC(JogadorGenérico,C), A =:= 2 , B  > 31   , C =:= 1 .
dG(JogadorGenérico,mediano) :- dECM(JogadorGenérico,A),i(JogadorGenérico,B),iNC(JogadorGenérico,C) ,A =:= 2 , B >= 18,B =< 25  , C =:= 3 . 
dG(JogadorGenérico,mediano) :- dECM(JogadorGenérico,A),i(JogadorGenérico,B),iNC(JogadorGenérico,C) ,A =:= 1 , B  > 31  , C =:= 3 . 
dG(JogadorGenérico,mediano) :- dECM(JogadorGenérico,A),i(JogadorGenérico,B),iNC(JogadorGenérico,C) ,A =:= 2 , B > 25,B =< 31 , C =:= 3 . 
dG(JogadorGenérico,mediano) :- dECM(JogadorGenérico,A),i(JogadorGenérico,B),iNC(JogadorGenérico,C) ,A =:= 2 , B  > 31  , C =:= 2 . 
dG(JogadorGenérico,mediano) :- dECM(JogadorGenérico,A),i(JogadorGenérico,B),iNC(JogadorGenérico,C) ,A =:= 3 , B >= 18,B =< 25   , C =:= 3 . 
dG(JogadorGenérico,mediano) :- dECM(JogadorGenérico,A),i(JogadorGenérico,B),iNC(JogadorGenérico,C) ,A =:= 3 , B > 25,B =< 31 , C =:= 2  . 
dG(JogadorGenérico,elevado) :- dECM(JogadorGenérico,A),i(JogadorGenérico,B),iNC(JogadorGenérico,C), A =:= 2, B  > 31   , C =:= 3 . 
dG(JogadorGenérico,elevado) :- dECM(JogadorGenérico,A),i(JogadorGenérico,B),iNC(JogadorGenérico,C) ,A =:= 3 , B > 25,B =< 31 , C =:= 3  . 
dG(JogadorGenérico,elevado) :- dECM(JogadorGenérico,A),i(JogadorGenérico,B),iNC(JogadorGenérico,C) ,A =:= 3 , B  > 31  , C =:= 1 . 
dG(JogadorGenérico,muito) :- dECM(JogadorGenérico,A),i(JogadorGenérico,B),iNC(JogadorGenérico,C) ,A =:= 3 , B  > 31  , C =:= 2  . 
dG(JogadorGenérico,muitoElevado) :- dECM(JogadorGenérico,A),i(JogadorGenérico,B),iNC(JogadorGenérico,C), A =:= 3 , B  > 31  , C =:= 3  . 

% Função que inferi o imC DO JogadorGenérico 

imC(JogadorGenérico,K) :- p(JogadorGenérico,X),a(JogadorGenérico,Y),K is X /(Y * Y) .

% Função que inferi a  TAXA BASAL DO JogadorGenérico 

tBX(JogadorGenérico,W)  :- p(JogadorGenérico,X),a(JogadorGenérico,Y),i(JogadorGenérico,Z), A is Y * 100,W is (X  * 10) + (A * 6.25) - (Z * 5) + 5 .

% Função que inferi o fator de atividade

fat(JogadorGenérico,1.2) :- dECM(JogadorGenérico,D), iNC(JogadorGenérico,U),D =:= 1,U =:= 1.
fat(JogadorGenérico,1.3) :- dECM(JogadorGenérico,D), iNC(JogadorGenérico,U),D =:= 2,U =:= 1.
fat(JogadorGenérico,1.4) :- dECM(JogadorGenérico,D), iNC(JogadorGenérico,U),D =:= 3,U =:= 1.
fat(JogadorGenérico,1.5) :- dECM(JogadorGenérico,D), iNC(JogadorGenérico,U),D =:= 1,U =:= 2.
fat(JogadorGenérico,1.6) :- dECM(JogadorGenérico,D), iNC(JogadorGenérico,U),D =:= 2,U =:= 2.
fat(JogadorGenérico,1.7) :- dECM(JogadorGenérico,D), iNC(JogadorGenérico,U),D =:= 1,U =:= 3.
fat(JogadorGenérico,1.8) :- dECM(JogadorGenérico,D), iNC(JogadorGenérico,U),D =:= 3,U =:= 2.
fat(JogadorGenérico,1.9) :- dECM(JogadorGenérico,D), iNC(JogadorGenérico,U),D =:= 2,U =:= 3.
fat(JogadorGenérico,2.2) :- dECM(JogadorGenérico,D), iNC(JogadorGenérico,U),D =:= 3,U =:= 3.

% Função que inferi a perfomAnce de um JogadorGenérico  Quanto aos gols pra zona de camPo 3

perfGol(JogadorGenérico,4) :- posi(JogadorGenérico,3),mG(JogadorGenérico,X), X < 0.10 .
perfGol(JogadorGenérico,9) :- posi(JogadorGenérico,3),mG(JogadorGenérico,X), X >= 0.10,X =< 0.20 .
perfGol(JogadorGenérico,25) :- posi(JogadorGenérico,3),mG(JogadorGenérico,X), X  > 0.20 ,X =< 0.30.
perfGol(JogadorGenérico,35) :- posi(JogadorGenérico,3),mG(JogadorGenérico,X), X  > 0.30 ,X =< 0.40 .
perfGol(JogadorGenérico,50) :- posi(JogadorGenérico,3),mG(JogadorGenérico,X), X  > 0.40  .

% Função que inferi a perfomAnce de um JogadorGenérico  Quanto aos gols pra zona de camPo  2

perfGol(JogadorGenérico,5) :-  posi(JogadorGenérico,2),mG(JogadorGenérico,X), X =< 0.10 .
perfGol(JogadorGenérico,10) :- posi(JogadorGenérico,2),mG(JogadorGenérico,X), X > 0.10,X =< 0.20 .
perfGol(JogadorGenérico,19) :- posi(JogadorGenérico,2),mG(JogadorGenérico,X), X  > 0.20 ,X =< 0.35 .
perfGol(JogadorGenérico,29) :- posi(JogadorGenérico,2),mG(JogadorGenérico,X), X  >  0.35 .

% Função que inferi a perfomAnce de um JogadorGenérico  Quanto AS assistencias  pra zona de camPo 3

perfAS(JogadorGenérico,5) :-  posi(JogadorGenérico,3),mA(JogadorGenérico,X), X =< 0.10 .
perfAS(JogadorGenérico,10) :-  posi(JogadorGenérico,3),mA(JogadorGenérico,X), X > 0.10,X =< 0.20 .
perfAS(JogadorGenérico,20) :-  posi(JogadorGenérico,3),mA(JogadorGenérico,X), X > 0.20,X =< 0.40 .
perfAS(JogadorGenérico,25) :-  posi(JogadorGenérico,3),mA(JogadorGenérico,X), X > 0.40  .

% Função que inferi a perfomAnce de um JogadorGenérico  Quanto AS assistencias  pra zona de camPo 2

perfAS(JogadorGenérico,4) :-  posi(JogadorGenérico,2),mA(JogadorGenérico,X), X =< 0.15 .
perfAS(JogadorGenérico,19) :- posi(JogadorGenérico,2),mA(JogadorGenérico,X), X > 0.15,X =< 0.25 .
perfAS(JogadorGenérico,29) :- posi(JogadorGenérico,2),mA(JogadorGenérico,X), X > 0.25,X =< 0.30 .
perfAS(JogadorGenérico,41) :- posi(JogadorGenérico,2),mA(JogadorGenérico,X), X  > 0.30 .

% Função que inferi a perfomAnce de um JogadorGenérico  Quanto aos passes certos pra zona de camPo 3

perfPA(JogadorGenérico,2) :-  posi(JogadorGenérico,3),mP(JogadorGenérico,X), X =< 0.70 .
perfPA(JogadorGenérico,5) :-  posi(JogadorGenérico,3),mP(JogadorGenérico,X), X > 0.70,X =< 0.80 .
perfPA(JogadorGenérico,10) :- posi(JogadorGenérico,3),mP(JogadorGenérico,X), X > 0.80 .

% Função que inferi a perfomAnce de um JogadorGenérico  Quanto aos passes certos pra zona de camPo 2

perfPA(JogadorGenérico,5) :-  posi(JogadorGenérico,2),mP(JogadorGenérico,X), X =< 0.70 .
perfPA(JogadorGenérico,15) :- posi(JogadorGenérico,2),mP(JogadorGenérico,X), X > 0.70,X =< 0.80 .
perfPA(JogadorGenérico,20) :- posi(JogadorGenérico,2),mP(JogadorGenérico,X), X > 0.80 .

% Função que inferi a perfomAnce de um JogadorGenérico  Quanto aos chutes certos pra zona de camPo 3

perfCC(JogadorGenérico,3) :- posi(JogadorGenérico,3),mC(JogadorGenérico,X), X =< 30 . 
perfCC(JogadorGenérico,7) :- posi(JogadorGenérico,3),mC(JogadorGenérico,X), X  > 30,X =< 40 .
perfCC(JogadorGenérico,9) :- posi(JogadorGenérico,3),mC(JogadorGenérico,X), X > 40,X =< 50 .
perfCC(JogadorGenérico,12) :- posi(JogadorGenérico,3),mC(JogadorGenérico,X), X  > 50,X =< 60 .
perfCC(JogadorGenérico,15) :- posi(JogadorGenérico,3),mC(JogadorGenérico,X), X > 60 .

% Função que inferi a perfomAnce de um JogadorGenérico  Quanto aos chutes certos pra zona de camPo 2

perfCC(JogadorGenérico,2) :- posi(JogadorGenérico,2),mC(JogadorGenérico,X), X =< 30 . 
perfCC(JogadorGenérico,4) :- posi(JogadorGenérico,2),mC(JogadorGenérico,X), X  > 30,X =< 40 .
perfCC(JogadorGenérico,6) :- posi(JogadorGenérico,2),mC(JogadorGenérico,X), X > 40,X =< 50 .
perfCC(JogadorGenérico,10) :- posi(JogadorGenérico,2),mC(JogadorGenérico,X), X  > 50   .


% Função que inferi a perfomAnce de um JogadorGenérico  Quanto AS Gols sofridos 

perfmdGSF(JogadorGenérico,20) :- posi(JogadorGenérico,1),mdGSF(JogadorGenérico,X), X < 0.7  .
perfmdGSF(JogadorGenérico,14) :- posi(JogadorGenérico,1),mdGSF(JogadorGenérico,X), X >= 0.7, X =< 1.0 .
perfmdGSF(JogadorGenérico,10) :- posi(JogadorGenérico,1),mdGSF(JogadorGenérico,X), X  > 1.0,X =< 1.5 .
perfmdGSF(JogadorGenérico,6)  :- posi(JogadorGenérico,1),mdGSF(JogadorGenérico,X), X > 1.5.

% Função que inferi a perfomAnce de um JogadorGenérico  Quanto AS Bolas interceptadas 

perfmDBI(JogadorGenérico,5) :- posi(JogadorGenérico,1),mDBI(JogadorGenérico,X), X < 1.0   .
perfmDBI(JogadorGenérico,9) :- posi(JogadorGenérico,1),mDBI(JogadorGenérico,X), X  > 1.0 ,X =< 2.0 . 
perfmDBI(JogadorGenérico,18) :- posi(JogadorGenérico,1),mDBI(JogadorGenérico,X), X  > 2.0, X =<  3.0.
perfmDBI(JogadorGenérico,25) :-posi(JogadorGenérico,1),mDBI(JogadorGenérico,X), X  > 3.0 .

% Função que inferi a perfomAnce de um JogadorGenérico  Quanto As divididas ganhas 

perfmDdG(JogadorGenérico,6) :-  posi(JogadorGenérico,1),mDdG(JogadorGenérico,X), X =< 50  .
perfmDdG(JogadorGenérico,12) :- posi(JogadorGenérico,1),mDdG(JogadorGenérico,X), X  > 50, X =< 60 .
perfmDdG(JogadorGenérico,24) :- posi(JogadorGenérico,1),mDdG(JogadorGenérico,X), X  > 60, X =< 70 .
perfmDdG(JogadorGenérico,35) :- posi(JogadorGenérico,1),mDdG(JogadorGenérico,X), X  > 70  .

% Função que inferi a perfomAnce de um JogadorGenérico Quanto As faltas cometidas

perfmDFC(JogadorGenérico,3) :- posi(JogadorGenérico,1),mDFC(JogadorGenérico,X), X >= 3.0   .
perfmDFC(JogadorGenérico,7) :- posi(JogadorGenérico,1),mDFC(JogadorGenérico,X), X  < 3.0,X >= 2.0 .
perfmDFC(JogadorGenérico,14) :- posi(JogadorGenérico,1),mDFC(JogadorGenérico,X), X  < 2.0 , X >= 1.0 .
perfmDFC(JogadorGenérico,20) :- posi(JogadorGenérico,1),mDFC(JogadorGenérico,X), X  < 1.0 .


% Função que inferi a perfomAnce de um JogadorGenérico  


perf(JogadorGenérico,1) :-  (((posi(JogadorGenérico,2);posi(JogadorGenérico,3)),perfGol(JogadorGenérico,X),perfAS(JogadorGenérico,Y),perfPA(JogadorGenérico,Z),perfCC(JogadorGenérico,A),SomA is X + Z + A + Y,SomA =< 35)  ; (posi(JogadorGenérico,1),perfmdGSF(JogadorGenérico,E),perfmDBI(JogadorGenérico,B),perfmDdG(JogadorGenérico,C),perfmDFC(JogadorGenérico,D),Total is E + B + C + D,Total =< 20  )). 
perf(JogadorGenérico,2) :- (((posi(JogadorGenérico,2);posi(JogadorGenérico,3)),perfGol(JogadorGenérico,X),perfAS(JogadorGenérico,Y),perfPA(JogadorGenérico,Z),perfCC(JogadorGenérico,A),SomA is X + Z + A + Y, SomA > 35, SomA =< 50) ; (posi(JogadorGenérico,1),perfmdGSF(JogadorGenérico,E),perfmDBI(JogadorGenérico,B),perfmDdG(JogadorGenérico,C),perfmDFC(JogadorGenérico,D),Total is E + B + C + D, Total  > 20, Total  =< 35 )).
perf(JogadorGenérico,3) :- (((posi(JogadorGenérico,2);posi(JogadorGenérico,3)),perfGol(JogadorGenérico,X),perfAS(JogadorGenérico,Y),perfPA(JogadorGenérico,Z),perfCC(JogadorGenérico,A),SomA is X + Z + A + Y,SomA > 50,SomA =< 65) ; (posi(JogadorGenérico,1),perfmdGSF(JogadorGenérico,E),perfmDBI(JogadorGenérico,B),perfmDdG(JogadorGenérico,C),perfmDFC(JogadorGenérico,D),Total is E + B + C + D,Total  > 35,Total  =< 50   )).
perf(JogadorGenérico,4) :- (((posi(JogadorGenérico,2);posi(JogadorGenérico,3)),perfGol(JogadorGenérico,X),perfAS(JogadorGenérico,Y),perfPA(JogadorGenérico,Z),perfCC(JogadorGenérico,A),SomA is X + Z + A + Y, SomA > 65) ; (posi(JogadorGenérico,1),perfmdGSF(JogadorGenérico,E),perfmDBI(JogadorGenérico,B),perfmDdG(JogadorGenérico,C),perfmDFC(JogadorGenérico,D),Total is E + B + C + D,Total  > 50  )).

% Função que inferi o obJogadorGenéricoegtivo DO JogadorGenérico

obJogadorGenérico(JogadorGenérico,melhorar_Recuperacao) :- (dG(JogadorGenérico,elevado);dG(JogadorGenérico,muito);dG(JogadorGenérico,muitoElevado)), perf(JogadorGenérico,X), X >= 3,X =< 4 .
obJogadorGenérico(JogadorGenérico,melhorar_resistência) :- (dG(JogadorGenérico,elevado);dG(JogadorGenérico,muito);dG(JogadorGenérico,muitoElevado)),perf(JogadorGenérico,X), X =:= 2 .
obJogadorGenérico(JogadorGenérico,melhorar_resistência) :- (dG(JogadorGenérico,elevado);dG(JogadorGenérico,muito);dG(JogadorGenérico,muitoElevado)), perf(JogadorGenérico,X), X =:= 1 .
obJogadorGenérico(JogadorGenérico,melhorar_Fisico) :- (dG(JogadorGenérico,normAl);dG(JogadorGenérico,mediano)),perf(JogadorGenérico,X), X =:= 1 .
obJogadorGenérico(JogadorGenérico,mAnter) :- (dG(JogadorGenérico,normAl);dG(JogadorGenérico,mediano)),perf(JogadorGenérico,X), X =:= 2  .
obJogadorGenérico(JogadorGenérico,mAnter) :-( dG(JogadorGenérico,normAl);dG(JogadorGenérico,mediano)),perf(JogadorGenérico,X), X >= 3,X =< 4  .
obJogadorGenérico(JogadorGenérico,mAnter) :- (dG(JogadorGenérico,pouco);dG(JogadorGenérico,muito_pouco)),perf(JogadorGenérico,X),X >= 3,X =< 4 .
obJogadorGenérico(JogadorGenérico,melhorar_Fisico) :- (dG(JogadorGenérico,pouco);dG(JogadorGenérico,muito_pouco)) ,perf(JogadorGenérico,X), X =:= 2  .
obJogadorGenérico(JogadorGenérico,melhorar_Fisico) :- (dG(JogadorGenérico,pouco);dG(JogadorGenérico,muito_pouco)) ,perf(JogadorGenérico,X), X =:= 1  .

% Função que inferi a Necessidade de calorias  

nECKCAL(JogadorGenérico,NECKCA) :- fat(JogadorGenérico,X),tBX(JogadorGenérico,Z),NECKCA is X * Z .

% Função que inferi a  Diferença de Altitude

aMAiorAltEstF1(JogadorGenérico,X) :-  f1Est1(JogadorGenérico,Estadio1),f1Est2(JogadorGenérico,Estadio2),at(Estadio1,A),at(Estadio2,B), X is max(B,A) .

bMAiorAltEstF1(JogadorGenérico,X) :- aMAiorAltEstF1(JogadorGenérico,C),f1Est3(JogadorGenérico,Estadio3),at(Estadio3,D), X is max(D,C) .

difAt(JogadorGenérico,Dif) :-  bMAiorAltEstF1(JogadorGenérico,X),atJ(JogadorGenérico,Y),Dif is abs(X - Y).    

% Função que classifica a diferença de Altitude

nivelDaDifAt(JogadorGenérico,baixa) :- difAt(JogadorGenérico,X) , X =< 500.
nivelDaDifAt(JogadorGenérico,media) :- difAt(JogadorGenérico,X) , X > 500, X =< 1200 .
nivelDaDifAt(JogadorGenérico,elevada) :- difAt(JogadorGenérico,X) , X > 1200, X =< 2100 .
nivelDaDifAt(JogadorGenérico,muito_elevada) :- difAt(JogadorGenérico,X) , X > 2100, X =< 3300 .
nivelDaDifAt(JogadorGenérico,extrema) :- difAt(JogadorGenérico,X) , X > 4300 .

% Função que inferi a  Diferença de ClimA  

medCL(JogadorGenérico,X) :-  f1Est1(JogadorGenérico,Estadio1),f1Est2(JogadorGenérico,Estadio2),f1Est3(JogadorGenérico,Estadio3),ct(Estadio2,A),ct(Estadio3,Y),ct(Estadio1,Z), X is (A + Y + Z) / 3 . 

difCl(JogadorGenérico,X) :- ctJ(JogadorGenérico,K),medCL(JogadorGenérico,Z), X is abs(K - Z) .  
 
% Função que classifica a diferença de Clima 

nivelDaDifCl(JogadorGenérico,baixa) :- difCl(JogadorGenérico,X) , X  =<  5.
nivelDaDifCl(JogadorGenérico,media) :- difCl(JogadorGenérico,X) , X > 5, X =< 10.
nivelDaDifCl(JogadorGenérico,alta) :- difCl(JogadorGenérico,X) , X > 10 .

% Avalia IMC 

imcNivel(JogadorGenérico,baixo) :- imC(JogadorGenérico,X), X < 18.5.
imcNivel(JogadorGenérico,alto) :- imC(JogadorGenérico,X), X >= 25 .


% função que sugere alimentos para 

alimento(Jogador, salmao_grelhado) :- obJogadorGenérico(Jogador, melhorar_Recuperacao).
alimento(Jogador, brocolis) :- obJogadorGenérico(Jogador, melhorar_Recuperacao). 
alimento(Jogador, batata_doce) :- obJogadorGenérico(Jogador, melhorar_Recuperacao).
alimento(Jogador, arroz_integral) :- obJogadorGenérico(Jogador, melhorar_Recuperacao).
alimento(Jogador, aveia) :- obJogadorGenérico(Jogador, melhorar_Recuperacao).
alimento(Jogador, ovo_cozido) :- obJogadorGenérico(Jogador, melhorar_Recuperacao).
alimento(Jogador, frango) :- obJogadorGenérico(Jogador, melhorar_Recuperacao).
alimento(Jogador, castanha) :- obJogadorGenérico(Jogador, melhorar_Recuperacao).
alimento(Jogador, macarrao) :- obJogadorGenérico(Jogador, melhorar_Recuperacao).
alimento(Jogador, mirtilo) :- obJogadorGenérico(Jogador, melhorar_Fisico).
alimento(Jogador, frango_temperado_com_curcuma) :- obJogadorGenérico(Jogador, melhorar_Fisico).
alimento(Jogador, arroz_integral) :- obJogadorGenérico(Jogador, melhorar_Fisico).
alimento(Jogador, lentilha) :- obJogadorGenérico(Jogador, melhorar_Fisico).
alimento(Jogador, cenoura) :- obJogadorGenérico(Jogador, melhorar_Fisico).
alimento(Jogador, sardinha) :- obJogadorGenérico(Jogador, melhorar_Fisico).
alimento(Jogador, batata_doce) :- obJogadorGenérico(Jogador, melhorar_Fisico).
alimento(Jogador, espinafre) :- obJogadorGenérico(Jogador, melhorar_Fisico).
alimento(Jogador, cereja) :- obJogadorGenérico(Jogador, melhorar_Fisico).
alimento(Jogador, molho_de_tomate) :- obJogadorGenérico(Jogador, melhorar_resistência).
alimento(Jogador, macarrao_integral) :- obJogadorGenérico(Jogador, melhorar_resistência).
alimento(Jogador, mel) :- obJogadorGenérico(Jogador, melhorar_resistência).
alimento(Jogador, tapioca) :- obJogadorGenérico(Jogador, melhorar_resistência).
alimento(Jogador, suco_de_beterraba) :- obJogadorGenérico(Jogador, melhorar_resistência).
alimento(Jogador, agua_de_coco) :- obJogadorGenérico(Jogador, melhorar_resistência).
alimento(Jogador, lentilha) :- obJogadorGenérico(Jogador, melhorar_resistência).
alimento(Jogador, beterraba) :- obJogadorGenérico(Jogador, melhorar_resistência).
alimento(Jogador, atum) :- obJogadorGenérico(Jogador, melhorar_resistência).
alimento(Jogador, iogurte_grego_com_aveia) :- obJogadorGenérico(Jogador, mAnter).
alimento(Jogador, frutas) :- obJogadorGenérico(Jogador, mAnter).
alimento(Jogador, arroz) :- obJogadorGenérico(Jogador, mAnter).
alimento(Jogador, salada) :- obJogadorGenérico(Jogador, mAnter).
alimento(Jogador, feijao) :- obJogadorGenérico(Jogador, mAnter).
alimento(Jogador, frango) :- obJogadorGenérico(Jogador, mAnter).
alimento(Jogador, tomate) :- obJogadorGenérico(Jogador, mAnter).
alimento(Jogador, pao_integral) :- obJogadorGenérico(Jogador, mAnter).
alimento(Jogador, pó_de_tomate) :- nivelDaDifAt(Jogador, baixa).   
alimento(Jogador, chocolate) :- nivelDaDifAt(Jogador, baixa).
alimento(Jogador, queijo) :- nivelDaDifAt(Jogador, media).  
alimento(Jogador, chocolate) :- nivelDaDifAt(Jogador, media).  
alimento(Jogador, peixes) :- nivelDaDifAt(Jogador, media).  
alimento(Jogador, peixe_enlatado_em_óleo) :- nivelDaDifAt(Jogador, elevada).  
alimento(Jogador, maurten) :- nivelDaDifAt(Jogador, elevada).  
alimento(Jogador, powerade) :- nivelDaDifAt(Jogador, elevada).  
alimento(Jogador, gatorade) :- nivelDaDifAt(Jogador, elevada).  
alimento(Jogador, barras_energeticas) :- nivelDaDifAt(Jogador, muito_elevada).  
alimento(Jogador, suco_de_uva_diluído) :- nivelDaDifAt(Jogador, extrema).  
alimento(Jogador, isotonicos) :- nivelDaDifAt(Jogador, extrema).  
alimento(Jogador, suco_de_laranja_diluído) :- nivelDaDifAt(Jogador, extrema).  
alimento(Jogador, pedialyte_Sport) :- nivelDaDifCl(Jogador, media).
alimento(Jogador, liquid_I_V) :- nivelDaDifCl(Jogador, media).
alimento(Jogador, kiwi) :- nivelDaDifCl(Jogador, alta).
alimento(Jogador, batata_inglesa) :- nivelDaDifCl(Jogador, alta).
alimento(Jogador, tapioca) :- nivelDaDifCl(Jogador, alta).
alimento(Jogador, laranja) :- nivelDaDifCl(Jogador, alta).
alimento(Jogador, gatorade) :- nivelDaDifCl(Jogador, alta).
alimento(Jogador, powerade) :- nivelDaDifCl(Jogador, alta).
alimento(Jogador, pao_sem_glúten_a_base_de_arroz) :- nivelDaDifCl(Jogador, alta).
alimento(Jogador, arroz_branco) :- nivelDaDifCl(Jogador, alta).
alimento(Jogador, mel) :- imcNivel(Jogador, baixo).
alimento(Jogador, azeite) :- imcNivel(Jogador, baixo).
alimento(Jogador, batata_doce) :- imcNivel(Jogador, baixo).
alimento(Jogador, amendoim) :- imcNivel(Jogador, baixo).
alimento(Jogador, vitamina_de_banana_com_aveia_e_amendoim) :- imcNivel(Jogador, baixo).
alimento(Jogador, macarrao_com_frango) :- imcNivel(Jogador, baixo).
alimento(Jogador, omelete_de_ovo_com_queijo) :- imcNivel(Jogador, baixo).
alimento(Jogador, carne) :- imcNivel(Jogador, baixo).
alimento(Jogador, queijo) :- imcNivel(Jogador, baixo).
alimento(Jogador, peixe_branco) :- imcNivel(Jogador, alto).
alimento(Jogador, legumes) :- imcNivel(Jogador, alto).
alimento(Jogador, espinafre) :- imcNivel(Jogador, alto).
alimento(Jogador, abobrinha) :- imcNivel(Jogador, alto).
alimento(Jogador, omelete_de_claras_com_espinafre_e_tomate) :- imcNivel(Jogador, alto).
alimento(Jogador, iogurte_grego) :- imcNivel(Jogador, alto).
alimento(Jogador, frutas) :- imcNivel(Jogador, alto).
alimento(Jogador, brocolis) :- imcNivel(Jogador, alto).
