
% addpath('A_100_90');
% addpath('B_100_90');
addpath('C_100_90');
% 
% addpath('D_90_80');
%addpath('E_90_80');
 %addpath('F_90_80');
% 
%addpath('G_80_70');
%addpath('H_80_70');
%addpath('I_80_70');


load('Ceraolo_SoC.mat');
load('Ceraolo_Tensao.mat');
load('C_SOH_100_90.mat');
load('Shephard_SoC_Simulado.mat');
load('Shephard_Tensao_Simulado.mat');


% load('I_SOH_80_70.mat');
% 
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


tempo = Sim_Corrente.Time;
capacidade = 60;
N1 = 15000;
SOC = [];
SOC(1) = Sim_Est_Carga.Data(1);

cte = 100/(capacidade*3600);
for t=2:1:N1
    SOC(t) = SOC(t-1) + Sim_Corrente.Data(t)*cte;
end
 
Sim_SOC = timeseries(SOC, tempo);

% 
save('C', 'Sim_Temperatura', 'Sim_Corrente', 'Sim_Tensao', 'Sim_Est_Carga', 'Sim_SOC');
% 
% clear all; clc;
% 
% num_arquivo = 1;
%     switch(num_arquivo)
%         case 1
%             load('A.mat');
%         case 2
%             load('B.mat');
%         case 3
%             load('C.mat');
%         case 4        
%             load('D.mat');
%         case 5    
%             load('E.mat');
%         case 6
%             load('F.mat');
%         case 7        
%             load('G.mat');
%         case 8    
%             load('H.mat');
%         case 9
%             load('I.mat');
%     end
% 
% 
% run('ssc_lead_acid_battery_72Ah_ini');
% SOC_init = Sim_Est_Carga.Data(1)/100;
% Costar = NominalCap*3600; %(As)
% Qe_init = (1-SOC_init)*Kc*Costar*interp1([theta_f Kt_Temps],[0 Kt],theta_init,'spline');
