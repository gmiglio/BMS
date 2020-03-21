function [numc,denc]=pmcont(typ,nump,denp,numd,dend,P,M,p,m);

% [numc,denc]=pmcont(type,nump,denp,numd,dend,P,M,p,m);
%
% Approximate model matching
% typ - type of approximation.
%     If type=1  => closed-loop model matching
%     If type~=1 => open-loop model matching
% numc/denc - controller transfer function
% nump/denp - plant transfer function
% numd/dend - reference model transfer function
% P - number of Pade coefficients to be matched
% M - number of Markov parameters to be matched
% p - controller numerator order
% m - controller denominator order
%
% Note that for exact Pade/Markov matching the following
% must hold: P + M = p + m + 1  for exact Pade/Markov retention
% if P+M>p+m+1 then the controller is obtained by least squares
% If M>0 then (n-q)+(m-p)<=pole/zero difference in numd/dend

% The nomenclature used is as in
% It should be noted however that c_0 is in c(1) and so on
% Luis A. Aguirre - Sheffield 26/10/93
% This version - 01/05/94

q=length(nump)-1;
n=length(denp)-1;
%
% P + M = p + m + 1
%

% Polynomial re-ordering

g=[nump(q+1:-1:1) zeros(1,5*(n+m-q))];
h=[denp(n+1:-1:1) zeros(1,5*m)];

% Test for integrators and determination of auxiliar model
I=0;
if typ==1
  flag=0;
  r=roots(denp);
  if h(1)==0,
    I=1;
    for i=2:n
      if r(i)==0,
        disp('WARNING! - Plant has more than one integrator');
        disp('Epsilon = 0.001 is being used');
        r(i)=-0.001;
        flag=1;
      end;
    end;
    if flag==1
      denp=real(poly(r));
      h=[denp(n+1:-1:1) zeros(1,m)];
    end;
  else
    I=0;
  end;
else
  auxp=1;
  for i=length(denp):-1:1
    if denp(i)==0
      auxp=conv(auxp,[1 0]);
    end;
  end;
  typep=length(roots(auxp));
  denp=deconv(denp,auxp);
  n=length(denp)-1;
  h=[denp(length(denp):-1:1) zeros(1,m)];
  auxd=1;
  for i=length(dend):-1:1
    if dend(i)==0
      auxd=conv(auxd,[1 0]);
    end;
  end;
  typed=length(roots(auxd));
  dend=deconv(dend,auxd);
  typec=typed-typep;
  %order of \bar{C}(s)
  if typec>0,
    m=m-typec;
    disp('The value of P+M must be reduced by: ');
    disp(typec);
    P=input('Enter new value of P: ');
    M=input('Enter new value of M: ');
  end;
end;

% Calculation of Pade and Markov parameters
c=mypade(numd,dend,P+3);
MM=mymarkov(numd,dend,M+5);

nu=1;
while MM(nu)==0,
      nu=nu+1;
end;
nu=nu-1;

% Matrix construction

GpI=zeros(P,p+1);        % GpI: P x p+1
Gp=zeros(P+I,p+1);       % Gp: P+I x p+1
if M>0,
  Gm=zeros(M,p+1);       % Gm: M x p+1
  Gn=zeros(M+nu-1,p+1);  % Gn: M+nu-1 x p+1
end;
for i=1:p+1
  if i<=P,
    Gp(i:P+I,i)=g(1:P+1+I-i)';
  else
    Gp(:,i)=zeros(P+I,1);
  end;
  if M>0,
    if n+m-nu-M+3-i>0,
       Gm(1:M,i)=g(n+m-nu+2-i:-1:n+m-nu-M+3-i)';
       Gn(1:M+nu-1,i)=g(n+m-nu-M+3-i:n+m+1-i)';
    else
      % Gm
      for j=1:M
        if n+m-nu-M+2-i+j>0,
          Gm(M+1-j,i)=g(n+m-nu-M+2-i+j);
        end;
      end;
      % Gn
      for j=1:M+nu-1
        if n+m-nu-M+2-i+j>0,
          Gn(j,i)=g(n+m-nu-M+2-i+j);
        end;
      end;
    end;
  end;
end;
% If integrator
if I==1,
  GpI=[g(2:P+1)' Gp(1:P,1:p)];
end;

% G1: 1 x p+1
G1=[zeros(1,p) g(n+1)];

Hp=zeros(P,m+1);           % Hp: P x m+1
if M>0,
  Hn=zeros(M+nu-1,m+1);    % Hn: M+nu-1 x m+1
end;
for i=1:m+1
  if i<=P,
    Hp(i:P+I,i)=h(1:P+1+I-i)';
  else
    Hp(:,i)=zeros(P,1);
  end;

  if M>0,
    if n+m-nu-M+3-i>0,
      Hn(1:M+nu-1,i)=h(n+m-nu-M+3-i:n+m+1-i)';
    else
      for j=1:M+nu-1
        if n+m-nu-M+2-i+j>0,
          Hn(j,i)=h(n+m-nu-M+2-i+j);
        end;
      end;
    end;
  end;
end;

% H1: 1 x m+1
H1=[zeros(1,m) h(n+1)];

% mm : M x 1
% mm=MM(nu+M:-1:nu+1);
mm=MM(nu+1:nu+M);

C=zeros(P,P+I);        % C: P x P+I
for i=1:P
  C(i:P,i)=c(1:P+1-i)';
end;
% If integrator
if I==1,
  C=[c(2:P+1)' C(:,1:P)];
end;

if M>0,                    % Mm: M x M+nu-1
  Mm=zeros(M-1,M+nu-1);    % A line is added below
end;
for i=1:M+nu-1
  if M-i>0,
    Mm(i:M-1,M+nu-i)=mm(1:M-i)';
  end;
end;
Mm=[zeros(1,M+nu-1);Mm];

% Information matrix
if typ==1
  if I==1
    FI=[GpI-C*Gp -C*Hp;G1 H1;Gm-Mm*Gn -Mm*Hn];
  else
    FI=[(eye(P)-C)*Gp -C*Hp;G1 H1;Gm-Mm*Gn -Mm*Hn];
  end;
else
  FI=[Gp -C*Hp;zeros(1,p+1) H1;Gm -Mm*Hn];
end;

% Vector Construction
Vector=[zeros(P,1);1;mm'];

% Controller determination
coeff=inv(FI'*FI)*FI'*Vector;
numc(1:p+1)=coeff(p+1:-1:1);
denc(1:m+1)=coeff(p+m+2:-1:p+2);

% If open-loop
if typ~=1,
  dif=length(auxd)-length(auxp);
  if dif~=0,
    auxc=poly(zeros(1,dif));
    denc=conv(denc,auxc);
  end;
end;
