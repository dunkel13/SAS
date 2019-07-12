DATA Paises;
INPUT Nombre $ 1-12 PNB PobEcAc Nat Mort MorInf Zona $;
CARDS;
Costarica	1900	59.6	26.00	4.0	16000	CENTROAM
Cuba		2600	56.9	17.50	6.5	11100	CARIBE
Chile		1940	63.0	22.00	6.0	17000	SURAMER
Dominica	2210	63.0	20.80	5.2	14000	CARIBE
Ecuador		980	56.6	30.00	7.0	55000	SURAMER
;
PROC PRINT Data=Paises;
run;

PROC MEANS Data=Paises; *PROC means es como el summary de R;
	VAR PNB PobEcAc Indice;
	TITLE 'Estadisticas de las variables PNB PobEcAc ';
RUN;
Proc Univariate normal data= Paises mu0=2.5;
Var PNB PobEcAc;
histogram PNB/normal;
histogram PobEcAc/normal;
run;

