/* Simulando datos (x,y) mezclados, de dos estructuras de correlación diferentes distinguidos por clase con la variable p */
DATA misdatos;
do i=1 to 20;
x=5*normal(0)+25;
y=2*x+normal(0);
p=1;
output;
end;
do i=21 to 40;
x=2*normal(0)+4;
y=2*x+normal(0);
p=2;
output;
end;
run;
/* Definiendo opciones del ambiente gráfico*/
goptions colors=();
goptions ctext=black cback=gwh ftext=simplex
ftitle=simplex htitle=1.0 htext=0.9;
/* Haciendo un gráfico de dispersión sin distinción de grupos de pares*/
title'Grafico de Dispersion';
PROC GPLOT DATA=misdatos;
plot y*x;
symbol c=red;
run;quit;
/* Gráfico de dispersión pero distinguiendo los dos grupos de pares en los datos que según los valores de la variable de clasificación p*/
goptions colors=(black) ctext=blue cback=gwn ftext=simplex
ftitle=simplex htitle=1.0 htext=0.9;
title'Grafico de Dispersion';
PROC GPLOT DATA=misdatos;
plot y*x=p;
symbol1 c=red v=star;
symbol2 c=blue v=dot;
run;quit;
