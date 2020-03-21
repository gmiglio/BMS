% Experimento do SOC com SOH em diversos níveis
% Validação dos dados
% Guilherme Miglio Doxa


cd('A_100_90');
load('04EB0618E220624GA_323535_2_014_001.mat');

save('A_SOH_100_90', 'Tensao', 'Tensao_Sts', 'Corrente', 'Corrente_Range',...
    'Temperatura','Temperatura_Sts', 'Est_Saude', 'Est_Saude_Sts',...
    'Est_Carga', 'Est_Carga_Sts', 'Ibs_Sts');

cd('..');

cd('B_100_90');
load('04EB0618E220624GA_323535_2_015_001.mat');

save('B_SOH_100_90', 'Tensao', 'Tensao_Sts', 'Corrente', 'Corrente_Range',...
    'Temperatura','Temperatura_Sts', 'Est_Saude', 'Est_Saude_Sts',...
    'Est_Carga', 'Est_Carga_Sts', 'Ibs_Sts');

cd('..');

cd('C_100_90');
load('04EB0618E220624GA_323535_2_024_079.mat');

save('C_SOH_100_90', 'Tensao', 'Tensao_Sts', 'Corrente', 'Corrente_Range',...
    'Temperatura','Temperatura_Sts', 'Est_Saude', 'Est_Saude_Sts',...
    'Est_Carga', 'Est_Carga_Sts', 'Ibs_Sts');

cd('..');

cd('D_90_80');
load('04EB0618E220624GA_323535_2_034_056.mat');

save('D_SOH_90_80', 'Tensao', 'Tensao_Sts', 'Corrente', 'Corrente_Range',...
    'Temperatura','Temperatura_Sts', 'Est_Saude', 'Est_Saude_Sts',...
    'Est_Carga', 'Est_Carga_Sts', 'Ibs_Sts');

cd('..');

cd('E_90_80');
load('04EB0618E220624GA_323535_2_035_024.mat');

save('E_SOH_90_80', 'Tensao', 'Tensao_Sts', 'Corrente', 'Corrente_Range',...
    'Temperatura','Temperatura_Sts', 'Est_Saude', 'Est_Saude_Sts',...
    'Est_Carga', 'Est_Carga_Sts', 'Ibs_Sts');

cd('..');

cd('F_90_80');
load('04EB0618E220624GA_323535_2_036_001.mat');

save('F_SOH_90_80', 'Tensao', 'Tensao_Sts', 'Corrente', 'Corrente_Range',...
    'Temperatura','Temperatura_Sts', 'Est_Saude', 'Est_Saude_Sts',...
    'Est_Carga', 'Est_Carga_Sts', 'Ibs_Sts');

cd('..');

cd('G_80_70');
load('04EB0618E220624GA_323535_2_083_002.mat');

save('G_SOH_80_70', 'Tensao', 'Tensao_Sts', 'Corrente', 'Corrente_Range',...
    'Temperatura','Temperatura_Sts', 'Est_Saude', 'Est_Saude_Sts',...
    'Est_Carga', 'Est_Carga_Sts', 'Ibs_Sts');

cd('..');

cd('H_80_70');
load('04EB0618E220624GA_323535_2_085_003.mat');

save('H_SOH_80_70', 'Tensao', 'Tensao_Sts', 'Corrente', 'Corrente_Range',...
    'Temperatura','Temperatura_Sts', 'Est_Saude', 'Est_Saude_Sts',...
    'Est_Carga', 'Est_Carga_Sts', 'Ibs_Sts');

cd('..');

cd('I_80_70');
load('04EB0618E220624GA_323535_2_044_001.mat');

save('I_SOH_80_70', 'Tensao', 'Tensao_Sts', 'Corrente', 'Corrente_Range',...
    'Temperatura','Temperatura_Sts', 'Est_Saude', 'Est_Saude_Sts',...
    'Est_Carga', 'Est_Carga_Sts', 'Ibs_Sts');

cd('..');