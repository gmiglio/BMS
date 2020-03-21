clear all; clc; close all;

% Carrega os dados dos arquivos;
load('Ceraolo_SoC_Simulado.mat');
Ceraolo_SoC = ans;

% Carrega os dados dos arquivos;
load('Shephard_SoC_Simulado.mat');
Shephard_SoC = ans;

load('Dados_B_327_Exp_2_428535_2.mat');

Ceraolo_SoC.Data = Ceraolo_SoC.Data - 5;

% Coulomb Counting
N = length(Corrente.Data);
Bat_CC = zeros(N,1);
Bat_CC(1) = SoC.Data(1);
cte = 100/(60*3600);

% Axis to hours


for i=2:1:N
    Bat_CC(i) = Bat_CC(i-1) + cte*Corrente.Data(i);
end

plot(Shephard_SoC, 'g');
hold on;

plot(SoC, 'r');
hold on;

plot(Bat_CC, 'm');
hold on;

plot(Ceraolo_SoC, 'b'); 


legend('Modelo de Shephard', 'IBS', 'Coulomb Couting', 'Modelo de Ceraolo' );
ylabel('Estado de Carga(%)');
xlabel('Tempo(s)');
title('Comparação dos valores do estado de Carga');
grid on;


figure;
time = 8000:1:10000;
% ylabels = {{'Estado de Carga(%)'}, {'Tensão (V)'}, {'Temperatura (ºC)'}};
%  [ax, hlines] = plotyyy(time, SoC.Data(time), time, Tensao.Data(time), time, Temperatura.Data(time), ylabels);

[AX, H1, H2] = plotyy(time, SoC.Data(time), time, Tensao.Data(time));

%style the plot
set(H1,'Color','r','LineWidth',2);
set(H2,'Color','b','LineWidth',2);

set(AX(1),'YColor','r');
set(AX(2),'YColor','b');

%x-axis and y-axis labels
set(get(AX(1),'Ylabel'),'String','Estado de Carga (\%)');
set(get(AX(2),'Ylabel'),'String','Tensão');


%add legend
leg = legend('SoC','Tensão', 'Location', 'NorthWest');
set(leg);

set(get(AX(1),'Xlabel'),'String','Tempo (s)');
set(get(AX(2),'Ylabel'),'String','Tensão'); 

%grid
% grid on;
