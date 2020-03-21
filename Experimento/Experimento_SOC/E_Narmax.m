% Guilherme Miglio Doxa
clear all; clc; close all;

%%

cd('A_Cap_72_Bateria_A_Amostra_1');
load('Bat_A_72_Amostra_1.mat');

% Carrega os dados dos arquivos;
load('Ceraolo_SoC.mat');
% Carrega os dados dos arquivos;
load('Shephard_SoC_Simulado.mat');
% Número de amostras
N = 15000;

%%
% Calculo dos regressores
u_tx1 = Corrente;
y_tx1 = Est_Carga;
m = length(y_tx1);
yest0 = y_tx1; 

% Faz-se yest igual a y para poder pegar as 22 primeiras
% amostras como estados inicial
% Montar o banco dos regressores
Regressores =  {'1 ';
                'u(k-1) ';
                'u(k-2) ';
                'u(k-3) ';
                'yest0(k-1) ';
                'yest0(k-2) ';
                'yest0(k-3) ';
                'u(k-1).^2 ';
                'u(k-1)*u(k-2) ';
                'u(k-1)*u(k-3) ';
                'u(k-2).^2 ';
                'u(k-2)*u(k-3) ';
                'u(k-3).^2 ';
                'yest0(k-1)*u(k-1) ';
                'yest0(k-1)*u(k-2) ';
                'yest0(k-1)*u(k-3) ';
                'yest0(k-2)*u(k-1) ';
                'yest0(k-2)*u(k-2) ';
                'yest0(k-2)*u(k-3) ';
                'yest0(k-3)*u(k-1) ';
                'yest0(k-3)*u(k-2) ';
                'yest0(k-3)*u(k-3) ';
                'yest0(k-1).^2 ';
                'yest0(k-1)*yest0(k-2) ';
                'yest0(k-1)*yest0(k-3) ';
                'yest0(k-2).^2 ';
                'yest0(k-2)*yest0(k-3) ';
                'yest0(k-3).^2 ';
                'u(k-1).^3 ';
                'u(k-1).^2*u(k-2) ';
                'u(k-1).^2*u(k-3) ';
                'u(k-1)*u(k-2).^2 ';
                'u(k-1)*u(k-2)*u(k-3) ';
                'u(k-1)*u(k-3).^2 ';
                'u(k-2).^3 ';
                'u(k-2).^2*u(k-3) ';
                'u(k-2)*u(k-3).^2 ';
                'u(k-3).^3 ';
                'yest0(k-1)*u(k-1).^2 ';
                'yest0(k-1)*u(k-1)*u(k-2) ';
                'yest0(k-1)*u(k-1)*u(k-3) ';
                'yest0(k-1)*u(k-2).^2 ';
                'yest0(k-1)*u(k-2)*u(k-3) ';
                'yest0(k-1)*u(k-3).^2 ';
                'yest0(k-2)*u(k-1).^2 ';
                'yest0(k-2)*u(k-1)*u(k-2) ';
                'yest0(k-2)*u(k-1)*u(k-3) ';
                'yest0(k-2)*u(k-2).^2 ';
                'yest0(k-2)*u(k-2)*u(k-3) ';
                'yest0(k-2)*u(k-3).^2 ';
                'yest0(k-3)*u(k-1).^2 ';
                'yest0(k-3)*u(k-1)*u(k-2) ';
                'yest0(k-3)*u(k-1)*u(k-3) ';
                'yest0(k-3)*u(k-2).^2 ';
                'yest0(k-3)*u(k-2)*u(k-3) ';
                'yest0(k-3)*u(k-3).^2 ';
                'yest0(k-1).^2*u(k-1) ';
                'yest0(k-1).^2*u(k-2) ';
                'yest0(k-1).^2*u(k-3) ';
                'yest0(k-1)*yest0(k-2)*u(k-1) ';
                'yest0(k-1)*yest0(k-2)*u(k-2) ';
                'yest0(k-1)*yest0(k-2)*u(k-3) ';
                'yest0(k-1)*yest0(k-3)*u(k-1) ';
                'yest0(k-1)*yest0(k-3)*u(k-2) ';
                'yest0(k-1)*yest0(k-3)*u(k-3) ';
                'yest0(k-2).^2*u(k-1) ';
                'yest0(k-2).^2*u(k-2) ';
                'yest0(k-2).^2*u(k-3) ';
                'yest0(k-2)*yest0(k-3)*u(k-1) ';
                'yest0(k-2)*yest0(k-3)*u(k-2) ';
                'yest0(k-2)*yest0(k-3)*u(k-3) ';
                'yest0(k-3).^2*u(k-1) ';
                'yest0(k-3).^2*u(k-2) ';
                'yest0(k-3).^2*u(k-3) ';
                'yest0(k-1).^3 ';
                'yest0(k-1).^2*yest0(k-2) ';
                'yest0(k-1).^2*yest0(k-3) ';
                'yest0(k-1)*yest0(k-2).^2 ';
                'yest0(k-1)*yest0(k-2)*yest0(k-3)';
                'yest0(k-1)*yest0(k-3).^2 ';
                'yest0(k-2).^3 ';
                'yest0(k-2).^2*yest0(k-3) ';
                'yest0(k-2)*yest0(k-3).^2 ';
                'yest0(k-3).^3 '; };
