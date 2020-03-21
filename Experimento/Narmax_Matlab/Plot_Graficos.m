% Plota os gráficos do sistema e salva os gráficos em arquivos

tag_corrente = 1;
tag_simulacao = 222;


% CAPACIDADE = 72;
% cte = 100/(CAPACIDADE*3600);
N = 40000;

%% Veículo 1 Experimento 1

% load('C_Bateria_A_72_Amostra_3.mat');



% % % Coulomb Counting
% Bat_CC = zeros(N,1);
% Bat_CC(1) = Sim_Est_Carga.Data(1);
% cte = 100/(CAPACIDADE*3600);
% for i=2:1:N
%     Bat_CC(i) = Bat_CC(i-1) + cte*Sim_Corrente.Data(i);
% end


u_est = Sim_Tensao.Data(20001:40000);
N_Dado = length(u_est);
y_est = zeros(N_Dado,1);
y_est(1) = 0;

k3 = Parameters_l1.Data(6667,3);
k2 = Parameters_l1.Data(6667,2);
k1 = Parameters_l1.Data(6667,1);
for k=2:1:N_Dado
    y_est(k) = k1*1 + k2*u_est(k-1) + k3*y_est(k-1);
end

data = y_est;
time = 1:1:20000;
Sim_y_est = timeseries(data, time);

data = Sim_Est_Carga.Data(20001:40000);
Sim_Est_Carga2 = timeseries(data, time);

load('Est_Carga_out');

plot(Sim_Est_Carga2);
hold on;
plot(Sim_y_est);


