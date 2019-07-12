DATA Paises2;
INPUT Nombre $ 1-12 PNB PobEcAc Nat Mort MorInf Zona $;
Indice2=PNB/Mort; IndCrec=Mort/Nat;
CARDS;
Belice		1990	63.0	36.00	6.0	36000	CENTROAM
Bolivia		630	54.5	36.00	10.0	92000	SURAMER
Brasil		2680	63.6	27.00	7.0	57000	SURAMER
Canada		20470	75.1	14.00	7.0	7000	NORTEAME
Colombia 	1260	59.0	24.00	6.0	37000	SURAMER
Costa Rica	2000	60.0	26.00	5.0	17000	CENTROAM
Cuba		2600	56.9	17.50	6.5	11100	CARIBE
;
RUN;

DATA Paises;
set paises1(RENAME=(Indice1=Indice))
    paises2(RENAME=(Indice2=Indice));
RUN;
PROC PRINT Data=Paises2;
RUN;
