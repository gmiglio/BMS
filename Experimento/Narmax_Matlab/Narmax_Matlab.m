clear all;
clc;

% load data
load('dados.mat');

% Carrega dados da amostragem

u = corrente_total(1:15000)';
y = SOC_CC(1:15000);

% Dados de treinamento
z = iddata(y, u, 1);
ze = z; 

% Dados de comprovação

% Carrega dados da amostragem

u = corrente_total(20001:40000)';
y = SOC_CC(20001:40000);

z = iddata(y, u, 1);
zv = z;



C1 = customreg(@(x)x^2, {'u1'}, 1);
C2 = customreg(@(y)y^2, {'y1'}, 1);


C = [C1, C2];

% Processa os dados
m6 = nlarx(ze, [0 0 0], 'linear', 'CustomRegressors', C);
m1 = nlarx(ze, [2 2 1], sigmoidnet('NumberOfUnits', 10));
m2 = nlarx(ze, [3 3 1], sigmoidnet('NumberOfUnits', 30));
m3 = nlarx(ze, [3 3 1], sigmoidnet('NumberOfUnits', 60));
m5 = nlarx(ze, [5 5 1], sigmoidnet('NumberOfUnits', 85));

compare(zv, m1, m2, m3, m5);
u = corrente_total(20001:40000)';
y = SOC_CC(20001:40000);
zv = iddata(y, u, 1);


