/*Programa para demonstrar o uso de transformación e creación de nuevas variables  */
Data pesos;
input peso @@;
p1t=peso**0.05;
pln=log(peso);
if peso < 2.55 then classe = -1;
else classe=1;
cards;
2.50 2.58 2.60 2.62 2.65 2.66 2.58 2.70
2.55 2.57 2.70 2.62 2.59 2.54 2.53 2.20
;
run;
Proc print data=pesos;
run;
