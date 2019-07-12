/* programa ejemplo del programa de regresión */
Data arv;
input y x1 x2 x3;
cards;
65 41 79 35
78 71 48 53
82 90 80 64
86 80 81 59
87 93 61 66
90 90 70 64
93 87 96 62
96 95 84 67
104 100 78 70
113 101 96 71
;
Proc Reg;
Model Y = x1 x2 x3 / p clm cli ss1 ss2;
Run;
