close all;

% Busca informações do veículo
% Dir 1 - vehicle = '1C4BU00000PB00196_520_TDI';  % CODIGO DO VEÍCULO
% Amostra_4 - '1C4BU00000PB00196_098_358.mat'
% Amostra_3 - '1C4BU00000PB00196_105_373.mat'
% Amostra_2 - '1C4BU00000PB00196_107_307.mat'


vehicle = '9BD195A6HH0751647_327_GSE';
% Capacidade da bateria 
% Capacidade = 72 Ah

% Seleção do diretorio do teste
cd(sprintf('%s', vehicle));

% Amostra_1 : 988611116GK000092_316_358.mat
% Amostra_2 : 
% Amostra_3 :
% Amostra_4 :


load('9BD195A6HH0751647_150_273.mat');

% Tratamento dos dados
N = length(IBat_A);

for i=2:1:N
    if(abs(SoC_IBS(i) - SoC_IBS(i-1)) > 10)
        SoC_IBS(i) = SoC_IBS(i-1);
    end
end


CAPACIDADE = 72; %AH
TEMPO = 3600;
CTE = 100/(CAPACIDADE*TEMPO);
SoC_CC = zeros(N, 1);
SoC_CC(1) = SoC_IBS(1);
for i=2:1:N
    if(SoC_CC(i-1) < 100)
        SoC_CC(i) = SoC_CC(i-1) + CTE*IBat_A(i);
    else 
        SoC_CC(i) = 100;
    end
end

time = 1:1:15000;

data = SoC_IBS(time);
SoC = timeseries(data, time);

data = VBat_V(time);
Tensao = timeseries(data, time);

data = IBat_A(time);
Corrente = timeseries(data, time);

data = TempBat_C(time);
Temperatura = timeseries(data, time);

SoC_ini = SoC.Data(1);
SOC_init = SoC.Data(1)/100;

% subplot(221);
% plot(IBat_A, 'LineWidth', 1);
subplot(121);
%plot(Corrente, 'LineWidth', 1);
subplot(122);
plot(SoC,'Color', 'r', 'LineWidth', 1);
hold on;
plot(SoC_CC,'Color', 'b', 'LineWidth', 1);
% subplot(224);
% plot(TempBat_C,'Color', 'g', 'LineWidth', 2);