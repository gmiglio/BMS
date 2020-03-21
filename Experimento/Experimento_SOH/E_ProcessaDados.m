clear all; clc; close all;


%%
% Amostra_A: 100-90
% Diretório dos dados do IBS
cd('C_100_90');
% Carrega os dados do IBS
load('C_SOH_100_90.mat');
% Carrega os dados dos arquivos;
load('Ceraolo_SoC.mat');
% Carrega os dados dos arquivos;
load('Shephard_SoC_Simulado.mat');

% Número de amostras padronizadas
N = 15000;

Inicial = 1001;
Final   = 15000 + Inicial;

Corrente = Corrente(Inicial:Final);
Corrente_Range = Corrente_Range(Inicial:Final);
Est_Carga     = Est_Carga(Inicial:Final);
Temperatura   = Temperatura(Inicial:Final);
Tensao        = Tensao(Inicial:Final);

Range = [2 200 1500];
Calc_Corrente = zeros(N,1);
for i=1:1:N
    Calc_Corrente(i) = (Corrente(i) - 32769)*Range(Corrente_Range(i) + 1)/65534;
end

% Coulomb Counting
SoC_Bat_CC = zeros(N,1);
SoC_Bat_CC(1) = Est_Carga(1);
cte = 100/(72*3600);

% Axis to hours
for i=2:1:N
    SoC_Bat_CC(i) = SoC_Bat_CC(i-1) + cte*Calc_Corrente(i);
end

Ceraolo_SoC_Data = Ceraolo_SoC.Data(Inicial:Final);
Shephard_SoC_Data = Shephard_SoC_Simulado.Data(Inicial:Final);



plot(uint8(Ceraolo_SoC_Data), 'b');
hold on;
plot(uint8(Shephard_SoC_Data), 'r');
hold on;
plot(uint8(Est_Carga),'k');
hold on;
plot(uint8(SoC_Bat_CC),'g');
legend('Ceraolo', 'Shephard', 'IBS', 'Counting');
axis([0 16000 70 83]);
grid on;


