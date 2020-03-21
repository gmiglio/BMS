

% Carrega os dados dos arquivos

load('dados.mat');

data = SOC_CC;
time = 20001:1:40000;

data = SOC_CC(time);
Sim_Est_Carga = timeseries(data, time);

data = corrente_total';
Sim_Corrente = timeseries(data, time);

data = tensao_total';
Sim_Tensao = timeseries(data, time);

