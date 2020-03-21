
clear all;
clc;

% Autocorrelação

%load('N_Bateria_B_60_Amostra_2.mat');
load('dados.mat');
corrente_total = corrente_total';

N = 15000;
CAPACIDADE = 60; % Ah

% Coulomb Counting
SOC_CC = zeros(N,1);
SOC_CC(1) = soc_total(1);
cte = 100/(CAPACIDADE*3600);
Corrente = corrente_total;

% Axis to hours
for i=2:1:N
    SOC_CC(i) = SOC_CC(i-1) + cte*Corrente(i);
end

y = SOC_CC;

N = 15000;
mean_y = mean(y)^2;
Y3 = sum((y.^2 - mean_y^2).^2);
r = [];

for k=1:1:N-1    
    Y0 = y(1:N-k).^2 - mean_y;
    Y1 = y(k:N-1).^2 - mean_y;
    r(k+1) = sum(Y0.*Y1)/Y3;
end

plot(r);
maxLag = 5000;
phi = [];
[phi, lags, CB] = crosscorr(y, y, 10000, 0.01);
figure
title('Autocorrelação');
plot(lags, phi, '-k', lags, CB(1)*ones(size(lags)), '--b', lags, CB(2)*ones(size(lags)), '--b')
ylabel('\Phi_{\xi\xi}')
xlim([-maxLag maxLag])

