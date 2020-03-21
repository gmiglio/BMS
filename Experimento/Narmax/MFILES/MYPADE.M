function x = mypade(num,den,np)
% pade(num,den,np) determina os primeiros np coeficientes de Pade
% da funcao de transferencia G(s)=num(s)/den(s)

% Luis Antonio Aguirre
% B.H. 11/11/88, PPGEE - UFMG

% Organizacao dos coeficientes do num e den

d(1)=0;
e(1)=0;
clear d;
clear e;

d0=num(length(num));
for i=1:length(num)-1
  d(i)=num(length(num)-i);
end;
d(np+1)=0;

e(2*np)=0;
e0=den(length(den));
for i=1:length(den)-1
  e(i)=den(length(den)-i);
end;

% Calculo de c's

C(np-1)=0;
C0=d0/e0;
C(1)=(d(1)-e(1)*C0)/e0;
for k=2:np-1
s=0;
for j=1:k-1
    s=s+e(j)*C(k-j);
end;
s=s+e(k)*C0;
C(k)=(d(k)-s)/e0;
end;

x=[C0 C];

