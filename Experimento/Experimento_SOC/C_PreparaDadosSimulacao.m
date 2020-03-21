
% Este arquivo  prepara os dados para a simulação,
% criando as timeseries para rodar no modelo de Shephard e
% Ceraolo

% Guilherme Miglio Doxa
clear all; clc;

% Amostra 1 - OK
% cd('A_Cap_72_Bateria_A_Amostra_1');
% load('Bat_A_72_Amostra_1.mat');

% Amostra 2 - OK
cd('B_Cap_72_Bateria_A_Amostra_2');
load('Bat_A_72_Amostra_2.mat');

% Amostra 3
% cd('C_Cap_72_Bateria_A_Amostra_3');
% load('Bat_A_72_Amostra_3.mat');

% Amostra 4
% cd('D_Cap_72_Bateria_B_Amostra_1');
% load('Bat_B_72_Amostra_1.mat');

% Amostra 5
% cd('E_Cap_72_Bateria_B_Amostra_2');
% load('Bat_B_72_Amostra_2.mat');

% Amostra 6
% cd('F_Cap_72_Bateria_B_Amostra_3');
% load('Bat_B_72_Amostra_3.mat');

% Amostra 7
% cd('G_Cap_72_Bateria_C_Amostra_1');
% load('Bat_C_72_Amostra_1.mat');

% Amostra 8
% cd('H_Cap_72_Bateria_C_Amostra_2');
% load('Bat_C_72_Amostra_2.mat');

% Amostra 9
% cd('I_Cap_72_Bateria_C_Amostra_3');
% load('Bat_C_72_Amostra_3.mat');

% Amostra 10
% cd('J_Cap_60_Bateria_A_Amostra_1');
% load('Bat_A_60_Amostra_1.mat');

% Amostra 11
% cd('K_Cap_60_Bateria_A_Amostra_2');
% load('Bat_A_60_Amostra_2.mat');

% Amostra 12
% cd('L_Cap_60_Bateria_A_Amostra_3');
% load('Bat_A_60_Amostra_3.mat');

% Amostra 13
% cd('M_Cap_60_Bateria_B_Amostra_1');
% load('Bat_B_60_Amostra_1.mat');

% Amostra 14
% cd('N_Cap_60_Bateria_B_Amostra_2');
% load('Bat_B_60_Amostra_2.mat');

% Amostra 15
% cd('O_Cap_60_Bateria_B_Amostra_3');
% load('Bat_B_60_Amostra_3.mat');

% Amostra 16
% cd('P_Cap_60_Bateria_C_Amostra_1');
% load('Bat_C_60_Amostra_1.mat');

% Amostra 17
% cd('Q_Cap_60_Bateria_C_Amostra_2');
% load('Bat_C_60_Amostra_2.mat');

% Amostra 18 - OK
% cd('R_Cap_60_Bateria_C_Amostra_3');
% load('Bat_C_60_Amostra_3.mat');

N = 15000;
time = 1:1:N;

data = Temperatura(time);
data(1) = data(2);
Sim_Temperatura = timeseries(data, time);

data = Corrente(time);
data(1) = data(2);
Sim_Corrente = timeseries(data, time);

data = Tensao(time);
data(1) = data(2);
Sim_Tensao = timeseries(data, time);

data = Est_Carga(time);
Sim_Est_Carga = timeseries(data, time);

Est_Carga(1)
