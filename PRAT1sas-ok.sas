options nodate nonumber ps=2000 ls=78;
data teste1;
input trat $ bloco PESO;
cards;
A 1 100
A 2 130
B 1 99
B 2  145
;
proc print;
title 'Datos para verificacion';
run;

data teste2;
input trat $ 1 bloco 3 PESO 5-7;
cards;
A 1 100
A 2 130
B 1  99
B 2 145
;
proc print;
run;

data;
input trat $ bloco PESO;
cards;
A 1 100 A 2 130
B 1  99 B 2 145
;
proc print;
title 'Archivo';
run;

data;
input trat $ bloco PESO @@;
cards;
A 1 100 A 2 130
B 1  99 B 2 145
;
proc print;
title;
run;

data;
 do trat='A', 'B';
   input bloco PESO;
   output;
 end;
cards;
1 100
2 130
1  99
2 145
;
proc print;
run;

data;
 do trat=1 to 2;
   do bloco=1 to 2;
     input PESO;
     output;
   end;
 end;
cards;
100
130
 99
145
;
proc print;
run;

data;
input trat $ bloco PESO;
cards;
A23456789 1 100
A23456789 2 130
B23456789 1  99
B23456789 2 145
;
proc print;
run;

data;
length trat $ 9;
input trat $ bloco PESO;
cards;
A23456789 1 100
A23456789 2 130
B23456789 1  99
B23456789 2 145
;
proc print;
run;

data;
input trat $ bloco PESO;
  if bloco <=1 then CONJUNTO=100;
  else CONJUNTO=200;
cards;
A 1 100
A 2 130
B 1  99
B 2 145
;
proc print;
run;

data;
input trat $ bloco PESO;
  if trat='A' then delete;
cards;
A 1 100
A 2 130
B 1  99
B 2 145
;
proc print;
run;

data;
input trat $ bloco PESO;
  if PESO=100 then PESO=333;
cards;
A 1 100
A 2 130
B 1  99
B 2 145
;
proc print;
run;

proc print data=data2;
title 'data set data2';
run;

proc print data=data4;
title 'data set data4';
run;
