/*Probabilidades  */
Data prob;
pbin=PROBBNML(0.5,10,3)-PROBBNML(0.5,10,2);
run;quit;
/*procedimento para imprimir el resultado*/
proc print;
run;quit;

Data prob;
pbin=PROBBNML(0.5,10,3)-PROBBNML(0.5,10,2);
ppoi=POISSON(2,3)-POISSON(2,2);
run;quit;
/*procedimento para imprimir el resultado*/
proc print;
run;quit;

Data prob;
  pbin=PROBBNML(0.5,10,3)-PROBBNML(0.5,10,2);
  ppoi=POISSON(2,3)-POISSON(2,2);
  pnorm=1-PROBNORM(2.7-2.58)/0.0675);
  qnorm=PROBIT(0.975)*(0.0675+2.58);
proc print;
run;quit;


/*procedimento imprimir el resultado*/
proc print;
run;quit;
