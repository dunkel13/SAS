/* Programa para demonstrar a entrada de datos e c�lculo de estad�sticas
descriptivas atrav�s del procedimento univariate */
Data pesos;
input peso @@;
cards;
2.50 2.58 2.60 2.62 2.65 2.66 2.58 2.70
2.55 2.57 2.70 2.62 2.59 2.54 2.53 2.20
;
run;
Proc Univariate normal data= pesos mu0=2.5;
Var peso;
histogram peso/normal;
run;
/* fin del programa */

Proc summary data = pesos alpha=0.05 print n
mean clm std stderr var min max range;
Var peso;
Run;

/* Programa para c�lculo de estadisticas descriptivas atrav�s do
procedimento summary*/

Proc summary data = pesos alpha=0.05 print n
mean clm std stderr var min max range;
Var peso;
Run;
/* fin del programa */
