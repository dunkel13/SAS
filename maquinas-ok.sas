options nodate nonumber ps=65;
data maquinas;
input x y;
cards;
1   7.29
1  10.24
2  25.00
2  24.01
3  42.25
3  54.76 
4  86.49
4 110.25
5 136.89
5 151.29
;
proc reg;
model y=x/clm cli;
plot y*x;
run;
proc means data=maquinas mean var std stderr sum;
run;
