options nodate nonumber ls=72;
data pratica;
input PESO@@;
cards;
16.89   11.84   18.69   16.51   18.97
15.21   17.90   17.38   12.56   13.73
14.60   18.94   16.72   14.41   13.23
16.65   15.73   16.86   17.87   15.45
18.19   16.04   15.72   16.68   17.76
12.03   14.00   14.74   16.68   12.39
15.30   15.49   11.53   19.13   15.01
13.47   16.83   15.47   11.63   16.22
12.14   17.69   12.54   18.73   17.02
17.03   16.44   13.58   10.46   16.89
;
proc univariate normal plot;
title 'Estadística descriptiva';
run;
proc chart;
title 'Histograma';
 vbar PESO;
run;
