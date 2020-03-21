function [num,den]=lspademk(no,do,ep,em,rp,C,mk)
% [num den]=lspademk(no,do,ep,em,rp,C,mk)
% Computes a reduced order model using the LS-Pade method
% The reduced model has numerator order no and denominator order do
% Using ep extra Pade coefficients, em extra Markov parameters
% and reatining approximately the poles in vector rp
% The Pade coefficients C0, C1, ... are assumed to be in vector C
% The Markov parameters  mk1, mk2 ... are assumed to be in vector mk

% Luis Antonio Aguirre - Sheffield 27/11/90

fm=0;
m=[0; mk'];

% numerator
n=0;
clear n;
ndee1=no+do+ep+em+1;
nde1=no+do+ep+1;
n(ndee1,no+1)=0;
% Pade
for i=1:no+1
  n(1:nde1,i)=[zeros(i-1,1); -1; zeros(nde1-i,1)];
end;
if em ~= 0
  % Markov
  id=eye(no+1);
  nn=0;
  clear nn;
  nn(em,no+1)=0;
  if em<=no+1
    for i=1:em
      for j=1:no+1
        nn(i,j)=id(i,no+2-j);
      end;
    end;
  else
    for i=1:no+1
      for j=1:no+1
        nn(i,j)=id(i,no+2-j);
      end;
    end;
  end;
  [lin,col]=size(nn);
  n(nde1+1:nde1+lin,1:no+1)=nn;
end;



% denominator - Pade
d=0;
clear d;
d(ndee1,do)=0;
d(1:nde1,1)=C(1:nde1)';
for i=2:do
  d(1:nde1,i)=[zeros(i-1,1); C(1:nde1-i+1)'];
end;
% denominador - Markov
if em ~= 0
  d(nde1+1:ndee1,do)=-m(fm+1:fm+em);
  if em>=do
    for i=do-1:-1:1
      d(nde1+1:ndee1,i)=[zeros(do-i,1); d(nde1+1:ndee1-do+i,do)];
    end;
  else
    dd(1:do,do)=-m(fm+1:fm+do);
    for i=do-1:-1:1
      dd(1:do,i)=[zeros(do-i,1); dd(1:i,do)];
    end;
    for j=1:em
      for i=do-1:-1:1
        d(nde1+j,i)=dd(j,i);
      end;
    end;
  end;
end;


G=[n d];
[lg cg]=size(G);
c=[zeros(no+1,1); -C(1:nde1-no-1)'; m(fm+2:fm+em+1)];

r=0;
clear r;
lrp=length(rp);

% if there are poles to be "retained"
if rp ~= 0
  for i=1:lrp
    for j=1:do
      r(i,j)=rp(i)^(j-1);
    end;
    cr(i)=-rp(i)^do;
  end;
  G=[G;[zeros(lrp,no+1) r]];
  c=[c;cr'];
end;

% LS-Pade
GG=G'*G;
coef=inv(GG)*G'*c;

% coefficient determination
num=troca(coef(1:no+1));
den=[1 troca(coef(no+2:length(coef)))];
% steady-state gain match
num(length(num))=C(1)*den(length(den));

