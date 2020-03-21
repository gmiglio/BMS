
% Este arquivo  prepara os dados para a simulação,
% criando as timeseries para rodar no modelo de Shephard e
% Ceraolo

% Guilherme Miglio Doxa
clear all; clc;

N = 15000;
time = 1:1:N;

%% Amostra 1 - OK
cd('A_Cap_72_Bateria_A_Amostra_1');
load('Bat_A_72_Amostra_1.mat');

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

cd('..');
save('A_Bateria_A_72_Amostra_1', 'Sim_Temperatura', 'Sim_Corrente', 'Sim_Tensao', 'Sim_Est_Carga');


%% Amostra 2 - OK
cd('B_Cap_72_Bateria_A_Amostra_2');
load('Bat_A_72_Amostra_2.mat');

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

cd('..');
save('B_Bateria_A_72_Amostra_2', 'Sim_Temperatura', 'Sim_Corrente', 'Sim_Tensao', 'Sim_Est_Carga');

%% Amostra 3
cd('C_Cap_72_Bateria_A_Amostra_3');
load('Bat_A_72_Amostra_3.mat');

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

cd('..');
save('C_Bateria_A_72_Amostra_3', 'Sim_Temperatura', 'Sim_Corrente', 'Sim_Tensao', 'Sim_Est_Carga');


%% Amostra 4
cd('D_Cap_72_Bateria_B_Amostra_1');
load('Bat_B_72_Amostra_1.mat');
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

cd('..');
save('D_Bateria_B_72_Amostra_1', 'Sim_Temperatura', 'Sim_Corrente', 'Sim_Tensao', 'Sim_Est_Carga');

%% Amostra 5
cd('E_Cap_72_Bateria_B_Amostra_2');
load('Bat_B_72_Amostra_2.mat');
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

cd('..');
save('E_Bateria_B_72_Amostra_2', 'Sim_Temperatura', 'Sim_Corrente', 'Sim_Tensao', 'Sim_Est_Carga');

%% Amostra 6
cd('F_Cap_72_Bateria_B_Amostra_3');
load('Bat_B_72_Amostra_3.mat');
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

cd('..');
save('F_Bateria_B_72_Amostra_3', 'Sim_Temperatura', 'Sim_Corrente', 'Sim_Tensao', 'Sim_Est_Carga');

%% Amostra 7
cd('G_Cap_72_Bateria_C_Amostra_1');
load('Bat_C_72_Amostra_1.mat');
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

cd('..');
save('G_Bateria_C_72_Amostra_1', 'Sim_Temperatura', 'Sim_Corrente', 'Sim_Tensao', 'Sim_Est_Carga');

%% Amostra 8
cd('H_Cap_72_Bateria_C_Amostra_2');
load('Bat_C_72_Amostra_2.mat');
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

cd('..');
save('H_Bateria_C_72_Amostra_2', 'Sim_Temperatura', 'Sim_Corrente', 'Sim_Tensao', 'Sim_Est_Carga');

%% Amostra 9
cd('I_Cap_72_Bateria_C_Amostra_3');
load('Bat_C_72_Amostra_3.mat');
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

cd('..');
save('I_Bateria_C_72_Amostra_3', 'Sim_Temperatura', 'Sim_Corrente', 'Sim_Tensao', 'Sim_Est_Carga');


%% Amostra 10
cd('J_Cap_60_Bateria_A_Amostra_1');
load('Bat_A_60_Amostra_1.mat');
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

cd('..');
save('J_Bateria_A_60_Amostra_1', 'Sim_Temperatura', 'Sim_Corrente', 'Sim_Tensao', 'Sim_Est_Carga');

%% Amostra 11
cd('K_Cap_60_Bateria_A_Amostra_2');
load('Bat_A_60_Amostra_2.mat');
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

cd('..');
save('K_Bateria_A_60_Amostra_2', 'Sim_Temperatura', 'Sim_Corrente', 'Sim_Tensao', 'Sim_Est_Carga');

%% Amostra 12
cd('L_Cap_60_Bateria_A_Amostra_3');
load('Bat_A_60_Amostra_3.mat');
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

cd('..');
save('L_Bateria_A_60_Amostra_3', 'Sim_Temperatura', 'Sim_Corrente', 'Sim_Tensao', 'Sim_Est_Carga');

%% Amostra 13
cd('M_Cap_60_Bateria_B_Amostra_1');
load('Bat_B_60_Amostra_1.mat');

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

cd('..');
save('M_Bateria_B_60_Amostra_1', 'Sim_Temperatura', 'Sim_Corrente', 'Sim_Tensao', 'Sim_Est_Carga');

%% Amostra 14
cd('N_Cap_60_Bateria_B_Amostra_2');
load('Bat_B_60_Amostra_2.mat');

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

cd('..');
save('N_Bateria_B_60_Amostra_2', 'Sim_Temperatura', 'Sim_Corrente', 'Sim_Tensao', 'Sim_Est_Carga');

%% Amostra 15
cd('O_Cap_60_Bateria_B_Amostra_3');
load('Bat_B_60_Amostra_3.mat');
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

cd('..');
save('O_Bateria_B_60_Amostra_3', 'Sim_Temperatura', 'Sim_Corrente', 'Sim_Tensao', 'Sim_Est_Carga');

%% Amostra 16
cd('P_Cap_60_Bateria_C_Amostra_1');
load('Bat_C_60_Amostra_1.mat');
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

cd('..');
save('P_Bateria_C_60_Amostra_1', 'Sim_Temperatura', 'Sim_Corrente', 'Sim_Tensao', 'Sim_Est_Carga');

%% Amostra 17
cd('Q_Cap_60_Bateria_C_Amostra_2');
load('Bat_C_60_Amostra_2.mat');
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

cd('..');
save('Q_Bateria_C_60_Amostra_2', 'Sim_Temperatura', 'Sim_Corrente', 'Sim_Tensao', 'Sim_Est_Carga');

%% Amostra 18 - OK
cd('R_Cap_60_Bateria_C_Amostra_3');
load('Bat_C_60_Amostra_3.mat');
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

cd('..');
save('R_Bateria_C_60_Amostra_3', 'Sim_Temperatura', 'Sim_Corrente', 'Sim_Tensao', 'Sim_Est_Carga');