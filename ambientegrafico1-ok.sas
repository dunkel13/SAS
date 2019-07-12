/* ############################### USO DE LA INTERPOLACION NEEDLE Y DOS EJES VERTICALES##########
 Define ambiente grafico*/
goptions reset=global gunit=pct border cback=white 
colors=(black blue green red) ftext=swiss ftitle=swissb  htitle=6 htext=3;
/* Crea el conjunto de datos MINNTEMP leyendo sólo las columnas de las varibles mes(la segunda variable que inicia en la décima columna en los datos)
y de la variable f2 (que inicia despues de la columna 23)*/
data minntemp;
input @10 mes @23 f2; /*Temperatura fahrenheit para Minneapolis*/
/* Calcula temperatura en grados centigrados*/
/* para Minneapolis                        */
c2=(f2-32)/1.8;
output;
datalines;
01JAN83  1    1   40.5  12.2  52.1
01FEB83  2    1   42.2  16.5  55.1
01MAR83  3    2   49.2  28.3  59.7
01APR83  4    2   59.5  45.1  67.7
01MAY83  5    2   67.4  57.1  76.3
01JUN83  6    3   74.4  66.9  84.6
01JUL83  7    3   77.5  71.9  91.2
01AUG83  8    3   76.5  70.2  89.1
01SEP83  9    4   70.6  60.0  83.8
01OCT83  10   4   60.2  50.0  72.2
01NOV83  11   4   50.0  32.4  59.8
01DEC83  12   1   41.2  18.6  52.5
;
run;
/*Define títulos y notas de pie*/
title1 'Temperatura promedio mensual para Minneapolis';
footnote1 j=1 'Fuente: 1984 American Express';
footnote2 j=1 '        Appointment Book';
/*Define caracteristicas de símbolos*/
symbol1 interpol=needle ci=blue cv=red  value=star height=3;
symbol2 interpol=none value=none;
/*Define características del eje horizontal*/
axis1 label=none value=( 'ENE' 'FEB' 'MAR' 'ABR' 'MAY' 'JUN' 'JUL' 'AGO' 'SEP' 'OCT' 'NOV' 'DIC')
offset=(2) width=3;
/*Define características del eje vertical izquierdo*/
axis2 label=(h=3 'Grados' justify=right 'Centigrados') order=(-20 to 30 by 10)
width=3 value=(h=3);
/*Define características del eje vertical derecho*/
axis3 label=(h=3 'Grados' justify=left "Fahrenheit") order=(-4 to 86 by 18)
width=3 value=(h=3);
/*Genera un gráfico con un segundo eje vertical*/
proc gplot data= minntemp;
plot c2*mes / frame caxis=red haxis=axis1 hminor=0 vaxis=axis2 vminor=1;
plot2 f2*mes / caxis=red vaxis=axis3 vminor=1;
run;
quit;


/* ########################### SUPONIENDO SERIES DE TIEMPO EN UN MISMO GRAFICO################# Define ambiente grafico*/
goptions reset=global gunit=pct border cback=white 
colors=(black blue green red) 
ftitle=swissb ftext=swiss htitle=6 htext=3;
/*Lectura de datos sobre series de componentes del PIB de E.U*/
data cinco;
infile'C:\Documents and Settings\Propietario\Mis documentos\clases\docum para clases\estadística 3\diebold\FCST03\STYLEKP.dat' firstobs=2;
input AGRICULTURE MANUFACTURING RETAIL SERVICES;
run;
/*Crea variable fecha y etiqueta variables originales*/
data seis;
set cinco;
fecha=intnx('year','31dec1959'd,_n_);
format fecha year7.;
t+1; /*crea la variable T comenzando desde 1 hasta el total de las observaciones*/
year=year(fecha);
label	agriculture='agricultura' /*etiqueta las variables indicadas con los labels dados*/
	manufacturing='manufactura'
	retail='comercio'
	services='servicios';
run;

/*Define titulos y pie de notas*/
title1 'Componentes PIB E.U 1960-1989' ;
footnote1 h=3 j=1 'fuente: Elementos de pronostico, F. Diebold';
/*Define simbolos de graficación, interpolación, color y tipo de lineas para las cuatro series*/
symbol1 i=join v=star c=black h=4;
symbol2 i=join v=circle c=black l=2 h=4;
symbol3 i=join v=diamond c=black l=3 h=4;
symbol4 i=join v=dot c=black l=4 h=4;
/*Define leyenda del eje vertical */
axis2 label=(h=3 'miles' justify=right 'dolares');
/*Define caracteristicas de leyenda del grafico.LABEL= Suprime la etiqueta de la leyenda. SHAPE= especifica un ancho y alto para los valores de la 
leyenda. POSITION= centra la leyenda dentro de la parte superior del marco de ejes. MODE= Comparte el área de la leyenda con los otros elementos gráficos*/
legend1 label=none
shape=symbol(4,2)
position=(top center inside)
mode=share;
/*realiza grafico de las cuatro  series componentes superpuestas y utiliza las leyendas de cada serie y del eje vertical previamente definidas*/
proc gplot data=seis;
plot (agriculture manufacturing retail services)*fecha/overlay legend=legend1 vaxis=axis2;
run;
quit;

/* Define ambiente grafico*/
goptions reset=global gunit=pct border cback=white 
colors=(black blue green red) ctext=black 
ftitle=swissb ftext=swiss htitle=6 htext=3;
/*Lectura de datos sobre series de componentes del PIB de E.U*/

/*Crea variable fecha y etiqueta variables originales*/
data seis;
set cinco;
fecha=intnx('year','31dec1959'd,_n_);
format fecha year7.;
t+1; /*crea la variable T comenzando desde 1 hasta el total de las observaciones*/
year=year(fecha);
label	agriculture='agricultura' /*etiqueta las variables indicadas con los labels dados*/
	manufacturing='manufactura'
	retail='comercio'
	services='servicios';
run;

/*Define titulos y pie de notas*/
title1 'Componentes PIB E.U 1960-1989' ;
footnote1 h=3 j=1 'fuente: Elementos de pronostico, F. Diebold';
/*Define simbolos de graficación*/
symbol1 i=join v=none c=black width=4 h=4;
symbol2 i=join v=none c=red width=4 h=4;
symbol3 i=join v=none c=green width=4 h=4;
symbol4 i=join v=none c=gray width=4 h=4;
axis2 label=(h=3 'miles' justify=right 'dolares');
/*Define leyenda del eje vertical */
legend1 label=none
shape=symbol(4,2)
position=(top left inside)
mode=share;
/*Grafica las cuatro  series mediante resalte de las areas entre ellas. Las series deben nombrarse en la declaración plot en orden de menor a mayor*/
proc gplot data=seis;
plot (agriculture retail services manufacturing)*fecha/overlay legend=legend1 vaxis=axis2
areas=4;
run;
quit;
proc gplot data=seis;
plot (agriculture manufacturing retail services)*fecha/overlay legend=legend1 vaxis=axis2;
run;
quit;
