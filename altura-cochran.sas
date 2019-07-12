/* programa ejemplo del programa de teste t para dos muestras*/
Data altura;
input grupo peso alt @@;
cards;
2 72 1.80 2 88 1.80 2 62 1.72 2 95 1.93
1 48.5 1.58 1 86 1.83 1 79 1.69 1 53 1.60
;
Proc ttest cochran data=altura;
Class grupo;
Var peso alt;
Run;
