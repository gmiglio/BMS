%% Use nlarx to Estimate Nonlinear ARX Models
% This example shows how to use |nlarx| to estimate a nonlinear ARX model for measured input/output data.
%%
% Prepare the data for estimation.
load('Bat_A_72_Amostra_1.mat');
% Copyright 2015 The MathWorks, Inc.
y = Est_Carga;
u = Corrente;
ze = iddata(y, u, 1);
%%
% Estimate several models using different model orders, delays, and
% nonlinearity settings.
m1 = nlarx(ze,[2 2 1]);
m2 = nlarx(ze,[6 3 2]);;
                  
%%
% An alternative way to perform the estimation is to configure the model
% structure first, and then to estimate this model.
% m5 = idnlarx([2 2 3],sigmoidnet('num',14),'nlr',[1 2]);
% m5 = nlarx(ze,m5);


%%
% Compare the resulting models by plotting the model outputs with the
% measured output.
load('Bat_A_72_Amostra_3.mat');
y = Est_Carga;
u = Corrente;
zv = iddata(y, u, 1);
compare(zv, m1,m2);

% hold on;
% load('Ceraolo_SoC_Amostra_2.mat');
% load('Shephard_SoC_Simulado.mat');
% plot(Ceraolo_SoC, 'r');
% hold on;
% plot(Shephard_SoC_Simulado, 'g');
%% 
% Copyright 2016, The MathWorks Inc.