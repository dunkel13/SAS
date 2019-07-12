/*modelos generalizados*/
/*Y ~ bin (mi, pi), funcion de ligacion logistica*/
proc iml;
  y={44,42,24,16,6,0.002};  
  m={50,49,46,48,50,49};
  d={10.2,7.7,5.1,3.8,2.6,0.0};
  pi=y/m;
  eta=log(y/(m-y));  
  print pi;
  n=nrow(y);
  x=j(n,1,1)||d;
  print x;
  *b0=inv(t(x)*x)*t(x)*eta;
  b0=inv(t(x)*x)*t(x)*pi;
  print b0;eps=0.000001;t=1;
  maxiter=1000;
  do iter=1 to maxiter while (t>eps);
    eta=x*b0;
	*print eta;
	mu=j(n,1,0);
	z=j(n,1,0);
	w=j(n,n,0);
	do i=1 to n;
	  *mu[i]=pi[i]*m[i];
	  mu[i]=m[i]*exp(eta[i])/(1+exp(eta[i]));
      z[i]=eta[i]+(y[i]-mu[i])*m[i]/(mu[i]*(m[i]-mu[i]));
	  w[i,i]=1/m[i]*mu[i]*(m[i]-mu[i]);	  
	end;
	b0m1=ginv(t(x)*w*x)*t(x)*w*z;
	t=max(abs(b0m1-b0)/b0);	
	b0=b0m1;
	print t eps;
	print iter eta mu z b0;
	print w;    	
  end;  
quit;  
/*data teste;
input x y m;
y1=log(y/(m-y));
cards;
10.2 44 50
7.7 42 49 
5.1 24 46
3.8 16 48
2.6 6 50
0 0.002 49
;
proc reg;
model y1=x;
run;quit;*/
