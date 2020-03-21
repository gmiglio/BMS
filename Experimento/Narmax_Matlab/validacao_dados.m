

% Script para a validação dos dados

%1) Carrega os dados da calibracao para validacao - De 20001 a 40000
y_tx2 = SOC_CC(20001:40000);
u_tx2 = corrente_total(20001:40000);

y_est = zeros(20000,1);
y_est(1) = y_tx2(1);
u_est = u_tx2;

if(d == 3)
    y_est(2) = y_tx2(2);
end

if(d == 4)
    y_est(2) = y_tx2(2);
    y_est(3) = y_tx2(3);
end

for k=d:20000
    y_est(k) = eval(equacao{1});
end

plot(y_est, 'k--', 'LineWidth', 2);
hold on;
plot(y_tx2,'r.-','LineWidth', 2);

set(gca, 'FontSize', 18);

title('SOC - Contagem de Carga x Estimado');
ylabel('SOC (%)');
%xlim([-50 50]);
xlabel('Tempo (s)','FontWeight','bold');
legend('SOC Estimado', 'Contagem de Carga', 'location', 'Best');

saveas(gcf, 'nl333_dados_parametrizacao.png');

y_est(20000)

figure;

load('F_Sim_SOC.mat');
load('F_Bateria_B_72_Amostra_3.mat');

% Curva com maior variação de SOC
u_tx2 = Sim_Corrente.Data;
y_tx2 = Sim_CC.Data;
y_est = zeros(15000, 1);
y_est(1) = y_tx2(1);

if(d == 3)
    y_est(2) = y_tx2(2);
end
if(d == 4)
    y_est(2) = y_tx2(2);
    y_est(3) = y_tx2(3);
end
u_est = u_tx2;


for k=d:1:15000
    y_est(k) = eval(equacao{1});
end

plot(y_est,'k--', 'LineWidth', 2);
hold on;
plot(Sim_CC,'r-', 'LineWidth', 2);

set(gca, 'FontSize', 18);
title('SOC - Contagem de Carga x Estimado');
ylabel('SOC (%)');
%xlim([-50 50]);
xlabel('Tempo (s)','FontWeight','bold');
legend('SOC Estimado', 'Contagem de Carga', 'location', 'Best');

saveas(gcf, 'nl333_dados_bateria.png');


y_est(15000)

