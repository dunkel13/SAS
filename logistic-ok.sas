Options nodate nonumber ps=1000;
Data doses;
Input dose m y;
datalines;
10.2 50 44 
 7.7 49 42
 5.1 46 24
 3.8 48 16
 2.6 50  6
 0.0 49  0;
proc genmod;
  model y/m=dose / dist=b ;
run;

