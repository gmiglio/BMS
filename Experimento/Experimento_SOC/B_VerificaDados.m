

% Experimento do SOC com SOH em diversos níveis
% Verificação dos dados
% Guilherme Miglio Doxa

clear all; clc;

% Amostra 1
% cd('A_Cap_72_Bateria_A_Amostra_1');
% load('1C4BU00000PB00196_108_317.mat');

% Amostra 2
cd('B_Cap_72_Bateria_A_Amostra_2');
load('1C4BU00000PB00196_107_307.mat');

% Amostra 3
% cd('C_Cap_72_Bateria_A_Amostra_3');
% load('1C4BU00000PB00196_080_359.mat');

% Amostra 4
% cd('D_Cap_72_Bateria_B_Amostra_1');
% load('988611116GK000092_316_358.mat');

% Amostra 5
% cd('E_Cap_72_Bateria_B_Amostra_2');
% load('988611116GK000092_312_335.mat');

% Amostra 6
% cd('F_Cap_72_Bateria_B_Amostra_3');
% load('988611116GK000092_304_346.mat');

% Amostra 7
% cd('G_Cap_72_Bateria_C_Amostra_1');
% load('988611151FK000265_295_344.mat');

% Amostra 8
% cd('H_Cap_72_Bateria_C_Amostra_2');
% load('988611151FK000265_288_318.mat');

% Amostra 9
% cd('I_Cap_72_Bateria_C_Amostra_3');
% load('988611151FK000265_282_351.mat');

% Amostra 10
% cd('J_Cap_60_Bateria_A_Amostra_1');
% load('9BD195A6HH0751647_001_324.mat');

% Amostra 11
% cd('K_Cap_60_Bateria_A_Amostra_2');
% load('9BD195A6HH0751647_039_388.mat');

% Amostra 12
% cd('L_Cap_60_Bateria_A_Amostra_3');
% load('9BD195A6HH0751647_086_365.mat');

% Amostra 13
% cd('M_Cap_60_Bateria_B_Amostra_1');
% load('98D195A6HH0731352_036_467.mat');

% Amostra 14
% cd('N_Cap_60_Bateria_B_Amostra_2');
% load('98D195A6HH0731352_038_378.mat');

% Amostra 15
% cd('O_Cap_60_Bateria_B_Amostra_3');
% load('98D195A6HH0731352_053_510.mat');

% Amostra 16
% cd('P_Cap_60_Bateria_C_Amostra_1');
% load('9BD195A97H0734614_175_354.mat');

% Amostra 17
% cd('Q_Cap_60_Bateria_C_Amostra_2');
% load('9BD195A97H0734614_168_297.mat');

% Amostra 18
% cd('R_Cap_60_Bateria_C_Amostra_3');
% load('9BD195A97H0734614_158_321.mat');


N = 15000;

Tensao = zeros(N,1);
Corrente = zeros(N,1);
Temperatura = zeros(N,1);
Est_Carga = zeros(N,1);

Est_Carga(1) = SoC_IBS(1);
DIFF_SOC = 10;


for i=2:1:N
    if (abs(SoC_IBS(i,1) - Est_Carga(i-1,1)) > DIFF_SOC)
        Tensao(i,1) = Tensao(i-1,1);
        Corrente(i,1) = Corrente(i-1,1);
        Temperatura(i,1) = Temperatura(i-1,1);
        Est_Carga(i,1) = Est_Carga(i-1,1);
    else
        Corrente(i,1) = IBat_A(i,1);
        Tensao(i,1) = VBat_V(i,1);
        Temperatura(i,1) = TempBat_C(i,1);
        Est_Carga(i,1) = SoC_IBS(i,1);
    end    
end

% save('Bat_A_72_Amostra_1', 'Tensao', 'Corrente', 'Temperatura', 'Est_Carga');
% 
save('Bat_A_72_Amostra_2', 'Tensao', 'Corrente', 'Temperatura', 'Est_Carga');
% 
% save('Bat_A_72_Amostra_3', 'Tensao', 'Corrente', 'Temperatura', 'Est_Carga');
% 
% save('Bat_B_72_Amostra_1', 'Tensao', 'Corrente', 'Temperatura', 'Est_Carga');
% 
% save('Bat_B_72_Amostra_2', 'Tensao', 'Corrente', 'Temperatura', 'Est_Carga');
% 
% save('Bat_B_72_Amostra_3', 'Tensao', 'Corrente', 'Temperatura', 'Est_Carga');
% 
% save('Bat_C_72_Amostra_1', 'Tensao', 'Corrente', 'Temperatura', 'Est_Carga');
% 
% save('Bat_C_72_Amostra_2', 'Tensao', 'Corrente', 'Temperatura', 'Est_Carga');
% 
% save('Bat_C_72_Amostra_3', 'Tensao', 'Corrente', 'Temperatura', 'Est_Carga');
%
% save('Bat_A_60_Amostra_1', 'Tensao', 'Corrente', 'Temperatura', 'Est_Carga');
% 
% save('Bat_A_60_Amostra_2', 'Tensao', 'Corrente', 'Temperatura', 'Est_Carga');
% 
% save('Bat_A_60_Amostra_3', 'Tensao', 'Corrente', 'Temperatura', 'Est_Carga');
% 
% save('Bat_B_60_Amostra_1', 'Tensao', 'Corrente', 'Temperatura', 'Est_Carga');
% 
% save('Bat_B_60_Amostra_2', 'Tensao', 'Corrente', 'Temperatura', 'Est_Carga');
% % 
% save('Bat_B_60_Amostra_3', 'Tensao', 'Corrente', 'Temperatura', 'Est_Carga');
% 
% save('Bat_C_60_Amostra_1', 'Tensao', 'Corrente', 'Temperatura', 'Est_Carga');
% 
% save('Bat_C_60_Amostra_2', 'Tensao', 'Corrente', 'Temperatura', 'Est_Carga');
% 
% save('Bat_C_60_Amostra_3', 'Tensao', 'Corrente', 'Temperatura', 'Est_Carga');