
addpath('Experimento_SOH/C_100_90');
load('dados_grafico');


plot(Coulomb, 'g>', 'LineWidth', 2);
hold on;
plot(Shephard,'r+', 'LineWidth', 2);
hold on;
plot(Ceraolo, 'bx','LineWidth', 2); 
hold on; 
plot(Ceraolo, 'b-','LineWidth', 2); 
hold on;
plot(Shephard,'r-', 'LineWidth', 2);
hold on;
plot(Coulomb, 'g-', 'LineWidth', 2);
hold on;


set(gca,'FontName', 'Times New Roman');
set(gca, 'FontSize', 18);
set(gca, 'Linewidth', 2);

xlabel('Tempo [s]','FontWeight','Bold','Fontsize',18);
ylabel('SOC (%)','FontWeight','Bold','Fontsize',18);
title('Estado de Carga com SOH maior que 90%','FontWeight','Bold','Fontsize',18);
legend('Contagem de Carga', 'Shephard', 'Ceraolo', 'Location', 'SouthEast');
%ylim([80 100]);
saveas(gcf,'soc_C.png');



clear all; clc; close all;
addpath('Experimento_SOH/F_90_80');
load('dados_grafico');


plot(Coulomb, 'g>', 'LineWidth', 2);
hold on;
plot(Shephard,'r+', 'LineWidth', 2);
hold on;
plot(Ceraolo, 'bx','LineWidth', 2); 
hold on; 
plot(Ceraolo, 'b-','LineWidth', 2); 
hold on;
plot(Shephard,'r-', 'LineWidth', 2);
hold on;
plot(Coulomb, 'g-', 'LineWidth', 2);
hold on;


set(gca,'FontName', 'Times New Roman');
set(gca, 'FontSize', 18);
set(gca, 'Linewidth', 2);

xlabel('Tempo [s]','FontWeight','Bold','Fontsize',18);
ylabel('SOC (%)','FontWeight','Bold','Fontsize',18);
title('Estado de Carga com SOH entre 90% e 80%','FontWeight','Bold','Fontsize',18);
legend('Contagem de Carga', 'Shephard', 'Ceraolo', 'Location', 'SouthEast');
%ylim([80 100]);
saveas(gcf,'soc_F.png');


clear all; clc; close all;
addpath('Experimento_SOH/G_80_70');
load('dados_grafico');


plot(Coulomb, 'g>', 'LineWidth', 2);
hold on;
plot(Shephard,'r+', 'LineWidth', 2);
hold on;
plot(Ceraolo, 'bx','LineWidth', 2); 
hold on; 
plot(Ceraolo, 'b-','LineWidth', 2); 
hold on;
plot(Shephard,'r-', 'LineWidth', 2);
hold on;
plot(Coulomb, 'g-', 'LineWidth', 2);
hold on;


set(gca,'FontName', 'Times New Roman');
set(gca, 'FontSize', 18);
set(gca, 'Linewidth', 2);

xlabel('Tempo [s]','FontWeight','Bold','Fontsize',18);
ylabel('SOC (%)','FontWeight','Bold','Fontsize',18);
title('Estado de Carga com SOH entre 80% e 70%','FontWeight','Bold','Fontsize',18);
legend('Contagem de Carga', 'Shephard', 'Ceraolo', 'Location', 'SouthEast');
%ylim([80 100]);
saveas(gcf,'soc_G.png');