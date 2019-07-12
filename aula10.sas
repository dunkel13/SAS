/* Programa para ejemplificar o Proc Nlin*/
Data aula10;
input y x1 @@;
cards;
65 41 78 71 82 90 86 80 87 93 90 90
93 87 96 95 104 100 113 101
;
Proc Nlin method=gauss maxiter=500;
parms a=0.5 b=-0.08;
model y=a*(x1**b);
der.a=x1**b;
der.b=a*(x1**b)*log(x1);
Run; Quit;
/* fin del programa */
