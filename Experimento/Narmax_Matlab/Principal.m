
%_______________________________________________________
%
% Indetifica��o de Sistemas
%
%_______________________________________________________

load('dados.mat');

data = corrente_total';
data = data(1:20000);
time = 1:1:20000;

Sim_Corrente = timeseries(data, time);

data = SOC_CC(1:20000);
Sim_SoC = timeseries(data, time);
% % load data
% load('Bat_A_72_Amostra_1.mat');
% 
% % Entrada e Sa�da 
% un = Corrente;
% yn = Est_Carga;
% 
% % Inicializa��o das vari�veis
% % Atraso no transporte
% d = 0;
% 
% % Intera��es do MQE
% nit = 30;
% l = 2;
% 
% % Ordem M�xima do sistema escolhida
% ordem = 4;
% passo = 1;
% 
% % Normalizado, devido a erros num�ricos, faixas de valores com ordem
% % de grandeza diferentes
% Nmax = 1;
% Nmin = -1;
% 
% MaxUn = 0.8472;
% MinUn = 0.6210;
% 
% un = un(1:passo:end-d);
% un = normaliza(un, Nmax, Nmin, MaxUn, MinUn);
% 
% % Sa�da do sistema real
% maxY = 2.5;
% minY = 0.1;
% 
% yn = yn(d+1:passo:end)';
% yn = normaliza(yn, Nmax, Nmin, maxY, minY);
% 
% % Algoritmo 1
% [permu, nu, ny, nt, qe, qs, 1] = permuta(1, ordem, 1, 1, d, 0);
% 
% % Algoritmo 2
% [P, Y] = monta_regressores(yn, un, 1, nu, ny, qe, qs, permu);
% 
% % Algoritmo 3
% [tetaest, L, ERR, AIC4, BIC, TetaMQ] = MGS_AmandaDantas(P, Y', yn, un, nit, permu, ordem);
% 
% % Algoritmo 4
% [yest, erro, yn] = validacaoBi(yn, un, tetaest', L, nu, ny, qs, qe, permu, 1);
% 
% yn = desnormaliza(yn, Nmax, Nmin, maxY, minY);
% yest = desnormaliza(yest, Nmax, Nmin, maxY, minY);
% un = desnormaliza(un, Nmax, Nmin, MaxUn, MinUn);
% 
% % Erro de Estima��o
% erro = yn - yest;
% 
% % M�dia entre a sa�da real e a sa�da estimada
% mean(abs(yest-yn));






