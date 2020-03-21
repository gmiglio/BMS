

% Script para a validação dos dados

% 1) Carrega os dados da calibracao para validacao - De 20001 a 40000
y_tx2 = SOC_CC(20001:40000);
%u_tx2 = tensao_total(20001:40000);
u_est = corrente_total(20001:40000);

% 2) Valida os dados da calibração no modelo escolhido
% teta
% piv
% psi

y_est = zeros(20000, 1);
y_est(1) = y_tx2(1);
y_est(2) = y_tx2(2);

tamanho = length(teta);
teta_mod = zeros(tamanho, 1);

y_est(1) = y_tx2(1);
for k=2:1:20000
    y_est(k) = teta(piv(1))*1 + teta(piv(2))*u_est(k-1) + teta(piv(3))*y_est(k-1) + ...
        teta(piv(4))*u_est(k-1)^2 + teta(piv(5))*u_est(k-1)*y_est(k-1) + teta(piv(6))*y_est(k-1)^2;
end

plot(y_est);
hold on;
plot(y_tx2);

figure;

load('dados_vei2_exp2.mat');
load('N_Bateria_B_60_Amostra_2.mat');

% Curva com maior variação de SOC
u_est = Sim_Corrente.Data;
y_tx2 = Sim_Est_Carga.Data;
y_est = zeros(15000, 1);
y_est(1) = y_tx2(1);
for k=2:1:15000
    y_est(k) = teta(piv(1))*1 + teta(piv(2))*u_est(k-1) + teta(piv(3))*y_est(k-1) + ...
        teta(piv(4))*u_est(k-1)^2 + teta(piv(5))*u_est(k-1)*y_est(k-1) + teta(piv(6))*y_est(k-1)^2;
end

plot(y_est);
hold on;
plot(Coulomb);

% Curva com variação de SOH





