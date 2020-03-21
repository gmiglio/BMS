t = linspace(0,2*pi,1000); % values in time
x = cos(t); % a sinusoid
perturbation = 0.1*exp((-(t-5*pi/4).^2)/.01).*sin(200*t); % a perturbation
signal = x+perturbation; % a signal to plot
% plot signal on new figure
figure,plot(t,x+perturbation)
xlabel('time'),ylabel('signal')
% create a new pair of axes inside current figure
axes('position',[.65 .175 .25 .25])
box on % put box around new pair of axes
indexOfInterest = (t < 11*pi/8) & (t > 9*pi/8); % range of t near perturbation
plot(t(indexOfInterest),signal(indexOfInterest)) % plot on new axes
axis tight

figure;

plot(tensao_total, 'b-','LineWidth', 2); 
hold on; 
plot(Ceraolo_Tensao,'r:', 'LineWidth', 2);
hold on;
plot(Shephard_Tensao_Simulado, 'k-.', 'LineWidth', 2);

set(gca,'FontName', 'Times New Roman');
set(gca, 'Fontsize', 20);

xlabel('Tempo [s]', 'Fontsize',22);
ylabel('Tensão (V)', 'Fontsize',22);
title('Tensão Medida x Tensão Simulada','FontWeight','Bold','Fontsize',22);
legend('Tensão Medida', 'Ceraolo','Shephard', 'Location', 'NorthWest');
ylim([12 16]);
xlim([0 40000]);

axes('position',[.62 0.65 .25 .25])
box on
plot(tensao_total, 'b-','LineWidth', 2); 
hold on; 
plot(Ceraolo_Tensao,'r:', 'LineWidth', 2);
hold on;
plot(Shephard_Tensao_Simulado, 'k-.', 'LineWidth', 2);
axis tight;
xlim([25000 30000]);
ylim([12 14.0]);

saveas(gcf,'Tensao_Parametrizacao.png');
