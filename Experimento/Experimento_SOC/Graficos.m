
% Carrega dados C

addpath('N_Cap_60_Bateria_B_Amostra_2');

load('Bat_B_60_Amostra_2.mat');
load('Ceraolo_SoC.mat');
load('Shephard_SoC_Simulado.mat');

N = 15000;
time = 1:1:N;

% Coulomb Counting
Bat_CC = zeros(N,1);
Bat_CC(1) = Est_Carga(1);
cte = 100/(60*3600);

% Axis to hours
for i=2:1:N
    Bat_CC(i) = Bat_CC(i-1) + cte*Corrente(i);
end

data = Bat_CC;
Sim_CC = timeseries(data, time);

plot(Sim_CC, 'g>', 'LineWidth', 2);
hold on;
plot(Shephard_SoC_Simulado,'r+', 'LineWidth', 2);
hold on;
plot(Ceraolo_SoC, 'bx','LineWidth', 2); 
hold on; 
plot(Ceraolo_SoC, 'b-','LineWidth', 2); 
hold on;
plot(Shephard_SoC_Simulado,'r-', 'LineWidth', 2);
hold on;
plot(Sim_CC, 'g-', 'LineWidth', 2);
hold on;
% 
% 
% set(gca,'FontName', 'Times New Roman');
% set(gca, 'FontSize', 18);
% set(gca, 'Linewidth', 2);
% 
% xlabel('Tempo [s]','FontWeight','Bold','Fontsize',18);
% ylabel('SOC (%)','FontWeight','Bold','Fontsize',18);
% title('Estado de Carga Veículo 1 - Experimento 1','FontWeight','Bold','Fontsize',18);
% legend('Coulomb', 'Shephard', 'Ceraolo', 'Location', 'SouthEast');
% %ylim([80 100]);
% saveas(gcf,'soc_C.png');


% clear all; clc;
% 
% addpath('F_Cap_72_Bateria_B_Amostra_3');
% 
% load('Bat_B_72_Amostra_3.mat');
% load('Ceraolo_SoC.mat');
% load('Shephard_SoC_Simulado.mat');
% 
% N = 15000;
% time = 1:1:N;
% 
% % Coulomb Counting
% Bat_CC = zeros(N,1);
% Bat_CC(1) = Est_Carga(1);
% cte = 100/(72*3600);
% 
% % Axis to hours
% for i=2:1:N
%     Bat_CC(i) = Bat_CC(i-1) + cte*Corrente(i);
% end
% 
% data = Bat_CC;
% Sim_CC = timeseries(data, time);
% 
% plot(Sim_CC, 'g>', 'LineWidth', 2);
% hold on;
% plot(Shephard_SoC_Simulado,'r+', 'LineWidth', 2);
% hold on;
% plot(Ceraolo_SoC, 'bx','LineWidth', 2); 
% hold on; 
% plot(Ceraolo_SoC, 'b-','LineWidth', 2); 
% hold on;
% plot(Shephard_SoC_Simulado,'r-', 'LineWidth', 2);
% hold on;
% plot(Sim_CC, 'g-', 'LineWidth', 2);
% hold on;
% 
% 
% set(gca,'FontName', 'Times New Roman');
% set(gca, 'FontSize', 18);
% set(gca, 'Linewidth', 2);
% 
% xlabel('Tempo [s]','FontWeight','Bold','Fontsize',18);
% ylabel('SOC (%)','FontWeight','Bold','Fontsize',18);
% title('Estado de Carga Veículo 1 - Experimento 2','FontWeight','Bold','Fontsize',18);
% legend('Coulomb', 'Shephard', 'Ceraolo', 'Location', 'SouthEast');
% %ylim([80 100]);
% saveas(gcf,'soc_F.png');
