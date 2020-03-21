
% Este arquivo  prepara os dados para a simulação,
% criando as timeseries para rodar no modelo de Shephard e
% Ceraolo

% Guilherme Miglio Doxa
clear all; clc;

cd('G_80_70');
load('G_SOH_80_70.mat');

N = 15000;
time = 1:1:N;

Range = [2 200 1500];
Calc_Corrente = [];
for i=1:1:N
    Calc_Corrente(i) = (Corrente(i) - 32769)*Range(Corrente_Range(i) + 1)/65534;
end


data = Temperatura(time);
Sim_Temperatura = timeseries(data, time);

data = Calc_Corrente(time);
Sim_Corrente = timeseries(data, time);

data = Tensao(time);
Sim_Tensao = timeseries(data, time);

data = Est_Carga(time);
Sim_Est_Carga = timeseries(data, time);


% Coulomb Counting
Bat_CC = zeros(N,1);
Bat_CC(1) = Est_Carga(1);
cte = 100/(60*3600);

% Axis to hours
for i=2:1:N
    Bat_CC(i) = Bat_CC(i-1) + cte*Calc_Corrente(i);
end

data = Bat_CC;
Sim_CC = timeseries(data, time);


% figure('Color',[1 1 1]);
% hist(Calc_Corrente, 100);
% 
% set(gca,'FontName', 'Times New Roman');
% set(gca, 'FontSize', 18);
% set(gca, 'Linewidth', 2);
% 
% title('Frequência da Corrente');
% 
% set(gca, 'XTick', [-50 -40 -30 -20 -10 0 10 20 30 40 50]);
% set(gca, 'YTick', [0 1000 3000 5000 7000 9000 11000]);
% set(gca, 'FontSize', 20);
% xlabel('Corrente (A)','FontWeight','bold');
% xlim([-50 50]);
% 
% saveas(gcf, 'histMaior90.png');
