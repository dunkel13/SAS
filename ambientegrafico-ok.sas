/*Definición del ambiente gráfico.*/
goptions reset=global gunit=pct border cback=white
colors=(black blue green red)
ftitle=swissb ftext=swiss htitle=5 htext=4;
/* Creando el conjunto de datos*/
data trabajos;
length ing $5; /*Define longitud de la variable ing.*/
input ing pesos num;
datalines;
Civil	2730800	73273
Aero	2984400	70192
Elec	2292000	89382
Mech	3281600	19601
Chem	2811600	25541
Petro	1844400	34833
;
run;

/* Define titulos y notas de pie.*/
title1 'Perfiles de los Miembros' ;
title2 'Salarios y Numero de Ingenieros Miembros';
footnote h=3 j=r 'Datos del SAS.HELP';
/* Define caracteristica de los ejes. OFFSET= especifica un offset  para las marcas de los ejes de modo que las burbujas cercanas a los ejes no sean recortadas.*/
axis1 offset=(5,5);
/* Genera bubble plot. HAXIS= asigna la declaración AXIS1 al ej horizontal. Los salarios promedio son asignados en formato dólares*/
proc gplot data=trabajos;
format pesos dollar11.;
bubble pesos dollar 11.;
bubble pesos*ing=num / haxis=axis1;
run;
quit; 

/* Define el ambiente grafico*/
goptions reset=global gunit=pct border cback=white
colors=(black blue green red)
ftitle=swissb ftext=swiss htitle=6 htext=4;
/* Define titulo y notas de pie.*/
title1 'Perfiles de los Miembros';
title2 h=4 'Salarios y Numero de Ingenieros Miembros';
footnote1 h=3 j=1 'Datos del SAS.HELP' ;
/* Define caracteristica de los ejes. AXIS1 suprime la etiqueta del eje horizontal y usa OFFSET= para mover el primer y el ultimo valor de marca
principal del eje lejos de los ejes verticales así las burbujas no son recortadas. AXIS2 usa ORDER para ajustar los intervalos de las marcas 
principales de eje vertical; aunque esto puede hacerse con VAXIS= en la declaración BUBBLE, puede no suprimir la etiqueta del eje y alterar otras caracteristicas*/
axis1 label=none offset=(5,5) width=3 value=(height=4);
axis2 order=(0 to 4000000 by 1000000) label=none major=(height=1.5) minor=(height=1)
width=3 value=(height=4);
/* Genera bubble plot. VWINOR= especifica una marca de tick menor para el eje vertical. BCOLOR= especifica los colores de las burbujas;BLABEL etiqueta las burbujas 
con los valores de la variable num y BFONT= espeifica la fuente para el texto. BSIZE= incrementa el tamaño de las burbujas aumentando el tamaño  del factor de 
escala a 12. CAXIS= define el color de las lineas de los ejes y de todas las marcas en estos*/
proc gplot data=trabajos;
format pesos dollar11. num comma7.0;
bubble pesos*ing=num / haxis=axis1
vaxis=axis2 vminor=1 bcolor=red
blabel bfont=swissi bsize=12
caxis=blue;
run;
quit;

/* Define el ambiente grafico*/
goptions reset=global gunit=pct border cback=white colors=(black blue green red)
ftitle=swissb ftext=swiss htitle=6 htext=3;
/* Crea el conjunto de datos trabajos2 y calcula la variable YEN. El paso DATA usa una declaración SET para leer el conjunto el conjunto de datos en el archivo
trabajos*/
data trabajos2;
set trabajos;
yen=pesos*125/3000;run;
/* Define titulo y notas de pie.*/
title1 'Perfiles de los M';
title2 h=4 'Salarios y Numero de Ing';
footnote j=r 'Datos del SAS.HELP' ;
/* Define caracteristicas del eje horizontal.*/
axis1 offset=(5,5) label=none width=3 value=(h=4);
/*Genera el bubble plot con un segundo eje vertical. En la declaración BUBBLE , HAXIS especifica la definición AXIS1 y VAXIS= escala el eje izquierdo. 
En la declaración BUBBLE2 , VAXIS escala el eje derecho. Ambos ejes representan el mismo rango de valores monetarios. Las declaraciones BUBBLE y BUBBLE2 
aseguran que las burbujas generadas por cada declaración son identicas coordinando las especificaciones en BCOLOR=, que genera colores para las burbujas,
BSIZE= increnmenta el tamaño del factor de la escala a 12 y CAXIS= especifica el color de sus ejes y de sus marcas. Las etiquetas de los ejes y los
valores de sus marcas usan el color por defecto, el cual es el primer color en la lista de colores*/
proc gplot data=trabajos2;
format pesos dollar11. num yen comma11.0;
bubble pesos*ing=num / haxis=axis1
vaxis=960000 to 4800000 by 1200000 hminor=0 vminor=1
blabel bfont=swissi bcolor=red bsize=12 caxis=blue;
bubble2 yen*ing=num / vaxis=40000 to 200000 by 50000
vminor=1 bcolor=red bsize=12 caxis=blue;
run;quit;
