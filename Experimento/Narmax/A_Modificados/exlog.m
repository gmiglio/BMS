% Exemplo identificação da eq. logisitica
% (c) Luis Aguirre, 22/01/99

% Carregar dados
%load exlog.dat;
%y=exlog;

% Linha Extra - Inclui esta linha
y = zeros(6,6);

y(1,1) = -2.8284;
y(1,2) = -1.2701;   y(2,2) =  0.9446;   
y(1,3) = -1.7023;   y(2,3) =  0.8170;   y(3,3) = -0.1641;
y(1,4) = -1.2874;   y(2,4) = -0.4957;   y(3,4) =  0.4364;   y(4,4) = -0.7097;
y(1,5) = -1.7113;   y(2,5) = -0.2807;   y(3,5) =  0.3867;   y(4,5) = -0.6961;
y(1,6) = -0.9264;   y(2,6) =  0.4001;   y(3,6) = -0.0263;   y(4,6) = -0.3622;   y(5,6) = -0.0383;   y(6,6) = -0.1232;

%clear exlog;

% Montar matriz de regressores
reg1=ones(8,1);		% constante
reg2=y(12:19);		% y(k-1)
reg3=y(11:18);		% y(k-2)
reg4=reg2.^2;		% y(k-1)^2
reg5=reg2.*reg3;	% y(k-1)y(k-2)
reg6=reg3.^2;		% y(k-2)^2

psi=[reg1 reg2 reg3 reg4 reg5 reg6];
vec=y(13:20);
Psi=[psi vec];

load exlog.dat;
y=exlog;
clear exlog;

% Montar matriz de regressores
reg1=ones(8,1);		% constante
reg2=y(12:19);		% y(k-1)
reg3=y(11:18);		% y(k-2)
reg4=reg2.^2;		% y(k-1)^2
reg5=reg2.*reg3;	% y(k-1)y(k-2)
reg6=reg3.^2;		% y(k-2)^2

psi=[reg1 reg2 reg3 reg4 reg5 reg6];
vec=y(13:20);
Psi=[psi vec];

[A,err,piv]=myhouse(Psi,6);
% numero de parametros no modelo final
np=3;
Psit=Psi(:,piv(1:np));
teta=inv(Psit'*Psit)*Psit'*vec
% numero de parametros no modelo final
np=3;
Psit=Psi(:,piv(1:np));
teta=inv(Psit'*Psit)*Psit'*vec

pause

%eliminando o regressor "constante" 

Psit=Psi(:,piv(2:3));
teta=inv(Psit'*Psit)*Psit'*vec

	