% % Montar matriz de regressores
    reg1 = ones((m-3),1); % constante
    reg2 = u_tx1(3:(m-1)); % u(k-1)
    reg3 = u_tx1(2:(m-2)); % u(k-2)
    reg4=u_tx1(1:(m-3)); % u(k-3)
    reg5=y_tx1(3:(m-1)); % y(k-1)
    reg6=y_tx1(2:(m-2)); % y(k-2)
    reg7=y_tx1(1:(m-3)); % y(k-3)
    reg8=reg2.^2; % u(k-1).^2
    reg9=reg2.*reg3; % u(k-1)*u(k-2)
    reg10=reg2.*reg4; % u(k-1)*u(k-3)
    reg11=reg3.^2; % u(k-2).^2
    reg12=reg3.*reg4; % u(k-2)*u(k-3)
    reg13=reg4.^2; % u(k-3).^2
    reg14=reg5.*reg2; % y(k-1)*u(k-1)
    reg15=reg5.*reg3; % y(k-1)*u(k-2)
    reg16=reg5.*reg4; % y(k-1)*u(k-3)
    reg17=reg6.*reg2; % y(k-2)*u(k-1)
    reg18=reg6.*reg3; % y(k-2)*u(k-2)
    reg19=reg6.*reg4; % y(k-2)*u(k-3)
    reg20=reg7.*reg2; % y(k-3)*u(k-1)
    reg21=reg7.*reg3; % y(k-3)*u(k-2)
    reg22=reg7.*reg4; % y(k-3)*u(k-3)
    reg23=reg5.^2; % y(k-1).^2
    reg24=reg5.*reg6; % y(k-1)*y(k-2)
    reg25=reg5.*reg7; % y(k-1)*y(k-3)
    reg26=reg6.^2; % y(k-2).^2
    reg27=reg6.*reg7; % y(k-2)*y(k-3)
    reg28=reg7.^3; % y(k-3).^2
    reg29=reg2.^2; % u(k-1).^3
    reg30=(reg2.^2).*reg3; % u(k-1).^2*u(k-2)
    reg31=(reg2.^2).*reg4; % u(k-1).^2*u(k-3)
    reg32=reg2.*reg3.^2; % u(k-1)*u(k-2).^2
    reg33=reg2.*reg3.*reg4; % u(k-1)*u(k-2)*u(k-3)
    reg34=reg2.*reg4.^2; % u(k-1)*u(k-3).^2
    reg35=reg3.^3; % u(k-2).^3
    reg36=(reg3.^2).*reg4; % u(k-2).^2*u(k-3)
    reg37=reg3.*reg4.^2; % u(k-2)*u(k-3).^2
    reg38=reg4.^3; % u(k-3).^3
    reg39=reg5.*reg2.^2; % y(k-1)*u(k-1).^2
    reg40=reg5.*reg2.*reg3; % y(k-1)*u(k-1)*u(k-2)
    reg41=reg5.*reg2.*reg4; % y(k-1)*u(k-1)*u(k-3)
    reg42=reg5.*reg3.^2; % y(k-1)*u(k-2).^2
    reg43=reg5.*reg3.*reg4; % y(k-1)*u(k-2)*u(k-3)
    reg44=reg5.*reg4.^2; % y(k-1)*u(k-3).^2
    reg45=reg6.*reg2.^2; % y(k-2)*u(k-1).^2
    reg46=reg6.*reg2.*reg3; % y(k-2)*u(k-1)*u(k-2)
    reg47=reg6.*reg2.*reg4; % y(k-2)*u(k-1)*u(k-3)
    reg48=reg6.*reg3.^2; % y(k-2)*u(k-2).^2
    reg49=reg6.*reg3.*reg4; % y(k-2)*u(k-2)*u(k-3)
    reg50=reg6.*reg4.^2; % y(k-2)*u(k-3).^2
    reg51=reg7.*reg2.^2; % y(k-3)*u(k-1).^2
    reg52=reg7.*reg2.*reg3; % y(k-3)*u(k-1)*u(k-2)
    reg53=reg7.*reg2.*reg4; % y(k-3)*u(k-1)*u(k-3)
    reg54=reg7.*reg3.^2; % y(k-3)*u(k-2).^2
    reg55=reg7.*reg3.*reg4; % y(k-3)*u(k-2)*u(k-3)
    reg56=reg7.*reg4.^2; % y(k-3)*u(k-3).^2
    reg57=(reg5.^2).*reg2; % y(k-1).^2*u(k-1)
    reg58=(reg5.^2).*reg3; % y(k-1).^2*u(k-2)
    reg59=(reg5.^2).*reg4; % y(k-1).^2*u(k-3)
    reg60=reg5.*reg6.*reg2; % y(k-1)*y(k-2)*u(k-1)
    reg61=reg5.*reg6.*reg3; % y(k-1)*y(k-2)*u(k-2)
    reg62=reg5.*reg6.*reg4; % y(k-1)*y(k-2)*u(k-3)
    reg63=reg5.*reg7.*reg2; % y(k-1)*y(k-3)*u(k-1)
    reg64=reg5.*reg7.*reg3; % y(k-1)*y(k-3)*u(k-2)
    reg65=reg5.*reg7.*reg4; % y(k-1)*y(k-3)*u(k-3)
    reg66=(reg6.^2).*reg2; % y(k-2).^2*u(k-1)
    reg67=(reg6.^2).*reg3; % y(k-2).^2*u(k-2)
    reg68=(reg6.^2).*reg4; % y(k-2).^2*u(k-3)
    reg69=reg6.*reg7.*reg2; % y(k-2)*y(k-3)*u(k-1)
    reg70=reg6.*reg7.*reg3; % y(k-2)*y(k-3)*u(k-2)
    reg71=reg6.*reg7.*reg4; % y(k-2)*y(k-3)*u(k-3)
    reg72=(reg7.^2).*reg2; % y(k-3).^2*u(k-1)
    reg73=(reg7.^2).*reg3; % y(k-3).^2*u(k-2)
    reg74=(reg7.^2).*reg4; % y(k-3).^2*u(k-3)
    reg75=(reg5.^3); % y(k-1).^3
    reg76=(reg5.^2).*reg6; % y(k-1).^2*y(k-2)
    reg77=(reg5.^2).*reg7; % y(k-1).^2*y(k-3)
    reg78=reg5.*reg6.^2; % y(k-1)*y(k-2).^2
    reg79=reg5.*reg6.*reg7; % y(k-1)*y(k-2)*y(k-3)
    reg80=reg5.*reg7.^2; % y(k-1)*y(k-3).^2
    reg81=reg6.^3; % y(k-2).^3
    reg82=(reg6.^2).*reg7; % y(k-2).^2*y(k-3)
    reg83=reg6.*reg7.^2; % y(k-2)*y(k-3).^2
    reg84=reg7.^3; % y(k-3).^3
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % Determinação da Estrutura %
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
psi=[reg1 reg2 reg3 reg4 reg5 reg6 reg7 reg8 reg9 reg10 reg11 reg12 reg13...
reg14 reg15 reg16 reg17 reg18 reg19 reg20 reg21 reg22 reg23 reg24 reg25...
reg26 reg27 reg28 reg29 reg30 reg31 reg32 reg33 reg34 reg35 reg36 reg37...
reg38 reg39 reg40 reg41 reg42 reg43 reg44 reg45 reg46 reg47 reg48 reg49...
reg50 reg51 reg52 reg53 reg54 reg55 reg56 reg57 reg58 reg59 reg60 reg61...
reg62 reg63 reg64 reg65 reg66 reg67 reg68 reg69 reg70 reg71 reg72 reg73...
reg74 reg75 reg76 reg77 reg78 reg79 reg80 reg81 reg82 reg83 reg84];
vec = y_tx1(4:m); %define vec como as amostras que se deseja identificar do
% vetor de medidas
Psi={psi vec};

