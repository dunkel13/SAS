Data solar;
input X Y @@;
Cards;
0.1 0.88 0.2 0.90 0.3 0.99 0.5 1.12
0.8 1.40 1.0 1.62 1.5 2.20 2.0 3.10
;
Proc NLIN Method=Gauss;
Parms a=0.5 b=1.8;
Model Y=a*(b**x);
Der.a=b**x;
Der.b=a*x*(b**(x-1));
Run;
