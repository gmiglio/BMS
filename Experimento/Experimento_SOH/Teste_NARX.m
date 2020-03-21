
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


N = 15000;
time = 1:1:N;

Range = [2 200 1500];
Calc_Corrente = [];
for i=1:1:N
    Calc_Corrente(i) = (Corrente(i) - 32769)*Range(Corrente_Range(i) + 1)/65534;
end

capacidade = 60;
N1 = 15000;
SOC = [];
SOC(1) = Est_Carga(1);

cte = 100/(capacidade*3600);
for t=2:1:N1
    SOC(t) = SOC(t-1) + Calc_Corrente(t)*cte;
end

% Regressores com ny=1 e nu=1 e l=1

% Regressores com ny=1 e nu=1


% Criando uma matriz de dados para a identificação