%u_est = Sim_Tensao.Data;
% Veículo 1 Experimento 1
% for k=inicio:1:Nr_Termos
%     if(tag_corrente == 0)
%         if (tag_simulacao == 111)
%         end
%     else
%         % Simulacao Corrente
%         if (tag_simulacao == 111)    
%             % nl111
%             y_est(k) = y_est(k-1)+0.00038544*u_est(k-1)+7.9096e-05*1;
%         end
%         if (tag_simulacao == 121)
%             % nl121
%             y_est(k) = 0.52852*y_est(k-1)+0.47148*y_est(k-2)+7.0753e-05*1+0.00056727*u_est(k-1);
%         end
%         if (tag_simulacao == 122)
%             y_est(k) = 0.53056*y_est(k-1)+0.46944*y_est(k-2)+7.0372e-05*1-2.7252e-06*u_est(k-2)+0.00056921*u_est(k-1);
%         end
%         if (tag_simulacao == 222)
%             y_est(k) = 0.59936*y_est(k-1)+0.40058*y_est(k-1)+ ...
%                        0.0028282*1+ ...
%                        0.00035731*u_est(k-2)-0.0026877*y_est(k-2)^2+0.0083532*y_est(k-1)*u_est(k-2)+ ...
%                        0.0004056*y_est(k-1)^2+0.0022825*y_est(k-1)*y_est(k-2)+0.00019268*u_est(k-1)- ...
%                        0.0091708*y_est(k-2)*u_est(k-1)+0.0091736*y_est(k-1)*u_est(k-1)-0.0083573*y_est(k-2)*u_est(k-2);
%         end
%         if(tag_simulacao == 211)
%             y_est(k) = 0.99993*y_est(k-1)+0.00039647*u_est(k-1)+0.0029458*1-1.4184e-07*u_est(k-1)^2+3.8214e-07*y_est(k-1)^2-1.3805e-07*u_est(k-1)*y_est(k-1);
%         end
%         if(tag_simulacao == 311)
%             y_est(k) = 0.9946*y_est(k-1)+0.00069703*u_est(k-1)+0.15421*1+6.3073e-05*y_est(k-1)^2+0.0012292*u_est(k-1)^3;
%         end
%         if(tag_simulacao == 322)
%             y_est(k) =  0.20135*y_est(k-1)+0.79395*y_est(k-1)+0.13446*1+0.00073875*u_est(k-2)^2+0.08892*u_est(k-2)+ ...
%                         0.0021126*y_est(k-2)^2+0.030163*y_est(k-1)*u_est(k-2)+0.0067093*y_est(k-1)^2+ ...
%                         0.080472*y_est(k-2)*u_est(k-1)+0.0059189*y_est(k-1)*u_est(k-1)*u_est(k-2)+ ...
%                         0.0006831*y_est(k-2)^2*u_est(k-1)+0.099223*y_est(k-2)*u_est(k-2)^2;
%         end
%         if(tag_simulacao == 333)
%             y_est(k) = 1.4655*y_est(k-1)+0.0081141*u_est(k-3)+0.080858*u_est(k-2)+ ...
%                     0.15436*1+8.7738e-05*u_est(k-3)^2+0.00049206*u_est(k-1)*u_est(k-3)+ ...
%                     0.00084831*u_est(k-2)^2+0.006126*y_est(k-2)*y_est(k-3)+0.00043119*y_est(k-3)*u_est(k-1)^2+ ...
%                     0.0028379*y_est(k-1)^2+0.00092886*y_est(k-2)*y_est(k-3)*u_est(k-3)+6.5609e-05*y_est(k-1)^2*y_est(k-2)+ ...
%                     0.0018276*y_est(k-2)^2*u_est(k-3)+0.13677*u_est(k-1)^3+0.0052717*y_est(k-2)*u_est(k-1)*u_est(k-2)+ ...
%                     0.00039377*y_est(k-1)*y_est(k-3)+0.020713*y_est(k-1)*u_est(k-2)^2+0.002014*y_est(k-3)*u_est(k-3)^2+ ...
%                     0.0014727*y_est(k-2)*u_est(k-1)^2+0.0033334*y_est(k-1)*u_est(k-3)^2+0.0065567*y_est(k-1)*y_est(k-2)+ ... 
%                     0.00058143*y_est(k-1)^2*u_est(k-3)+5.57e-05*y_est(k-2)^3+0.00047582*y_est(k-1)^2*u_est(k-2)+ ...
%                     0.0009901*y_est(k-3)^2*u_est(k-2)+0.00093021*y_est(k-3)^2*u_est(k-3)+0.022529*y_est(k-1)*u_est(k-1)*u_est(k-3)+ ...
%                     0.013977*y_est(k-3)*u_est(k-2)*u_est(k-3)+0.1114*y_est(k-2)*u_est(k-2)+0.00096722*y_est(k-1)*y_est(k-2)*u_est(k-1)+ ...
%                     0.072554*y_est(k-3)*u_est(k-1)+0.011165*y_est(k-1)*u_est(k-1)+0.00021165*y_est(k-2)^2*u_est(k-1)+ ...
%                     0.0012695*y_est(k-2)*y_est(k-3)*u_est(k-1)+5.9776e-05*y_est(k-1)^3+0.060577*y_est(k-2)*u_est(k-3)+0.00049457*y_est(k-3)^3;
%         end
%         
%     end
% end
% 
% plot(y_est, 'b-','LineWidth', 2); 
% hold on; 
% plot(Bat_CC,'r-', 'LineWidth', 2);
% 
% xlabel('Tempo [s]','FontWeight','Bold','Fontsize',10);
% ylabel('SOC (%)','FontWeight','Bold','Fontsize',10);
% title('Predição do SOC Veiculo 1 Experimento 1','FontWeight','Bold','Fontsize',14);
% legend('NARMAX', 'Contagem de Carga', 'Location', 'SouthEast');
% %ylim([80 100]);
% saveas(gcf,'Corrente/nl333/vei1_exp1.png');
% 
% fprintf('SOC (C) OCV = %6.2f \n', Sim_Est_Carga.Data(Nr_Termos));
% fprintf('SOC (C) Narmax = %6.2f \n', y_est(Nr_Termos));
% 
% figure;
% 
% %% Veículo 1 Experimento 2
% 
% load('F_Bateria_B_72_Amostra_3.mat');
% 
% % % Coulomb Counting
% Bat_CC = zeros(N,1);
% Bat_CC(1) = Sim_Est_Carga.Data(1);
% cte = 100/(CAPACIDADE*3600);
% for i=2:1:N
%     Bat_CC(i) = Bat_CC(i-1) + cte*Sim_Corrente.Data(i);
% end
% 
% inicio = 2;
% y_est = [];
% 
% if(tag_simulacao == 111 || tag_simulacao == 211)
%     y_est(1) = Sim_Est_Carga.Data(1);
%     inicio = 2;
% end
% if(tag_simulacao == 121 || tag_simulacao == 122 || tag_simulacao == 222)
%     y_est(1) = Sim_Est_Carga.Data(1);
%     y_est(2) = Sim_Est_Carga.Data(2);
%     inicio = 3;
% end
% 
% u_est = Sim_Corrente.Data;
% %u_est = Sim_Tensao.Data;
% % Veículo 1 Experimento 1
% for k=inicio:1:length(Sim_Corrente.Data)
%     if(tag_corrente == 0)
%         if (tag_simulacao == 111)
%         end
%     else
%         % Simulacao Corrente
%         if (tag_simulacao == 111)    
%             % nl111
%             y_est(k) = y_est(k-1)+0.00038544*u_est(k-1)+7.9096e-05*1;
%         end
%         if (tag_simulacao == 121)
%             % nl121
%             y_est(k) = 0.52852*y_est(k-1)+0.47148*y_est(k-2)+7.0753e-05*1+0.00056727*u_est(k-1);
%             % y_est(k) = 0.34694*y_est(k-1)+0.00077118*u_est(k-1)+7.0753e-05*1+0.65306*y_est(k-2);
%         end
%         if (tag_simulacao == 122)
%             y_est(k) = 0.53056*y_est(k-1)+0.46944*y_est(k-2)+7.0372e-05*1-2.7252e-06*u_est(k-2)+0.00056921*u_est(k-1);
%         end
%         if(tag_simulacao == 211)
%             y_est(k) = 0.99993*y_est(k-1)+0.00039647*u_est(k-1)+0.0029458*1-1.4184e-07*u_est(k-1)^2+3.8214e-07*y_est(k-1)^2-1.3805e-07*u_est(k-1)*y_est(k-1);
%         end
%     end
% end
% 
% plot(y_est, 'b-','LineWidth', 2); 
% hold on; 
% plot(Bat_CC,'r-', 'LineWidth', 2);
% 
% xlabel('Tempo [s]','FontWeight','Bold','Fontsize',10);
% ylabel('SOC (%)','FontWeight','Bold','Fontsize',10);
% title('Predição do SOC no Veiculo 1 Experimento 2','FontWeight','Bold','Fontsize',14);
% legend('NARMAX', 'Contagem de Carga', 'Location', 'SouthEast');
% %ylim([80 100]);
% saveas(gcf,'Corrente/nl211/vei1_exp2.png');
% 
% fprintf('SOC (F) OCV = %6.2f \n', Sim_Est_Carga.Data(Nr_Termos));
% fprintf('SOC (F) Narmax = %6.2f \n', y_est(Nr_Termos));
% 
% figure;
% 
% %% Veículo 2 Experimento 1
% 
% load('J_Bateria_A_60_Amostra_1.mat');
% CAPACIDADE = 60;
% % % Coulomb Counting
% Bat_CC = zeros(N,1);
% Bat_CC(1) = Sim_Est_Carga.Data(1);
% cte = 100/(CAPACIDADE*3600);
% for i=2:1:N
%     Bat_CC(i) = Bat_CC(i-1) + cte*Sim_Corrente.Data(i);
% end
% 
% inicio = 2;
% y_est = [];
% 
% if(tag_simulacao == 111 || tag_simulacao == 211)
%     y_est(1) = Sim_Est_Carga.Data(1);
%     inicio = 2;
% end
% if(tag_simulacao == 121 || tag_simulacao == 122 || tag_simulacao == 222)
%     y_est(1) = Sim_Est_Carga.Data(1);
%     y_est(2) = Sim_Est_Carga.Data(2);
%     inicio = 3;
% end
% 
% u_est = Sim_Corrente.Data;
% %u_est = Sim_Tensao.Data;
% % Veículo 1 Experimento 1
% for k=inicio:1:length(Sim_Corrente.Data)
%     if(tag_corrente == 0)
%         if (tag_simulacao == 111)
%         end
%     else
%         % Simulacao Corrente
%         if (tag_simulacao == 111)    
%             % nl111
%             y_est(k) = y_est(k-1)+0.00038544*u_est(k-1)+7.9096e-05*1;
%         end
%         if (tag_simulacao == 121)
%             % nl121
%             y_est(k) = 0.52852*y_est(k-1)+0.47148*y_est(k-2)+7.0753e-05*1+0.00056727*u_est(k-1);
%             % y_est(k) = 0.34694*y_est(k-1)+0.00077118*u_est(k-1)+7.0753e-05*1+0.65306*y_est(k-2);
%         end
%         if (tag_simulacao == 122)
%             y_est(k) = 0.53056*y_est(k-1)+0.46944*y_est(k-2)+7.0372e-05*1-2.7252e-06*u_est(k-2)+0.00056921*u_est(k-1);
%         end
%         if(tag_simulacao == 211)
%             y_est(k) = 0.99993*y_est(k-1)+0.00039647*u_est(k-1)+0.0029458*1-1.4184e-07*u_est(k-1)^2+3.8214e-07*y_est(k-1)^2-1.3805e-07*u_est(k-1)*y_est(k-1);
%         end
%     end
% end
% 
% plot(y_est, 'b-','LineWidth', 2); 
% hold on; 
% plot(Bat_CC,'r-', 'LineWidth', 2);
% 
% xlabel('Tempo [s]','FontWeight','Bold','Fontsize',10);
% ylabel('SOC (%)','FontWeight','Bold','Fontsize',10);
% title('Predição do SOC no  Veiculo 2 Experimento 1','FontWeight','Bold','Fontsize',14);
% legend('NARMAX', 'Contagem de Carga', 'Location', 'SouthEast');
% %ylim([80 100]);
% saveas(gcf,'Corrente/nl211/vei2_exp1.png');
% 
% fprintf('SOC (J) OCV = %6.2f \n', Sim_Est_Carga.Data(Nr_Termos));
% fprintf('SOC (J) Narmax = %6.2f \n', y_est(Nr_Termos));
% 
% figure;
% 
% %% Veículo 2 Experimento 2
% 
% load('N_Bateria_B_60_Amostra_2.mat');
% CAPACIDADE = 60;
% % % Coulomb Counting
% Bat_CC = zeros(N,1);
% Bat_CC(1) = Sim_Est_Carga.Data(1);
% cte = 100/(CAPACIDADE*3600);
% for i=2:1:N
%     Bat_CC(i) = Bat_CC(i-1) + cte*Sim_Corrente.Data(i);
% end
% 
% inicio = 2;
% y_est = [];
% 
% if(tag_simulacao == 111 || tag_simulacao == 211)
%     y_est(1) = Sim_Est_Carga.Data(1);
%     inicio = 2;
% end
% if(tag_simulacao == 121 || tag_simulacao == 122 || tag_simulacao == 222)
%     y_est(1) = Sim_Est_Carga.Data(1);
%     y_est(2) = Sim_Est_Carga.Data(2);
%     inicio = 3;
% end
% if(tag_simulacao == 333)
%     y_est(1) = Sim_Est_Carga.Data(1);
%     y_est(2) = Sim_Est_Carga.Data(2);
%     y_est(3) = Sim_Est_Carga.Data(3);
%     inicio = 4;
% end
% 
% u_est = Sim_Corrente.Data;
% %u_est = Sim_Tensao.Data;
% % Veículo 1 Experimento 1
% for k=inicio:1:length(Sim_Corrente.Data)
%     if(tag_corrente == 0)
%         if (tag_simulacao == 111)
%         end
%     else
%         % Simulacao Corrente
%         if (tag_simulacao == 111)    
%             % nl111
%             y_est(k) = y_est(k-1)+0.00038544*u_est(k-1)+7.9096e-05*1;
%         end
%         if (tag_simulacao == 121)
%             % nl121
%             y_est(k) = 0.52852*y_est(k-1)+0.47148*y_est(k-2)+7.0753e-05*1+0.00056727*u_est(k-1);
%             % y_est(k) = 0.34694*y_est(k-1)+0.00077118*u_est(k-1)+7.0753e-05*1+0.65306*y_est(k-2);
%         end
%         if (tag_simulacao == 122)
%             y_est(k) = 0.53056*y_est(k-1)+0.46944*y_est(k-2)+7.0372e-05*1-2.7252e-06*u_est(k-2)+0.00056921*u_est(k-1);
%         end
%         if(tag_simulacao == 211)
%             y_est(k) = 0.99993*y_est(k-1)+0.00039647*u_est(k-1)+0.0029458*1-1.4184e-07*u_est(k-1)^2+3.8214e-07*y_est(k-1)^2-1.3805e-07*u_est(k-1)*y_est(k-1);
%         end
%         if(tag_simulacao == 333)
%             y_est(k) = 1.4655*y_est(k-1)-0.08846*u_est(k-1)+0.0081141*u_est(k-3)+0.080858*u_est(k-2)+ ...
%                 0.15436*1-0.13635*u_est(k-1)^2+8.7738e-05*u_est(k-3)^2+0.00049206*u_est(k-1)*u_est(k-3)+0.00084831*u_est(k-2)^2+ ...
%                 0.006126*y_est(k-2)*y_est(k-3)-6.5294e-05*y_est(k-1)*y_est(k-2)^2-2.5067e-06*u_est(k-1)*u(k-3)^2 - ...
%                 9.0323e-07*u_est(k-2)^3-3.5705e-05*u_est(k-1)^2*u_est(k-3)+3.4561e-06*u_est(k-3)^3+2.6225e-05*u_est(k-1)*u_est(k-2)*u_est(k-3)- ...
%                 9.828e-06*u_est(k-2)*u_est(k-3)^2+4.1514e-05*u_est(k-1)^2*u_est(k-2)+ ...
%                 1.2529e-05*u_est(k-2)^2*u_est(k-3)-0.001511*u_est(k-1)*u_est(k-2)-0.00027971*u_est(k-2)*u_est(k-3)- ...
%                 5.274e-05*u_est(k-1)*u_est(k-2)^2-0.0048773*y_est(k-3)*u_est(k-1)*u_est(k-2)- ...
%                 0.0079986*y_est(k-3)*u_est(k-1)*u_est(k-3)-0.0019081*y_est(k-1)*u_est(k-1)^2+0.00043119*y_est(k-3)*u_est(k-1)^2- ...
%                 0.015811*y_est(k-3)*u_est(k-2)^2-0.0039269*y_est(k-2)*u_est(k-2)*u_est(k-3)-1.0277e-05*y_est(k-1)^2*y_est(k-3) - ...
%                 0.0053479*y_est(k-2)*u_est(k-3)^2-0.015851*y_est(k-2)^2+0.0028379*y_est(k-1)^2+0.00092886*y_est(k-2)*y_est(k-3)*u_est(k-3) - ...
%                 0.052061*y_est(k-1)*u_est(k-3)+6.5609e-05*y_est(k-1)^2*y_est(k-2)+0.0018276*y_est(k-2)^2*u_est(k-3)-0.0022853*y_est(k-1)*y_est(k-2)*u_est(k-3)+...
%                 0.13677*u_est(k-1)^3-0.0087045*y_est(k-3)*u_est(k-3)+0.0052717*y_est(k-2)*u_est(k-1)*u_est(k-2)+0.00039377*y_est(k-1)*y_est(k-3)+ ...
%                 0.020713*y_est(k-1)*u_est(k-2)^2-0.0049099*y_est(k-2)*u_est(k-2)^2-0.014533*y_est(k-2)*u_est(k-1)*u_est(k-3)- ...
%                 0.41165*y_est(k-2)-0.059224*y_est(k-3)+0.002014*y_est(k-3)*u_est(k-3)^2+0.0014727*y_est(k-2)*u_est(k-1)^2+ ...
%                 0.0033334*y_est(k-1)*u_est(k-3)^2+0.0065567*y_est(k-1)*y_est(k-2)-0.010048*y_est(k-1)*u_est(k-2)*u_est(k-3)+0.00058143*y_est(k-1)^2*u_est(k-3)- ...
%                 0.0019817*y_est(k-1)*y_est(k-3)*u_est(k-3)-0.00037763*y_est(k-1)*u_est(k-1)*u_est(k-2)+5.57e-05*y_est(k-2)^3+-2.6453e-05*y_est(k-1)*y_est(k-2)*y_est(k-3)+ ...
%                 2.8944e-05*y_est(k-1)*y_est(k-3)^2+0.00047582*y_est(k-1)^2*u_est(k-2)+0.0009901*y_est(k-3)^2*u_est(k-2)-0.0004901*y_est(k-2)*y_est(k-3)*u_est(k-2)- ...
%                 1.9859e-05*y_est(k-1)*y_est(k-3)*u_est(k-2)+0.00093021*y_est(k-3)^2*u_est(k-3)+0.022529*y_est(k-1)*u_est(k-1)*u_est(k-3)+ ...
%                 0.013977*y_est(k-3)*u_est(k-2)*u_est(k-3)+0.1114*y_est(k-2)*u_est(k-2)-0.00052446*y_est(k-3)^2-0.091234*y_est(k-1)*u_est(k-2)- ...
%                 0.0008435*y_est(k-1)*y_est(k-2)*u_est(k-2)-0.00010135*y_est(k-2)^2*u_est(k-2)-1.9442e-05*y_est(k-2).^2*y_est(k-3)+0.00096722*y_est(k-1)*y_est(k-2)*u_est(k-1)- ...
%                 0.00088472*y_est(k-3)^2*u_est(k-1)+0.072554*y_est(k-3)*u_est(k-1)+0.011165*y_est(k-1)*u_est(k-1)-0.081638*y_est(k-2)*u_est(k-1)+0.00021165*y_est(k-2)^2*u_est(k-1)- ...
%                 0.00018229*y_est(k-1)*y_est(k-3)*u_est(k-1)+0.0012695*y_est(k-2)*y_est(k-3)*u_est(k-1)+-0.022072*y_est(k-3)*u_est(k-2)-0.0013937*y_est(k-1).^2*u_est(k-1)+...
%                 5.9776e-05*y_est(k-1)^3- ...
%                 5.8917e-05*y_est(k-2)*y_est(k-3).^2+0.060577*y_est(k-2)*u_est(k-3)+0.00049457*y_est(k-3).^3;
%         end
%     end
% end
% 
% plot(y_est, 'b-','LineWidth', 2); 
% hold on; 
% plot(Bat_CC,'r-', 'LineWidth', 2);
% 
% xlabel('Tempo [s]','FontWeight','Bold','Fontsize',10);
% ylabel('SOC (%)','FontWeight','Bold','Fontsize',10);
% title('Predição do SOC no Veiculo 2 Experimento 2','FontWeight','Bold','Fontsize',14);
% legend('NARMAX', 'Contagem de Carga', 'Location', 'SouthEast');
% %ylim([80 100]);
% 
% fprintf('SOC (N) OCV = %6.2f \n', Sim_Est_Carga.Data(Nr_Termos));
% fprintf('SOC (N) Narmax = %6.2f \n', y_est(Nr_Termos));
% 
% saveas(gcf,'Corrente/nl211/vei2_exp2.png');

