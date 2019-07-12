options nodate nonumber ls=72;
data notas;
input alumno $ 1-14 sexo $ P1 P2 curso $;
media=(P1+2*P2)/3;
 if media >=5 then result='aprob';
 else result='reprob';
cards;
Joaquin Silva  M 4.9 5.1 AG
Pedro Alejo   M 3.8 2.5 AG
Ana Maria      F 7.8 8.3 PR
Helena Suarez   F 8.4 4.3 AG
Mario Perez M 6.4 7.3 PRO
;
proc print;
title 'Datos para verificación';
run;
proc sort;
 by media;
run;
proc print;
title 'Datos ordenados por la  média final';
run;
proc means;
title 'Média de las notas de cada evaluación';
 var P1 P2 media;
run;
data teor2;
input ex1 ex2;
datalines;
203 203
208 198
198 199
200 200
202 201
192 202
197 197
;
proc print;
title 'Datos usados en la clase teórica';
run;
proc means var std stderr cv mean clm;
title 'Estadisticas de interes';
run;
