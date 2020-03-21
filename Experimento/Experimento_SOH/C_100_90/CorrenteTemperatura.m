

% plotyy

figure('Color',[1 1 1]);
SoC = Ceraolo.Data;
[hAx, hLine1, hLine2] = plotyy(time, SoC, time, Sim_Temperatura.Data);
hLine1.LineStyle = '--';
hLine2.LineStyle = ':';

set(gca,'FontName', 'Times New Roman');
set(gca, 'FontSize', 18);
set(gca, 'Linewidth', 2);

title('Perfil de Corrente e Temperatura');
set(gca, 'FontSize', 20);

saveas(gcf, 'CorrenteTemperatura.png');