function x = mymarkov(num,den,np)
% markov(num,den,np) returns the first np Markov parameters of
% the transfer function which numerator is num and denominator
% is den

% Luis Antonio Aguirre
% B.H. 28/06/90, PPGEE - UFMG

if length(num)==length(den)
  m=num(1)/den(1);
else
  m=0;
end;

% Representacao do sistema no espaco de estado

[aa,bb,cc,dd]=tf2ss(num,den);

% Calculo dos parametros de Markov

for i=1:np
 mx(i)=cc*aa^(i-1)*bb;
end;
x=[m mx];



