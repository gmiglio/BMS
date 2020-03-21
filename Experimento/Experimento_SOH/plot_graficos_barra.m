clc; clear all; close all;

vetor_dir = {   'A_100_90'
                'B_100_90'
                'C_100_90'
                'D_90_80'
                'E_90_80'
                'F_90_80'
                'G_80_70'
                'H_80_70'
                'I_80_70'
            };

vetor_arq = {   'A.mat' 
                'B.mat' 
                'C.mat' 
                'D.mat' 
                'E.mat' 
                'F.mat' 
                'G.mat' 
                'H.mat' 
                'I.mat'}; 

%% Experimento 1
i = 2;

    load(vetor_arq{i});
    cd(vetor_dir{i});
    
    load('Ceraolo_SoC.mat');
    load('Ceraolo_Tensao.mat');
    load('Shephard_SoC_Simulado.mat');
    load('Shephard_Tensao_Simulado.mat');



disp('Fim do cálculo dos dados');
%% PLota gráficos

figure('Color',[1 1 1]);
corrente = Sim_Corrente.Data;
%hist(corrente, 100);

set(gca,'FontName', 'Times New Roman');
set(gca, 'FontSize', 18);
set(gca, 'Linewidth', 2);

title('Estado de Carga com SOH maior que 90%');

%set(gca, 'XTick', [-50 -40 -30 -20 -10 0 10 20 30 40 50]);
%set(gca, 'YTick', [0 1000 3000 5000 7000 9000 11000]);

plot(Ceraolo_SoC, 'b-.', 'LineWidth', 2);
hold on;
plot(Shephard_SoC_Simulado, 'r--', 'LineWidth', 2);
hold on;
plot(Sim_SOC,'g-', 'LineWidth', 2);

set(gca, 'FontSize', 20);
ylabel('SOC (%)');
%xlim([-50 50]);
xlabel('Tempo (s)','FontWeight','bold');
legend('Ceraolo', 'Shepherd', 'Contagem de Carga', 'location', 'Best');

saveas(gcf, 'soc_b.png');

disp('Plota dados na curva');