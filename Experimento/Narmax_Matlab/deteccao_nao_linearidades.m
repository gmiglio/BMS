clear all;
clc;

% Detecçao de não linearidades
load('dados');
%load('C_Bateria_A_72_Amostra_3.mat');
%load('C_Sim_SOC.mat');
%_________________________________________________________________________
Nr_Termos_1 = 40000;

time = 1:1:Nr_Termos_1/2;

% Entrada
% corrente_total = corrente_total';
u = corrente_total(time);
%u = Sim_Corrente.Data;
u = decimate(u, 100);

% Saída

y = SOC_CC(time);
%y = Sim_CC.Data;
y = decimate(y, 100);

u_linha = (u - mean(u))/var(u);
y_linha = (y - mean(y))/var(y);

u_linha_2 = u_linha.^2;
y_linha_2 = y_linha.^2;

x = (u_linha_2 - mean(u_linha_2))/var(u_linha_2);
v = (y_linha_2 - mean(y_linha_2))/var(y_linha_2);


Quant_Termos = length(u);
intervalo_95 = 1.96/(sqrt(Quant_Termos));
intervalo_90 = 1.645/(sqrt(Quant_Termos));



[xc,lags, CB] = crosscorr(x,y_linha, 200-1, 2);
subplot(211);
plot(lags, xc, '-k', lags, intervalo_95*ones(size(lags)), '--b', lags, (-1)*intervalo_95*ones(size(lags)), '--b', lags,intervalo_90*ones(size(lags)),'-.b', lags, (-1)*intervalo_90*ones(size(lags)), '-.b', 'LineWidth', 1);
set(gca, 'FontSize', 14);
title('Método da Correlação Cruzada');
xlabel('Atraso','FontWeight','bold');

subplot(212);
[yc, lags] = crosscorr(v, y_linha, 200-1, 2);
plot(lags, yc, '-k', lags, intervalo_95*ones(size(lags)), '--b', lags, (-1)*intervalo_95*ones(size(lags)), '--b', lags,  intervalo_90*ones(size(lags)),  '-.b', lags, (-1)*intervalo_90*ones(size(lags)), '-.', 'LineWidth', 1);
set(gca, 'FontSize', 14);
title('Método da Autocorrelação');
xlabel('Atraso','FontWeight','bold');
saveas(gcf, 'deteccao_nao_linearidades.png');



% xi = y_est - y_tx2;
% 
% v = (xi - mean(xi))/var(xi);
% 
% fig = figure('Units', 'characters', 'Position', [0 0 100 100]); %// gives x left, y bottom, width, height

% r_xixi
% subplot(411);
% [ac, lags, CB] = parcorr(xi, 50);
% plot(lags, ac, '-k', lags, CB(1)*ones(size(lags)), '--b', lags, CB(2)*ones(size(lags)), '--b');
% set(gca, 'FontSize', 14);
% title('Teste de Validação - r_{\xi}');
% xlabel('Atraso','FontWeight','bold');

%r_uxi
% subplot(412);
% [yc, lags] = crosscorr(u_tx2, xi, 10000, 2);
% plot(lags, yc, '-k', lags, 0.05*ones(size(lags)), '--b', lags, -0.05*ones(size(lags)), '--b');
% set(gca, 'FontSize', 14);
% title('Teste de Validação - r_{u\xi}');
% xlabel('Atraso','FontWeight','bold');

%r_u_linhaxi
% [yc, lags] = crosscorr(u_linha_2, xi, 10000, 2);
% subplot(413);
% plot(lags, yc, '-k', lags, 0.05*ones(size(lags)), '--b', lags, -0.05*ones(size(lags)), '--b');
% set(gca, 'FontSize', 14);
% title('Teste de Validação - r_{u^{`}\xi}');
% xlabel('Atraso','FontWeight','bold');

% %r_ulinha2xi2
% xi_2 = xi.^2;
% [yc, lags] = crosscorr(u_linha_2, xi_2, 10000, 2);
% subplot(414);
% plot(lags, yc, '-k', lags, 0.05*ones(size(lags)), '--b', lags, -0.05*ones(size(lags)), '--b');
% set(gca, 'FontSize', 14);
% 
% title('Teste de Validação - r_{u^2\xi^2}');
% xlabel('Atraso','FontWeight','bold');
% saveas(fig, 'r_Total.png');

% figure;
% A = [xi(:)  xi(:)  u_tx2(:), 'coeff'];
% [yc, lags] = xcorr(A);
% plot(lags, yc(:,1), '-k', lags, 0.05*ones(size(lags)), '--b', lags, -0.05*ones(size(lags)), '--b', 'LineWidth', 2);
% set(gca, 'FontSize', 18);
% title('Teste de Validação - \Phi_{\xi\xi u}');
% xlabel('Atraso','FontWeight','bold');
% saveas(gcf, 'r_xixiu.png');
